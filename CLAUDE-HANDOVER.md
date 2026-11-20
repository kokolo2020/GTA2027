# Harbor City — current handover

Version 0.21.0, code 23 (see the v0.21.0 section at the end; 0.11 and 0.12 were never released on their own). Original single-player Android game, Godot 4.7.2 standard / Compatibility, Samsung Galaxy Z Fold5.

The canonical project has moved to **/Users/koko/GTA2027**, repository **https://github.com/kokolo2020/GTA2027**. Read PUBLISHING.md for the new self-contained GitHub release process. The old /Users/koko/harbor-city folder is retained for toolchain and historical recovery; develop here going forward.

v0.8.0 passed the Mac headless regression and APK verification and was published to the legacy private Site before migration. GitHub migration is complete; see the final migration record below.

## Latest gameplay

The North Update adds Industrial Quarter, Maple Suburbs, Harbor Airfield and Summit Pass, eight discoveries, two trials and a North Explorer mission. North Gate opens after three Bay discoveries. Original Blender buildings, props, planes, trees, cars, lighthouse and windmill are included. Existing upgrades, garage, radio, pedestrians, street events, deliveries and save data are retained.

Earlier Fold5 feedback: Koko finished all v0.3 objectives and most v0.5 objectives; do not reset their progress. v0.8.0 Fold5 appearance, performance and install-as-update still need verification.

APK SHA256: 7160b88b54c0c6d989861f3397b7bb3d840de24d60651db722791d1f8f34bfbb
Bytes: 29337270
Package: com.koko.harborcity, version 0.10.0 / code 10, ARM64, min SDK 24, target 36.
Certificate SHA256: 5168f1fa527ea9b9ea183d442285192de49dfe0d5b6cf0e0590421b84b5f547b

Mac smoke test passed all existing checks including North content and models. Two ObjectDB instances leak at headless exit as in prior builds; no assertions failed. Signed APK, ZIP integrity, exact legacy-site chunks and hash verified.

Full historical feature/setup notes are in docs/history/PRE-GITHUB-HANDOVER.md. Current source and GLBs are in game; Blender generators in blender-src; public download page in site. The export preset was made portable by clearing custom template paths; the existing templates/key remain local on the Mac.

Next: install v0.8.0 over the existing app, verify progress and North performance, then address observed issues. Never schedule recurring monitoring.

## Completed GitHub migration — 17 November 2026

- Public canonical source: https://github.com/kokolo2020/GTA2027
- Download page: https://kokolo2020.github.io/GTA2027/
- Verified APK release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.8.0
- Source release tag v0.8.0 points at 98cda9dba5ba7149f769752d910efc36581e07d1.
- A fresh import and full smoke test passed from this new checkout.
- The new publisher was used successfully end to end: APK signature/version checks, source push/tag, GitHub release asset upload, publish, page metadata push, and remote APK download/hash verification.
- GitHub Pages is configured for the workflow in .github/workflows/pages.yml; its deployment succeeded.
- No keys, credentials, SDK/editor binaries, caches or APK blobs were committed. APK binaries are release assets.
- Existing toolchain/key stays local on Koko's Mac; assets and generators are portable. Tools under ~/harbor-city/tools and the Godot key under ~/Library remain available to build.
- Future Claude sessions need GitHub CLI write access (gh auth status) and native Android verification tools, not the Sites connector. PUBLISHING.md has the exact command. In a new cloud environment, folder access and GitHub login must still be established.
- Old ChatGPT Site remains a private 0.8.0 fallback. Its successful deployment was appgdep_6afbceed111081918bf572f46bd22f2d from source 72b14b406cf26b3539abd8d1830ecb8781dfecbe.
- Fold5 testing of v0.8.0 remains outstanding.

## v0.9.0 Online Preview

Optional Online button uses Supabase Realtime broadcast for peer positions, names, selected car and driving/on-foot markers. Starts off; no shared authoritative progression or collision. Local save retains the generated online name. Source config is game/multiplayer.local.json (ignored); placeholder example is tracked. Android Internet permission enabled.

APK: builds/Harbor-City-Android-debug.apk, 29329078 bytes.
SHA256: 89e997cf73654aeb9e912046b4a130ae827068d763833f5e11899bff5425af7c
Package com.koko.harborcity version 0.9.0 code 9.
The bundled client key was inspected without printing it: public anon role, not service_role. Local configuration must remain untracked. Do not claim live multiplayer validation from offline message tests. Physical two-device online testing remains outstanding.

## Claude implementation notes (before publication)
 — 17 November 2026

- Optional online mode (default OFF): "Online: OFF" button in the HUD top-right row. Shows other drivers as tinted cars with name tags; no collisions, shared money or chat.
- Transport: Supabase Realtime over WebSocket (Phoenix protocol v1), public channel realtime:harbor-city-lobby, 5 Hz position broadcast, max 12 peers. Code in game/main.gd (_online_* functions).
- Supabase project `harbor-city`, ref yklbetbggdhjfxdohlyf (free tier, created by Koko). URL + public anon key live in game/multiplayer.local.json (gitignored, bundled into the APK via export include_filter). game/multiplayer.example.json shows the format; without the file online mode reports "not configured".
- Android INTERNET permission now enabled (first permission). Installs over 0.8.0.
- Build: versionName 0.9.0 / code 9, 29329078 bytes, SHA256 89e997cf73654aeb9e912046b4a130ae827068d763833f5e11899bff5425af7c, cert 5168f1fa...547b verified. Offline smoke test passed; the live Supabase connection is UNTESTED (sandbox could not reach Supabase).
- Known risks: public channel (anyone with the anon key can broadcast); free-tier message limits not verified (4 players x 5 msg/s adds up); WebSocket TLS on Android untested.
- Next: install on two phones, turn Online on for both, report whether ghost cars appear and how laggy. Hardening later (private channel/auth, lower send rate) needs Koko's approval for any paid service.
- Publish: python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.9.0.md (needs authenticated gh on the Mac) and update site/index.html.

## v0.9.0 publication completed by Codex

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.9.0
APK: https://github.com/kokolo2020/GTA2027/releases/download/v0.9.0/Harbor-City-Android-debug.apk
Release source commit/tag: 025ad4c2ad9ec1e4221458741b16a177e41f8bc9 / v0.9.0
Download metadata commit: d850fc9d80480addc39429697aa7735b1f106fc4
APK SHA256: 89e997cf73654aeb9e912046b4a130ae827068d763833f5e11899bff5425af7c

The GitHub publisher completed upload and remote download/checksum verification. Mac source regression passed. Its deliberately malformed JSON test prints a parser error before HARBOR_SMOKE_OK; all assertions pass. Known two ObjectDB exit leaks remain. Two-device online play and Android WebSocket behavior remain untested; do not describe this as fully verified multiplayer. The local config remains untracked; only the public client key is bundled in the APK. Install as an update without uninstalling.

## v0.10.0 Chase Update — 17 November 2026

- Offline chase mode: Menu > Chase. Thief (3 AI cops, survive 90 s) or Police (catch a fleeing AI thief). Win pays $600; busted/failed costs nothing. Code: `_chase_*` in game/main.gd (CharacterBody3D units steered toward/away from the car with sphere-probe obstacle avoidance; chase_wins saved).
- Smoke test covers thief bust, police arrest payout, and leaving the car. Screenshot: docs/shots-0.10.0/chase-thief-a.png (also site/assets/gameplay.png).
- Build: 0.10.0 / code 10, 29337270 bytes, SHA256 7160b88b54c0c6d989861f3397b7bb3d840de24d60651db722791d1f8f34bfbb, cert 5168f1fa...547b verified. Previous APKs kept in harbor-city/builds (…-0.9.0.apk).
- To publish: python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.10.0.md (needs authenticated gh on the Mac; site/release.json is updated by the script).
- Untested on Fold5: cop speed/balance, AI getting stuck on buildings, 2-phone online test still outstanding. Ideas next: online cops vs thief (team field in position messages), roadblocks, helicopter, siren audio.

## v0.10.0 publication completed by Codex

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.10.0
APK: https://github.com/kokolo2020/GTA2027/releases/download/v0.10.0/Harbor-City-Android-debug.apk
Release source: ad89c51f3507c605b084771cae1db33a2231ae73
Download metadata: 049524fe2e1ea8a266eb20633dc532add82407df
SHA256: 7160b88b54c0c6d989861f3397b7bb3d840de24d60651db722791d1f8f34bfbb
Mac regression passed including chase bust, arrest payout and exit behavior. APK signature/package/version/integrity verified. Publisher uploaded the release and downloaded it back to verify its hash. GitHub Pages deployment 44044205264 succeeded. Fold5 chase handling and balance remain untested. User explicitly selected GitHub only; do not create/deploy a Netlify site for this task.

## Web version + online roles (in progress) — 17 November 2026

- Web build (Godot Web export, single-threaded/no-threads template, Compatibility/WebGL2) lives in site/play and is served by GitHub Pages at https://kokolo2020.github.io/GTA2027/play/ . QR code: site/assets/play-qr.svg. index.wasm is ~40 MB (about 10 MB gzipped); the pck includes game/multiplayer.local.json (public anon key).
- Rebuild: Linux Godot with web templates in ~/.local/share/godot/export_templates/4.7.2.stable (web_nothreads_*.zip extracted from tools/export-templates.tpz), then `godot --headless --path game --export-release "Web" ../site/play/index.html` (preset "Web" in game/export_presets.cfg). Commit site/play; each rebuild adds ~40 MB to git history, so rebuild sparingly.
- Browser saves are separate from the Android app's save (IndexedDB vs app storage).
- v0.11.0 source (code 11): online roles in Menu > Chase: ONLINE thief / police. Role (t field) travels in the 5 Hz position message; police peers get flashing lights and blue name tags, thieves orange tags. Roles are judged locally on each client (no authority): thief busted if a police peer stays within 5 m for 2.5 s; survive 90 s with police online = $600; police arrest of a thief = $400 (20 s cooldown). Smoke test covers it. Android 0.11.0 APK not built yet.

## v0.12.0 Levels Update — 17 November 2026

