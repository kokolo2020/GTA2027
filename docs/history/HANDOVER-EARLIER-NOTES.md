# Harbor City — handover to Claude

Prepared 16 November 2026, Bangkok time. Read this before CONTINUE-HERE.md or VALIDATION.md: those files describe an earlier milestone and are superseded where this note differs.

## User's goal and scope

Koko wants an original GTA-inspired standalone mobile game for a **Samsung Galaxy Z Fold5 (Android)**. We agreed to **single-player first**, multiplayer later. Working title: **Harbor City**. Godot 4.7.2 standard editor, GDScript, Compatibility renderer, procedural stylized 3D city, no external art dependencies.

First playable scope: walk, enter/drive/exit a car, pick up a parcel at Port Dispatch, deliver it to Sunset Market for $150, save cash and completed delivery totals locally. Landscape with a left joystick and right contextual action button. This is an early prototype, not GTA-scale production.

User has authorized continuing through first playable gameplay and asked to **show gameplay screenshots and publish when ready to play**. They subsequently requested this handover to continue in Claude. No public download page or store release exists yet. Do not claim publication or phone validation.

## Cost and authorization preferences

- Conserve AI usage. Latest screenshot showed 30% of the five-hour allowance and 13% of the weekly allowance remaining; do not assume that is still current.
- **Never schedule three-minute checks or recurring AI monitoring.** See `/Users/koko/AGENTS.md`.
- User explicitly accepted the Android SDK License Agreement and authorized installing SDK build tools during this session. The accepted SDK license has been recorded by sdkmanager. Do not ask for the same license again. New or different legal agreements still need user acceptance.
- User said “Approve all till first playable gameplay.” Routine implementation, installing the authorized tools, testing and preparing distribution are authorized. No spending on hosting/assets/accounts, no paid services, no store publication fees are authorized.
- Do not touch the user's other projects or livestreams. The previous Flag Atelier stream has ended and its monitoring automation was deleted.

## Where everything is

Project root: `/Users/koko/harbor-city`

- `game/project.godot`: import/open in Godot.
- `game/main.tscn`: main scene, a Node3D with the main script attached.
- `game/main.gd`: all city generation, player/car movement, mission, HUD, controls, local save, regression test.
- `game/icon.svg`: original Harbor City launcher icon added after the first APK export.
- `game/credits.txt`: official Godot MIT license downloaded from the 4.7.2 source repository.
- `game/export_presets.cfg`: Android arm64 debug export configuration with custom template paths.
- `builds/Harbor-City-Android-debug.apk`: **EXISTS BUT STALE**. First successful export, predates final fixes described below. Do not distribute it as the latest build.
- `Harbor-City-source.zip`: refreshed with this handover and latest source; excludes SDK/editor/caches/signing keys.
- `tools/Godot.app`: extracted official macOS editor.
- `tools/jdk17/jdk-17.0.21+9/Contents/Home`: OpenJDK 17 for Apple Silicon.
- `tools/android-sdk`: local Android SDK.
- `tools/export-templates/4.7.2.stable/android_debug.apk` and `android_release.apk`: extracted official templates matching the editor.
- `tools/editor-settings-before-android.tres`: backup of Godot's global editor settings before configuring Android paths. This may contain local signing configuration; do not publish it.

Godot editor settings at `/Users/koko/Library/Application Support/Godot/editor_settings-4.7.tres` now point to the above JDK and SDK. SDK packages installed: platform-tools, build-tools 35.0.1, Android platform 35, command-line tools. Full Android Studio, emulator, NDK and CMake were NOT installed; the prebuilt Godot APK export succeeded without them.

SDK command-line tools archive SHA256 was verified against Google's download page:
`835b62a26162b229b441d1f6d4680383815a270809eb33522c0d480fa5002c4e`

## Implemented behavior

- Procedural waterfront district: road grid, buildings with windows, kiosks, trees, signs, sea, player and blue car.
- Walking and camera-relative movement using WASD/arrows or joystick.
- Arcade steering, acceleration, release-to-brake, car collision and gravity.
- Contextual action: enter/exit vehicle, pick up or deliver at destination.
- Golden destination ring, distance, directional arrow, speed readout.
- Separate-finger touch dispatch for joystick and buttons. Mouse-from-touch emulation is disabled; real touch buttons are dispatched from InputEventScreenTouch. Mouse remains supported on desktop.
- Menu: continue and rescue/reset to start, with progress preserved.
- Local ConfigFile save at `user://harbor_save.cfg`: cash and completed deliveries. Active parcel does not persist across relaunch.
- F12 gameplay screenshot function was added at the very end: writes `user://screenshots/harbor-city-gameplay.png` after RenderingServer.frame_post_draw. **Not yet exercised in a fresh running build.**

