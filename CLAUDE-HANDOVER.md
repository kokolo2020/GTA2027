# Harbor City — current handover

Version 0.18.1, code 19 (see the v0.18.x sections at the end; 0.11 and 0.12 were never released on their own). Original single-player Android game, Godot 4.7.2 standard / Compatibility, Samsung Galaxy Z Fold5.

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
