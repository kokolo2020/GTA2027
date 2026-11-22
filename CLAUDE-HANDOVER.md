# Harbor City — current handover

## START HERE (updated 2026-11-22, 0.53.0 released and verified)

**Live version: 0.53.0, versionCode 88** (next is 89).

**Unreleased city-wide character update (2026-11-22):** Koko requested the new style for everyone, an athletic male, a fuller adult female, and a matching thumbnail. Implemented locally on main: player Settings cycles Male / Female / Classic; all city NPC roles use new male/female crowd models; online avatars send body choice (`nb`) and exact palette (`nc`) and rebuild safely when changed. Saves and Classic wardrobe remain intact; new models wear the futuristic outfit family. Standing crowds hold varied resting poses; moving and working actors retain their animations. Hoverboard defaults and walking cadence are unchanged. Includes the running-sync fix below.

Runtime assets: `game/models/natural_male.glb`, `natural_female.glb` and their `_crowd.glb` variants; generator `blender-src/make_city_people.py`; crowd shader `game/natural_crowd.gdshader`. Crowd models use one mesh/material surface and about 6k triangles each. `TRY_NATURAL_CITY` controls the city factory; `--classic-city` selects the baseline. Import, focused male/female/palette/network/sitting/Settings tests, full smoke, rendered gameplay screenshots and Classic startup passed; desktop save restored byte for byte. In the same M1 food-court Web-lite benchmark, new crowd rendering reached 50.7 FPS vs 45.9 Classic (scene-specific, no phone validation). Koko authorized Release; preparing 0.53.1 / code 89. Latest livestream thumbnail: `docs/stream/harbor-city-live-new-characters-v3.jpg` (1280x720); PNG and exact generation prompt alongside it.

**Unreleased running-sync fix:** Koko clarified that walking is fine; only running is out of sync. Hoverboard defaults were not changed. The new player's Run playback now follows actual horizontal displacement after `move_and_slide`, smooths its playback rate, and returns to Idle when stopped/blocked. Visible playable-character animations update every frame rather than using crowd distance throttling. Walking cadence and movement speeds remain unchanged. Changes are in `game/main.gd` and `game/natural_player_trial.gd`; focused speed/phase/blocked/far-camera checks and the full smoke test passed, with the desktop save restored byte for byte. Included in the authorized 0.53.1 release preparation; not phone-tested.

**0.53.0 character trial (code 88), released and verified:** new rigged playable character with a fixed futuristic outfit. Menu > Settings > Character switches New / Classic immediately and remembers the preference; Classic restores the full saved wardrobe. NPCs and online peers stay classic. Runtime: `game/natural_player_trial.gd` + `game/models/natural_player_trial.glb`; source/previews: `prototypes/natural-character/`. Idle/walk/run/sit/wave/talk/cheer included. Import, focused checks (including the Settings switch), full desktop smoke, rendered in-game screenshots, classic startup fallback, Android/Web exports and APK package/version/signing verification passed. Desktop save restored byte for byte. Not checked on Fold5. GitHub release and live Pages metadata verified; public Web PCK checksum matches the export. New / Classic switching also checked in the published browser build. No player progress migration.

**Last release: 0.53.0.** Original single-player + online city game, Godot 4.7.2 (Compatibility), Android APK + web build. Owner: Koko, who plays on a Samsung Galaxy Z Fold5 and talks to Claude over Remote Control from the phone (keep replies short, end with one question and its choices, send screenshots with SendUserFile).

