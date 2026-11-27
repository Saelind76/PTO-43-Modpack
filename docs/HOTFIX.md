# How to ship a hotfix

Hotfixes are **cumulative**: each one contains everything changed since 1.0 BETA, so players only need
**1.0 BETA + the latest hotfix**.

1. Edit the mod folder as usual and test it in DCS.
2. In `CHANGELOG.md`, move what is under **Unreleased** to a new version heading.
3. From the repository folder, build the zip (it also syncs `src/` and checks Lua syntax):

   ```powershell
   python tools/make_hotfix.py 1.0.2
   ```

4. Check `git diff`, then commit and push `src/` and `CHANGELOG.md`.
5. Copy the previous notes in `docs/releases/` to `docs/releases/v1.0.2-beta.md`, update them, then publish:

   ```powershell
   gh release create v1.0.2-beta ..\PTO43_Modpack_HOTFIX_1.0.2.zip --prerelease --title "[PTO'43] Modpack HOTFIX 1.0.2 (beta)" --notes-file docs/releases/v1.0.2-beta.md
   ```

6. In `docs/releases/v1.0-beta.md` update the **Latest hotfix** row (link and size) and the link in `README.md`,
   push, then apply it:

   ```powershell
   gh release edit v1.0-beta --notes-file docs/releases/v1.0-beta.md
   ```

Notes:
- A zip cannot delete files. If you remove a file from the mod, say so in the release notes.
- Large changes to models or textures make the hotfix grow. When it gets close to the size of the full
  pack, publish a new full release instead and point `--base` to it.
