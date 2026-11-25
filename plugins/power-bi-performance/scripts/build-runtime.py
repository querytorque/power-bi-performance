"""Repackage and compare the unchanged runtime from the pinned VSIX."""

import argparse
import csv
import hashlib
import io
import json
import posixpath
from collections import defaultdict
from pathlib import Path, PurePosixPath
from zipfile import ZIP_DEFLATED, ZipFile, ZipInfo


VERSION = "1.3.4"
VSIX_SHA = "c1e032242cc9d3f60003a20df5458289c74c23602ccac050d1ca2083c156a1f1"
ZIP_NAME = f"power-bi-performance-runtime-{VERSION}-win32-x64.zip"
VSIX_PREFIX = "extension/runtime/"
SITE = "python/Lib/site-packages/"
CLIENT_MANIFEST = SITE + "qt_dax/connections/native_clients_manifest.json"
BINARY_SUFFIXES = {
    ".a", ".dll", ".exe", ".exp", ".lib", ".obj", ".ocx", ".pdb", ".pyd",
    ".so", ".tlb", ".winmd",
}


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def verified(data: bytes, expected: str, name: str) -> bytes:
    if sha(data) != expected:
        raise ValueError(f"SHA-256 mismatch for {name}")
    return data


def inventory(members: dict[str, bytes]) -> str:
    owners = {}
    notices = defaultdict(list)
    for path in members:
        if path.startswith(SITE) and path.endswith(".dist-info/RECORD"):
            group = PurePosixPath(path).parent.name
            for filename, *_ in csv.reader(io.StringIO(members[path].decode())):
                owners[posixpath.normpath(SITE + filename)] = group
        if path.startswith(SITE) and ".dist-info/" in path:
            folder, filename = path.removeprefix(SITE).split(".dist-info/", 1)
            if filename.startswith("licenses/") or filename.lower().startswith(
                ("license", "licence", "notice", "copying", "copyright")
            ):
                notices[folder + ".dist-info"].append(path)

    groups = defaultdict(list)
    for path, data in sorted(members.items()):
        if PurePosixPath(path).suffix.lower() in BINARY_SUFFIXES or data.startswith(b"MZ"):
            group = owners.get(path)
            if group is None:
                if not path.startswith("python/") or path.startswith(SITE):
                    raise ValueError(f"Unattributed binary: {path}")
                group = "CPython Windows runtime"
            groups[group].append(path)

    count = sum(map(len, groups.values()))
    lines = [
        "# Third-party binary inventory",
        "",
        f"The {VERSION} Windows x64 runtime ZIP ships {count} binary files from the released VSIX,",
        "including CPython and dependencies of QT:DAX. Paths below are relative to the ZIP root.",
        "The archive preserves the VSIX's THIRD_PARTY_NOTICES.txt and wheel notices.",
        "The QueryTorque plugin uses Apache-2.0. The owner must confirm redistribution terms for the runtime before publishing.",
        "Some wheels bundle components without a separate licence file alongside the binary.",
        "",
        "## Microsoft prerequisites downloaded on first run",
        "",
        "The released QT:DAX NuGet installer downloads the pinned packages from `api.nuget.org`.",
        "It verifies package and extracted DLL SHA-256 hashes against the released manifest",
        "before activating the client cache in Claude Code's plugin data directory.",
        "The packages and the selected client DLLs below are supplied by the first-run download.",
        "The installer retains `package-license.json` and these package notices in the client cache.",
        "",
        "| NuGet package | Licence terms | Retained notices | Selected DLLs |",
        "|---|---|---|---|",
    ]
    manifest = json.loads(members[CLIENT_MANIFEST])
    for package in manifest["packages"]:
        name, version = package["id"], package["version"]
        terms = f"[{package['license'] or 'Vendor terms'}]({package['license_url']})"
        retained = ", ".join(f"`{PurePosixPath(path).name}`" for path in package["notices"]) or "None listed"
        dlls = ", ".join(f"`{filename}`" for filename, entry in manifest["files"].items()
                         if (entry["package"], entry["version"]) == (name, version))
        lines.append(f"| `{name} {version}` | {terms} | {retained} | {dlls} |")
    lines.extend(["", "## Binaries shipped in the runtime ZIP"])
    for group, paths in sorted(groups.items(), key=lambda item: item[0].lower()):
        lines.extend(["", f"### {group.removesuffix('.dist-info')}", ""])
        if group == "CPython Windows runtime":
            files = ["python/LICENSE.txt", "THIRD_PARTY_NOTICES.txt"]
        else:
            files = sorted(notices[group])
        if files:
            lines.extend(["Shipped licence and notice files", ""])
            lines.extend(f"- `{path}`" for path in files)
        else:
            lines.append("The wheel has no separate licence file. See THIRD_PARTY_NOTICES.txt.")
        extra = {
            "CPython Windows runtime": "The CPython notice includes Microsoft Visual C++ redistribution terms and notices for bundled OpenSSL, SQLite, Tcl/Tk and libffi.",
            "numpy-2.5.4.dist-info": "Includes OpenBLAS and Microsoft Visual C++ runtime. Review the OpenBLAS notice and Microsoft redistribution terms.",
            "pandas-3.1.1.dist-info": "Includes Microsoft Visual C++ runtime. The wheel does not ship a separate Microsoft licence file.",
            "pythonnet-3.1.0.dist-info": "Includes managed .NET reference assemblies. The wheel does not identify a separate licence file for the Microsoft assemblies.",
        }.get(group)
        if extra:
            lines.extend(["", extra])
        lines.extend(["", "Binary files", ""])
        lines.extend(f"- `{path}`" for path in paths)
    return "\n".join(lines) + "\n"