- Repo: /Users/koko/GTA2027 (GitHub kokolo2020/GTA2027). Main script: game/main.gd (~32k lines, everything lives there; new systems are appended at the end with a `# ---- vX.Y: ...` banner). Blender generators: blender-src/*.py. Release notes: docs/releases/vX.Y.Z.md. Screenshots: docs/shots-X.Y.Z/.
- Branches: develop and release on **main**. The folder is normally checked out on `character-redesign`, which belongs to another session: never merge or push it; `git checkout main` to work and switch back to `character-redesign` when done.
- Untracked `reports/` and `research_notes/` are the user's; leave them. Also untracked (from the character-redesign work, not released): blender-src/make_player.py, game/models/player.glb(+.import); Koko asked not to move them: for the publisher's clean-tree check, list them temporarily in .git/info/exclude and restore that file afterwards. Move them aside while running the publisher (it needs a clean tree) and put them back.
- Back up the desktop save before test runs and restore it after: ~/Library/Application Support/Godot/app_userdata/Harbor City/harbor_save.cfg.
- Godot: ~/harbor-city/tools/Godot.app/Contents/MacOS/Godot. Blender: /Applications/Blender.app/Contents/MacOS/Blender. JDK for apksigner: ~/harbor-city/tools/jdk17/jdk-17.0.21+9/Contents/Home.

### Release steps ("Release" from Koko)
1. Bump `version/code` and `version/name` in game/export_presets.cfg; update the startup `_show_toast("Harbor City 0.xx: ...")` in main.gd.
2. Smoke test: `Godot --headless --path game -- --smoke-test` (about 1 minute; run it with a time guard: an assert inside an awaited test function makes the run hang instead of failing). Expect HARBOR_SMOKE_OK and no SCRIPT ERROR.
3. If the world changed: `Godot --path game --resolution 1024x1024 -- --bake-map`, then `Godot --headless --path game --import`.
4. Export: `Godot --headless --path game --export-debug "Android" ../builds/Harbor-City-Android-debug.apk` (delete the .idsig), `Godot --headless --path game --export-release "Web" ../site/play/index.html`. Check `apksigner verify --print-certs` shows SHA-256 5168f1fa527ea9b9ea183d442285192de49dfe0d5b6cf0e0590421b84b5f547b, and `aapt dump badging` shows the new version.
5. Write docs/releases/vX.Y.Z.md; update site/index.html (edition "NEO HARBOR / X", "New in X:" lead text, download button link + label, maybe the h1 and site/assets/gameplay.png). Commit and push main.
6. `python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/vX.Y.Z.md` (folders moved aside).
7. Watch the "Publish download page" workflow (`gh run list --workflow pages.yml`). It often fails with "No artifacts named github-pages": re-run it (`gh run rerun <id>` or `gh workflow run pages.yml --ref main`).
8. Verify live: release.json version + sha256, page edition and button, /play/index.pck content-length, downloaded APK sha256. Append a "Released and verified" line here, commit, push, switch back to character-redesign.

### Releasing from a cloud/phone chat (no Claude on the Mac)
A cloud chat linked to the Mac (computer use / device_bash) cannot run Mac Godot, the signing key or gh, and cannot type into Terminal. So: when Koko says "Release", the chat itself does the file work, then Koko runs ONE command in Terminal on the Mac.
1. In the repo on main (`git checkout main`; the folder is normally on character-redesign), edit: `version/code` + `version/name` in game/export_presets.cfg, the startup `_show_toast("Harbor City X.Y.Z: ...")` in game/main.gd, site/index.html (edition, "New in X.Y.Z:" lead, download link v-tag, button label, gameplay.png?v=), and write docs/releases/vX.Y.Z.md (no hashes; the script appends them).
2. Tell Koko to run in Terminal on the Mac: `gh auth status` (if not logged in: `gh auth login`), then `bash ~/GTA2027/scripts/release.sh X.Y.Z CODE`.
3. scripts/release.sh does: set aside untracked files, smoke test, import, export APK + Web, verify cert/version, append hash to notes, commit + push main, scripts/publish-release.py, Pages workflow check, live check, update this file, push, restore branch/save/files. It stops at the first problem; logs in /tmp/hc-aside.*/log.
4. In a cloud chat, device_bash is a Linux VM: git commands there leave .lock files (deletion is off); never leave stale locks under .git.

### Developer tools in the game
- `--city-shots` with HC_CAM="name;x,y,z;lx,ly,lz;hour[;extra frames]" and HC_SHOTS=<dir> saves one frame. Extras: HC_NOHUD=1 (no buttons), HC_PHOTO=1 (Photo mode), HC_VIEWERS=<n> (streamer viewer badge), HC_CAREER=<0-3> HC_CJ=<wait|pickup|mirror|dropoff|done|load|unload|radio|arrest|spray|fireout>[:seconds] (one frozen moment of a career job), HC_SJ=<name> (stream-join welcome banner), HC_FOLLOW=1 (Follow view, shows the screen arrow), HC_MENU=<tab>, HC_HOME=<i> (+HC_HOMETOP=1), HC_CAREER=<i>, HC_LEVEL=<n>, HC_SHOWOFF, HC_PEERS.
- `--bench --web-lite` with HC_BENCH_AT="x,z,yaw" prints fps, draw calls, primitives, process/physics ms; HC_SKIP="biosphere,galleria,..." skips building parts.
- `--nav-check` (walk grids), `--home-check` (walking inside a home).

