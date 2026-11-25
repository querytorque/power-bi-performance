# Third-party binary inventory

The 1.3.4 Windows x64 runtime ZIP ships 426 binary files from the released VSIX,
including CPython and dependencies of QT:DAX. Paths below are relative to the ZIP root.
The archive preserves the VSIX's THIRD_PARTY_NOTICES.txt and wheel notices.
The QueryTorque plugin uses Apache-2.0. The owner must confirm redistribution terms for the runtime before publishing.
Some wheels bundle components without a separate licence file alongside the binary.

## Microsoft prerequisites downloaded on first run

The released QT:DAX NuGet installer downloads the pinned packages from `api.nuget.org`.
It verifies package and extracted DLL SHA-256 hashes against the released manifest
before activating the client cache in Claude Code's plugin data directory.
The packages and the selected client DLLs below are supplied by the first-run download.
The installer retains `package-license.json` and these package notices in the client cache.

| NuGet package | Licence terms | Retained notices | Selected DLLs |
|---|---|---|---|
| `Microsoft.AnalysisServices 19.118.3` | [Vendor terms](https://go.microsoft.com/fwlink/?linkid=852989) | None listed | `Microsoft.AnalysisServices.Core.dll`, `Microsoft.AnalysisServices.dll`, `Microsoft.AnalysisServices.Tabular.dll`, `Microsoft.AnalysisServices.Tabular.Json.dll` |
| `Microsoft.AnalysisServices.AdomdClient 19.118.3` | [Vendor terms](https://go.microsoft.com/fwlink/?linkid=852895) | None listed | `Microsoft.AnalysisServices.SPClient.Interfaces.dll`, `Microsoft.AnalysisServices.AdomdClient.dll`, `msasxpress.dll` |
| `Microsoft.Identity.Client 4.83.3` | [MIT](https://licenses.nuget.org/MIT) | None listed | `Microsoft.Identity.Client.dll` |
| `Microsoft.Identity.Client.Broker 4.83.3` | [MIT](https://licenses.nuget.org/MIT) | None listed | `Microsoft.Identity.Client.Broker.dll` |
| `Microsoft.Identity.Client.NativeInterop 0.20.4` | [MIT](https://licenses.nuget.org/MIT) | None listed | `Microsoft.Identity.Client.NativeInterop.dll`, `msalruntime.dll` |
| `Microsoft.IdentityModel.Abstractions 8.14.0` | [MIT](https://licenses.nuget.org/MIT) | None listed | `Microsoft.IdentityModel.Abstractions.dll` |
| `System.Buffers 4.5.1` | [Vendor terms](https://github.com/dotnet/corefx/blob/master/LICENSE.TXT) | `LICENSE.TXT`, `THIRD-PARTY-NOTICES.TXT` | `System.Buffers.dll` |
| `System.Diagnostics.DiagnosticSource 6.0.1` | [MIT](https://licenses.nuget.org/MIT) | `LICENSE.TXT`, `THIRD-PARTY-NOTICES.TXT` | `System.Diagnostics.DiagnosticSource.dll` |
| `System.Formats.Asn1 8.0.1` | [MIT](https://licenses.nuget.org/MIT) | `LICENSE.TXT`, `THIRD-PARTY-NOTICES.TXT` | `System.Formats.Asn1.dll` |
| `System.Memory 4.5.5` | [Vendor terms](https://github.com/dotnet/corefx/blob/master/LICENSE.TXT) | `LICENSE.TXT`, `THIRD-PARTY-NOTICES.TXT` | `System.Memory.dll` |
| `System.Numerics.Vectors 4.5.0` | [Vendor terms](https://github.com/dotnet/corefx/blob/master/LICENSE.TXT) | `LICENSE.TXT`, `THIRD-PARTY-NOTICES.TXT` | `System.Numerics.Vectors.dll` |
| `System.Runtime.CompilerServices.Unsafe 6.0.0` | [MIT](https://licenses.nuget.org/MIT) | `LICENSE.TXT`, `THIRD-PARTY-NOTICES.TXT` | `System.Runtime.CompilerServices.Unsafe.dll` |
| `System.ValueTuple 4.5.0` | [Vendor terms](https://github.com/dotnet/corefx/blob/master/LICENSE.TXT) | `LICENSE.TXT`, `THIRD-PARTY-NOTICES.TXT` | `System.ValueTuple.dll` |

## Binaries shipped in the runtime ZIP

### apsw-3.54.1.0

Shipped licence and notice files

- `python/Lib/site-packages/apsw-3.54.1.0.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/apsw/__init__.cp312-win_amd64.pyd`
- `python/Lib/site-packages/apsw/_unicode.cp312-win_amd64.pyd`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/amatch.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/anycollseq.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/appendvfs.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/base64.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/base85.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/btreeinfo.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/cksumvfs.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/completion.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/compress.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/csv.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/decimal.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/diskused.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/eval.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/fileio.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/fuzzer.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/ieee754.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/memstat.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/nextchar.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/noop.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/prefixes.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/randomjson.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/regexp.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/rot13.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sha1.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/shathree.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/spellfix.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlar.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_dbdump.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_dbhash.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_dbtotxt.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_diff.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_expert.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_index_usage.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_normalize.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_offsets.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_rsync.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_shell.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_showdb.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_showjournal.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_showshm.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_showstat4.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_showtmlog.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_showwal.exe`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/sqlite3_tool.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/stmt.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/stmtrand.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/tmstmpvfs.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/uint.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/unionvtab.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/uuid.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/vec1.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/vfsstat.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/vtablog.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/zipfile.dll`
- `python/Lib/site-packages/apsw/sqlite_extra_binaries/zorder.dll`
- `python/Scripts/apsw.exe`

### cffi-2.0.0

Shipped licence and notice files

- `python/Lib/site-packages/cffi-2.0.0.dist-info/licenses/AUTHORS`
- `python/Lib/site-packages/cffi-2.0.0.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/_cffi_backend.cp312-win_amd64.pyd`

### clr_loader-0.3.1

Shipped licence and notice files

- `python/Lib/site-packages/clr_loader-0.3.1.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/clr_loader/ffi/dlls/amd64/ClrLoader.dll`
- `python/Lib/site-packages/clr_loader/ffi/dlls/amd64/ClrLoader.pdb`
- `python/Lib/site-packages/clr_loader/ffi/dlls/x86/ClrLoader.dll`
- `python/Lib/site-packages/clr_loader/ffi/dlls/x86/ClrLoader.pdb`

### comtypes-1.4.16

Shipped licence and notice files

- `python/Lib/site-packages/comtypes-1.4.16.dist-info/licenses/LICENSE.txt`

Binary files

- `python/Lib/site-packages/comtypes/test/TestComServer.tlb`
- `python/Lib/site-packages/comtypes/test/TestDispServer.tlb`
- `python/Lib/site-packages/comtypes/test/mylib.tlb`
- `python/Lib/site-packages/comtypes/test/urlhist.tlb`
- `python/Scripts/clear_comtypes_cache.exe`

### CPython Windows runtime

Shipped licence and notice files

- `python/LICENSE.txt`
- `THIRD_PARTY_NOTICES.txt`

The CPython notice includes Microsoft Visual C++ redistribution terms and notices for bundled OpenSSL, SQLite, Tcl/Tk and libffi.

Binary files

- `python/DLLs/_asyncio.pyd`
- `python/DLLs/_bz2.pyd`
- `python/DLLs/_ctypes.pyd`
- `python/DLLs/_ctypes_test.pyd`
- `python/DLLs/_decimal.pyd`
- `python/DLLs/_elementtree.pyd`
- `python/DLLs/_hashlib.pyd`
- `python/DLLs/_lzma.pyd`
- `python/DLLs/_msi.pyd`
- `python/DLLs/_multiprocessing.pyd`
- `python/DLLs/_overlapped.pyd`
- `python/DLLs/_queue.pyd`
- `python/DLLs/_socket.pyd`
- `python/DLLs/_sqlite3.pyd`
- `python/DLLs/_ssl.pyd`
- `python/DLLs/_testbuffer.pyd`
- `python/DLLs/_testcapi.pyd`
- `python/DLLs/_testclinic.pyd`
- `python/DLLs/_testconsole.pyd`
- `python/DLLs/_testimportmultiple.pyd`
- `python/DLLs/_testinternalcapi.pyd`
- `python/DLLs/_testmultiphase.pyd`
- `python/DLLs/_testsinglephase.pyd`
- `python/DLLs/_uuid.pyd`
- `python/DLLs/_wmi.pyd`
- `python/DLLs/_zoneinfo.pyd`
- `python/DLLs/libcrypto-3-x64.dll`
- `python/DLLs/libffi-8.dll`
- `python/DLLs/libssl-3-x64.dll`
- `python/DLLs/pyexpat.pyd`
- `python/DLLs/select.pyd`
- `python/DLLs/sqlite3.dll`
- `python/DLLs/tcl86t.dll`
- `python/DLLs/tk86t.dll`
- `python/DLLs/unicodedata.pyd`
- `python/DLLs/winsound.pyd`
- `python/Lib/venv/scripts/nt/python.exe`
- `python/python.exe`
- `python/python3.dll`
- `python/python312.dll`
- `python/vcruntime140.dll`
- `python/vcruntime140_1.dll`

### cryptography-50.0.0

Shipped licence and notice files

- `python/Lib/site-packages/cryptography-50.0.0.dist-info/licenses/LICENSE`
- `python/Lib/site-packages/cryptography-50.0.0.dist-info/licenses/LICENSE.APACHE`
- `python/Lib/site-packages/cryptography-50.0.0.dist-info/licenses/LICENSE.BSD`

Binary files

- `python/Lib/site-packages/cryptography/hazmat/bindings/_rust.pyd`

### distro-1.9.0

Shipped licence and notice files

- `python/Lib/site-packages/distro-1.9.0.dist-info/LICENSE`

Binary files

- `python/Scripts/distro.exe`

### fastapi-0.138.0

Shipped licence and notice files

- `python/Lib/site-packages/fastapi-0.138.0.dist-info/licenses/LICENSE`

Binary files

- `python/Scripts/fastapi.exe`

### httpx-0.28.1

Shipped licence and notice files

- `python/Lib/site-packages/httpx-0.28.1.dist-info/licenses/LICENSE.md`

Binary files

- `python/Scripts/httpx.exe`

### httpx2-2.16.0

Shipped licence and notice files

- `python/Lib/site-packages/httpx2-2.16.0.dist-info/licenses/LICENSE.md`

Binary files

- `python/Scripts/httpx2.exe`

### idna-3.18

Shipped licence and notice files

- `python/Lib/site-packages/idna-3.18.dist-info/licenses/LICENSE.md`

Binary files

- `python/Scripts/idna.exe`

### jiter-0.15.0

Shipped licence and notice files

- `python/Lib/site-packages/jiter-0.15.0.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/jiter/jiter.cp312-win_amd64.pyd`

### jsonschema-4.26.0

Shipped licence and notice files

- `python/Lib/site-packages/jsonschema-4.26.0.dist-info/licenses/COPYING`

Binary files

- `python/Scripts/jsonschema.exe`

### markdown_it_py-4.2.0

Shipped licence and notice files

- `python/Lib/site-packages/markdown_it_py-4.2.0.dist-info/licenses/LICENSE`
- `python/Lib/site-packages/markdown_it_py-4.2.0.dist-info/licenses/LICENSE.markdown-it`

Binary files

- `python/Scripts/markdown-it.exe`

### markupsafe-3.0.3

Shipped licence and notice files

- `python/Lib/site-packages/markupsafe-3.0.3.dist-info/licenses/LICENSE.txt`

Binary files

- `python/Lib/site-packages/markupsafe/_speedups.cp312-win_amd64.pyd`

### mcp-2.3.0

Shipped licence and notice files

- `python/Lib/site-packages/mcp-2.3.0.dist-info/licenses/LICENSE`

Binary files

- `python/Scripts/mcp.exe`

### numpy-2.5.4

Shipped licence and notice files

- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/LICENSE.txt`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/include/numpy/libdivide/LICENSE.txt`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/common/pythoncapi-compat/COPYING`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/highway/LICENSE`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/multiarray/dragon4_LICENSE.txt`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/npysort/x86-simd-sort/LICENSE.md`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/_core/src/umath/svml/LICENSE`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/fft/pocketfft/LICENSE.md`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/linalg/lapack_lite/LICENSE.txt`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/ma/LICENSE`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/LICENSE.md`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/distributions/LICENSE.md`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/mt19937/LICENSE.md`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/pcg64/LICENSE.md`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/philox/LICENSE.md`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/sfc64/LICENSE.md`
- `python/Lib/site-packages/numpy-2.5.4.dist-info/licenses/numpy/random/src/splitmix64/LICENSE.md`

Includes OpenBLAS and Microsoft Visual C++ runtime. Review the OpenBLAS notice and Microsoft redistribution terms.

Binary files

- `python/Lib/site-packages/numpy.libs/libscipy_openblas64_-ed4f167a5330424524f45258e7ca2c8d.dll`
- `python/Lib/site-packages/numpy.libs/msvcp140-a4c2229bdc2a2a630acdc095b4d86008.dll`
- `python/Lib/site-packages/numpy/_core/_multiarray_tests.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/_core/_multiarray_tests.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/_core/_multiarray_umath.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/_core/_multiarray_umath.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/_core/_operand_flag_tests.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/_core/_operand_flag_tests.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/_core/_rational_tests.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/_core/_rational_tests.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/_core/_simd.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/_core/_simd.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/_core/_struct_ufunc_tests.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/_core/_struct_ufunc_tests.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/_core/_umath_tests.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/_core/_umath_tests.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/_core/lib/npymath.lib`
- `python/Lib/site-packages/numpy/fft/_pocketfft_umath.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/fft/_pocketfft_umath.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/linalg/_umath_linalg.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/linalg/_umath_linalg.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/linalg/lapack_lite.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/linalg/lapack_lite.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/random/_bounded_integers.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/random/_bounded_integers.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/random/_common.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/random/_common.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/random/_generator.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/random/_generator.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/random/_mt19937.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/random/_mt19937.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/random/_pcg64.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/random/_pcg64.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/random/_philox.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/random/_philox.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/random/_sfc64.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/random/_sfc64.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/random/bit_generator.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/random/bit_generator.cp312-win_amd64.pyd`
- `python/Lib/site-packages/numpy/random/lib/npyrandom.lib`
- `python/Lib/site-packages/numpy/random/mtrand.cp312-win_amd64.lib`
- `python/Lib/site-packages/numpy/random/mtrand.cp312-win_amd64.pyd`
- `python/Scripts/f2py.exe`
- `python/Scripts/numpy-config.exe`

### pandas-3.1.1

Shipped licence and notice files

- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/BOTTLENECK_LICENCE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/DATEUTIL_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/HAVEN_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/HAVEN_MIT`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/KLIB_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/MUSL_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/NUMPY_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/PACKAGING_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/PSF_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/PYPERCLIP_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/PYUPGRADE_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/SAS7BDAT_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/STATSBASE_JL_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/ULTRAJSON_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/LICENSES/XSIMD_LICENSE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/subprojects/fast_float-8.2.10/LICENSE-APACHE`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/subprojects/fast_float-8.2.10/LICENSE-BOOST`
- `python/Lib/site-packages/pandas-3.1.1.dist-info/licenses/subprojects/fast_float-8.2.10/LICENSE-MIT`

Includes Microsoft Visual C++ runtime. The wheel does not ship a separate Microsoft licence file.

Binary files

- `python/Lib/site-packages/pandas.libs/msvcp140-a4c2229bdc2a2a630acdc095b4d86008.dll`
- `python/Lib/site-packages/pandas/_libs/_cyutility.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/_cyutility.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/_ujson.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/_ujson.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/algos.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/algos.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/arrays.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/arrays.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/byteswap.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/byteswap.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/groupby.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/groupby.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/hashing.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/hashing.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/hashtable.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/hashtable.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/index.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/index.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/indexing.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/indexing.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/internals.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/internals.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/interval.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/interval.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/join.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/join.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/lib.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/lib.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/missing.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/missing.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/ops.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/ops.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/ops_dispatch.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/ops_dispatch.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/pandas_datetime.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/pandas_datetime.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/pandas_parser.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/pandas_parser.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/parsers.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/parsers.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/properties.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/properties.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/reshape.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/reshape.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/sas.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/sas.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/sparse.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/sparse.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/testing.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/testing.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslib.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslib.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/base.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/base.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/ccalendar.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/ccalendar.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/conversion.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/conversion.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/dtypes.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/dtypes.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/fields.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/fields.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/nattype.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/nattype.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/np_datetime.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/np_datetime.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/offsets.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/offsets.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/parsing.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/parsing.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/period.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/period.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/strptime.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/strptime.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/timedeltas.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/timedeltas.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/timestamps.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/timestamps.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/timezones.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/timezones.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/tzconversion.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/tzconversion.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/tslibs/vectorized.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/tslibs/vectorized.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/window/aggregations.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/window/aggregations.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/window/indexers.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/window/indexers.cp312-win_amd64.pyd`
- `python/Lib/site-packages/pandas/_libs/writers.cp312-win_amd64.lib`
- `python/Lib/site-packages/pandas/_libs/writers.cp312-win_amd64.pyd`

### pydantic_core-2.46.4

Shipped licence and notice files

- `python/Lib/site-packages/pydantic_core-2.46.4.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/pydantic_core/_pydantic_core.cp312-win_amd64.pyd`

### pygments-2.20.0

Shipped licence and notice files

- `python/Lib/site-packages/pygments-2.20.0.dist-info/licenses/AUTHORS`
- `python/Lib/site-packages/pygments-2.20.0.dist-info/licenses/LICENSE`

Binary files

- `python/Scripts/pygmentize.exe`

### python_dotenv-1.2.2

Shipped licence and notice files

- `python/Lib/site-packages/python_dotenv-1.2.2.dist-info/licenses/LICENSE`

Binary files

- `python/Scripts/dotenv.exe`

### pythonnet-3.1.0

Shipped licence and notice files

- `python/Lib/site-packages/pythonnet-3.1.0.dist-info/licenses/AUTHORS.md`
- `python/Lib/site-packages/pythonnet-3.1.0.dist-info/licenses/LICENSE`

Includes managed .NET reference assemblies. The wheel does not identify a separate licence file for the Microsoft assemblies.

Binary files

- `python/Lib/site-packages/pythonnet/runtime/Microsoft.Win32.Primitives.dll`
- `python/Lib/site-packages/pythonnet/runtime/Python.Runtime.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.AppContext.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Collections.Concurrent.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Collections.NonGeneric.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Collections.Specialized.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Collections.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.ComponentModel.EventBasedAsync.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.ComponentModel.Primitives.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.ComponentModel.TypeConverter.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.ComponentModel.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Console.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Data.Common.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Diagnostics.Contracts.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Diagnostics.Debug.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Diagnostics.FileVersionInfo.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Diagnostics.Process.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Diagnostics.StackTrace.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Diagnostics.TextWriterTraceListener.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Diagnostics.Tools.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Diagnostics.TraceSource.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Diagnostics.Tracing.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Drawing.Primitives.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Dynamic.Runtime.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Globalization.Calendars.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Globalization.Extensions.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Globalization.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.Compression.ZipFile.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.Compression.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.FileSystem.DriveInfo.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.FileSystem.Primitives.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.FileSystem.Watcher.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.FileSystem.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.IsolatedStorage.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.MemoryMappedFiles.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.Pipes.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.UnmanagedMemoryStream.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.IO.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Linq.Expressions.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Linq.Parallel.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Linq.Queryable.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Linq.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.Http.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.NameResolution.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.NetworkInformation.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.Ping.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.Primitives.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.Requests.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.Security.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.Sockets.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.WebHeaderCollection.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.WebSockets.Client.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Net.WebSockets.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.ObjectModel.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Reflection.Extensions.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Reflection.Primitives.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Reflection.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Resources.Reader.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Resources.ResourceManager.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Resources.Writer.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.CompilerServices.VisualC.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.Extensions.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.Handles.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.InteropServices.RuntimeInformation.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.InteropServices.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.Numerics.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.Serialization.Formatters.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.Serialization.Json.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.Serialization.Primitives.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.Serialization.Xml.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Runtime.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Security.Claims.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Security.Cryptography.Algorithms.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Security.Cryptography.Csp.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Security.Cryptography.Encoding.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Security.Cryptography.Primitives.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Security.Cryptography.X509Certificates.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Security.Principal.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Security.SecureString.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Text.Encoding.Extensions.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Text.Encoding.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Text.RegularExpressions.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Threading.Overlapped.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Threading.Tasks.Parallel.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Threading.Tasks.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Threading.Thread.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Threading.ThreadPool.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Threading.Timer.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Threading.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.ValueTuple.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Xml.ReaderWriter.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Xml.XDocument.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Xml.XPath.XDocument.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Xml.XPath.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Xml.XmlDocument.dll`
- `python/Lib/site-packages/pythonnet/runtime/System.Xml.XmlSerializer.dll`
- `python/Lib/site-packages/pythonnet/runtime/netstandard.dll`

### pywin32-312

Shipped licence and notice files

- `python/Lib/site-packages/pywin32-312.dist-info/licenses/adodbapi/license.txt`
- `python/Lib/site-packages/pywin32-312.dist-info/licenses/com/License.txt`
- `python/Lib/site-packages/pywin32-312.dist-info/licenses/com/win32comext/mapi/src/MAPIStubLibrary/LICENSE`
- `python/Lib/site-packages/pywin32-312.dist-info/licenses/isapi/README.txt`
- `python/Lib/site-packages/pywin32-312.dist-info/licenses/pythonwin/License.txt`
- `python/Lib/site-packages/pywin32-312.dist-info/licenses/pythonwin/Scintilla/License.txt`
- `python/Lib/site-packages/pywin32-312.dist-info/licenses/pythonwin/pywin/idle/LICENSE.txt`
- `python/Lib/site-packages/pywin32-312.dist-info/licenses/win32/License.txt`

Binary files

- `python/Lib/site-packages/isapi/PyISAPI_loader.dll`
- `python/Lib/site-packages/pythonwin/Pythonwin.exe`
- `python/Lib/site-packages/pythonwin/dde.pyd`
- `python/Lib/site-packages/pythonwin/scintilla.dll`
- `python/Lib/site-packages/pythonwin/win32ui.pyd`
- `python/Lib/site-packages/pythonwin/win32uiole.pyd`
- `python/Lib/site-packages/pywin32_system32/pythoncom312.dll`
- `python/Lib/site-packages/pywin32_system32/pywintypes312.dll`
- `python/Lib/site-packages/win32/_win32sysloader.pyd`
- `python/Lib/site-packages/win32/_winxptheme.pyd`
- `python/Lib/site-packages/win32/libs/pywintypes.lib`
- `python/Lib/site-packages/win32/mmapfile.pyd`
- `python/Lib/site-packages/win32/odbc.pyd`
- `python/Lib/site-packages/win32/perfmon.pyd`
- `python/Lib/site-packages/win32/perfmondata.dll`
- `python/Lib/site-packages/win32/pythonservice.exe`
- `python/Lib/site-packages/win32/servicemanager.pyd`
- `python/Lib/site-packages/win32/timer.pyd`
- `python/Lib/site-packages/win32/win32api.pyd`
- `python/Lib/site-packages/win32/win32clipboard.pyd`
- `python/Lib/site-packages/win32/win32console.pyd`
- `python/Lib/site-packages/win32/win32cred.pyd`
- `python/Lib/site-packages/win32/win32crypt.pyd`
- `python/Lib/site-packages/win32/win32event.pyd`
- `python/Lib/site-packages/win32/win32evtlog.pyd`
- `python/Lib/site-packages/win32/win32file.pyd`
- `python/Lib/site-packages/win32/win32gui.pyd`
- `python/Lib/site-packages/win32/win32help.pyd`
- `python/Lib/site-packages/win32/win32inet.pyd`
- `python/Lib/site-packages/win32/win32job.pyd`
- `python/Lib/site-packages/win32/win32lz.pyd`
- `python/Lib/site-packages/win32/win32net.pyd`
- `python/Lib/site-packages/win32/win32pdh.pyd`
- `python/Lib/site-packages/win32/win32pipe.pyd`
- `python/Lib/site-packages/win32/win32print.pyd`
- `python/Lib/site-packages/win32/win32process.pyd`
- `python/Lib/site-packages/win32/win32profile.pyd`
- `python/Lib/site-packages/win32/win32ras.pyd`
- `python/Lib/site-packages/win32/win32security.pyd`
- `python/Lib/site-packages/win32/win32service.pyd`
- `python/Lib/site-packages/win32/win32trace.pyd`
- `python/Lib/site-packages/win32/win32transaction.pyd`
- `python/Lib/site-packages/win32/win32ts.pyd`
- `python/Lib/site-packages/win32/win32wnet.pyd`
- `python/Lib/site-packages/win32com/libs/axscript.lib`
- `python/Lib/site-packages/win32com/libs/pythoncom.lib`
- `python/Lib/site-packages/win32comext/adsi/adsi.pyd`
- `python/Lib/site-packages/win32comext/authorization/authorization.pyd`
- `python/Lib/site-packages/win32comext/axcontrol/axcontrol.pyd`
- `python/Lib/site-packages/win32comext/axdebug/axdebug.pyd`
- `python/Lib/site-packages/win32comext/axscript/axscript.pyd`
- `python/Lib/site-packages/win32comext/bits/bits.pyd`
- `python/Lib/site-packages/win32comext/directsound/directsound.pyd`
- `python/Lib/site-packages/win32comext/ifilter/ifilter.pyd`
- `python/Lib/site-packages/win32comext/internet/internet.pyd`
- `python/Lib/site-packages/win32comext/mapi/exchange.pyd`
- `python/Lib/site-packages/win32comext/mapi/mapi.pyd`
- `python/Lib/site-packages/win32comext/propsys/propsys.pyd`
- `python/Lib/site-packages/win32comext/shell/shell.pyd`
- `python/Lib/site-packages/win32comext/taskscheduler/taskscheduler.pyd`
- `python/Scripts/pywin32_postinstall.exe`
- `python/Scripts/pywin32_testall.exe`

### pyyaml-6.0.3

Shipped licence and notice files

- `python/Lib/site-packages/pyyaml-6.0.3.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/yaml/_yaml.cp312-win_amd64.pyd`

### qt_dax-1.3.4

Shipped licence and notice files

- `python/Lib/site-packages/qt_dax-1.3.4.dist-info/licenses/LICENSE`

Binary files

- `python/Scripts/qt-dax.exe`

### rpds_py-2026.9.1

Shipped licence and notice files

- `python/Lib/site-packages/rpds_py-2026.9.1.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/rpds/rpds.cp312-win_amd64.pyd`

### tqdm-4.68.3

Shipped licence and notice files

- `python/Lib/site-packages/tqdm-4.68.3.dist-info/licenses/LICENCE`

Binary files

- `python/Scripts/tqdm.exe`

### uvicorn-0.49.0

Shipped licence and notice files

- `python/Lib/site-packages/uvicorn-0.49.0.dist-info/licenses/LICENSE.md`

Binary files

- `python/Scripts/uvicorn.exe`

### xmhuffman-0.3.2

Shipped licence and notice files

- `python/Lib/site-packages/xmhuffman-0.3.2.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/xmhuffman.cp312-win_amd64.pyd`

### xpress8-0.1.1

Shipped licence and notice files

- `python/Lib/site-packages/xpress8-0.1.1.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/xpress8.cp312-win_amd64.pyd`

### xpress9-0.3.9

Shipped licence and notice files

- `python/Lib/site-packages/xpress9-0.3.9.dist-info/licenses/LICENSE`

Binary files

- `python/Lib/site-packages/xpress9.cp312-win_amd64.pyd`
