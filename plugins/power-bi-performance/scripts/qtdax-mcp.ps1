$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

if ([Environment]::OSVersion.Platform -ne [PlatformID]::Win32NT) {
    [Console]::Error.WriteLine('Power BI Performance needs Windows x64 and Power BI Desktop.')
    exit 1
}

$version = '1.3.4'
$archiveName = "power-bi-performance-runtime-$version-win32-x64.zip"
$expectedHash = '4850be2c1a4c1b5277134debda01409eac03ec2ac3dac68adfa3b416b2ab618b'
$defaultUrl = "https://github.com/querytorque/power-bi-performance/releases/download/v$version/$archiveName"
$manifestRelative = 'python/Lib/site-packages/qt_dax/connections/native_clients_manifest.json'

function Open-InstallLock([string] $lockPath) {
    $deadline = [DateTime]::UtcNow.AddMinutes(5)
    while ($true) {
        try {
            return [IO.File]::Open($lockPath, 'OpenOrCreate', 'ReadWrite', 'None')
        } catch [IO.IOException] {
            if (($_.Exception.HResult -band 0xffff) -notin 32, 33) { throw }
            if ([DateTime]::UtcNow -ge $deadline) {
                throw 'The runtime is still being installed. Wait for the other session, then restart Claude Code.'
            }
            Start-Sleep -Milliseconds 250
        }
    }
}

function Install-NativeClients([string] $python, [string] $cache) {
    # Run the released NuGet installer in this plugin's own cache.
    $previousAppData = $env:LOCALAPPDATA
    $previousClients = $env:QT_DAX_NATIVE_CLIENTS
    try {
        $env:LOCALAPPDATA = $cache
        $env:QT_DAX_NATIVE_CLIENTS = $null
        $code = @'
import json, sys
from qt_dax.connections.native_runtime import native_clients_directory

clients = native_clients_directory(progress=lambda message: print(message, file=sys.stderr, flush=True))
print(json.dumps({'path': str(clients)}))
'@
        $result = & $python -I -B -c $code
        if ($LASTEXITCODE -ne 0) {
            throw "Microsoft clients could not be verified. Check access to api.nuget.org and the client cache at $cache, then restart Claude Code."
        }
        return ($result | ConvertFrom-Json).path
    } finally {
        $env:LOCALAPPDATA = $previousAppData
        $env:QT_DAX_NATIVE_CLIENTS = $previousClients
    }
}