- XP/level is DERIVED from saved progress (no new save key): finds 20, sites 25, first trial clears 40, claimed missions 60, first 6 deliveries 10 = 1660 total. LEVEL_XP = [0,150,450,900,1500]; max level 5. Code: _xp/_level_for/_level_text/_check_level in game/main.gd. HUD title shows LV, Menu and Journal show the bar, online name tags show Lv (position message field "l").
- Level 5 plan (Koko's request): unlock car showroom + avatar customization (v0.13) and a new map extension with new quests (v0.14, Blender). Current map stays open to all (existing Ridge/Bay/North discovery gates unchanged).
- Build: 0.12.0 / code 12, 29345462 bytes, SHA256 ea1fe4d12414bdb3b657c1d4e56a7fce7064619acab32a2b355a412ee276b580, cert 5168f1fa...547b verified. Web build at /play updated (same wasm, new pck). The 0.10/0.11 APKs were not published separately; 0.12.0 includes them.
- Publish: python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.12.0.md (needs authenticated gh on the Mac).
- Web test done: https://kokolo2020.github.io/GTA2027/play/ loads and Online connects to Supabase (verified in the Mac built-in browser). Two-device visibility test still outstanding.

## v0.13.0 Marina Heights — 17 November 2026

- Level 5 unlocks the Marina Gate at (0,0,58): a south bridge into Marina Heights (`_build_marina`). 5 MARINA sites (save key marina_mask, +$3000 bonus), trial 8 Marina Boulevard (area 4), missions Marina Arrival and Window Shopper (visit all 3 shops, shop_visit_mask).
- Shops (`SHOPS`, `_shop_*`): Harbor Motors Showroom (drive in) sells 3 premium CARS (Marina GT $7500, Skyline Racer $12000, Phantom Black $18000; reuse car_4 model, own colours). Style Shop (on foot) sells SHIRTS/PANTS/HATS (av_shirt/av_pants/av_hat/av_own). Paint Shop (drive in) repaints the current car, PAINT_PRICE $150 (car_paint per car, 0 = factory). New save keys load with defaults on older saves.
- Build exported headlessly on the Mac (no GUI needed): `~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path game --export-debug "Android" ../builds/Harbor-City-Android-debug.apk`. This needs the Android templates in ~/Library/Application Support/Godot/export_templates/4.7.2.stable/ (copied there from ~/harbor-city/tools/export-templates/4.7.2.stable on 17 Nov). Delete the .apk.idsig file it writes next to the APK.
- APK: 29370115 bytes, SHA256 e37ba39cde0a84eb88baeb28aa579d512f019c3308b74fbf6b72563c58849cf1, com.koko.harborcity 0.13.0 code 13, INTERNET permission only, apksigner v2/v3 OK, cert 5168f1fa...547b. Mac smoke test HARBOR_SMOKE_OK (the JSON parse error it prints is the deliberate malformed-message check). Screenshots: docs/shots-0.13.0/.
- Web build in site/play rebuilt for 0.13 on the Mac: install web_nothreads_*.zip from ~/harbor-city/tools/export-templates.tpz into the same templates folder, then `Godot --headless --path game --export-release "Web" ../site/play/index.html`. index.wasm was byte-identical, so only index.pck (~1 MB) and index.html changed. Loaded locally in the browser with no console errors.
- NOT tested on the Fold5: shop panels on touch, premium car handling at 130+ km/h, Marina performance, update-over-install from 0.10.
- Next (Koko's Level 5 plan): v0.14 new map extension with new quests (Blender).

## v0.13.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.13.0
APK: https://github.com/kokolo2020/GTA2027/releases/download/v0.13.0/Harbor-City-Android-debug.apk
Release source commit/tag: c37b9cc / v0.13.0. Download metadata commit: 9bf12b0 (Pages run 44065798063 succeeded; live page shows 0.13.0).
SHA256: e37ba39cde0a84eb88baeb28aa579d512f019c3308b74fbf6b72563c58849cf1
The publisher verified the APK, uploaded it, and downloaded it back to check the hash. 0.11 and 0.12 were never released on their own; 0.13.0 includes them. Fold5 testing is still outstanding.

## v0.14.0 Airport Line bus — 17 November 2026 (source only, not yet built or released)

- Code in game/main.gd: BUS_STOPS (6 stops along x=0, z 44 to -288), `_build_bus`, `_bus_tick` (called from `_physics_process` after the car floor check), `_bus_near/_bus_board/_bus_alight`. State: bus_idx/bus_next/bus_fwd/bus_dwell/bus_z/bus_riding (not saved). Bus drives lane x=+2.6 northbound, -2.6 southbound, dwells 7 s at stops (10 s at termini). Route is limited to z > -49 while `_north_open()` is false. While riding, movement input is zeroed and the player follows the bus; `_rescue`, `_chase_start` and `_orole_start` force a hop-off.
- `_bus_near()` returns false when a blue token is in reach (exploring) or a job destination is in reach (not exploring), so those keep the action button.
- Smoke test `_smoke_bus` added (closed gate limit, board, ride to Downtown, get off, reach airfield and turn back). Passed on the Mac VM with 0 SCRIPT ERRORs plus HARBOR_SMOKE_OK. Screenshots: docs/shots-0.14.0 (bus-stop, bus-ride, bus-airfield).
- export_presets.cfg is already bumped to 0.14.0 / code 14. Still to do: build the signed APK (headless export procedure in the v0.13.0 section), rebuild site/play, update site/index.html strings, publish with `python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.14.0.md`.
- Not tested on the Fold5. Possible follow-ups: bus fare, Marina stop, online sync of buses, bus audio.

## v0.14.0 characters + release build — 17 November 2026

- People: blender-src/make_people.py (run `/Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python blender-src/make_people.py`) writes game/models/person_0.glb (short hair) and person_1.glb (long hair), ~2.1k tris each, feet at y=0, facing -Z. Nodes Body/Head/ArmL/ArmR/LegL/LegR with joint pivots; materials Shirt/Pants/Skin/Hair/Shoes/Eye recoloured per character.
- Code: `_make_person` (load + per-instance material overrides, returns limbs) and `_pose_person` (walk swing + bob) in game/main.gd. Used by `_build_player` (model at y=-0.7; shirt_mat/pants_mats point at the model materials; hat_holder scaled 0.65 at y=0.29), `_build_peds` (model rotated PI because peds steer +Z forward) and online peers on foot. Box fallback if a model is missing. Smoke test asserts models load and legs swing. Dev mode `-- --people-shots` (HC_SHOTS=dir) renders close-ups; shots in docs/shots-0.14.0/people-*.
- APK: 29505677 bytes, SHA256 7c393667863073dd0d9f5ea6a92a09ebaf79b1d78df8ab77ed8af2f31e478d16, code 14, cert 5168f1fa...547b, v2/v3 OK. 0.13.0 APK copied to ~/harbor-city/builds.
- Not tested on the Fold5: performance with 17 animated characters.

## v0.14.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.14.0 (source f82299d, metadata 805bce5). Browser build /play updated (a69822a, pck 1209456 bytes). All Pages runs succeeded; live page shows 0.14.0 and release.json has SHA256 7c393667...8d16. Publisher downloaded the APK back and verified the hash. Fold5 testing outstanding (characters' performance, bus).

## v0.15.0 bus fare, Marina stop, helicopter and roadblocks — 17 November 2026 (source only, not built or released; supersedes the 0.14 entry)

- Bus: BUS_STOPS now has 7 stops, index 0 = Marina Heights (z 150, shown and served only when `_marina_open()`), 1 Waterfront (z 44) ... 6 Airfield. `_bus_first()` is 0 or 1, `_bus_last()` is 6 or 3 (North Gate) while the north is closed. BUS_FARE $15 charged in `_bus_board` (needs cash; saved via `_save_progress`). Buses are local per device.
- Chase (thief mode only, mode 1): CHASE_BLOCK_TIMES [12,40,68] spawn a 2-car roadblock 40-80 m ahead (`_chase_roadblock`, lasts 14 s, solid); CHASE_HELI_START/END 30/52 s spawn a heli (`_chase_heli_build`) that follows at 0.78x top speed; within 16 m it adds 0.35 bust per second and the HUD shows HELI ON YOU. Cleanup in `_chase_clear`.
- Tests: `_smoke_bus` (rewritten for Marina/fare) and `_smoke_chase_extras` pass on the Mac VM with 0 SCRIPT ERRORs and HARBOR_SMOKE_OK. Screenshots in docs/shots-0.15.0 (bus-stop, bus-ride, bus-airfield, bus-marina, chase-roadblock, chase-heli).
- export_presets.cfg bumped to 0.15.0 / code 15. Still to do: signed APK build, site/play web rebuild, site/index.html strings, publish with `python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.15.0.md`.
- Not tested on the Fold5. Ideas next: roadblocks/heli for online police, siren audio, bus sync online, new Blender models.

## v0.15.0 build + publication by Claude — 17 November 2026

- Built from 204b5aa (0.15.0 source by the other session). Mac smoke test HARBOR_SMOKE_OK. APK 29509773 bytes, SHA256 783aed572765a605c5d4f44bc07acb58a433ec1bf8ccda566269ec3b7af185de, code 15, cert 5168f1fa...547b, v2/v3 OK. 0.14.0 APK copied to ~/harbor-city/builds.
- Page image: docs/shots-0.15.0/chase-heli.png. Browser build /play rebuilt.
- Not tested on the Fold5.

## v0.16.0 Skyline District, traffic, busier city — 17 November 2026

- Models: blender-src/make_downtown.py (`Blender --background --factory-startup --python blender-src/make_downtown.py`) -> tower_0..4, shops_0/1, garage, police, mall, station, stadium, traffic_light, bench, bin, hydrant, billboard, palm, planter, fountain, kiosk, bus_shelter (unused). Each is ONE joined mesh with origin at ground centre, so the game draws repeats with MultiMesh (`_model_batch`, `_box_batch` in main.gd). Fronts face +Z in Godot.
- District: x -446..-110.5, z -440.5..-61.5. Avenues DT_AVES (x), streets DT_STREETS (z), 12 m roads; merged blocks remove road pieces listed in DT_AVE_GAPS/DT_STREET_GAPS (stadium, station, park, mall). Entrances: gaps in the North west wall at z=-150 and -250, and a link road x=-130 from a gap in Bay Road's north wall. `_downtown_open()` = `_bay_open()`. Sites DOWNTOWN (save key downtown_mask, bonus 4000), trial 9 "Skyline Dash" (area 5), missions 16 Skyline Explorer and 17 Rush Hour. best_times now has 9 slots. Journal has 3 pages (missions split); trials panel is a 2-column grid.
- Traffic: TRAFFIC_LOOPS (lane offset, speed, cars, corner points) -> paths with stop points at signalled intersections (`light_spots`, downtown + 9 old-city junctions). Global LIGHT_CYCLE 20 s (0-9 N/S green, 10-19 E/W green). Cars are AnimatableBody3D; they stop for red, traffic ahead (mutual block: lower index goes), player car/player, bus, chase units and pedestrians. Loops never share a lane in the same direction. Disabled during the smoke test except `_smoke_downtown`.
- Old city: sidewalk strips, crosswalks, signals, 2 shop rows at (+-16,-8.6) scale 0.55, furniture, rooftop billboards (ADS), palms replace Bay's box palms. Pedestrians: 62 (24 city, 28 Skyline walkers, 10 idle); person meshes culled at 95 m and cast no shadows (player still does). Traffic cars culled at 150 m.
- Draw calls (Mac, 1280x720): old city game camera ~1215 (0.15 was ~1155), Skyline ~650. Dev screenshot mode: `-- --skyline-shots` (HC_SHOTS=dir) prints draw calls; shots in docs/shots-0.16.0.
- APK 29768009 bytes, SHA256 7a75572ffdf0fae7f8f29ab678efa03ff454f02f99354bfb2f6527838a3f6df8, code 16, cert 5168f1fa...547b. NOT tested on the Fold5 (performance, trial par).

## v0.16.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.16.0 (source e29d674, metadata 20606ab). Browser /play rebuilt (adb2338, pck 1463108 bytes). All Pages runs succeeded; live page shows 0.16.0, release.json SHA256 7a75572f...6df8. Publisher downloaded the APK back and verified the hash. Koko is testing on the Fold5 next.

## v0.17.0 minimap, views, level-up — 17 November 2026

- Map image: game/map/world_map.png (1024 px, top-down ortho render of MAP_CENTER (-127.5,-99.5) +- 350 m, north up). Re-bake whenever the world changes: `Godot --path game --resolution 1024x1024 -- --bake-map`, then `--import`.
- Minimap (`_build_minimap`, `_draw_minimap`, MINIMAP_SHADER): rotates with the camera's ground forward (`_map_angle`), MINI_SPAN 150 m. Tap -> `_open_map` (pauses; map_panel is registered as an overlay in `_input`). Keys: M map, V view.
- Views (`view_mode` 0 Far, 1 Close, 2 In-car; `_cycle_view`, `_apply_view`, `_follow_camera`). In-car hides the car model and shows `cockpit` (bonnet uses car_body_mat), camera far 150 with depth fog 60-146, car-relative controls (gas/brake/reverse, steer) in `_physics_process`.
- Level-up: `_level_up_fx` (banner + rays tween, light pillar hidden in-car, ring, CPUParticles3D confetti, synthesized jingle `_level_sound`). Called from `_check_level`.
- Dev modes: `--view-shots`, `--levelup-shots` (HC_SHOTS=dir). Known older issue: a car parked in the bus lane can be pushed through the road by the bus.
- APK 30128654 bytes, SHA256 0350f4e98fc9589be660490032417150fbc29e6d9bb301cf2170377113e618ad, code 17, cert 5168f1fa...547b. NOT tested on the Fold5.

## v0.17.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.17.0 (source 509028d). Browser /play rebuilt (293edbd, pck 1821792 bytes). Pages deployed; live page shows 0.17.0. Publisher verified the downloaded APK hash. Awaiting Koko's Fold5 test.

## v0.18.0 Harbor Dome, arrows, checkpoints, Eye view, stadium — 17 November 2026

- Harbor Dome: centre HUB_C (210,0,32), radius 46, causeway along z=32 from x 52 to 164. Models from blender-src/make_hub.py (dome_shell, game_table, chair, sofa, beanbag, stage, robot, hub_counter). `_build_hub`, seats in `hub_seats` (kind ttt/rps/show/lounge, side, face, h), `_sit`/`_stand_up`/`_seated_tick`, robot regulars `hub_bots`. Games: `ttt`/`rps` arrays, robot AI `_ttt_bot_move`, payouts in `_ttt_check`/`_rps_resolve`; online matches via broadcast event "gm" (whole board each move) in `_hub_game_msg`; position frames add s (seat), q/qn (quick chat), e/en (emote). Comedy: game/hub_jokes.gd (~100 original jokes), DisplayServer TTS (project setting audio/general/text_to_speech=true), `_play_rimshot`. Chat: `_build_chat`, `_say`, `_do_emote`, bubbles/emotes in `_hub_people_tick`.
- Map widened: MAP_CENTER (-95,-99.5), MAP_SIZE 720 (re-baked).
- Quest arrows (`_build_guidance`, `_guidance_tick`, `_guide_target`), checkpoints (CHECKPOINTS, save key `checkpoint`, spawn on start, rescue returns there). Eye view on foot (view_mode 2 when not driving, `_look`). Walk-in stadium (`_build_stadium_walls`, STADIUM_* consts, gap segments 20-21). In-car fix: velocity is now applied from car_speed/heading; steering dead zone 0.25.
- Dev modes: --hub-shots, --guide-shots, --stadium-shots. APK 30548145 bytes, SHA256 9dc3a4f3...8045, code 18. NOT tested: two real phones online, TTS voice, Fold5.

## v0.18.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.18.0 (source 76b602d). Browser /play rebuilt (5b775ef). Pages deployed; live page shows 0.18.0. Publisher verified the downloaded APK hash.

## v0.18.1 looking for players, people-only dome — 17 November 2026

- Koko confirmed two-player online works on real phones (0.18.0) and the robot tables work.
- Dome is people-only: car-only barrier (StaticBody on collision layer HUB_CAR_LAYER=2, car.collision_mask includes it) at HUB_BARRIER_X with bollards and parking at HUB_PARK; `_hub_keep_cars_out` parks any car found inside. Dome checkpoint moved to (148,0,36).
- Main chat feed (`_build_feed`, `_feed_add`, `_feed_tick`) and invites: broadcast events "lfp" (looking for players) and "lfa" (accepted, with "to"), `_send_lfp` (30 s cooldown, needs online), `_lfp_msg`, `_accept_invite` (teleports on foot to the dome entrance, car to HUB_PARK; blocked during trial/chase/bus).
- APK 30552241 bytes, SHA256 df24a242...ddeb6, code 19. Invites between two real phones not yet tested.

## v0.18.1 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.18.1 (source 102b942). Browser /play rebuilt (3c65de1). Pages deployed; live page shows 0.18.1. Publisher verified the downloaded APK hash.

## v0.19.0 Civic Center, nicknames, dome zoom — 17 November 2026

- Civic Center: x -246..-55.5, z 17..106 plus south row x -246..-109.5 to z 152 (CIV_* consts). Avenues CIV_AVES, streets CIV_STREETS (32 is the old waterfront street continued west). Models from blender-src/make_civic.py (hospital, school, hotel, bank, fire_station, library) plus police, tower_1 (Grand Hotel), mall. CIVIC sites (save key civic_mask, 10 sites, bonus 1500) are guided right after the 8 FINDS. Checkpoint "Civic Center" appended at the END of CHECKPOINTS (never insert in the middle: saves store the index). Traffic loop and 16 pedestrians added (78 total). Old garage smoke test marks civic sites found while it runs.
- Nicknames: Menu > Nickname (`_build_nick_panel`, `_clean_nick` 3-14 chars + NICK_BLOCK filter, `_online_clean_name` hides rude peer names). Save key nick_chosen; first Online prompts once. `_relayout_hud` repositions every HUD control on resize (fold/unfold).
- Dome zoom: `_hub_focus` + `hub_zoom` in `_follow_camera`. Invites only from PvP tables (`_at_pvp_table`), lfp payload carries k/tb/s; `_accept_invite` seats the accepter opposite.
- `_smoke_sites_reachable` checks every discovery site is on walkable ground (Fountain Plaza moved to z 166.5).
- The full smoke test now takes several minutes; run it in the background with a time guard.
- APK 30692675 bytes, SHA256 cfe6e8c3...caf1, code 21. NOT tested on the Fold5.

## v0.19.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.19.0 (source 42b69e4). Browser /play rebuilt (614b3f4). Pages deployed; live page shows 0.19.0. Publisher verified the downloaded APK hash.

## v0.20.0 Harbor Raceway — 18 November 2026

- Area RW_X0..RW_X1 (205..620) x RW_Z0..RW_Z1 (-440..-40). Road from the North east wall gap at z=-150 (wall split into two boxes). Car-only bollards at RW_BARRIER_X, parking RACE_PARK, pit desk RW_DESK, race car spawn RW_PIT. Checkpoint "Harbor Raceway" appended to CHECKPOINTS.
- Race car: `race_car` flag reuses the player car body with fixed RACE_* stats and car_4 model (`_apply_car`, `_model_key`); own car shown as a parked copy (`race_ghost`) and restored by `_race_car_end`. `_race_keep_cars_out` keeps normal cars out and race cars in.
- Events in `_rw_start` (1 GP, 2 time attack, 3 long jump, 4 drag), ticked by `_rw_tick`; track RW_TRACK polyline -> rw_path, gates = vertices, laps via rec_gate; AI racers `rec_ai` move along the path with corner slowdown, rubber-banding, boosts and spikes. `_eff_max`/`_eff_accel` apply boost/spike/off-track. Ramp takeoff: `_race_takeoff` gives vertical speed from the floor normal (race car only). The ramp is sunk 0.35 m so it has no lip.
- Shop/inventory: boosts, spikes (max 5), records rw_best (lap, gp, jump, drag) saved. Online: events rcs (start, JOIN in feed), rcf (finish times), spk (spikes); pos frame has rc (peers render the race car).
- Map widened to MAP_CENTER (82,-99.5), MAP_SIZE 1090 (re-baked). Dev mode --race-shots.
- APK 30614851 bytes, SHA256 44b47830...1f2c, code 22. NOT tested on the Fold5 or with two phones racing.

## v0.20.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.20.0 (source 295a274). Browser /play rebuilt (0c2c04c). Pages deployed; live page shows 0.20.0. Publisher verified the downloaded APK hash.

## v0.21.0 Raceway rebuild — 18 November 2026

- User asked: track only (no other events), AI at the same speed, park inside near the pit with a big lot, real-looking track.
- Removed long jump and drag strip (events 3/4, ramp, `_race_takeoff`, car_on_floor tracking). `rw_best` still saves 4 values so old saves are unchanged. `_rw_start` only accepts 1 (GP) and 2 (time attack).
- Circuit: RW_TRACK is 39 control points smoothed by centripetal Catmull-Rom (`_cr_point`, `_rw_build_path`, RW_STEP 2.5 m) into rw_path (~1.42 km). Gates = control points; `rw_gate_idx` maps them to path indices; `_rw_seg_progress` projects only between the last and next gate. Width RW_TRACK_W 14.
- Visuals are flat ribbon meshes (`_ribbon`, `_rw_band`) raised 0.09–0.17 m to avoid depth fighting at distance: asphalt, edge lines, kerbs on corners, gravel on corner outsides. Walls at RW_WALL 16 m (armco/tyres) with one multi-shape collider, skipped inside `_rw_keepout` (pit area, grandstands, bridge towers) or near other track parts.
- New Blender models (blender-src/make_raceway.py): pit_building, grandstand, start_gantry, footbridge.
- Parking lot inside the gate: x RW_X0..RW_LOT_X1 (257.5), z RW_LOT_Z0 (-250.5)..RW_Z1, with car-only (HUB_CAR_LAYER) bollards on its east and north edges. `_in_rw_lot`. Own car stays where parked; it is moved to RACE_PARK only if it is outside the lot. Pit desk RW_DESK (262,-138) faces the lot. Race car spawns at RW_PIT in the pit lane (x 295.5).
- AI: vmax = RACE_MAX, accel = RACE_ACCEL, boost x1.45 and accel x2 like the player; no rubber-banding. AI_CORNER sets per-driver corner lift; rw_corner = max heading change over the next 35 m.
- Map re-baked. Shots in docs/shots-0.21.0.
- APK 30865519 bytes, SHA256 d67903ef...5f52, code 23. NOT tested on the Fold5 or with two phones racing.

## v0.21.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.21.0 (tag at dc6034f). Download page and browser /play rebuilt (02ca86e). Pages deployed; live page and release.json show 0.21.0. Publisher verified the downloaded APK hash.

## v0.22.0 Street-level camera, Call Car, new characters — 18 November 2026

- User asked: a close "normal" view when walking (driving keeps the current view as default, user can pick), call the car instead of walking back to it, and much better characters.
- Walking views are separate from driving views. `walk_view` (WALK_VIEWS Follow/Far/Close/Eye, default 0 Follow); driving still uses `view_mode` (Far/Close/In-car). `_cycle_view` changes the one in use. `eye_view` = walk_view 3 on foot; `follow_view` = walk_view 0 on foot.
- Follow camera `_follow_walk_camera`: orbit at FOLLOW_DIST 4.6 around player+0.75 using `cam_yaw`/`cam_pitch` (0.05..1.1); ray (mask 1, excludes player, car and traffic) pulls it in at walls. Drag on the right side (`_look`) orbits and sets `cam_hold` 1.5 s; while walking the yaw eases behind the player unless walking back towards the camera. Follow far plane 200, fov 64. When seated it falls back to the old hub zoom.
- Call Car: the action button reads CALL CAR when on foot and the car is 5 m or more away; `_call_car` / `_call_block_reason` / `_call_spot` (8 candidate spots beside or behind the player, ground ray, box overlap test with mask 1|HUB_CAR_LAYER). Cooldown CALL_COOL 8 s, CALL_COOL_CHASE 45 s as thief. Blocked inside Harbor Dome and inside the raceway outside the lot. Procedural horn `_play_horn`.
- Characters: blender-src/make_people.py rewritten; person_0..3 (short, long, bun+ponytail, curly), ~3.6–4.3k tris each. New child nodes ShinL/ShinR (knee) under LegL/LegR, ForeArmL/ForeArmR (elbow) under ArmL/ArmR. Fixed materials EyeWhite, Mouth, Sole, Belt. `_pose_person` bends knees and elbows; `_sit_pose` hangs the shins. Peds, Harbor Dome bots and online peers use all 4 variants.
- Smoke test starts with walk_view 1 (Far) so older steering checks are unchanged; `_smoke_follow_call` covers the follow camera and Call Car. Dev modes --follow-shots and --people-shots (now with a line-up and face close-up). Shots in docs/shots-0.22.0.
- APK 31185401 bytes, SHA256 40253bcc...34df, code 24. NOT tested on the Fold5, and web performance with the heavier characters not checked.

## v0.22.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.22.0 (source 04cae2e). Download page and browser /play rebuilt. Pages deployed; live page and release.json show 0.22.0. Publisher verified the downloaded APK hash.

## v0.23.0 (2026-11-18): RUN, fast travel, roadside job stops, taller trees, new hats

- RUN toggle above the stick (walk 5 m/s, run 9 m/s, faster stride). Travel button under Chat opens FAST TRAVEL: jump with your car to any CHECKPOINTS entry whose area is open (TRAVEL_AREA maps each checkpoint to _area_open), 20 s wait, blocked in races, chases, trials, bus and seats.
- Delivery stops moved 6.5 m from the road centre onto the pavement (STOP_* constants; PICKUP/DROPOFF updated). Driving reach 6.2 m.
- _prop_stretch: tree_round 1.3/1.75, tree_pine 1.2/1.6, palm 1.15/1.5, lamp 1.0/1.3 (x/y) in _scatter and _model_batch.
- Follow view: guide arrow lies small (0.42 scale) on the ground at your feet.
- Hats rebuilt for the Blender head (hat_holder unscaled, head centre 0.555 above it); box hats kept for the no-model fallback.
- Dev shots: `--v23-shots`; saved in docs/shots-0.23.0.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.23.0 (source commit 8889c69). APK SHA256 b6265d73fd8eb083e5b42bb35ad497ac897771f8441b7d5de399f5eb89399872, 31193593 bytes, code 25. Pages run succeeded; live release.json, page and /play show 0.23.0.
- Smoke test passed on desktop. Not tested on the Fold5.

## v0.24.0 (2026-11-18): quick quests, 20 levels, all towns open, starter crate, QR join code, new sky

- Graphics: ProceduralSky, always-on depth haze ending at camera.far (off for map bake), linear tonemap with saturation 1.16 / contrast 1.1, sun 1.05 with PSSM2 shadows. _material() returns shared world-triplanar noise materials for road (SURF_ASPHALT), grass and pavement colours. Follow view on foot uses the screen arrow (hud_arrow). Pines kept off North Highway cross streets (_near_cross_street); _prop_stretch is height-only now.
- QR: scripts/make_qr.py (own encoder, version 3-L, needs only Pillow) writes game/map/join_qr.png for https://kokolo2020.github.io/GTA2027/play/?join=1. Verified with CoreImage (swift CIDetector). On web, ?join=1 switches Online on 2 s after boot (_qr_join_check).
- Starter crate: _open_crate on boot when crate_done is false (also once for existing saves). CRATE_RARITY 60/30/10 -> cars 1/3/4, random paint, cash. Pauses the game while open; _toggle_menu ignored.
- Quick quests: QUICK (20 stops), quick_on default true, pays 60+0.6*distance (+20 per lap) and 50 bonus XP. Activity cycle quick -> jobs -> explore.
- Levels: LEVEL_XP has 20 entries; _xp() adds saved bonus_xp (quick quests, +25 per delivery). All towns open unless legacy_rules (set only during the older smoke checks, which expect locks and 5 levels).
- Smoke test note: a run that fails part-way can leave the desktop test save changed; a backup of the restored test save was kept in the session scratchpad.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.24.0 (source commit a696f8e). APK SHA256 b091fe842e46efd36f7f29f27e53668765a68db66d68d1ab1ea39d59e9eeb7f2, 31218362 bytes, code 26. Pages run succeeded; live release.json, page and /play show 0.24.0.
- Not tested on the Fold5 or in a real browser (including the QR join flow).

## v0.24.1 (2026-11-18): treasure hunts, FIND ME!, Quests list, name tags, player rings

- Treasure hunt: 300 s rounds from the system clock (same chest for everyone online, picked from FINDS and all site lists). Clues only: district (first 120 s), landmark (next 90 s), beam in the last 90 s; chest visible within 35 m. $300 + 100 bonus XP, once per round (treasure_got).
- FIND ME!: online events fms (announce, repeated every 3 s), fmf (hunter found), fmr (places, decided by the hider). Hider pays $350 up front, frozen 2 min on a glowing floor; unclaimed prizes refunded, fm_refund restored on next load if the app closed mid-game. Hunters get 60 XP with their prize.
- Quests list (top-left Quests button, 8 nearest quick quests, pay from distance), orange quick-quest dots on the minimap, own name tag (Label3D, fixed size), gold ring under you and cyan ring under online players, RUN beside the QR code, feed hidden while menus are open.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.24.1 (source commit 80b22d7). APK SHA256 70dbc98d76abb93c70fd690c52b985f6bb091d165865d810d483cac1870609c0, 31242938 bytes, code 27. Pages run succeeded; live release.json, page and /play show 0.24.1.
- Not tested on the Fold5 or with real phones online together (FIND ME and shared treasure need that).

## v0.24.2 (2026-11-18): treasure objects, FIND ME off the road

- Treasure: TREASURE_PROPS (6 primitive-built objects) beside the chest, chosen per round by _treasure_prop(cycle); clue names the object. Object visible within 110 m, chest within 35 m, beam in the last 90 s.
- Road map: _box/_box_batch/_box_batch_rot register thin asphalt boxes in road_rects; _on_road() and _curb_spot() find the nearest non-road open spot. FIND ME moves the hider there on start.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.24.2 (source commit d225d03). APK SHA256 697ae7255bf7426659e4763c59daf2a04823d82cb87c8513295ae34e112ca509, 31247034 bytes, code 28. Pages run succeeded; live release.json and page show 0.24.2.
- Not tested on the Fold5 or with real phones online together.

## v0.25.0 (2026-11-18): daily quests with real items

- Fixed money glitch: the Quests list let you re-pick the stop you just finished, and pay grew with distance, so PICK UP at 0 m paid forever. Now quick_got (bitmask) + quick_day (local date, saved) make each QUICK stop pay once per day; _quick_pay(i) is fixed per stop (60 + 0.4 x distance from the start, max +240). _quick_fix_target keeps quick_idx on an open stop; all 20 done gives QUICK_ALL_BONUS $500, then quick quests pause until midnight and _toggle_activity skips to delivery jobs.
- Items: each QUICK entry has "item"; _build_quick_props builds a primitive item (street-stall table for small items) at the stop, 1.6 m toward the building via _quick_side, scale 1.3; hidden once picked today. Raceway and Harbor Dome stops moved off the road; the smoke test asserts every ring and item is off the road.
- Shots: --daily-shots (docs/shots-0.25.0).
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.25.0 (source commit b99b7bd). APK SHA256 304381652da310e1e172c3c018ce71f15448ba093e0c5683a330f168ff9bcd15, 31259322 bytes, code 29. Pages run succeeded; live release.json, page and /play show 0.25.0.
- Not tested on the Fold5 or with real phones online together.

## v0.25.1 (2026-11-18): FIND ME fixes, lighter browser build

- FIND ME: FM_REACH 4.5 (whole glow counts); finder re-sends fmf every 3 s until paid; host includes "pl" (winners) in every fms announce and _fm_check_paid pays from fms or fmr once; finder banner shows Waiting / place and prize.
- Web: _web_perf_setup (web or --web-lite): 3D scaling to ~1.1 MP (bilinear), one shadow split at 55 m, 2048 atlas; ?fps=1 shows a counter. --bench prints average fps (desktop 2560x1440: 67 -> 88 fps with lite).
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.25.1 (source commit 6c711ee). APK SHA256 39f84ca1cb93bda9e86ef977eca8d73470145a1c54b17244efc383d77d6aa80e, 31263418 bytes, code 30. Pages run succeeded; live release.json, page and /play show 0.25.1.
- Not measured in a real browser; FIND ME not retested with two phones.

## v0.26.0 (2026-11-18): Sunset Beach, Westside, more pedestrians

- _build_expansion (end of main.gd), called after _build_raceway. Sunset Beach: SB_X0..X1 270..610, SB_Z0..Z1 40..400, bridge from the Dome causeway at x = 130 (gap in its south railing x 123..137) south to z = 150 then east; avenues 330/430/530, streets 90/150/250, beach road 318, boardwalk, pier at x 450, hotel, lighthouse. Westside: WS -462..-246 x -50..340, entered through a gap in the Civic Center west wall at the z = 72 street; market at (-330,111), windmill park, water tower. Helpers _ex_grid, _ex_lamps, _ex_house, _ex_yards, _ex_umbrella.
- CHECKPOINTS +2 (TRAVEL_AREA +0,0), MAP_LABELS +2, TRAFFIC_LOOPS +2 (32 cars), QUICK +6 (26; new items ice cream, bread, surfboard). Map re-baked (--bake-map at 1024x1024; my_tag skipped during bake).
- Pedestrians 78 -> 153. _update_peds throttles people > 150 m away (move every 0.5 s, no animation); per-ped logic in _update_ped.
- Shots: --expand-shots (docs/shots-0.26.0).
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.26.0 (source commit 0925805). APK SHA256 3a418a78f0edd87d21fb8a8f743abc52a3526873dc14643d28d49e39c83faf2a, 31943354 bytes, code 31. Pages run succeeded; live release.json, page and /play show 0.26.0.
- Not driven across the bridges by hand; not tried on the Fold5 or a real browser.

## v0.26.1 (2026-11-18): full-size houses

- HOUSE_SCALE 2.0 (was 1.3; the house model is small, doors were knee height), HOUSE_STEP 20; rows re-spaced 17 m from road centres. Trophy quest moved to (214,0,-168) inside the Raceway gate; Westside cat to (-368,0,192). Smoke test now also asserts quest rings/items are not inside colliders (_blocked_at). Map re-baked.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.26.1 (source commit 39971c1). APK SHA256 ed8e68cedbe39f74c6b1d1bffe627b79260c9c887991cb496f895a3175b68ea7, 31939258 bytes, code 32. Pages run succeeded; live release.json, page and /play show 0.26.1.
- Not tried on the Fold5 or a real browser.

## v0.26.2 (2026-11-18): proper houses in the new districts

- Root cause of the long, low houses: _model_batch used only the first mesh and ignored its node transform inside the .glb. New param use_local (4th) multiplies in the mesh node's transform; used for house_* in _build_expansion. HOUSE_SCALE back to 1.0 (same as Maple Suburbs), HOUSE_STEP 16, rows HOUSE_ROW 14 m from road centres, HOUSE_EDGE 14.4. Map re-baked.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.26.2 (source commit 5bea402). APK SHA256 8385949fa800327774bce42a016d13df9c48b1091afb592c75aea0d5bb1eff69, 31943354 bytes, code 33. Pages run succeeded; live release.json, page and /play show 0.26.2.
- Not tried on the Fold5 or a real browser.

## v0.27.0 (2026-11-18): one connected city, Harbor Loop sky train, airport, day and night

- Walls: all district boundary rock walls removed (North, Downtown, Civic, Raceway, Bay, Ridge low walls, Marina/SB/Westside edges). Elevated ramp/plateau rails and bridge railings kept. _build_connect (v0.27 section, end of main.gd): LAND_FILLS grass boxes (visual top -0.08, collision top -0.05), LINK_ROADS (Raceway Road x 197, Coast Road z -28, SB avenue links, North streets east, Westside Boulevard z -56, Bay road west, Civic avenue links, Airport Road z -458 and stubs). Sea: big water box + sea floor at -2.2; _sea_tick tows the car/player back to the oldest of 8 safe spots after 1 s below y -0.6.
- Sky train: SKY_CORNERS loop (2.67 km, Bezier corners), SKY_STATIONS 5, 2 trains on Time.get_unix_time_from_system (period ~270 s). Ride flow: ring -> SKY TRAIN -> platform wait (sky_wait) -> auto board -> GET OFF NEXT / GET OFF. Pillars in road medians (30 m apart, skip near crossings). City Tour: tour_day/tour_got saved, $750 + 150 XP once a day. sky_time_override for tests/shots.
- Airport (_build_airport): runway z -660, taxiway -612, apron, terminal (glass named GlassLobby so night scan lights it), 5 gates, tower, hangars, cargo, fuel farm, car park; AP_FLIGHT moving airliner (~187 s loop), ap_vehicles on loops; _airport_ped_plan adds 35 people (peds 188). AP_PLANE_FIX = PI (airplane.glb faces +Z). Checkpoint 15 "Harbor Airport" (TRAVEL_AREA 0).
- Day/night: SKY_SHADER (sun, moon, stars), DAY_KEYS keyframes, DAY_CYCLE 1440 s shared clock, day_mode saved (Menu > Time). _night_setup scans model materials by name (WinGlass/Glass*/LampGlow/Light/Tail) and drives emission; lamp_spots (recorded in _model_batch for lamp.glb) get additive light pools; car SpotLight headlights. HUD clock beside the minimap. haze_now replaces HAZE in _apply_view.
- Map: MAP_CENTER (85,-180), MAP_SIZE 1210, re-baked (bake forces 13:00 and hides trains/plane). New dev flags: --city-shots (docs/shots-0.27.0), --sky-check. cam_lock stops _follow_camera during shots.
- Bench (2560x1440): 68 fps, 78 with --web-lite.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.27.0 (source commit b7109fa). APK SHA256 88255d7ff91e2d32c38ac434ae81886511b03dd972f8c58c7b191ea1b511c775, 31775418 bytes, code 34. Pages run succeeded; live release.json, page and /play show 0.27.0.
- Not tried on the Fold5, in a real browser, or with phones online together.

## v0.27.1 (2026-11-19): traffic no longer stuck behind people

- Idle pedestrians placed on a road are moved to the nearest pavement at build (_ped_curb; _curb_spot's player-capsule test always failed at ground level). Traffic edges past a pedestrian who stays in its lane > TRAFFIC_PED_PATIENCE (4 s) via ped_wait/ped_skip on each traffic car. Smoke asserts both.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.27.1 (source commit 64dd401). APK SHA256 1d5ca41519785cbe5e9e879ebb209030323080a7b71eb77603ab976d2c70620a, 31775418 bytes, code 35. Pages run succeeded; live release.json, page and /play show 0.27.1.
- Not tried on the Fold5 or a real browser.

## v0.28.0 (2026-11-19): Downtown rebuilt big (phase 1 of the big-city rebuild)

- The user asked for the whole city at much bigger scale (wide multi-lane roads, big buildings) and chose a district-by-district rebuild, Downtown first. Next phases: Old City, North Highway, Civic Center, Westside, Marina, Sunset Beach, one at a time.
- _build_downtown rewritten: DT_AVES x -140..-620 and DT_STREETS z -140..-380 on an 80 m grid (DT_BLOCK), all roads DT_ROAD 20 m (4 lanes, double yellow centre, dashes at +-5, curbs, 12-bar zebras, signals at +-12.6). Gaps for park/stadium/mall/station in DT_AVE_GAPS/DT_STREET_GAPS. Blocks via _dt_block(col,row). Towers x DT_TOWER_SCALE 1.7, shops x1.4, mall 1.35, station 1.4, STADIUM_SCALE 1.45 at (-540,-381.5). Park 136 m, plaza 50 m. Airport Road z -458 is the south (north on screen) street; Westside Boulevard is 20 m.
- Downtown traffic loops all lane 6.0 (stopline needs lane >= ~5 on 20 m roads); 33 traffic cars total. Downtown sites, checkpoints, quick quests, ped lines, Skyline Dash (lane x -134) moved. Sky-train pillars only on straight stretches (a corner pillar stood in a Civic lane). Map MAP_CENTER (-25,-185), MAP_SIZE 1360, re-baked.
- Bench: 70 fps, 81 with --web-lite. Shots in docs/shots-0.28.0 (dt-street, dt-avenue, dt-night-avenue, dt-aerial, map).
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.28.0 (source commit 4dd72de). APK SHA256 cc273b8e598c675cdd67c51515b4a4c19a68da3366fe13b4b9c9873309b5f598, 31718074 bytes, code 36. Pages run succeeded; live release.json, page and /play show 0.28.0; downloaded APK hash matches.
- Not tried on the Fold5 or a real browser. Night tower windows glow as whole glass panels.

## v0.29.0 (2026-11-19): clean screen, North Highway rebuilt big, real street lights

- North Highway (phase 2 of the big-city rebuild): _build_north rewritten (v0.29 section near the top of main.gd). _nm_roads(): highway x 0 (20 m, z -56..-458), avenues x -60 (to -458) and +60 (to -300), streets z -140/-220/-300 (x -110.5..110) and -380 (to the highway) lined up with Downtown, industrial roads x +-32 (12 m), Summit link z -270. NM_SIGNALS 11 intersections. Blocks: Industrial Quarter (warehouses x1.4 via _prop_big), Maple Suburbs (houses x1.3, shops/tower_3 x1.2, Maple Court park NM_PARK, Skate Plaza NM_SKATE), Midtown towers, Harbor Airfield east of the highway (runway x 92, hangars x 31, tower). NORTH sites, checkpoints, quick quests, bus stops (_bus_side: shelters at x 12.6 north of the Old City; airfield stop z -324), Runway Dash on the runway, LINK_ROADS east stubs -220/-300, 2 new traffic loops (traffic 41), 20 more peds (208). Sky pillars: side probe 12.5 m so they stand in 20 m road medians (72 pillars).
- Street furniture: _signal_pole/_city_signals draw tall mast-arm signals (two heads over 4-lane roads, one on narrow roads); _model_batch/_scatter route lamp.glb to _city_lamps (9 m pole, 3.2 m arm toward the road, LampGlow head; old Old City/Marina scatter rows flipped to face the road). Lamp pools at LAMP_ARM-0.2, 14 m.
- Clean screen (hud_clean, saved, default on): _clean_hud_tick hides the info panel, buttons, treasure banner, clock and own name tag each frame; QR at (18,18); minimap scaled CLEAN_MINI_SCALE 0.68 top right; tapping it opens the Menu (_minimap_tap), which gained Map/Quests/Travel/Call car/Chat/View/Radio/Online/Run/Screen rows. The action button shows only when it isn't CALL CAR. Smoke runs older checks with hud_force_full and checks the clean screen at the end. run_on defaults to true.
- Bench: 73 fps, 85 with --web-lite. Shots in docs/shots-0.29.0 (incl. menu.png).
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.29.0 (source commit 1f1cb81). APK SHA256 ef8c2c5e4cd5cd00de653c757737e539bde9a50332ed1e4d52319d0de03bc453, 31730362 bytes, code 37. Pages run succeeded; live release.json, page and /play show 0.29.0; downloaded APK hash matches.
- Not tried on the Fold5 or a real browser. Still old size: Old City, Civic Center, Westside, Marina, Sunset Beach.

## v0.29.1 (2026-11-19): Quests button and Call Car on the clean screen

- QUESTS button kept on the clean screen under the QR code (_clean_hud_tick positions it; text "QUESTS" on the clean screen). The big action button always shows on the clean screen again, including CALL CAR (commit 140e515 from another session).
- Not included: the "bigger heads" people change (bf5c480, script only, people models not regenerated, so hats would float). It is kept unpushed on local branch people-bigger-heads, rebased onto this release. The character-redesign branch (new player.glb) is also unmerged and unpushed.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.29.1 (source commit 6f3550e). APK SHA256 0ac21504365ef0d1fc8b4e9ff21ae118a0419ce6f6085ddcb8aeabc2fe673def, 31730362 bytes, code 38. Pages run succeeded; live release.json, page and /play show 0.29.1; downloaded APK hash matches.
- Not tried on the Fold5 or a real browser.

## v0.30.0 (2026-11-19): a real-looking city (phases 1 and 2)

- Phase 1, photo textures: game/textures/*_diff.jpg (1K) and *_nor.jpg (512), CC0 from Poly Haven (asphalt_02, concrete_pavement, leafy_grass, brick_wall_001, white_stucco, concrete, clay_roof_tiles_02, corrugated_iron, bark_brown_02, rectangular_facade_tiles), imported VRAM-compressed with mipmaps (normal maps flagged). _surface_material uses them for asphalt/grass/pave (world triplanar). _try_model calls _realify: model materials by base name (REAL_WALLS) get photo textures tinted by their own colour (REAL_TINT, REAL_SIZE metres per tile); glass (GLASS_NAMES) reflects the sky, and curtain-wall glass gets a procedural window grid plus an emission texture so only ~40% of windows light at night (EMISSION_OP_MULTIPLY; night energy 1.5/1.6 for textured glass). Web/--web-lite skips normal maps.
- Phase 2, models: blender-src/make_real.py (Blender 4.2, joined meshes, smooth by angle) writes tree_round (~900 tris), tree_pine, palm, car_0..4 (real shapes, ~2k tris), bus.glb, sky_car.glb, sky_car_end.glb (tail = end car turned round). _prop_stretch no longer stretches trees/palms. Foliage (Leaf/Leaf2/Pine/PalmLeaf/Bush) uses a cheap cellular-noise texture on mesh UVs (triplanar + normal map cost ~20 fps). Car paint is _paint_mat (metallic 0.45, roughness 0.28). _smoke_models now expects >= 6 surfaces per car.
- Bench: 66 fps, 80 with --web-lite. APK ~40 MB (was ~30), web pck ~14 MB (was 3.4).
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.30.0 (source commit 13f0e2f). APK SHA256 260a76d4b215d6c88be6512f401851507060399e27d912692e27c63db308331d, 42405223 bytes, code 39. Pages run succeeded; live release.json, page and /play show 0.30.0; downloaded APK hash matches.
- Not tried on the Fold5 or a real browser. People are left to the separate character-redesign work (branches character-redesign and people-bigger-heads, both unpushed).

## v0.31.0 (2026-11-19): Neo Harbor (futuristic look), quest offers, glowing players

- 0.30.1 (never released alone, included here): quest offers (_quest_offer_tick: nearest undone QUICK within QUEST_OFFER_RADIUS 40 m, ACCEPT/NO THANKS card, decline cools down 5 min; quest_active saved; _qt() = quest being done; marker/arrow/PICK UP only when accepted; quest_bar at top, tap to stop). _player_ring bigger (0.6/0.78, y 0.12, scale y 0.3) with additive halo; own ring at -0.58 pulses; own name tag stays on the clean screen; _online_pill_tick "N ONLINE" under the minimap. FINDS base slabs removed; clock column moved to x 7.6. 17 collectibles moved off roads; _collectibles_on_road/_offroad (margin 1.6 m) + smoke assert; --road-check dev flag prints offenders. Treasure prop side picked off-road (_treasure_prop_side).
- 0.31 futuristic layer (_build_future after _build_traffic): neon bands from neon_boxes (filled by _place and old-city boxes), each band fitted to the model width at that height via _model_profile (mesh vertices per metre); NEON_CYAN/VIOLET emissive mats driven by _future_lights(night). Holograms (HOLO_SHADER, additive scanline) at plaza/station/mall/Midtown/Old City, animated in _holo_tick; billboard faces (BoardFace) use a hologram material, ad text bright. SKY_LANES flying hover cars (x1.5) and drones (x2.2) over road centres (_sky_traffic_tick). Glow enabled on desktop/Android, off in web-lite. Road line colours share emissive line_mats that glow at night; street lamps cool white.
- Bench: 56 fps (was 66), 77 with --web-lite.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.31.0 (source commit ef54514). APK SHA256 88bd34249ea86bc50a5d68744d983ece6bcb8970dda52f8881f5e439d5e8ee4b, 42548583 bytes, code 41. Pages run succeeded; live release.json, page and /play show 0.31.0; downloaded APK hash matches.
- Not tried on the Fold5, a real browser, or with phones online together.

## v0.32.0 (2026-11-19): play together (friends, invites, crews, gifts, high-fives, dance floor, photos)

- Social section (before _minimap_tap): permanent player_uid (_uid(), used as online_id), friends {uid:name}, crew_name/crew_color (CREW_COLORS), kindness, gifts_day/gifts_sent; all saved under [social]. Pos frame carries cr/cc/k; _social_peer_extras sets peer crew/kindness/ring colour; peer tags show [crew] ★ ♥k. New broadcast event "soc" {to,t}: fr/fra, inv, hf, gift (capped GIFT_AMOUNT 100, GIFTS_PER_DAY 10), ty, cri/cra; offers go through the feed (invite {"soc":..}) and _accept_invite routes them to _social_accept. Feed shows on the clean screen when not empty. PLAYERS button under QUESTS while online; social_panel (added to in_overlay touch list, _open_panel, _layout_panels). Crew bonus: quest pay x1.5 with a crewmate within CREW_NEAR 80 m; together bonus HANG_XP 20/min per friend/crewmate within 40 m (max 3). Dance floor at DT_PLAZA (shader tiles, DANCE action, idle peds dance, XP every 30 s, more with peers dancing). Group photo (_photo) saves to Pictures/HarborCity on Android (unverified on device), download on web, else user://photos. _hub_people_tick skips emotes of freed people (crash when a peer left mid-emote).
- Bench: 63 fps desktop.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.32.0 (source commit 6725114). Code 42. Pages run succeeded; live release.json, page and /play show 0.32.0; downloaded APK hash matches.
- Not tried with real phones online together.

## v0.33.0 (2026-11-19): dome game centre, 91 achievements, level/achievement colours, LED signals

- Dome: _build_arcade (C4_TABLES 4, tables 0-1 robot; RX_CABS 2 two-seat cabinets, cab 0 robot; MEM_CABS 2 solo) with hub seats kinds c4/rx/mem; game panel gains c4 board, reaction button, memory grid (_build_arcade_panel/_refresh_arcade_panel). Online moves via "gm" k=c (42-char board), k=x (go/time per round), k=m (memory best time). _robot_table/_game_state generalise ttt/rps code; LFP invites accept c4/rx. Party Quiz at QUIZ_C (234,0,54), radius 9: unix-clock slots (20 s per question, 8 per round + results), _quiz_question seeded by round/number (no repeats within a round), 40 questions, scores broadcast "qz", two deterministic robot contestants, winner $300+50 XP. quiz_time_override for tests.
- Achievements: ACH (91 entries, tiers b/s/g/l), stats dict (drive_m, walk_m, night_m, dance_s and event counters via _stat_add), ach_got; saved under [ach]. _ach_check every second (disabled during --smoke-test except explicit calls); first check after load awards silently. Gold/Legend broadcast "ach" and go to the feed; _ach_msg shows others'. Menu > Achievements panel. Players panel now hidden by _toggle_menu (bug fix).
- Highlights: _style_ring sets ring = level band colour (rainbow at 20, animated), halo = best tier colour, inner ring = crew; name tag modulate = tier colour; tags show ◆count. Pos frame carries at/ac.
- Signals: _city_signals rebuilt as white poles/arms with cyan line, dark LED bars lit by signal caps (bars 1.5 m), base neon rings using light_ns/ew mats; amber via _light_look (last 1.6 s of green). Online peer bound widened 600 -> 950 m.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.33.0 (source commit 7302bd3). Code 43. Pages run succeeded; live release.json, page and /play show 0.33.0; downloaded APK hash matches.
- Not tried with real phones online together.

## v0.33.1 (2026-11-19): online player count under the minimap

- Passive lobby watcher (_watch_tick, called from _process so it runs while paused): when Online is off, a second WebSocket joins the lobby without broadcasting and records pos-frame ids in watch_seen (dropped after ONLINE_TIMEOUT). online_pill is now a Button under the minimap on the clean screen: offline "● N ONLINE · JOIN" / "○ GO ONLINE" (tap = _online_toggle), online "● N ONLINE" (tap = Players panel). Dev flag --watch-check prints the watcher count after 14 s; verified live with a probe broadcaster.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.33.1 (source commit c92cf9d). Code 44. Pages run succeeded; live release.json, page and /play show 0.33.1; downloaded APK hash matches.

## v0.33.2 (2026-11-19): symbols on every device, fixed rainbow ring, lower name tags

- Web builds have no system font fallback, so ● ◆ ▶ ✕ ★ ♥ showed as boxes on iPad. _symbol_font (first thing in _ready) appends game/fonts/NotoSansSymbols2-Regular.ttf (OFL, credits.txt + fonts/OFL.txt) to ThemeDB.fallback_font.fallbacks. Thin arrows (←↑→↓ etc.) are not in that font, so all were replaced with ⬅⬆➡⬇⬉⬈⬊⬋. Smoke asserts every symbol has a font.
- Level 20 ring: RAINBOW_SHADER (hue by angle, static) instead of a time-cycling colour that differed per device. Peers restyle when their level changes (ring_lv).
- Peer name tags: fixed_size like your own, at 1.2 m above the body on foot (2.8 driving), so they don't go off screen up close.
- Published: https://github.com/kokolo2020/GTA2027/releases/tag/v0.33.2 (source commit c33da72). Code 45. Pages run succeeded; live release.json, page and /play show 0.33.2; downloaded APK hash matches.

## v0.33.3 (released 2026-11-19)

- Quests start by themselves: `_quest_offer_tick` auto-picks the nearest open, un-skipped quest (`_quest_auto_pick`), the offer card is disabled, ✕ skips (5 min cooldown), and finishing chains to the next.
- Release commit c7c64d2, tag v0.33.3, versionCode 46. APK SHA256 95c0f7d9b1705fbc6d513116b19460d88d5c8fb19c304013985bb8f6c8e6d153 (43269712 bytes), same certificate.
- Verified: release.json, download page edition, live /play/index.pck hash matches the local build, and the downloaded APK hash matches.

## v0.33.4 (released 2026-11-19)

- Peers wear their own look: the pos payload sends `av` = [av_shirt, av_pants, av_hat]; `_peer_look` rebuilds the peer as person variant 0 with those colours and a hat (shared `_build_hat(holder, index, boxy)`). Old clients without `av` keep the random look.
- Peer name tags hide when at/behind the camera or within 2.5 m (fixes giant tags across the screen).
- Release commit 5690045, tag v0.33.4, versionCode 47. APK SHA256 c092e4090d300078a5d90cff830baa67d7f33efa734983fcbd5b74ccf0677dc3 (43273808 bytes), same certificate.
- Verified: release.json, download page edition, live /play/index.pck hash matches the local build, downloaded APK hash matches.

## v0.33.5 (released 2026-11-19)

- TRACK in the Players panel: `track_id`, `_soc_track`, `_track_pos` (ends when the peer leaves); `_guide_target` returns the tracked peer first; the screen arrow shows "Name · N m".
- `_auto_collect_tick` (from `_process`, skipped in the smoke test unless forced): FINDS gems collect within 2.6 m on foot in any mode; the active daily quest completes within 3 m (4.5 m driving).
- Release commit 2c22a96, tag v0.33.5, versionCode 48. APK SHA256 3a9e6bf7f84581b045749953e842360010d46fe80f1c64fa2b462d9488336d06 (43273808 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.33.6 (released 2026-11-19)

- Harbor Food Court on old-city block FC_BLOCK (-17,0,-17): the building there and the west shop row at (-16,-8.6) are removed; the rooftop billboard stands on posts at z -23.2 and advertises the court.
- `_build_food_court`: three hover kiosks (FC_STANDS, FC_Z -20) with robot vendors, hologram menus (`_fc_holo`), see-through treats (`_fc_ghost`), neon tables, arch; ~25 crowd people (`fc_people`, culled at 45 m, no shadows; fewer in web-lite). `_food_court_tick` spins/bobs holograms and pods and plays crowd emotes.
- Bench next to the court about 50 fps (released 0.33.5 about 57) on 2560x1440 desktop.
- Dev hook: HC_CAM="name;x,y,z;lx,ly,lz;hour" with --city-shots saves one frame.
- Release commit 8e35bea, tag v0.33.6, versionCode 49. APK SHA256 8f1e45ed7f4cdd605a50c58c3a3b4a4b655ddd2d08d622626d224c193828ad43 (43290192 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.34.0 (released 2026-11-19; includes unreleased 0.33.7)

- 0.33.7: own name tag hidden (`my_tag.visible = false`); peer tags short ("Name · lvl", ★ friend) at pixel_size 0.00075; crew/♥/◆ only in PLAYERS (`_social_tag`).
- Hover cars: blender-src/make_real.py builds car_0..4 with hover jets (material "Jet", emissive) instead of wheels, lifted HOVER_LIFT 0.28. Regenerate cars only with `HARBOR_CARS_ONLY=1 Blender --background --factory-startup --python blender-src/make_real.py`, then `--import`.
- Hoverboard: `board_on` (saved under [market]), BOARD button beside the action button, BOARD_SPEED 15, `_board_tick` raises the person 0.18 and the hat holder to 0.47.
- Neon Market on the east lawn (16,-8.6), replacing the east shop row: MARKET kiosks (Neon Outfitters, Pet Palace), GEAR (7) and PETS (5, level 20). `_build_gear`/`_build_pet` primitives, saved gear_own/gear_on/pet_own/pet_on under [market]; broadcast in `av` [shirt,pants,hat,gear,pet].
- Money pill under the minimap (`_cash_pill_tick`, `_money`) opens the leaderboard.
- Leaderboard: Supabase table public.leaderboard (SQL in docs/leaderboard.sql, created by Koko 2026-11-19). anon can select/insert/update (no delete). `_lb_upload` every 90 s for players with a nickname (upsert on uid), `_lb_fetch` top 30 per tab. Tested live from the Mac; test rows were deleted by Koko.
- Dev hooks with --city-shots: HC_CAM="name;x,y,z;lx,ly,lz;hour", HC_PEERS=1, HC_SHOWOFF=<gear index>.
- Release commit 22b739d, tag v0.34.0, versionCode 50. APK SHA256 9e38c3ff89450452c0e8fd0d99da229a6de08f919b046f3f17ae8aa7b9b1ab68 (43314768 bytes), same certificate. Bench about 51 fps.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.34.1 (released 2026-11-19)

- Fix: `_toggle_menu` now also hides `extra_panels` (leaderboard and market), so Close works on them. Smoke test opens and closes all three.
- Release commit 5384372, tag v0.34.1, versionCode 51. APK SHA256 e9aeb082171ccbd8ffe152b1f99cbfc53033182dc693213d394643536ae96e32 (43314768 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.34.2 (released 2026-11-19)

- Gear is now a worn mask (`gear_on`, bit i = GEAR[i]); saved as [market] gear_worn (old gear_on index migrated). Broadcast `av[3]` = mask | 128; peers on 0.34.0/0.34.1 sent an index and are still read. `_build_gear(holder, mask)` builds each piece via `_gear_piece`.
- Harbor Live on old-city block DS_BLOCK (-46,0,17) (building removed): two V screens (DS_SCREEN_SHADER), leaderboard rotating 4 tabs every 7 s from a 45 s Supabase fetch (`ds_get`, top 50 sorted locally), City News (online, treasure countdown, quiz, richest, big achievements from feed), ticker DS_ADS, hologram trophy, watchers.
- Release commit 39270c3, tag v0.34.2, versionCode 52. APK SHA256 2f7bb244c55e6c042ebc0b126fdc54c3975a78f8284c5ccb2dc0c86f4f43357e (43327056 bytes), same certificate. Bench about 52 fps.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.34.3 (released 2026-11-19)

- Streamer mode (Menu > Streamer mode, `streamer_on`, not saved): `_build_streamer`/`_streamer_tick` (runs after `_social_tick`) hide QR, QUESTS, PLAYERS, pills and feed, fade joystick/action/BOARD/quest bar to 0.4, show a pulsing LIVE badge (opens Menu), a "Play with me" QR card and a leaders line at y 104; fetches the board every 45 s via `ds_get`. Turning off restores qr_small and quests_button visibility.
- Release commit 4f33485, tag v0.34.3, versionCode 53. APK SHA256 1133e507472c9093bab1bfcd7bf39e9a1b357aeeb1cf193c48b6963b0ee5b99b (43327056 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.34.5 (released 2026-11-19; includes unreleased 0.34.4)

- Roads: `_surface_material` asphalt → `_future_road` (generated panel texture, glow seams via emission_texture with black emission colour, in `road_mats`, brightened by `_future_lights`). Pavements → `_future_pave`.
- Walls/roofs: `_realify` sends REAL_WALLS kinds (not bark) to `_future_wall` (pearl panels, glowing floor bands, `skin_mats`) and roofs to `_future_roof` (solar glass).
- Signals: `_signal_pole` now adds in-road strips at y 0.075 (4.2 m x 0.32 m) per head; `_city_signals` builds only corner bollards and foot rings. Lamps (`_city_lamps`): 5.6 m light-blade pillars with a disc head.
- Sky train: slim cylinder columns (radius 0.32) with seam and collars, thinner pearl beam with a glow strip, glass lift tube at stations (collider 2 m).
- Parked car goes home after CAR_PARK_TIME 120 s idle (`_car_park_tick`, `car_gone`, hidden and collision off); `_call_car` calls `_car_back`.
- Release commit fe70a03, tag v0.34.5, versionCode 55. APK SHA256 d6f4d40a6f159993ecae945391f398b7c8653bf341a9106d5274c3a4de9cec1a (43335248 bytes), same certificate. Bench about 52 fps.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.34.7 (released 2026-11-19; includes unreleased 0.34.6)

- Old-city blocks (not FC/DS) are `_future_tower(base, idx)` (4 styles, `tower_glass` via `_real_glass`, `tower_pearl`), with a 11x18x10 collider; old rooftop billboards removed (only FC and DS keep theirs).
- Bridge: avenue x=0 continues z 35.5..58.5 at y 0.12 plus a deck slab z 50.5..58.5; MARINA "Bridge Gate" moved to (8.5,0,50). Smoke checks walking z 36..62.
- Bus stops: `_bus_shelter` (glass shelter, totem with two Label3D screens), `_bus_displays_tick` from `_bus_tick` with `_bus_eta`.
- City Loop buses: traffic loops with >=4 cars use bus.glb for k==0 (and k==3 if >=6 cars), `_bus_skin` recolours BusBlue, traffic dict "half" (5.7 bus, 1.8 car) used for gaps and stop lines; red-light smoke test accounts for half.
- Release commit 42cf5e8, tag v0.34.7, versionCode 57. APK SHA256 acc32f05f744bef44fe3a12256bc00c90eef923de5f1f6c8ae917c77bcf4cd6f (43339344 bytes), same certificate. Bench about 52 fps.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.34.8 (released 2026-11-19)

- Fix: a car that went home (`car_gone`) skips gravity/move_and_slide and is ignored by the y < -5 rescue check (it used to fall through the ground and loop the checkpoint rescue). `_rescue` calls `_car_back` first.
- `_travel_to` on foot calls `_car_away` (car stays home, CALL CAR brings it); driving still brings the car.
- Release commit 79bfa83, tag v0.34.8, versionCode 58. APK SHA256 d0463f48ab49fcfa771cec281a84a79d755bc7e0f2ab8f7ea0f4b9595ec24a50 (43339344 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.34.9 (released 2026-11-20)

- New airplane.glb from blender-src/make_real.py `build_jet()` (run with HARBOR_JET_ONLY=1): lofted fuselage, wraparound cockpit, swept wings with winglets, glowing nacelles, swept fin. Same frame as the old model, so `_ap_plane` and the North airfield are unchanged.
- Release commit 3273f2a, tag v0.34.9, versionCode 59. APK SHA256 fdf6204aa5f64b1a75d2e4784ef877578de4c574f21d57cb83d210e22de5aeb6 (43421264 bytes), same certificate. Bench about 51 fps.
- Verified: release.json, page edition, live /play/index.pck hash matches, downloaded APK hash matches.

## v0.35.0 (released 2026-11-20)

- New animated people: game/models/kperson.glb built by blender-src/make_kenney_people.py from Kenney Animated Characters (CC0; skins in game/models/people/, credit in LICENSE-Kenney.txt). 11 clips: Idle, Walk, Run, Jump, Sit, Wave, Talk, Cheer, Sip, Phone, Look.
- main.gd: `_make_person` uses `_make_kperson` when the model loads (old person_%d.glb fallback). One ShaderMaterial per person (game/people.gdshader tints shirt/pants/shoes/skin regions of the "T" skins); `mats` proxies synced with `_ksync`. `_kpeople_tick` advances AnimationPlayers manually by distance (every frame <14 m, 2nd <25 m, 4th <40 m, none beyond). Hats/gear scale 1.9 via `_hat_y`/`_sit_drop`; back gear counter-scaled in `_gear_piece`.
- Release commit 6ba1e5a, tag v0.35.0, versionCode 60. APK SHA256 1e0f66119b58025154ff6f2a742366f9d73e5ca85eab39ef14224ee840625cde (43869707 bytes), same certificate. Bench about 46 fps (was 51).
- Verified: release.json, page edition, live /play/index.pck size matches, downloaded APK hash matches.

## v0.35.1 (released 2026-11-20)

- Adult proportions: make_kenney_people.py now pose-scales the body after the retarget (legs 1.55, arms 1.4, torso 1.12 long / 1.28 wide, limbs 1.12 thick, head 0.65), raises Hips to keep feet on the floor, bakes the mesh and applies the pose as rest. It prints "FIT" numbers used for K_HAT_SCALE 1.15, K_HEAD_Y 1.53, K_HIP 0.70, K_BACK_Y 0.93, K_HEAD_Z -0.04 in main.gd.
- Release commit 25d3115, tag v0.35.1, versionCode 61. APK SHA256 e8e429f490a3058b54f3112222c75cb3ee0d1ffc7fc771fa83f184dbe8ad0b4e (43869707 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck size matches, downloaded APK hash matches. Hats/back gear up close not visually checked (screenshot run with HC_SHOWOFF hung).

## v0.35.2 (released 2026-11-20)

- Natural motion: blender-src/make_people_motion.py reopens game/models/kperson.glb (output of make_kenney_people.py) and replaces Idle, Walk, Talk, Wave, Cheer, Sip, Phone, Look and Sit with hand-made poses solved as absolute armature-space directions (feet grounded from the lowest foot point). Run and Jump stay Kenney's. Rebuild order: make_kenney_people.py, then make_people_motion.py <in.glb> <out.glb> [render_dir] (HC_SIDE=1 for side renders).
- Release commit 9b62d39, tag v0.35.2, versionCode 62. APK SHA256 d4574969956392cb56de8ebdd290eeac43ab0ae851f4bfd632e5fff9cc86dbc3 (43841035 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck size matches, downloaded APK hash matches. Quaternius Drive still "Quota exceeded" on 2026-11-20.

## v0.36.0 (released 2026-11-20)

- Harbor Commons park (`_build_commons`, `_commons_tick`) in the old empty field x -132..-54, z -56..-16 (fountain CM_C, playground CM_PLAY, court CM_COURT, Puzzle Pavilion CM_PUZZLE). Custom benches `_cm_bench`; kids are people scaled 0.62.
- Daily puzzle (`_pz_*`): date-seeded, alternates Neon Lights 4x4 / Slide 8; pays PZ_PAY + streak once a day; saved as pz_day / pz_streak / pz_total. Action button DAILY PUZZLE at CM_TERMINAL.
- Nearby chat: HUB_PHRASES extended (append-only; indexes are sent online as "q"), CHAT pill under PLAYERS, speech bubbles (`_bubble`), CHAT_NEAR 40 m filter, crew-only flag "qc" in the pos frame, chat log with `_chat_area`. Symbols must exist in NotoSansSymbols2 (smoke checks it). HC_CHAT=1/2 screenshot preview uses chat_preview and never connects (an earlier preview briefly went online as "Tester"; don't set online_on in shot hooks without online_retry = 1e9).
- Daytime default: day_mode 1, one-time migration flag day_default_v036. Pose fixes in make_people_motion.py (FOOT_YAW, FORE_TWIST 0.8, wider step).
- Release commit 08b397e, tag v0.36.0, versionCode 63. APK SHA256 945d4f955337a654efbccdf674c12a4cf3e49ae1973fe0bf6febb24a5ab58f4c (43869707 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck size matches, downloaded APK hash matches.

## v0.36.1 (released 2026-11-20)

- Original people back: USE_KPERSON := false (kperson.glb and the Kenney/motion scripts stay; flip it to bring them back).
- `_pose_limbs`: natural procedural walk + idle (breathing, weight shift, look-around, per-person seed). `_people_life_tick` animates standing crowds (fc_people, cm_people, idle peds) within 35 m; `person["sat"]` marks seated people so idle leaves them alone.
- Grounded feet: `floor_grid` registry of raised visual floors (`_floor_note` from non-solid `_box` on self or nodes with meta "static_floor", `_box_batch`, plus park floors) and `_ground_at` (registry + physics ray). Peds sample it every ~0.3 s; crowds snap once after 1.5 s; player/peers get `person["lift"]`. Smoke `_smoke_feet` asserts 0 buried.
- Online players now walk (phase from their speed). Online by default: `online_pref` (saved), `_online_autostart` after boot; any `--` developer arg stays offline.
- Release commit 01d643f, tag v0.36.1, versionCode 64. APK SHA256 dd2023288c24e2daac851dcbc14834807edf9b97b2124f695885a44fb054d89e (43877899 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck size matches, downloaded APK hash matches. Live auto-connect not exercised from desktop.
