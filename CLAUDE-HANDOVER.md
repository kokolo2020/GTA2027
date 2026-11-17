# Harbor City — current handover

Version 0.13.0, code 13 (see the v0.13.0 section at the end; 0.11 and 0.12 were never released on their own). Original single-player Android game, Godot 4.7.2 standard / Compatibility, Samsung Galaxy Z Fold5.

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
- Web build in site/play is still the 0.12 one (not rebuilt; each rebuild adds ~40 MB to git history).
- NOT tested on the Fold5: shop panels on touch, premium car handling at 130+ km/h, Marina performance, update-over-install from 0.10.
- Next (Koko's Level 5 plan): v0.14 new map extension with new quests (Blender).

## v0.13.0 publication completed by Claude

Release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.13.0
APK: https://github.com/kokolo2020/GTA2027/releases/download/v0.13.0/Harbor-City-Android-debug.apk
Release source commit/tag: c37b9cc / v0.13.0. Download metadata commit: 9bf12b0 (Pages run 44065798063 succeeded; live page shows 0.13.0).
SHA256: e37ba39cde0a84eb88baeb28aa579d512f019c3308b74fbf6b72563c58849cf1
The publisher verified the APK, uploaded it, and downloaded it back to check the hash. 0.11 and 0.12 were never released on their own; 0.13.0 includes them. Fold5 testing is still outstanding.
