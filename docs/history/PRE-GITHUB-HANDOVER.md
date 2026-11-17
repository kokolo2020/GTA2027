# Harbor City — Claude handover (current: 0.8.0, code 8 — built, NOT yet published)

Updated 17 November 2026, Bangkok time. Read this first. HANDOVER-0.1.0.md has older setup detail.

## Resume prompt
Continue Harbor City at /Users/koko/harbor-city. Read CLAUDE-HANDOVER.md first. Preserve the existing project, saves and private download Site. Publish v0.8.0 (ChatGPT/Codex has the Sites connector) then help test it on Koko's Samsung Galaxy Z Fold5, then fix observed problems. Conserve usage; never schedule recurring monitoring or three-minute checks.

## v0.8.0 The North Update (built, NOT yet published)
Much bigger map for a future multiplayer game (still single-player/offline, NO networking). North Gate at (0,0,-56.5) opens after 3 Bay sites (`_north_open()`); 220x384 ground north of the city with solid rock borders. Districts: North Highway spine (x=0), Industrial Quarter (z -60..-180: warehouses, container stacks, crane, smokestack), Maple Suburbs (z -180..-290: 32 houses, skate plaza, park), Harbor Airfield (z -296..-436: runway, 3 hangars, planes, tower, terminal), Summit Pass (east branch at z=-270 up a 14 degree ramp to a plateau lookout x~178). 8 sites in `NORTH` (save key north_mask, legacy-safe; bonus 2000), trials 5 North Highway and 6 Runway Dash (area 3), mission 11 North Explorer ($2000), HUD x/20 sites, journal section, guidance after Bay.
Blender: blender-src/make_world.py (run in Blender console like make_models.py; joins each model into one mesh) -> building_0..3, house_0/1, warehouse, container_0..2, hangar, tower, airplane, crane, tree_pine, tree_round, rock, lamp .glb. City buildings and waterfront trees now use the models (old box visuals hidden, colliders kept); lamps/trees/rocks scattered with MultiMesh (`_scatter`), `_prop` places models with colliders, `_build_landscape` adds city lamps and Ridge pines. Trial list buttons shrunk (7 rows).
Verified: headless smoke test (HARBOR_SMOKE_OK incl. north sites/trials/rewards/blocked checks), shots in builds/shots080/, signed APK from Koko's Mac Godot: apksigner v2/v3 OK, cert 5168f1fa...547b, com.koko.harborcity 0.8.0 code 8, no permissions, 29320811 bytes, SHA256 cc9635af96dd87776ae1d36ee3987c9c8930375e950ad27aff99fff8a8b38bae. download-site/dist regenerated (chunks reassemble to that sha), index.html updated. NOT tested on Fold5 (performance of ~40 houses/lamps/trees is the thing to watch). Previous source: main-v0.7.0.gd. Ideas: traffic, AI racers, Night Comet wing, windmill sails, real multiplayer later (needs Koko's OK for hosting/cost).
Publish download-site/ to the EXISTING Site via ChatGPT/Codex, then record URL, commit and deployment ID here.

## v0.7.0 Blender models (published)
Koko asked for Blender graphics. Blender 4.2 LTS (Mac, driven through its Scripting console) ran blender-src/make_models.py (original procedural low-poly shapes, no outside assets) and exported 5 car .glb files, lighthouse.glb and windmill.glb to game/models/. main.gd loads res://models/car_N.glb for the selected car (materials named Body/Cabin take the car colours, the box car is hidden when a model exists, with a box fallback if a model is missing) and swaps the Bay lighthouse and windmill visuals via _landmark() (colliders unchanged). Models face -Z (front). Smoke test (Linux Godot, needs `--import` first on a fresh copy) checks every car model shows. APK is ~28.7 MB.
APK from Koko's Mac Godot editor: apksigner v2/v3 OK, cert 5168f1fa...547b, com.koko.harborcity 0.7.0 code 7, no permissions. Shots: builds/shots070/. NOT tested on Fold5 (look, performance).
APK: builds/Harbor-City-Android-debug.apk, 28702859 bytes, SHA256 0c6b2bcaa03515cafe01668ac336c978c5bf5d5722031bbcba5e4cd7a831da70. v0.6.0 APK kept as Harbor-City-Android-0.6.0-debug.apk. v0.6.0 (street events + Return-to-car fix) was never published on its own; v0.7.0 includes it. Publish download-site/ to the EXISTING Site (Claude has no Sites connector).

