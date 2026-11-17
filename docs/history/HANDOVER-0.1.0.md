# Harbor City — Claude handover

Updated 16 November 2026, Bangkok time. This is the current source of truth. Earlier milestone notes are archived in HANDOVER-EARLIER-NOTES.md and contain superseded statements.

## Resume prompt

Continue Harbor City at /Users/koko/harbor-city. Read CLAUDE-HANDOVER.md first and preserve the existing project. The first Android prototype is built and privately published. Next priority is testing installation, controls, layout, and performance on Koko's Galaxy Z Fold5, then fixing observed issues. Keep AI usage low. Never create recurring monitoring or three-minute checks. Do not spend money or publish to an app store without authorization.

## Product and user authorization

- Original GTA-inspired standalone mobile game; single-player first, multiplayer later.
- Working title: Harbor City — First Drive. Stylized procedural waterfront city with original geometry; no copied GTA branding/assets.
- User requested first playable gameplay, screenshots, and publication when ready. A private APK download page is published.
- User accepted Google's Android SDK License Agreement and authorized SDK tool installation in this conversation. Do not request acceptance of the same agreement again. New legal agreements still require acceptance.
- No paid hosting/services/assets, store fees, or public audience change authorized.
- Never schedule recurring AI monitoring. Conserve usage; do not infer current quota from old screenshots.
- Leave other projects, OBS and livestreams alone.

## Current delivery

Private download page:
https://harbor-city-koko.sotivear-pic-7972.chatgpt.site

Sign in with the owner's ChatGPT account. The deployed URL was opened and showed the expected sign-in gate. The native deployment result confirmed success. Authenticated production download has not been retested; the local browser download passed.

- APK: builds/Harbor-City-Android-debug.apk
- Version 0.1.0, code 1, package com.koko.harborcity.
- 28,316,482 bytes; SHA256 c0e16bce35f7824cdb669f471223717ff3e015471647caba34befd631f6b66d7.
- ARM64 only, minimum Android API 24, target API 36, GLES 3, landscape.
- Debug signed with local Godot debug key. Signature schemes v2 and v3 verified.
- No Android permissions requested. Offline game.
- Real screenshot: builds/harbor-city-gameplay.png.
- Source bundle: Harbor-City-source.zip. Excludes toolchain, Godot caches and signing keys.
- This is a small playable prototype, not a finished commercial game. Physical Android installation/performance remain unverified.

## Implemented and verified

- Procedural roads, buildings/windows, trees, kiosks, sea, yellow-shirt player and blue car.
- Walk with left joystick or WASD/arrows; contextual action button or E.
- Enter, steer, drive, brake by releasing input, collide with buildings, exit.
- Collect parcel at Port Dispatch (-32,0,26); deliver to Sunset Market (32,0,-29); earn $150.
- Golden goal ring, direction arrow, distance, speed, earnings and deliveries.
- Menu Continue / rescue back to car, preserving earned progress.
- Cash and completed delivery totals saved in ConfigFile user://harbor_save.cfg. Active parcel resets on relaunch.
- Separate touch fingers supported: joystick can remain held while other finger presses action.
- F12 saves actual viewport PNG at user://screenshots/harbor-city-gameplay.png.

Final source smoke test passed: two-finger input, actual driving displacement, pickup, delivery/reward, rescue, vehicle exit after settling. Test restores original cash/delivery totals on success; assertion failure may leave test save state.

Manual Mac checks passed: walking, car entry, movement/steering, braking, building collision, and exit. Exit floor-overlap bug fixed by adding 0.25 to exit-candidate Y. F12 screenshot was exercised successfully after the fix.

Not verified: physical Fold5 installation, touch on device, unfolded/folded layout and resize, Android lifecycle/background-resume, frame rate and thermal behavior.

## Files and tools

Project root /Users/koko/harbor-city

