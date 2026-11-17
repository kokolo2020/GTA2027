# Harbor City

Original single-player Android city exploration and driving prototype for Koko's Samsung Galaxy Z Fold5. The repository is named GTA2027; the game remains Harbor City and uses original assets.

**[Download the game](https://kokolo2020.github.io/GTA2027/) · [APK releases](https://github.com/kokolo2020/GTA2027/releases/latest)**

Current version: **0.8.0 — The North Update**. Android 7+, ARM64, GLES3. Offline. Install over the old app to keep progress.

## Project

- `game/project.godot`: Godot **4.7.2 standard**, GDScript, Compatibility renderer.
- `game/main.gd`: world, driving, missions, saves, radio, pedestrians and regression test.
- `game/models/`: original exported GLB models.
- `blender-src/`: Blender 4.2 generators for cars, landmarks and scenery.
- `site/`: public GitHub Pages download page. APKs are release assets, not Git blobs.
- `docs/`: release notes, screenshots and history.
- `scripts/publish-release.py`: verifies and publishes an APK using GitHub CLI.

## Open and test

Install Godot 4.7.2 from the official vendor and import `game/project.godot`.

    godot --headless --path game --editor --import --quit
    godot --headless --path game -- --smoke-test
    godot --path game

WASD/arrows move; E interacts; Escape opens Menu. Android uses the joystick and contextual button.

## Build Android

Install matching Godot export templates, OpenJDK 17 and the official Android SDK. Configure Godot's Android export paths and **the existing signing key** locally. Export the Android preset as Debug to `builds/Harbor-City-Android-debug.apk`.

On Koko's existing Mac, the editor, JDK, SDK and templates remain under `~/harbor-city/tools/`; the original Godot key remains in the user's Godot configuration. Read [PUBLISHING.md](PUBLISHING.md) before building or publishing.

## Publish without the Sites connector

Commit the tested source and release notes, then:

    python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.8.0.md

GitHub CLI authentication with repository write access is required. GitHub Actions publishes `site/` automatically when it changes on `main`. No OpenAI Sites connector is needed.

The repository deliberately excludes signing keys, credentials, tools, caches and APK binaries. Keep the key backed up privately: changing it prevents an in-place update of existing installs.

Godot's MIT attribution is in `game/credits.txt`. Public availability of this source does not grant an additional project license.