Mission positions:
- Pickup `Vector3(-32, 0, 26)`.
- Drop-off `Vector3(32, 0, -29)`.

## Validation completed

1. Headless editor imported the project.
2. The actual city rendered in a Mac debug window, with visible HUD, joystick and action button after the old off-screen positioning bug was fixed.
3. Manual desktop play testing confirmed walking toward the car, contextual button entry, steering/movement, automatic braking and building collision.
4. A manual exit attempt exposed a bug: after the car settled, the capsule exit query overlapped the floor, blocking all candidates. **Fixed afterward** by raising each exit candidate Y by 0.25. Manual visual recheck of that fix remains pending.
5. Expanded regression test passed after this fix. It exercises two-finger entry while maintaining joystick finger, driving displacement, parcel pickup, delivery/reward, rescue, and exit after allowing the vehicle to settle on the ground.
6. The last code change after that passing test adds the F12 screenshot helper; rerun the check to include that final addition.

Successful regression output:
`HARBOR_SMOKE_OK: two-finger input, drive, pickup, deliver, exit, rescue`

Run:
```sh
/Users/koko/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path /Users/koko/harbor-city/game -- --smoke-test
```
The test briefly changes progress but restores original cash/delivery totals on successful completion. An assertion failure may leave a test state saved; inspect before relying on it.

## First APK export details — stale artifact

The first export succeeded, including APK alignment, signing and verification:

- File size: 28,267,022 bytes (~27 MiB).
- Modified: 2026-11-16 23:13:20 Bangkok.
- SHA256: `ab2edfaa2cc29df859cc5b9c3a57ac34c1784f929bec4d28af04463ca55a47b0`
- Package: `com.koko.harborcity`, version 0.1.0 / code 1.
- arm64-v8a only, GLES 3.0, landscape, small/normal/large/xlarge screens supported.
- Minimum Android SDK 24; first APK manifest target SDK 36 (template default).
- No requested permissions appeared in aapt badging. Internet is explicitly false in the preset.
- Signed with the local Godot debug key. Keep signing keys local; do not include them in the source archive or website.

Warnings in first export:
- System CA lookup error in this sandbox, also in headless tests. No network feature exists in the game.
- Build tools target mismatch: template used SDK36, installed build tools were35.0.1. Export still signed/verified. Source preset now includes `gradle_build/target_sdk="35"`; confirm whether this affects prebuilt (non-Gradle) export. It might not. Either install matching36 tools under the already accepted SDK license or verify compatibility honestly; do not misreport manifest values.
- Missing project icon: **source now includes original icon.svg and config/icon**, so rebuild.
- Could not connect to adb daemon due sandbox permissions. That is not a failed APK export and no phone was connected/tested.

Source is newer than first APK (last recorded main.gd modification 23:18:25). Later source changes include icon/credits, target setting, menu attribution, the floor/exit fix, better button hover/pressed styles and toast outlines, plus F12 capture. **Rebuild before sharing.**

Rebuild:
```sh
/Users/koko/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path /Users/koko/harbor-city/game --export-debug Android /Users/koko/harbor-city/builds/Harbor-City-Android-debug.apk
```

Verify:
```sh
env JAVA_HOME=/Users/koko/harbor-city/tools/jdk17/jdk-17.0.21+9/Contents/Home /Users/koko/harbor-city/tools/android-sdk/build-tools/35.0.1/apksigner verify --verbose /Users/koko/harbor-city/builds/Harbor-City-Android-debug.apk
/Users/koko/harbor-city/tools/android-sdk/build-tools/35.0.1/aapt dump badging /Users/koko/harbor-city/builds/Harbor-City-Android-debug.apk
/Users/koko/harbor-city/tools/android-sdk/build-tools/35.0.1/aapt dump permissions /Users/koko/harbor-city/builds/Harbor-City-Android-debug.apk
```

## Remaining tasks in priority order

