"""Build a cumulative hotfix zip for the [PTO'43] Modpack.

    python tools/make_hotfix.py 1.0.2

1. Syncs the mod's text sources into src/.
2. Syntax-checks every .lua (if DCS's luae.exe is found; set DCS_LUAE to its path).
3. Packs every file that is new or different from the 1.0 BETA zip.

Hotfixes are cumulative: players only need 1.0 BETA + the latest hotfix.
Nothing is committed or published by this script.

Expected layout (all next to the repository folder):
    [PTO'43] Modpack/Mods/tech/0_PTO'43 Modpack/   the mod you edit
    [PTO'43] Modpack_BETA_1.0.zip                  the published base release
"""
import argparse
import os
import shutil
import subprocess
import sys
import zipfile
import zlib
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
STORAGE = REPO.parent
MOD_NAME = "0_PTO'43 Modpack"
ZIP_ROOT = "[PTO'43] Modpack/Mods/tech/" + MOD_NAME + "/"
TEXT_EXT = (".lua", ".lods", ".ship_wake", ".txt")


def files_in(root):
    return {p.relative_to(root).as_posix(): p for p in root.rglob("*") if p.is_file()}


def crc_and_size(path):
    crc = 0
    with open(path, "rb") as fh:
        for block in iter(lambda: fh.read(1 << 22), b""):
            crc = zlib.crc32(block, crc)
    return crc, path.stat().st_size


def sync_sources(mod_files):
    dest = REPO / "src" / MOD_NAME
    wanted = {k: p for k, p in mod_files.items() if k.lower().endswith(TEXT_EXT)}
    for rel, path in wanted.items():
        target = dest / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(path, target)
    for rel, path in files_in(dest).items():
        if rel not in wanted:
            path.unlink()
            print("  removed from src/:", rel)
    print("src/ synced: %d files" % len(wanted))


def check_lua(mod_files):
    luae = Path(os.environ.get("DCS_LUAE", r"D:\DCS World\bin\luae.exe"))
    if not luae.exists():
        print("WARNING: luae.exe not found, Lua syntax NOT checked")
        return
    errors = []
    for rel, path in mod_files.items():
        if rel.lower().endswith(".lua"):
            code = "local f,err=loadfile([[%s]]) if not f then print(err) end" % path
            out = subprocess.run([str(luae), "-e", code], capture_output=True, text=True, errors="replace")
            if out.returncode or out.stdout.strip():
                errors.append("%s: %s" % (rel, (out.stdout + out.stderr).strip()))
    if errors:
        sys.exit("Lua errors, hotfix NOT built:\n" + "\n".join(errors))
    print("Lua syntax OK")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("version", help="for example 1.0.2")
    ap.add_argument("--mod", type=Path, default=STORAGE / "[PTO'43] Modpack" / "Mods" / "tech" / MOD_NAME)
    ap.add_argument("--base", type=Path, default=STORAGE / "[PTO'43] Modpack_BETA_1.0.zip")
    ap.add_argument("--out", type=Path, help="output zip (default: next to the repository)")
    args = ap.parse_args()
    out = args.out or STORAGE / ("PTO43_Modpack_HOTFIX_%s.zip" % args.version)
    for needed in (args.mod, args.base):
        if not needed.exists():
            sys.exit("Not found: %s" % needed)
    if out.exists():
        sys.exit("Already exists (use a new version number): %s" % out)

    mod_files = files_in(args.mod)
    check_lua(mod_files)
    sync_sources(mod_files)

    with zipfile.ZipFile(args.base) as z:
        base = {i.filename.split(MOD_NAME + "/", 1)[1]: (i.CRC, i.file_size)
                for i in z.infolist() if not i.is_dir()}
    changed = sorted(k for k, p in mod_files.items() if base.get(k) != crc_and_size(p))
    removed = sorted(set(base) - set(mod_files))
    if not changed:
        sys.exit("No differences from the base release.")

    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as z:
        for rel in changed:
            z.write(mod_files[rel], ZIP_ROOT + rel)
    with zipfile.ZipFile(out) as z:
        assert z.testzip() is None, "zip is corrupt"

    print("\n".join("  " + c for c in changed))
    print("%d files, %.1f MB -> %s" % (len(changed), out.stat().st_size / 1048576, out))
    if removed:
        print("WARNING: files removed since 1.0 (a zip cannot delete them; mention it in the notes):")
        print("\n".join("  " + r for r in removed))


if __name__ == "__main__":
    main()