def write_comparison(target: Path, members: dict[str, bytes], listing: Path) -> None:
    with ZipFile(target) as archive, listing.open("w", encoding="utf-8", newline="") as output:
        names = archive.namelist()
        if len(names) != len(members) or set(names) != members.keys():
            raise ValueError("Runtime ZIP member list differs from the released VSIX runtime")
        writer = csv.writer(output, delimiter="\t", lineterminator="\n")
        writer.writerow(("runtime_path", "bytes", "vsix_sha256", "zip_sha256", "result"))
        for path, source in sorted(members.items()):
            packaged = archive.read(path)
            if source != packaged:
                raise ValueError(f"Runtime ZIP member differs from the VSIX: {path}")
            writer.writerow((path, len(source), sha(source), sha(packaged), "match"))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--vsix", required=True, type=Path)
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--inventory", required=True, type=Path)
    args = parser.parse_args()
    source = verified(args.vsix.read_bytes(), VSIX_SHA, args.vsix.name)
    with ZipFile(io.BytesIO(source)) as archive:
        members = {
            entry.filename.removeprefix(VSIX_PREFIX): archive.read(entry)
            for entry in archive.infolist()
            if entry.filename.startswith(VSIX_PREFIX) and not entry.is_dir()
        }
    markdown = inventory(members)

    args.out.mkdir(parents=True, exist_ok=True)
    target = args.out / ZIP_NAME
    with ZipFile(target, "x") as archive:
        for path, data in sorted(members.items()):
            entry = ZipInfo(path, date_time=(1980, 1, 1, 0, 0, 0))
            entry.create_system = 0
            archive.writestr(entry, data, compress_type=ZIP_DEFLATED, compresslevel=9)
    write_comparison(target, members, args.out / "VSIX-COMPARISON.tsv")
    digest = sha(target.read_bytes())
    (args.out / "SHA256SUMS.txt").write_text(f"{digest}  {ZIP_NAME}\n", encoding="utf-8")
    args.inventory.write_bytes(markdown.encode("utf-8"))
    print(f"{digest}  {target} ({len(members)} members, {target.stat().st_size} bytes)")


if __name__ == "__main__":
    main()
