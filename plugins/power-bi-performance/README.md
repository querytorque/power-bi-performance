# Power BI Performance Tuner for Claude Code

Find slow Power BI visuals, test DAX rewrites on a copy, and measure the result on the local Power BI engine. This plugin uses the same QT:DAX 1.3.4 runtime as the Power BI Performance Tuner extension.

## Before you start

- Windows x64, Windows PowerShell and an installed x64 Power BI Desktop. QT:DAX uses the installed Desktop engine. For the Orchard demo, Claude Code also needs Git Bash. If there are multiple Desktop installs, set `QT_DAX_POWERBI_DIRECTORY` to the correct Desktop bin folder before starting Claude Code.
- Claude Code with local marketplace and persistent plugin data support.
- A saved import PBIP with its local `.pbi/cache.abf` or an import-mode PBIX. DirectQuery and live-connected reports are outside this workflow.
- The pinned Windows x64 runtime archive and first-run HTTPS access to `api.nuget.org` for the Microsoft client libraries.

## Install

In PowerShell:

~~~powershell
$env:MCP_TIMEOUT = '180000'
claude plugin marketplace add querytorque/power-bi-performance
claude plugin install power-bi-performance@querytorque-power-bi-performance
claude
~~~

The first start downloads the pinned runtime from this repository's GitHub release, verifies its SHA-256 and installs it in Claude Code's plugin data directory (about a minute). `MCP_TIMEOUT` gives Claude Code three minutes to connect during that first setup.

## Install from a local copy

For pre-release testing, set the paths for your local marketplace checkout and runtime archive. The pinned Microsoft client packages still download from NuGet on the first start.

~~~powershell
$env:QTDAX_RUNTIME_FILE = 'D:\path\to\power-bi-performance-runtime-1.3.4-win32-x64.zip'
$env:MCP_TIMEOUT = '180000'
$marketplace = 'D:\path\to\power-bi-performance-plugin'
claude plugin validate $marketplace
claude plugin validate (Join-Path $marketplace 'plugins/power-bi-performance')
claude plugin marketplace add $marketplace
claude plugin install power-bi-performance@querytorque-power-bi-performance
claude
~~~

The first MCP start copies the archive, verifies its SHA-256 and installs it in Claude Code's persistent plugin data directory. The bundled QT:DAX installer downloads the pinned Microsoft packages from NuGet, verifies the package and DLL hashes, and caches the clients in the same plugin data directory. `MCP_TIMEOUT` gives Claude Code three minutes to connect during setup. Later sessions reuse the installation for that version. If `QTDAX_RUNTIME_FILE` is unset, the launcher uses `QTDAX_RUNTIME_URL` or the default GitHub release at `querytorque/power-bi-performance`.

## Start an investigation

Use `/power-bi-performance:power-bi-demo` to generate Orchard and measure its original visuals. The default demo generates eight million rows locally. Give the command a new folder path if you want it saved somewhere specific.

For your own report, ask Claude to investigate the slow Power BI report and give it the saved PBIP or PBIX path. Review the measured bottlenecks before asking for a rewrite. The plugin uses a protected baseline, a separate trial copy and explicit approval before delivery. Keep delivery on ask in Claude Code.

## Every rewrite is checked

The same-answer check compares affected visuals in saved filter states and sampled slicer states, including supported grouping levels, totals and ranking. Clear saved point drills or expanded points in Power BI Desktop, save the report and prepare a new run before checking those visuals.

By default the check covers the changed measures and every report visual that uses them, directly or through another measure. The regression guard also checks the rewritten measure and the measures that depend on it, including hidden measures (in the default scope, those the report's visuals show), with no filters and in the saved and sampled states. Thorough checks (the trial's `thorough` option, or `QT_DAX_THOROUGH_CHECKS=1`) also check every dependent measure on its own, including measures no visual shows; without them, the receipt and the workbench name each dependent measure that was not checked.

Floating-point values may differ by at most one part in a trillion, or by no more than the engine's own measured run-to-run noise for that value (never more than one part in a billion), and the value shown by the measure's format must be identical. Where the original report itself returns different values for the same calculation on copies of the same saved model, a rewritten value is accepted only between the lowest and highest of those values, only when they differ by no more than one part in a billion, and each such value is named.

Checks use the model's current data. A rewrite that differs only on future data, such as a later date, or outside the sampled slicer values and combinations can still pass. The receipt records the sampling limits. Cross-filtering, interactive drill selections, security roles and other reports are outside this coverage.

The plugin blocks a rewrite when an affected measure or a calculation item that can act on it uses the current date or time, the viewer's identity, random values, or parsing or formatting that depends on regional settings. New locale-sensitive parsing and formatting calls also block the rewrite unless `FORMAT` specifies a locale.

Both checks must pass on the exact rewrite before delivery. The plugin records refused states per measure and replays them in later trials that can affect that measure. History follows the same semantic model through refreshes, project moves and delivered rewrites. The saved model ID identifies the history. When there is no saved ID, the PBIP model name or PBIX file name identifies it, so renaming it starts a separate history. Keep the refusal history in the plugin's local data directory readable and writable. The history and delivery receipt are unsigned local files.

The default timings cover chart DAX on the local engine. Power BI's visible report response also includes opening and drawing the report. Read `chart-timings.json` for timed and untimed visuals and the repeatability of the measurements. A difference or incomplete required check blocks delivery.

## Runtime provenance

The runtime build verifies the source VSIX and copies every runtime file byte for byte. From `plugins/power-bi-performance/`, run `python scripts/build-runtime.py --vsix <vsix> --out <directory> --inventory <inventory-file>` to rebuild locally and produce `VSIX-COMPARISON.tsv`. The launcher pins the assembled ZIP's SHA-256. The Orchard command reads the launcher's path files and runs the released CLI through Bash.

The plugin is Apache-2.0. The runtime contains third-party components with their own terms. See [THIRD-PARTY.md](THIRD-PARTY.md) for the binary inventory and shipped notices.