function Write-PathFile([string] $path, [string] $value) {
    $contents = $value.Replace('\', '/') + "`n"
    if ([IO.File]::Exists($path) -and [IO.File]::ReadAllText($path) -ceq $contents) { return }
    $temporary = $path + '.' + [Guid]::NewGuid().ToString('N')
    try {
        [IO.File]::WriteAllText($temporary, $contents)
        if ([IO.File]::Exists($path)) {
            [IO.File]::Replace($temporary, $path, [System.Management.Automation.Language.NullString]::Value)
        } else {
            [IO.File]::Move($temporary, $path)
        }
    } finally {
        [IO.File]::Delete($temporary)
    }
}

try {
    $architecture = $env:PROCESSOR_ARCHITEW6432
    if (-not $architecture) { $architecture = $env:PROCESSOR_ARCHITECTURE }
    if ($architecture -ne 'AMD64') {
        throw 'Power BI Performance needs Windows x64 and Power BI Desktop.'
    }
    if (-not $env:CLAUDE_PLUGIN_DATA) {
        throw 'Start this launcher from the installed Claude Code plugin so it has a data directory.'
    }

    $data = [IO.Path]::GetFullPath($env:CLAUDE_PLUGIN_DATA)
    $runtime = Join-Path $data 'runtime'
    $installed = Join-Path $runtime $version
    $marker = Join-Path $installed '.sha256'
    $python = Join-Path $installed 'python/python.exe'
    $clientManifest = Join-Path $installed $manifestRelative
    [void] [IO.Directory]::CreateDirectory($runtime)

    $installLock = Open-InstallLock (Join-Path $runtime "$version.lock")
    try {
        $ready = [IO.File]::Exists($python) -and [IO.File]::Exists($clientManifest) -and
            [IO.File]::Exists($marker) -and ([IO.File]::ReadAllText($marker).Trim() -ceq $expectedHash)
        if (-not $ready) {
            $stage = Join-Path $runtime ('.install-' + [Guid]::NewGuid().ToString('N'))
            $payload = Join-Path $stage 'payload'
            $zip = Join-Path $stage $archiveName
            [void] [IO.Directory]::CreateDirectory($stage)
            try {
                if ($env:QTDAX_RUNTIME_FILE) {
                    $localZip = [IO.Path]::GetFullPath($env:QTDAX_RUNTIME_FILE)
                    if (-not [IO.File]::Exists($localZip)) {
                        throw 'Set QTDAX_RUNTIME_FILE to the pinned runtime ZIP on disk, then restart Claude Code.'
                    }
                    [Console]::Error.WriteLine("Installing Power BI Performance $version from a local archive.")
                    [IO.File]::Copy($localZip, $zip)
                } else {
                    $url = $defaultUrl
                    if ($env:QTDAX_RUNTIME_URL) { $url = $env:QTDAX_RUNTIME_URL }
                    $uri = $null
                    if (-not [Uri]::TryCreate($url, [UriKind]::Absolute, [ref] $uri) -or $uri.Scheme -ne 'https') {
                        throw 'Set QTDAX_RUNTIME_URL to the HTTPS address of the pinned runtime archive.'
                    }
                    [Console]::Error.WriteLine("Downloading the pinned Power BI Performance $version runtime.")
                    try { Invoke-WebRequest -Uri $uri -OutFile $zip -UseBasicParsing -TimeoutSec 180 }
                    catch {
                        throw 'The runtime download failed. Check QTDAX_RUNTIME_URL or set QTDAX_RUNTIME_FILE to the pinned ZIP on disk.'
                    }
                }

                if ((Get-FileHash -LiteralPath $zip -Algorithm SHA256).Hash -ine $expectedHash) {
                    throw 'The archive SHA-256 does not match. Replace it with the pinned runtime archive and restart Claude Code.'
                }
                Add-Type -AssemblyName System.IO.Compression.FileSystem
                [IO.Compression.ZipFile]::ExtractToDirectory($zip, $payload)
                if (-not [IO.File]::Exists((Join-Path $payload 'python/python.exe')) -or
                    -not [IO.File]::Exists((Join-Path $payload $manifestRelative))) {
                    throw 'The verified archive has an unexpected layout. Check the runtime release instructions.'
                }
                [IO.File]::WriteAllText((Join-Path $payload '.sha256'), $expectedHash + [Environment]::NewLine)

                $previous = $null
                if ([IO.Directory]::Exists($installed)) {
                    $previous = Join-Path $runtime ('.replaced-' + [Guid]::NewGuid().ToString('N'))
                    [IO.Directory]::Move($installed, $previous)
                }
                try {
                    [IO.Directory]::Move($payload, $installed)
                } catch {
                    if ($previous) { [IO.Directory]::Move($previous, $installed) }
                    throw
                }
                [Console]::Error.WriteLine("Power BI Performance $version runtime installed and SHA-256 verified.")
            } finally {
                # Only this process's staging directory is created and cleaned here.
                if ([IO.Directory]::Exists($stage)) {
                    if (([IO.DirectoryInfo] $stage).Parent.FullName -ne ([IO.DirectoryInfo] $runtime).FullName -or
                        (([IO.File]::GetAttributes($stage) -band [IO.FileAttributes]::ReparsePoint) -ne 0)) {
                        throw 'Could not safely clean up the runtime staging directory.'
                    }
                    try { [IO.Directory]::Delete($stage, $true) }
                    catch [IO.IOException] { [Console]::Error.WriteLine("Could not clean up runtime staging at $stage.") }
                }
            }
        }
        $clients = Install-NativeClients $python (Join-Path $data 'native-deps')
        Write-PathFile (Join-Path $data 'native-clients-path.txt') $clients
        Write-PathFile (Join-Path $data 'runtime-path.txt') (Split-Path -Parent $python)
    } finally {
        $installLock.Dispose()
    }

    $env:QT_DAX_NATIVE_CLIENTS = $clients
    $env:QT_DAX_AGENT_STATE_DIR = Join-Path $data 'state'
    $env:QT_DAX_REVIEW_STORE_DIR = Join-Path $env:QT_DAX_AGENT_STATE_DIR 'reviews'
    $env:TEMP = Join-Path $data 'tmp'
    $env:TMP = $env:TEMP
    [void] [IO.Directory]::CreateDirectory($env:QT_DAX_AGENT_STATE_DIR)
    [void] [IO.Directory]::CreateDirectory($env:TEMP)

    & $python -I -B -m qt_dax.cli.main mcp serve
    exit $LASTEXITCODE
} catch {
    [Console]::Error.WriteLine("Power BI Performance couldn't start. " + $_.Exception.Message)
    exit 1
}