1. Run final regression check including F12 addition; open a fresh game instance. Visually verify controls and corrected vehicle exit on the ground, then complete one delivery manually if practical.
2. Test landscape at unfolded Fold5-like aspect ratio and a narrower cover-screen ratio. The code uses a 1280x720 base with expand and viewport-size callbacks; actual fold/resume and Android touch still need real device testing.
3. Capture real screenshots for the user. F12 in latest game should save a clean viewport image at:
   `/Users/koko/Library/Application Support/Godot/app_userdata/Harbor City/screenshots/harbor-city-gameplay.png`
   Copy it to `builds/` for delivery. Earlier screenshots were shown through the computer-use tool only; no gameplay PNG is currently saved on disk.
4. Rebuild and verify the current debug APK. APK built != phone tested. Install on user's Fold5 if reachable/authorized or provide an APK download and simple private-install instructions. Do not disable Play Protect or broad device security controls.
5. Publish a minimal Android download page only after the refreshed build is verified. Explicitly label an early single-player prototype. It is an Android download, not a browser game. User has asked to publish. **No Site/Netlify project has been created for Harbor City yet.** Choose a suitable existing authorized hosting workflow. Do not expose tools, debug keys, SDKs or other local files.
6. Update handover/validation and source ZIP. Preserve this setup so credits are not wasted repeating installation.

## Publishing considerations (not implemented)

The APK is ~27MiB. Some static hosts cap individual assets at25MiB, so check before selecting hosting. Possible options: a host supporting this size, gzip transport if configured correctly, or a browser download button that fetches and concatenates byte chunks and validates SHA256. These were ideas only; no website, chunks, manifest or download code exists yet. Do not blindly claim the APK can be served by a particular platform.

## UI automation pitfalls observed

Native Godot accessibility exposes only windows/menus; screenshots and coordinates are needed for in-game controls. Multiple Godot processes (editor, Project Manager, game, headless exporter) share the same bundle ID, so tools may bind the wrong process and return `noWindowsAvailable` during a run/export. Avoid running an exporter concurrently with native UI play tests. Reacquire the correct app after the headless process exits. Use normal app quit/reopen if appropriate; do not kill arbitrary processes or lose unsaved work.

Godot Project Manager sometimes showed a recovery prompt after headless/editor runs. Choose Edit normally for this project; no tool scripts, plugins or GDExtensions are involved. Normal play worked afterward. Last computer-use attempt timed out and reset its tool session; no reliable active app handle remains.

## Resume prompt to paste into Claude

Continue `/Users/koko/harbor-city`. Read `CLAUDE-HANDOVER.md` first. Finish and verify the single-player Android prototype for my Samsung Galaxy Z Fold5, show real gameplay screenshots, rebuild the stale APK, and publish an install/download page once it is ready for testing. Android SDK license installation was explicitly accepted already. Keep costs and AI usage low; never set up three-minute checks or recurring monitoring. No paid services or store release. Report what was actually tested, and preserve all existing source/tooling.


## Final verification update — 2026-11-16

- Latest source smoke test: PASS, two-finger input, driving, pickup, delivery/reward, exit, rescue.
- Desktop manual check: car entry and exit pass; actual F12 screenshot captured in builds/harbor-city-gameplay.png.
- Rebuilt APK: 0.1.0 com.koko.harborcity, arm64, min SDK 24, target SDK 36. Android v2/v3 signature verified. No requested permissions.
- Removed invalid non-Gradle target SDK override. Prebuilt template targets 36; signing with build tools 35.0.1 succeeds.
- APK bytes: 28316482; SHA256: c0e16bce35f7824cdb669f471223717ff3e015471647caba34befd631f6b66d7.
- Download page in download-site; three binary parts reassembled and SHA256-verified by the browser. Local button check passed.
- Site ID: appgprj_6afb31a03dfc8191b5320be3bc52385f. Private publication pending; check deployment status before claiming live.
- Physical Fold5 installation, performance, unfolded layout and Android lifecycle remain untested.


Publication succeeded: https://harbor-city-koko.sotivear-pic-7972.chatgpt.site
Owner-private Site. Deployment appgdep_6afb32c8ebb08191b9875e9b3c5a0ebd.
Source commit c5527d9995942d37f87ec5c68d3abd7d5b9c4f32.
Local preview server stopped. Phone testing remains outstanding.