### What is in the game now (newest first)
- 0.52.0: careers rebuilt as job loops (section `# ---------------- v0.52: careers as clear job loops`): step bar `cj_bar` in `_hud_top_stack`, cut scenes via `_cs_play(id,dur,tick,end)` (tap skips, HUD hidden, `_cs_cam` keeps the camera out of walls, `cs_freeze` for screenshots), JOB DONE through `_career_job_done` (+`_level_up_fx`), next job after `CJ_NEXT`. Career people are procedural (no AnimationPlayer): pose them with `_cj_anim(holder,"Idle|Walk|Wave|HandsUp")`; they face -z like the player. 20 career achievements (`job_<id>` keys + stats taxi_tip_best/medic_ontime/police_catches/fire_out). Police arrests on shift no longer pay the Chase prize too. Arrest scene's suspect car is still the simple red box (Koko: keep for now).
- 0.51.3: short link kokolo2020.github.io/GTA2027/p (site/p, site/join redirect to /play/?join=1); ?join=1 = `_stream_join_check()`: online at once, crate after 2 min, lands next to the latest peer with the `st` (streaming) flag + welcome banner; streamer viewer badge (`_viewer_count`, flashes on join); web shell game/web_shell.html (loading screen; game calls window.hcReady when built; ?timing=1 posts load marks to /__timing for local measuring); export excludes: web drops textures/*_nor.jpg, both drop models/player.glb + models/tex/*. Web pck 17.8 MB (was 21.7). Safari on the Mac: ~11.6 s to playable, mostly building the city in _ready (the next lever if loading needs to be faster); halving web textures would save ~5 MB more.
- 0.51.2: Photo mode (camera button under the minimap; hides HUD CanvasLayers as a whole and drops render layer 20 = UI3D_LAYER from the camera; name tags/rings/bubbles/arrows are put on it with `_ui3d()`; new 3D overlays must call it too), Restart chapters (ch_best saved, no double pay), `_hud_top_stack()` lays out quest bar > chapter bar > screen arrow, quick chat chips hidden when `web_build`.
- 0.51.1: chapter step bursts/chimes and chapter-complete confetti banner, chapter arrow before daily quests, chapter bar under the arrow, quick chat bubble at head height, join/leave messages in chat log and feed.
- 0.51: Chapters (8 chapters visiting every district, Menu > PLAY > Chapters, chip under the top bar; `_ch_target()` is a low-priority guide target below Directions/careers/quests/trials), four always-on quick chat chips (HUB_PHRASES[CHAT_SYM_END..]), new players spawn at SPAWN_FOOD_COURT.
- 0.50.x: careers (taxi/paramedic/police/firefighter, ranks; Menu > PLAY > Careers), homes $55k-$320k with living room, bedroom, bathroom and decorating (Menu > ME > My Home), entering the car switches to the driver's-seat camera.
- 0.49: 40 levels (from 21, each level costs 100n XP). 0.48: performance work (spatial buckets for traffic, distant people pose less, mall interior hidden when away) and level-locked places (Galleria L4, Biosphere L7, Sky Garden L10).
- 0.47: tabbed menu (GO / PLAY / ME / FRIENDS / SETTINGS), 15 m downtown roads with wide pavements, open street stalls. 0.46: Grand Central walk-in shops, kiosks with goods, busier traffic with police patrols. 0.45: Blender hover cars (make_hovercars.py) with cyan underglow. 0.44: walkers on walk grids, 10-station sky train, Directions + signposts, Grand Central plaza and towers, Harbor Gardens, lofts.
- Older history is below, newest at the end of this file.

### Known open items / ideas
- Nothing has been checked on a real phone since ~0.43; ask Koko how it runs (frame rate downtown, homes, careers).
- North Highway, Airport Road and Westside Boulevard are still 20 m roads (downtown is 15 m).
- Ideas Koko liked but not built: crews and districts (weekly crew goals, daily gifts, see reports/), islands and boats, real flying hover cars, visiting friends' homes online, parked cars.
- Thumbnail for livestreams: docs/stream/harbor-city-live-thumbnail.png.

### Working style Koko asked for
- Start a new conversation about every 10 updates (long conversations cost much more per message). Before that, refresh this START HERE section.
- Batch several changes into one release when possible; release only when Koko says "Release".

---

## Older handover notes (history)

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

## v0.37.0 (released 2026-11-20)

- The Biosphere (`_build_biosphere`, `_biosphere_tick`, `_smoke_biosphere`): hub at BIO_C (-500,0,-600), domes at hub ±44 m (radius 30), tunnels hub->each dome plus BIO_LINKS; entrance walk south to the Skyline boulevard (z -472). 16 species in BIO_SPECIES (zones in/out/swim/fly/flutter), procedural animals (`_bio_make_*`), wander targets stay within ±0.7 rad so walks don't cut across ring habitats. Spotting saved as bio_seen; ACH "bio4"/"bio16" via `_ach_value("bio")`.
- make_people.py: more detailed original people (faces, hands, sneakers), ~6000-6900 tris each; node names/pivots unchanged; generate_lods on import. HARBOR_PEOPLE_RENDER=<dir> renders previews.
- Airport: parked jets use AP_PARK_SCALE 2.5 (jet span 17.9 m model) so wings clear 50 m gates; smoke asserts it.
- `_bake_map` now calls `_unfade` so far-culled places show on the baked map; world_map.png re-baked.
- Release commit 1dd9369, tag v0.37.0, versionCode 65. APK SHA256 dd23d5892b49ccd8ab43e16cafbc82db179e842cc4a5485e0fcabccbb1a7faf4 (44049931 bytes), same certificate. Bench about 54 fps.
- Verified: release.json, page edition, live /play/index.pck size matches, downloaded APK hash matches. Not checked on a phone.

## v0.37.1 (released 2026-11-20)

- Fast travel to the Biosphere: new last entry in CHECKPOINTS ("The Biosphere", (-500,0,-486) on the entrance walk) with TRAVEL_AREA 0 (always open); it is also a checkpoint. `_smoke_travel` checks the landing spot is open.
- Release commit 38acfa9, tag v0.37.1, versionCode 66. APK SHA256 adc9b0106b62696cade6d3aa0fe2883cc6cbafa1c89d589bb22c244d01b7d6e0 (44049931 bytes), same certificate.
- Verified: release.json, page edition, live /play/index.pck size matches, downloaded APK hash matches.

## v0.38.0 released and verified (2026-11-20)

- Biosphere redesign: hexagonal glass gridshell domes and hub (`_bio_gridshell`), each dome six 60-degree sections (`_bio_pt(i, section, apothem, t)`, section 0 faces the hub). Central fenced habitat (BIO_IN), ring path (BIO_RING), far sections 2/3/4 are fenced enclosures (one species each, `"sec"` in BIO_SPECIES), near sections 0/1/5 are gardens with the doorways. Skywalk 4 m up (BIO_SKY_*) with two ramps in section 0 (foot at y -0.04 to meet the real ground collider) and a glass-floored lookout over section 3. Spring has a rain vortex through an oculus (`bio_scroll`). Boxes batch via `_bio_add/_bio_flush`, solids via `bio_cols/_bio_body`.
- Smoke test checks fencing, open doorways, deck heights and walks a test player up a ramp (the player's collision shape is disabled at that point of the smoke run, so the test enables it temporarily).
- Map re-baked. Commit f69e9a8, versionCode 67, APK SHA256 047456d326595b97e2b29d9b34fc277858cf325b0892ec98d372f582c05e8d2e (44,066,315 bytes), same certificate. Workflow run 44708984960 passed; live release.json, page button, web pck (15,734,072) and downloaded APK hash verified.
- Not verified on a phone: frame rate with the new domes.

## v0.39.0 released and verified (2026-11-20)

- Biosphere: each dome has its own layout (`_bio_winter/_spring/_summer/_autumn`): round fenced habitats (`_bio_pen` -> `bio_hab`), raised decks built from `_bio_slab`/`_bio_helix`/`_bio_ring_deck`/`_bio_disc_deck`, and `bio_routes` that the smoke test walks for real (player collision shape is disabled at that point of the smoke run, so the test enables it). Layout frame: `_bio_lp(i, x, z)` with x toward the hub entrance. `BIO_JOIN` = where doorway paths end; pens must stay clear of them.
- Nature models: `blender-src/make_nature.py` (Blender -b -P) writes `game/models/nature_*.glb`; crowns use leaf cards whose `LeafCard_<kind>` material the game swaps for an alpha-scissor material with `game/models/tex/leaf_<kind>.png` (from `blender-src/make_leaf_textures.py`, Pillow). New GLBs need `Godot --headless --path . --import`. Placed via `_bio_model` (batched MultiMesh per model).
- Tickets: hub TICKETS desk (`BIO_TICKET`), $50 `BIO_PASS_PRICE` day pass saved as `bio_pass_day` (date string, uses `_pz_today`). Gates toggle their StaticBody collision_layer (not shape.disabled, which only applies next physics step); shut only on the hub side, so the way out is always open.
- Signs: `_bio_text` (small Label3D with visibility range) and `_bio_plaque` (zoo sign on a post). Facts moved into the SPOTTED toast.
- Known flaky pre-existing smoke assert: "The robot blocks three in a row" (Connect Four robot randomness) failed once, passed on re-runs.
- Commit cb895a4, versionCode 68, APK SHA256 3a5a27b70f9715056340c5ffff707ceaf9dfa848761ed0411f6e71f7af012322 (45,727,491 bytes), same certificate. Workflow run 44718566161 passed; release.json, page button, web pck (17,381,380) and downloaded APK hash verified. Not verified on a phone: frame rate in the Biosphere.

## v0.40.0 released and verified (2026-11-20)

- Style system: `person_N.glb` bodies are now hairless (brows use the `Brow` material); `blender-src/make_wear.py` (Blender -b --factory-startup -P) writes `game/models/wear/*.glb` (hair_0-9, beard_1-4, top_*, bottom_*, shoes_*, acc_*). Each piece's meshes are named after the body node they ride on; `_dress(person, look)` hangs them using rest transforms from `_person_index`, recolours `Cloth`/`Trim`/`Hair`/`Stubble`, bares arms/legs per item, and scales nodes for builds. NPCs get `_npc_look(seed)` outfits (seeded by `npc_seq`).
- Look data: `look` (keys in `LOOK_KEYS`), `look_own` bitmasks, saved as `look_v40`/`look_own_v40`; sent online as `"lk"` (old `"av"` kept for older phones). Old Style Shop colours map to `look.tc`/`look.pc`.
- Harbor Galleria at `GA_C` (-330,0,-600): stores from `GA_STORES` (`_ga_store`, local frame), `ga_spots` counters, `STORES` panel (`_open_store`, catalog cards, fitting camera `_style_face_camera`), `_style_finish` drops unowned try-ons when the panel closes. Relics (`RELICS`, daily stock `_relic_stock`), deals (`_style_deal`), featured podiums and Sky Run (`SKY_PADS`, `_ga_fun_tick`, saved `sky_run`). Checkpoint "Harbor Galleria" is last in CHECKPOINTS.
- Fixes included: Biosphere gate side test uses the gate plane (`along < 0`, within 20 m), doorway wall pieces stop 2.85 m from openings, `_on_foot_collision_guard`, CALL CAR blocked by `_bio_inside`.
- Developer: `--style-shots` (outfit line-up and store screens; offline).
- Commit be111ce, versionCode 69, APK SHA256 7d05370125750ea9fa8791f9e29f6a454817457816bc36a2c283db7b8a955fc9 (46,431,777 bytes), same certificate. Workflow run 44733051176 passed; release.json, page button, web pck (18,064,328) and downloaded APK hash verified. Desktop bench 55.8 fps. Not verified on a phone.

## v0.40.1 released and verified (2026-11-20)

- Harbor Galleria enclosed: `_ga_shell` builds solid walls on GA_X0/GA_X1/GA_Z0/GA_ZN up to GA_WALL_H with roofs over the store rows; doors are the arch (half-width GA_DOOR_S) and the west Sky Run door (GA_DOOR_W). `_ga_inside` tells inside from outside; smoke test ray-checks every wall metre and walks into each wall and out of each door at hoverboard speed.
- Commit a40b256, versionCode 70, APK SHA256 a3d402381eb58dbdfb42cd7748c649fda98dc18cf3e8fa560103b908689fcc0c (46,431,777 bytes), same certificate. Workflow run 44736976191 passed; release.json, page button, web pck (18,065,976) and downloaded APK hash verified.

## v0.41.0 released and verified (2026-11-20)

- Sky Garden (`_build_sky_garden`, terrace SG_X0..SG_X1 / SG_Z0..SG_Z1 at SG_TOP, ramp at SG_RAMP_X): 12 plants in SG_PLANTS, rarity SG_RARITY (restock odds and quantities), mutations SG_MUTS rolled at planting (deterministic from planting time and bed). Offline growth uses unix timestamps (`_sg_now`, test override `sg_test_now`). Saved as `sky_garden` {plots, bag, codex, muts, all, bk, bought}. Panel `sg_panel` (shop / plant / codex). Dev screenshots: HC_GARDEN_DEMO=1 with --city-shots.
- Cars: `_car_barrier` puts bollards on HUB_CAR_LAYER (car-only collision) at the Biosphere entrance, both Galleria doors and the Sky Garden ramp; `_people_only` + `_people_only_keep_cars_out` sends cars inside away; `_call_block_reason` refuses inside the mall and garden.
- Galleria: muted GA_TOY palette, darker floor; GA_EXTRA adds 5 shops (Sneaker Lab -> Thread & Co shoes tab, Neon Outfitters -> market 0, Pet Palace -> market 1, Seed & Bloom -> garden seed shop, Harbor Sweets decor), interaction via `_extra_near`.
- Note: untracked research output lives in reports/ and research_notes/ (not committed). scripts/publish-release.py needs a clean tree, so move them aside while publishing.
- Commit 2014713, versionCode 71, APK SHA256 4d6350cebce2e0cdee01f259bc673bfd70bf151973a3a8762d7a8fa297e85cee (46,468,641 bytes), same certificate. Workflow run 44741649075 passed; release.json, page button, web pck (18,101,400) and downloaded APK hash verified. Not verified on a phone.

## v0.42.0 released and verified (2026-11-20)

- Zoo animals: blender-src/make_animals.py (metaball bodies, painted markings per face, nodes Body/Head/Tail/LegFL/LegBL/LegFR/LegBR with pivots) writes game/models/animals/animal_<kind>.glb for 9 quadrupeds. `_bio_load_animal` uses them in `_bio_make_quad` (old primitive builder is the fallback). Penguin, birds, flamingo, butterflies still primitive.
- Waterfront kiosks: `_future_kiosk` (KIOSKS names/colours) replaces the four 8x3.6x6 box kiosks at z=40; same collider.
- Commit ce0ef5c, versionCode 72, APK SHA256 239c4c03b6c7b6aef165ff721fc509d62e7b30e29818cb7ccfdb5b0b8170973f (48,326,072 bytes), same certificate. Workflow run 44765842863 passed; release.json, page button, web pck (19,952,660) and downloaded APK hash verified. Not verified on a phone.

## v0.43.0 released and verified (2026-11-20)

- Harbor Album / Harbor Pass / Harbor Night / check-ins (panel `hp_panel`, Menu > "Album & Pass"): `_album_pages` (5 pages from existing collections), `album_claimed`; season = `_pass_day()/SEASON_DAYS` (28 days), tiers from `_xp()-season_base` (SEASON_STEP 150, 30 tiers, SEASON_ITEMS unlock look_own bits); `_harbor_night()` Saturday 18-22 local (Sky Run x3, mutation chances x2 via `_sg_mut_roll(...,night)`); `_cal_tick` daily check-in (+$100, 5 of 7 days +$1,500/+100 XP, week starts Monday). Saved as `harbor_pass`. Tests/screenshots never check in (any -- arg); test clock `pass_test_now`.
- Birds: make_animals.py `build_bird` (penguin, flamingo, owl, parrot, duck, goose; Body with WingL/WingR/Head children, flamingo LegL/LegR). `_bio_load_bird` hooks them in. Metaball chains now gap-filled for smooth necks/wings.
- Commit 3004c72, versionCode 73, APK SHA256 e1d5050687d3d74fcefbba4ea370a509def1af4f89c132dcd7f7b4c04192504a (49,588,924 bytes), same certificate. Workflow run 44768783135 passed; release.json, page button, web pck (21,216,748) and downloaded APK hash verified. Not verified on a phone.

## v0.44.0 (2026-11-21): Grand Central, 10-station loop, Directions, Harbor Gardens, walkers

- Walkers (`_nav_area`, `_nav_spot`, `_stroller`, `_strollers_tick`, end of main.gd): each place gets a walk grid of NAV_CELL 0.8 m cells free of colliders (layer 1) and `nav_blocks` (benches, ticket gates, tables), reachable from its seeds, plus one distance field per spot. Grids build a few hundred cells per frame the first time the camera comes within NAV_NEAR of the place. Areas: Galleria (`ga_nav`, 22 shoppers), Biosphere (`bio_nav`, 26 visitors, pens are spots; gates are blocked so dome visitors stay in their domes), Grand Central (`gc_nav`, 28), Harbor Gardens (`hg_nav`, 16), stadium Fan Plaza (`fan_nav`, 16). Walker people carry `pp["walk"]` so the idle-life and feet-snap code leaves them alone.
- Sky train: SKY_CORNERS now runs up Raceway Road to Airport Road (z -458), west to avenue x -620, down to the z -300 street and back east to x -300. 10 stations (Airport, Galleria, Biosphere, Stadium, Grand Central and Civic Center added; the old Union Station stop is gone, Grand Central replaces it), SKY_TRAINS 3, TOUR_BONUS 1200. A station entry may carry "side" (-1 puts the entrance on the other side of the track).
- Directions: DIR_DESTS, Menu > Directions (`dir_panel`), `dir_target` overrides `_guide_target`, chip at the top (tap to stop), clears within DIR_ARRIVE. `_build_signposts` puts finger posts at signalled junctions and station entrances (nearest 4 places, 20 degrees apart, distance on each blade).
- Grand Central (`_build_grand_central`, GC_C plaza block (-420,-340); GC_T towers block (-340,-340)): downtown plan entries garage (2,3) and tower_0 (3,3) removed. Plaza with the Harbor Ring pool, glass hall with kiosks, terrace, LED screen (`gc_screen`, `_gc_tick`), Aurora Residences and The Meridian on a 16-shop podium. Batched with `_gb`/`_gb_flush` into `gb_root`.
- Filled land (`_build_fill`): Garden Lofts along Airport Road, Galleria Lofts (x -283), Westpark lofts (x -640), Harbor Gardens park with a lake (HG_*), stadium Fan Plaza (food trucks, flags, trees). `lofts` records footprints for the smoke test. `_fill_clear` uses a box from knee height so the ground slab doesn't count.
- Galleria walk now starts at Airport Road (z -469).
- Released and verified 2026-11-21: commit 0fe19f8 (tag v0.44.0), metadata 8ff9348, versionCode 74. APK SHA256 27517a60e9a087edb31c3d928a259376cd084404d478231b3d15d76c9957549b (49,654,460 bytes), same certificate. The first two Pages runs failed on GitHub's side ("No artifacts named github-pages", upload had succeeded); a fresh `gh workflow run pages.yml` run 44811160271 passed. Live release.json, page button, web pck (21,278,972) and downloaded APK hash verified.
- Dev flag `--nav-check` builds every walk grid and runs the v0.44 checks alone (about 10 s). The full smoke test takes about a minute when nothing else is running.
- Not verified on a phone: frame rate with ~100 extra walkers and the new buildings.

## v0.45.0 (2026-11-21): new hover cars

- blender-src/make_hovercars.py (`Blender --background --factory-startup --python blender-src/make_hovercars.py`, HARBOR_CAR_RENDER=<dir> for previews) replaces car_0..4 with original designs inspired by the user's reference pictures (style only): Lumen (retro hatch, arch covers), Solar Cab (wedge, rear pods), Interceptor (angular, rails, roof light), Vela (faceted wedge racer), Arc (roof arch over a glass bubble). Same frame and material names (Body, Cabin, Glass, Light, Tail, Jet, Dark, Chrome); every car needs a Cabin part for the smoke tint check. It execs helpers from make_real.py.
- `_try_model` adds `_car_underglow` (additive cyan radial plane at y -0.5) to every res://models/car_* instance.
- Released and verified 2026-11-21: commit 2adbdf8 (tag v0.45.0), metadata 160d498, versionCode 75. APK SHA256 8dc9d78e1b5d8aa469f9ab45b373cb551ad19eeca22d153e4e6b9a5b0d3ca3c7 (49,781,436 bytes), same certificate. Pages run for the source commit failed (same GitHub artifact error as 0.44), the run for 160d498 (44825410506) passed and deploys the whole site. Live release.json, page button, web pck (21,406,236) and downloaded APK hash verified. Not checked on a phone.

## v0.46.0 (2026-11-21): Grand Central shops open, busier downtown

- GC_T podium is now a 30 m solid core plus 7.5 m corner blocks with 12 open shop bays (GC_SHOP_PICK into GC_SHOPS, GC_SHOP_KIND per shop) built by `_gc_shop_inside(kind, ...)` (bay frame: x across the front, z 15 at the back wall to 23 at the street; displays batched with `_gb`, solid bits via colliders, clerk with pp["walk"] so idle code leaves them). `gc_shop_spots` feed `gc_shop_nav` (30 walkers). `_gc_kiosk` is an open stall with `_kiosk_goods(name)` and a clerk.
- TRAFFIC_LOOPS gained 5 inner-lane loops (lane 2.6, "stopline" 13.6, optional "police": the 3rd car is a white car_2 with flashing `police_lights`, toggled in `_gc_tick`); traffic 66. Smoke light test runs with `traffic_test_path` (only that loop's cars, no people) so other loops can't block it.
- Downtown pedestrian lines cover avenues -140/-220(to the station)/-300/-380/-460/-620 and streets -140/-220/-300/-380(to the stadium); peds 272.
- Released and verified 2026-11-21: commit 7563b03 (tag v0.46.0), metadata 6ef9b24, versionCode 76. APK SHA256 3e01c82ef3f63affa897eb9b3d629c10a74e693d03f9139409999ae1e574072f (49,797,820 bytes), same certificate. The metadata Pages run failed on GitHub's artifact error again; a `gh workflow run pages.yml` run (44828650281) passed. Live release.json, page button, web pck (21,423,580) and downloaded APK hash verified. Not checked on a phone.

## v0.47.0 (2026-11-21): tabbed menu, 15 m downtown roads, street stalls

- Menu (in `_build_hud` where `menu` is made): header (`menu_who`, `collection_label`), tabs from the `pages` list (`menu_tabs`, `_menu_tab(i)`), tiles reuse the existing button objects (mode/nick/time/view/radio/online/run/screen). Dev: HC_MENU=<tab> with --city-shots shows the menu.
- DT_ROAD 15 (was 20): dashes at ±3.75, zebra bar count from the width, downtown loops lane 5.6 / inner 1.9 with "stopline" 11.1, downtown pedestrian lines at DT_ROAD/2+3.1. North Highway, Airport Road and Westside Boulevard are still 20 m.
- `_build_street_stalls` (17 open stalls on the downtown pavements, `street_stalls`), fan plaza trucks replaced by `_gc_kiosk` stalls; `_kiosk_goods` kinds added: HOT DOG HQ/TACO STAND, FRESH DRINKS, FAN STORE, FLOWER CART (and DAILY NEWS uses the news racks).
- `_cull_people_in(root)` replaces `_cull_person(root)` on gc_root/fill_root: a visibility range on a district-wide MultiMesh hid it whenever its far centre was out of range.
- Released and verified 2026-11-21: commit b23e1a1 (tag v0.47.0), metadata 3627c2e, versionCode 77. APK SHA256 92a6a11a99f5515a4c3460e795d7f16d289a226d654bbfcd3207ec1dfad356ba (49,793,724 bytes), same certificate. Pages passed first time. Live release.json, page button, web pck (21,419,724) and downloaded APK hash verified. Not checked on a phone.

## v0.48.0 (2026-11-21): performance, level-locked places

- Bench: `--bench --web-lite` with HC_BENCH_AT="x,z,yaw" stands anywhere; prints fps (vsync off), draw calls, primitives, process/physics ms. HC_SKIP="biosphere,galleria,sky_garden,grand_central,fill,peds,traffic" skips building those (developer only). Finding: closing places barely helped; people + traffic simulation was the main cost; the Galleria interior was ~2200 draw calls.
- `_traffic_tick` buckets people and vehicles in 12 m cells; cars further than 170 m from you skip people; cars further than 185 m don't move their body (`_traffic_place(..., far)`). `_update_peds` poses people beyond 70 m every third frame. People in gc/fill/ga roots fade at 95 m (`_cull_people_in`). `ga_inner` (everything inside the mall) is hidden unless the camera is within 14 m of the building (`_ga_inner_tick`). Dome planting MultiMeshes have visibility_range_end 150.
- PLACE_LOCKS: Galleria L4, Biosphere L7, Sky Garden L10. Locked: root hidden and PROCESS_MODE_DISABLED (colliders off), fenced sign shown, ticks and near-checks return early, `_travel_open` refuses. `_places_tick` re-checks once a second and announces openings. Tests/shots always unlocked; `place_test_level` or env HC_LEVEL to try a level.
- Released and verified 2026-11-21: commit 623befb (tag v0.48.0), metadata d56223c, versionCode 78. APK SHA256 c53769c277e220edfa0440fb0a04674651d5bb4a8d1ac992407b04b20e232e2e (49,801,916 bytes), same certificate. Pages passed. Live release.json, page button, web pck (21,427,420) and downloaded APK hash verified. Not checked in a real browser or on a phone.

## v0.49.0 (2026-11-21): 40 levels

- LEVEL_XP has 40 entries: level n costs 50n XP up to 20 and 100n from 21 (level 40 at 71,450 XP). Peer levels clamp to 1-40; ACH gained lv25/lv30/lv40; `_level_color` gold at 20, pink at 30, white at 40.
- Released and verified 2026-11-21: commit ea3cbc0 (tag v0.49.0), versionCode 79. APK SHA256 fc606268a01e32cfcddaf221ed740163565311fcd95e7a502bebdade5c57874f (49,801,916 bytes), same certificate. Pages passed; live release.json, page button, web pck (21,427,868) and downloaded APK hash verified.

## v0.50.0 (2026-11-21): careers and homes

- Careers (end of main.gd): CAREERS (taxi/medic/police/fire; level 1/8/12/16), CAREER_RANKS (pay x1.0-2.1), `career` (shift, not saved), `career_jobs`/`career_earned` saved under progress/careers. `_career_start` swaps the car livery and model (`_model_key` 200+career, `_apply_car`), police adds roof lights to your car. Jobs: `_career_next` picks spots from `_career_spots()` (QUICK, CHECKPOINTS, DIR_DESTS, stalls; no raceway, no locked places), `_career_tick` advances stages, police calls start `_chase_start(2)` and `_chase_end` calls `_career_chase_over`. `_career_target` drives the guide arrow; `_career_hud` the top text. Panel: Menu > PLAY > Careers.
- Homes: HOMES (5, $55k-$320k), doors from the first loft of each row and the GC_T corner lobbies (`_home_door_spots`). Rooms are built on first entry at HOME_BASE + i*120 m (y 40), with a sea and towers for the view; furniture spots HOME_SLOTS per kind, catalogue FURNI, `_furni_build(id)`. Saved under progress/homes {own, layout, furni}. Action button: BUY HOME / ENTER HOME / DECORATE / LEAVE HOME. Panel Menu > ME > My Home ("Go home" or directions via `dir_custom`). Dev: HC_HOME=<i> or HC_CAREER=<i> with --city-shots.
- Released and verified 2026-11-21: commit 83fe7eb (tag v0.50.0), metadata 91c2b98, headline fix ff531c7, versionCode 80. APK SHA256 6d5ab9f1790917e1e3c6879943339ed91d2372c48835571b1934f220efde2199 (49,838,780 bytes), same certificate. The headline Pages deploy failed twice on GitHub's artifact error and passed on a rerun of run 44881189337. Live release.json, page (0.50.0, new headline), web pck (21,464,828) and downloaded APK hash verified. Note: the publisher's metadata commit also rewrites the page's "New in" text from the release notes, so edit the lead text after publishing (or check it) rather than before.

## v0.50.1 (2026-11-21): home fixes, driver's view

- Homes: `_home_slots(kind)` replaces HOME_SLOTS (zones from `_home_zones`: living left with kitchen, partition at px with doorways to the bathroom (back) and bedroom (window side), `_home_build_layout`). Decorating rings sit in front of each piece (`_home_ring`), which fixes being trapped inside new furniture. `_home_fix_layout` maps older saved layouts onto the new spots by category. Dev: HC_HOMETOP=1 with HC_HOME shows a cut-away from above; --home-check walks around inside a home.
- `_interact` entering the car sets view_mode 2 (driver's seat) unless legacy_rules.
- Released and verified 2026-11-21: commit a21ae31 (tag v0.50.1), metadata fa8a40e, versionCode 81. APK SHA256 321e0198247e8d98c867027d3edc75c78c6a2a2471be2df481d793a9f2bf4d23 (49,846,972 bytes), same certificate. Pages passed; live release.json, page button, web pck (21,471,228) and downloaded APK hash verified. Not checked on a phone.

## v0.51.0 — Released and verified 2026-11-21

https://github.com/kokolo2020/GTA2027/releases/tag/v0.51.0 · source commit f8b115f (tag v0.51.0) · APK SHA256 6b16db62491486ff8344a79f477fdd3437a361b76f2c78d20c443679dfba0dcc (50109309 bytes, code 82, cert 5168f1fa...547b). Smoke test passed after fixing the chapter arrow overriding Directions/quests. Live release.json, page edition/button, /play/index.pck size and downloaded APK hash verified. Not checked on a phone.

## v0.51.1 — Released and verified 2026-11-21

https://github.com/kokolo2020/GTA2027/releases/tag/v0.51.1 · source commit e316a29 (tag v0.51.1) · APK SHA256 12f39799f56938e041f00a015c35bf6cbcbe67cdb8c12082a23e5b9ce0106b4b (50113405 bytes, code 83, cert 5168f1fa...547b). Smoke test passed with a time guard. Live release.json, page edition/button, /play/index.pck size and downloaded APK hash verified. Not checked on a phone.

## v0.51.2 — Released and verified 2026-11-21

https://github.com/kokolo2020/GTA2027/releases/tag/v0.51.2 · source commit 0e0278e (tag v0.51.2) · APK SHA256 9ce8c0eab0a57294b68e630119a8e0916200189f0e0b32e0416a83477b807962 (50125693 bytes, code 84, cert 5168f1fa...547b). Smoke test passed with a time guard. Live release.json, page edition/button, /play/index.pck size and downloaded APK hash verified. Not checked on a phone.

## v0.51.3 — Released and verified 2026-11-21

https://github.com/kokolo2020/GTA2027/releases/tag/v0.51.3 · source commit 8351434 (tag v0.51.3) · APK SHA256 3e0d90c68813f4f1f70d6f8325acbfec239b961be4cd76e87bbf5d3f3afd783b (49633075 bytes, code 85, cert 5168f1fa...547b). Smoke test passed with a time guard. Live release.json, page edition/button, /play/index.pck size (17762560), new loading screen, /p redirect and downloaded APK hash verified. Joining a live stream from a second device not tested yet.

## v0.52.0 — Released and verified 2026-11-21

https://github.com/kokolo2020/GTA2027/releases/tag/v0.52.0 · source commit 5ec0330 (tag v0.52.0) · APK SHA256 c72c8b37a364ddc9d0f3a7f994d0fa9941692fcc4188c8ea2e05715414ba7ab9 (49665843 bytes, code 86, cert 5168f1fa...547b). Smoke test passed with a time guard (each career start to finish, achievements once). Live release.json, page edition/button, /play/index.pck size and downloaded APK hash verified. Cut scenes only checked in desktop screenshots (docs/shots-0.52.0); not played on a phone.


## Released and verified 0.52.1 (2026-11-22)
Release https://github.com/kokolo2020/GTA2027/releases/tag/v0.52.1, APK SHA256 ba04ad2692e1c019ea5ceea774b8beb40ee5301d6f043986dc23827dca8c85c5. Desktop smoke test passed; not checked on a phone.


## Released and verified 0.53.0 (2026-11-22)

Release https://github.com/kokolo2020/GTA2027/releases/tag/v0.53.0 · source/tag commit `16542deef39cd65f6877ede39755cb34cc524e14` · APK SHA256 `d86029d36bb15a4169b67cf62410357ab89a6304b52a0acad02d14e150e3c0ed` (50,399,407 bytes, code 88, package com.koko.harborcity, existing certificate 5168f1fa...547b). Import, focused avatar/Settings checks and full smoke passed. Real in-game shots are in `docs/shots-0.53.0/`. Android and Web exported; the downloaded release APK matched its checksum. Pages run 44965257189 succeeded on retry after the known missing-artifact failure. Live manifest, page edition/button and Web PCK checksum verified (18,525,152 bytes). Public browser build loaded and New / Classic switching worked. Desktop save restored byte for byte; unrelated untracked files and original Git exclusions preserved. Not tested on Fold5. To revert the character on-device: Menu > Settings > Character: Classic; the choice persists and restores the saved wardrobe.
