# Publishing Harbor City from Claude or another coding assistant

Canonical source: https://github.com/kokolo2020/GTA2027  
Mac checkout: `/Users/koko/GTA2027`  
Download page: https://kokolo2020.github.io/GTA2027/  
APK releases: https://github.com/kokolo2020/GTA2027/releases

The former ChatGPT Site is retained as a v0.8.0 fallback. Future publishing uses GitHub; do not use its Sites connector or edit the older checkout unless recovering historical files.

## Access

Use an authenticated GitHub CLI with write access to kokolo2020/GTA2027. Run `gh auth status`. If another Claude environment is not authenticated, ask Koko to complete GitHub login there. Never copy tokens into chat, source, command arguments or committed files. A folder path alone does not give a cloud session access to the Mac.

## Each release

1. Pull main and preserve existing work. Increase `version/code` and `version/name` in `game/export_presets.cfg`. Keep package `com.koko.harborcity` and the current signing identity.
2. Import new assets and run the Godot smoke test. Check the changed behavior visually and on the Fold5 when available. Tests restore saves on success; do not run two game/test instances concurrently against the same save.
3. Export the signed Android Debug APK on the Mac to `builds/Harbor-City-Android-debug.apk`. The SDK agreement was already accepted by Koko. New agreements or spending still need authorization. Never generate a replacement key for existing players.
4. Update `site/index.html`, copy an actual game screenshot to `site/assets/gameplay.png`, and add reviewed `docs/releases/vX.Y.Z.md`. Put the correct version in static button/image/script query strings. Do not claim device validation that has not happened.
5. Commit the tested source, assets, page and release notes to main. Keep the working tree clean.
6. Run the publisher (first use `--check-only` if desired):

       python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/vX.Y.Z.md

The script verifies APK integrity, package, version and signing certificate; tags the source; creates a draft GitHub release; uploads a frozen APK copy, SHA256SUMS.txt and release.json; publishes it; updates Pages metadata; pushes it; and downloads the remote APK to verify the checksum. It refuses to overwrite an already published version. Partial draft uploads can be retried with the same tested commit.

7. Check the **Publish download page** Actions run and the live page before reporting success. A published release is downloadable even if Pages is still deploying. Record the release URL, source commit, APK hash and test limits in CLAUDE-HANDOVER.md.

## Android tools

The publisher finds `apksigner` and `aapt` on PATH or under `ANDROID_HOME/build-tools`. On this Mac it also recognizes the existing `~/harbor-city/tools/android-sdk` and JDK17 directories.

The portable export preset has no custom template paths. Either install matching templates in Godot's normal location or select the existing debug/release templates under `~/harbor-city/tools/export-templates/4.7.2.stable/` locally. Do not commit personal paths or signing settings. Keep Gradle target-SDK override blank for prebuilt APK export.

Claude's Linux VM cannot execute Mac binaries. It can test using the matching Linux Godot and use GitHub CLI to publish a verified APK, but SDK tools must be native to that environment. Building on the Mac with the existing key is the established route.

## Blender regeneration

From this checkout, with Blender 4.2 available:

    blender --background --python blender-src/make_models.py
    blender --background --python blender-src/make_world.py

Run each generator in a disposable Blender scene; it clears that scene. Re-import GLBs into Godot, test and commit generated models. No Blender install is required simply to run the existing game.

## Boundaries

Preserve money, cars, upgrades, discoveries and mission progress on update. Do not advise uninstalling. Single-player/offline; multiplayer hosting, paid services and app-store publication are separate decisions. Never create recurring monitoring or three-minute checks.