- game/project.godot — Godot 4.7.2, GDScript, Compatibility renderer, 1280x720 expanding viewport.
- game/main.gd — city, gameplay, HUD, touch, local save, smoke test, screenshot helper.
- game/main.tscn — main scene.
- game/icon.svg — original launcher icon.
- game/credits.txt — Godot MIT license text.
- game/export_presets.cfg — Android debug export, custom matching templates.
- download-site/ — separate Git checkout for deployed download page.
- download-site/.openai/hosting.json — retained Site identity.
- VALIDATION.md — verification record.

Godot binary:
 /Users/koko/harbor-city/tools/Godot.app/Contents/MacOS/Godot
JDK:
 /Users/koko/harbor-city/tools/jdk17/jdk-17.0.21+9/Contents/Home
SDK:
 /Users/koko/harbor-city/tools/android-sdk
Templates:
 /Users/koko/harbor-city/tools/export-templates/4.7.2.stable/

SDK has command-line tools, platform-tools, build-tools 35.0.1, Android platform 35. No emulator, NDK, CMake or full Android Studio required for current prebuilt export.

Global Godot editor settings point to these JDK/SDK paths. Default debug key lives in ~/Library/Application Support/Godot/keystores/debug.keystore. Never distribute keys or tools/editor-settings-before-android.tres.

## Reproduce checks and build

From a terminal:

    /Users/koko/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path /Users/koko/harbor-city/game -- --smoke-test

    /Users/koko/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path /Users/koko/harbor-city/game --export-debug Android /Users/koko/harbor-city/builds/Harbor-City-Android-debug.apk

    env JAVA_HOME=/Users/koko/harbor-city/tools/jdk17/jdk-17.0.21+9/Contents/Home /Users/koko/harbor-city/tools/android-sdk/build-tools/35.0.1/apksigner verify --verbose /Users/koko/harbor-city/builds/Harbor-City-Android-debug.apk

Prebuilt template targets SDK 36. Leave gradle_build/target_sdk blank: overriding it while Gradle is disabled causes export failure. Build tools 35.0.1 successfully sign and verify this template; exporter prints version mismatch warning. Mac headless CA certificate lookup error and sandbox adb daemon warning also occurred; export completed. Check artifact and signature rather than assuming these warnings prove failure.

Avoid simultaneous headless export and GUI testing: multiple Godot processes share a bundle ID and computer automation may select the wrong editor window. Last gameplay process may still be open; inspect before launching duplicates. Idle recovery-mode editor was closed.

## Published website maintenance

Site ID: appgprj_6afb31a03dfc8191b5320be3bc52385f
Audience: owner-private; preserve.
Successful deployment: appgdep_6afb32c8ebb08191b9875e9b3c5a0ebd
Pushed source commit: c5527d9995942d37f87ec5c68d3abd7d5b9c4f32
Saved version: appgprj_6afb31a03dfc8191b5320be3bc52385f~appgver_efc86d599ee081919d0223f02fdc86e3

Read the Sites skill before updates if available. Reuse project_id; do not create another Site. Credentials were held only in session memory; mint fresh scoped credentials via the connector when needed. Push matching source before publishing.

Buildless HTML/CSS/JS under download-site/dist.
- assets/gameplay.png — actual game capture.
- assets/harbor-city.part1 through part3 — APK split into <=10 MiB chunks to fit static host asset limits.
- download.json — filename, byte count, version, SHA256 and ordered part paths.
- download.js — fetch parts, join Blob, verify length and SHA256, download with .apk extension.

After every APK rebuild regenerate all parts and metadata, verify reassembled bytes equal the APK, and republish matching source. Never update only the APK while leaving old website parts. Local browser button passed complete download/checksum path. Local preview server was stopped.

## Next steps for Claude

1. Help Koko install the existing APK on the Fold5 using the private page. If sign-in or blob downloading fails on phone, reproduce that specific issue and provide a supported distribution fix.
2. Test landscape launch, walk, simultaneous joystick/action, enter/drive/exit, pickup/delivery, rescue, save persistence, fold/unfold and background/resume.
3. Fix observed failures; rebuild and verify signature, regenerate website chunks/checksum, publish with existing audience.
4. Keep the scope small until the first phone playthrough passes. Multiplayer, larger world, extra missions, traffic and store release are later decisions.

Do not claim the phone playthrough passed until it has actually been observed.