## v0.6.0 Street Events + hotfix (included in 0.7.0)
- **Hotfix** (Koko got stuck on foot, ENTER CAR did nothing): `_rescue()` placed the player 6.1 m from the car but the enter range is 5 m. Now the player lands ~3.4 m away at (4.6,0.9,5.2), the HUD refreshes, the toast says to tap ENTER CAR, and ENTER CAR beyond range shows "Your car is too far away. Open Menu > Return to the car." Workaround on old builds: Menu > Trials > Cancel running trial. Smoke test covers rescue then enter.
- **Street events**: TRIALS now has 5 entries: Pizza Rush (7 rings loop, par 38 s, $400) and Waterfront Dash (3 rings along the z=0 road, par 11 s, $250), both area 0. `best_times` has 5 slots (older saves load). Trial Runner mission now needs all 5 (desc updated).
Validation: smoke test passes (incl. street events, rescue/enter). APK from Koko's Mac Godot editor: apksigner v2/v3 OK, cert 5168f1fa...547b, com.koko.harborcity 0.6.0 code 6, no permissions. Shots: builds/shots060/. NOT tested on Fold5.
APK: builds/Harbor-City-Android-debug.apk, 28377922 bytes, SHA256 ab21b193452de6b90ed9949b001fb16af6bfec9741b2d752faf8cce875c45911. v0.5.0 APK kept as Harbor-City-Android-0.5.0-debug.apk. Koko/Codex must publish download-site/ to the EXISTING Site (Claude has no Sites connector).
Blender: Blender 4.2 LTS is installed on the Mac (/Applications/Blender.app). Script blender-src/make_models.py (5 cars, lighthouse, windmill -> game/models/*.glb, log in blender-src/blender-log.txt) is written but NOT yet run or wired into main.gd. Plan: run via Blender Scripting console exec(open(...).read()), run `Godot --headless --import` in a scratch copy, load res://models/car_N.glb in _apply_car (override materials named Body/Cabin with car_body_mat/car_roof_mat; hide the box car when a model exists), swap lighthouse/windmill visuals. Target v0.7.0.

## v0.5.0 Radio & Residents (published)
Koko asked for GTA-style atmosphere (radio, citizens, things to do); this milestone does radio and pedestrians. Street events are still to do.
- **Radio**: music-note button under Menu cycles Off, Harbor FM, Bay Waves, Talk 88 (saved as `radio` in the save; default off, legacy saves load). All audio is synthesized in code at runtime (AudioStreamWAV, 16 kHz mono, looping, generated in the background within ~8 ms/frame the first time a station is chosen; button shows "Tuning..."). Harbor FM: 124 bpm Am-F-C-G synth loop. Bay Waves: 76 bpm pads and bells. Talk 88: quiet bed; captions (HUD, rotate every 9 s) are the talk content, with lines that react to cash, gates and top speed. No assets, so APK size barely grows. Original compositions only.
- **Pedestrians**: 16 box people on 8 patrol lines along sidewalks (x=+-6, +-26.5, 38.5; z=6, -26.5, -37.5), visual only, they step away from a moving car (5 m) or the player on foot (1.4 m). Paths are checked against solid geometry in the smoke test.
Validation: headless smoke test passes including radio generation/looping/level for all three stations, touch on the radio button, persistence, pedestrian paths/walking/dodging. APK exported by Koko's Mac Godot editor: apksigner v2/v3 OK, cert SHA-256 5168f1fa...547b, com.koko.harborcity 0.5.0 code 5, no permissions. Shots: builds/shots050/ (city-radio.png is the new one).
NOT tested: real audio on the Fold5 (volume, stutter while generating), pedestrian look/performance on device.
APK: builds/Harbor-City-Android-debug.apk, 28365634 bytes, SHA256 025102266eb80aab12207246800152e1eb5df9a88aa1c125e5f03c83b0bb9514. v0.4.0 APK kept as Harbor-City-Android-0.4.0-debug.apk. Koko must publish download-site/ to the EXISTING Site.

## v0.4.0 Tune & Trials (built; superseded by 0.5.0 build)
Koko finished everything in v0.3.0 and chose: car upgrades, bigger area, challenges, Blender models (Blender deferred, see Next work).
- **Upgrades** (Menu > Garage > Tune this car): Engine (+6% top speed/level), Turbo (+8% acceleration), Tires (+6% handling), 5 levels each, cost UPGRADE_COSTS [300,600,1000,1600,2500] x (1+0.5*car_index). `tunes` saved per car; `_car_stats()` applies them.
- **Bay Road** (west, x -57..-172): Bay Gate at x=-57 opens when all 6 Ridge sites are found. 6 BAY sites (Cove Cafe 300, Fisher's Wharf 300, Whale Rock 400, Glass Beach 400, Windmill Point 500, Lighthouse Light 600; +$1000 bonus), saved in bay_mask. HUD shows x/12 sites.
- **Time trials** (Menu > Trials): City Sprint ($300, par 40s), Ridge Sprint ($500, par 16s), Bay Run ($800, par 13s); checkpoint rings, pay when under par, best_times saved. Interaction is blocked during a trial.
- **Missions**: now 11 (added Master Tuner 1200, Bay Master 1500, Trial Runner 700).
- **Save compatibility**: new keys tunes, bay_mask, trial_done, best_times; older saves load with defaults.
Validation: headless smoke test passes (all earlier checks plus legacy save, tuning, Bay gate/sites, trials, missions). APK exported by Koko's Mac Godot editor: apksigner v2/v3 OK, cert SHA-256 5168f1fa...547b (same as before), package com.koko.harborcity versionName 0.4.0 code 4, no permissions, zip OK. Screenshots in builds/shots040/ (scripted test profile, not the Fold5).
NOT tested: Fold5 update-over-install, touch feel of tune/trial panels, trial difficulty, performance.
APK: builds/Harbor-City-Android-debug.apk, 28353346 bytes, SHA256 edc4120b3486532f0e3d13f7203cec064817889777d49afc976df29e9d8c4345. v0.3.0 APK kept as Harbor-City-Android-0.3.0-debug.apk. Site payload regenerated (download-site/dist, version 0.4.0); Koko must publish it to the EXISTING Site (Claude has no publish tool).

## v0.3.0 Garage & Ridge (published)
Koko's v0.2.0 feedback: finished 8/8 collectibles and 18 jobs, $3,550; wanted progression/exploration and a use for money.
- **Garage** (Menu > Garage): 5 cars in CARS: Harbor Blue (free), Mint Cruiser $500, Ridge Rover $1400, Coast Runner $2600, Night Comet $4500. Each has top speed, acceleration (accel) and turn rate that drive the car physics; the body/roof colour changes and cars 4-5 get a spoiler. Ownership (owned_mask) and selected car (car_id) are saved.
- **Ridge area** (east of the city, x 56..156): solid Ridge Gate at x=57 stays closed until a Ridge Rover is owned (derived from owned_mask bit 4, so no extra flag). Corridor, plaza, ramp (14 deg) to the Summit plateau, pines, camp, mill, pool, flag. Terrain is solid slabs; ramp low end sits 0.1 below the plaza and plateau is 0.1 below the ramp top so cars do not catch on lips.
- **Discoveries**: 6 RIDGE sites ($150/$200/$200/$250/$250/$400, +$600 for all six); found by arriving (within 4.5 m, car or foot), saved in ridge_mask. Guidance after the 8 city tokens points to the gate, then the nearest undiscovered site.
- **Journal** (Menu > Journal): 8 MISSIONS auto-claimed once (claimed_mask), $3,550 total: Garage Day, Open the Ridge Gate, Ridge Scout (3 sites), Summit View, Speed Run (85 km/h, best_kmh saved), Courier Veteran (25 deliveries), Ridge Master, Car Collector.
- **Save compatibility**: new keys owned_mask (default 1), car_id (0), ridge_mask, claimed_mask, best_kmh. A v0.2.0 save keeps cash/deliveries/found_mask/route; missions start fresh.
- Menu panels are laid out by _open_panel/_layout_panels; touch dispatch treats menu, garage and journal buttons as overlay buttons.
- Small fixes: clocktower 12:00 label moved above the tower; HUD panel more opaque. Dev-only `--shots` mode renders screenshots from a scripted profile and never touches the real save.

## Validation (v0.3.0)
PASS (Linux arm64 Godot 4.7.2, headless): all earlier checks plus legacy v0.2.0 save load, garage buy/select/persist (also through real touch dispatch), panels on screen at 1280x720, gate blocks then opens, every Ridge site clear and grounded, a Ridge Rover drives through the gate and up the ramp to the plateau, discoveries pay once, mission rewards pay once.
PASS: APK exported by Koko's Mac Godot editor; apksigner v2/v3 verifies; certificate SHA-256 5168f1fa527ea9b9ea183d442285192de49dfe0d5b6cf0e0590421b84b5f547b is identical to v0.2.0 (so it installs as an update); package com.koko.harborcity, versionName 0.3.0, versionCode 3, min SDK 24, target 36, no permissions; zip integrity OK.
PASS: download chunks reassemble bit-for-bit (scripts/prepare-download.py).
Screenshots: builds/shots/ (garage, journal, ridge-pass, ridge-ramp, gate-locked). Real rendered frames from a scripted test profile (cash $3,850 etc.), not from the Fold5.
NOT tested: physical Fold5 install-as-update, folded/unfolded layout, performance, Android background/resume. Ridge driving feel and garage UI on a touch screen are untested.

## Build and download
APK: builds/Harbor-City-Android-debug.apk, bytes 28341058, SHA256 9c6330cf1b004e91e768685502b6962dfa1cdf70542f84391de40d806b206546. Previous v0.2.0 APK kept as builds/Harbor-City-Android-0.2.0-debug.apk.
v0.3.0 is now PUBLISHED to the existing owner-private page:
https://harbor-city-koko.sotivear-pic-7972.chatgpt.site
Project: appgprj_6afb31a03dfc8191b5320be3bc52385f
Successful deployment: appgdep_6afb4a8377588191aa9a0216f34233a3
Saved version: appgprj_6afb31a03dfc8191b5320be3bc52385f~appgver_43bc630234a08191b427a19300a95254
Pushed source commit: 8a8a009b753ef113c06cded6a8de4493e6cf6545
Codex independently reran the Mac headless regression successfully, verified APK v2/v3 signatures, matched the old v0.2.0 signing certificate, verified package/version code 3, archive integrity, SHA256 and exact website chunk reassembly. Native Sites deployment reported succeeded. The new APK still requires physical Fold5 update/play testing. Do not uninstall the old app; install as an update to keep progress.
Retain the existing Site ID and owner-only audience; never create a replacement.

## How builds work now (important)
- The Claude shell (device_bash) is a Linux arm64 VM, not macOS: it cannot run the Mac Godot or the SDK's Mac binaries, and it cannot read ~/Library (the Godot debug signing key lives there). Do NOT search the whole home folder (a find hung the shell).
- Tests/screenshots in the VM: download Godot_v4.7.2-stable_linux.arm64 from github.com/godotengine/godot-builds, copy game/ to a scratch dir, then `Godot --headless --path . -- --smoke-test` and `HC_SHOTS=dir xvfb-run -a -s "-screen 0 1280x720x24" Godot --rendering-driver opengl3 --path . -- --shots`.
- Signed APK export must use Koko's Mac Godot editor (key stays there): quit any running game window, open Godot > Harbor City, Project > Export, Export All, choose Debug. Background clicks did not reach the dialogs and a macOS Dictation overlay blocked clicks, so keyboard Tab/Return worked after Claude was given brief full-screen control. Editor shows a harmless "Could not find version of build tools" warning.
- Then: apksigner (java -jar tools/android-sdk/build-tools/35.0.1/lib/apksigner.jar verify -v --print-certs), `python3 scripts/prepare-download.py`, publish.
- Android SDK licence already accepted; no paid services authorised. Do not expose signing keys.

## Files
game/main.gd (everything: world, Ridge, cars, UI, saving, smoke test, --shots), game/export_presets.cfg (version 0.5.0 / code 5), scripts/prepare-download.py, download-site/ (dist is buildless HTML/JS), builds/, main-before-garage.gd (v0.2.0 source backup), HANDOVER-0.1.0.md.

## Next work
1. Publish v0.7.0 to the existing Site; Koko installs over the current app (do not uninstall) and checks car models, lighthouse/windmill, Return to the car, street events, radio and progress.
1b. Next atmosphere work: street events (street race, pizza rush bonus), more radio tracks, traffic cars.
2. Fix what Fold5 play shows (garage layout, car handling, ramp, camera).
3. Blender models (Koko chose this; v0.5.0): Blender is not reachable from the Claude VM (download blocked). Needs Blender installed on Koko's Mac and driven by GUI, or Koko supplying .glb files. Plan: replace box cars/landmarks with original Blender models exported as .glb (watch APK size).
4. Ideas: more missions, a second Ridge delivery route, car upgrades. Multiplayer and store release remain later work.

## Codex publication record — 17 November 2026

v0.5.0 successfully published to https://harbor-city-koko.sotivear-pic-7972.chatgpt.site
Owner-private audience preserved.
Deployment: appgdep_6afba0fd5fec8191bb0c4e8cacb1d641
Saved version: appgprj_6afb31a03dfc8191b5320be3bc52385f~appgver_f59da8d24c0881918861951806aeae83
Source commit: dbf47f7b577fb45cdebea176fc998557dfec5a51
APK SHA256: 025102266eb80aab12207246800152e1eb5df9a88aa1c125e5f03c83b0bb9514
Archive: harbor-city-site-0.5.0.tar.gz, immutable payload verified.

Codex independently passed Mac gameplay regression including radio and pedestrians, verified APK signatures, package code 5, existing signing certificate, ZIP integrity, website chunks and archive checksum. Headless test reported two ObjectDB instances leaked at exit; no test assertions failed. Physical Fold5 audio, performance and update-over-install remain untested for this version.

v0.5.0 includes the v0.4.0 upgrades/Bay Road/trials. Do not publish the older v0.4.0 payload over it. Install over existing app; do not uninstall to preserve saves.

## Codex publication record — v0.7.0

Successfully published to https://harbor-city-koko.sotivear-pic-7972.chatgpt.site
Owner-private access preserved.
Deployment: appgdep_6afbb2c4b8b48191af4341f5f3cef45a
Saved version: appgprj_6afb31a03dfc8191b5320be3bc52385f~appgver_3f0102164ff88191aad90b9475aa4784
Source commit: 489ecd21fd96e970cb3e4157d335fe0211a64908
APK SHA256: 0c6b2bcaa03515cafe01668ac336c978c5bf5d5722031bbcba5e4cd7a831da70

Mac headless regression passed including Blender models, street events and rescue/enter fix. APK signatures v2/v3 verified with existing certificate; package com.koko.harborcity code 7. APK ZIP integrity, website chunks and immutable deployment archive all verified. Two ObjectDB leaks at headless exit remain as before; no assertions failed. Fold5 appearance/performance and update-over-install remain to test for v0.7.0. Install over existing app; do not uninstall.
