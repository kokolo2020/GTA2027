# Release notes for handover (newest first; 0.55.x). Older releases: docs/handover/HISTORY.md and docs/releases/*.md

## 0.57.0 (code 121, 2026-11-24)
- New game/cafe.gd (Roastery + lounge, build_lounge, props from blender-src/make_cafe.py -> game/models/cafe_*.glb), hooks in main.gd (cafe var, interact, panel, speed perk, --cafe-shots, _smoke_cafe). dome_quests.gd: 10 café quests (idx 11-20), cq_* state saved. world_biosphere.gd: round beams, hex_roof, sign_frame.

## 0.56.10 (code 120, 2026-11-24)
- world_biosphere.gd: spotting no longer needs the camera frustum within 22 m; passport lists STILL TO SPOT animals. Site: Play in browser button first, ~60 MB note. main.gd smoke: _my_ach_tier() >= 2.

## 0.56.9 (code 119, 2026-11-23)
- Free chat: main.gd chat_edit LineEdit (max 150) + Send in chat_panel, _chat_send_text, _chat_clean (strips control/zero-width chars, links -> [link], CHAT_BAD words starred, cut at CHAT_MAX), _chat_wrap (26 per line), _chat_fit (panel stays on screen), _typing() guard in _input/keyboard poll. Net: position frame carries "qt" (text) for 4 s after sending; peers clean it again before showing (bubble + log). Smoke: _smoke_typed_chat. Shots: --chat-shots.

## 0.56.8 (code 118, 2026-11-23)
- Renamed to Chit Chat City (CCC): project.godot config/name (use_custom_user_dir + custom_user_dir_name="Harbor City" keeps the desktop save folder), export package/name, main.gd player-facing strings, web_shell.html, site pages, publish-release.py release title. Package id com.koko.harborcity and APK file name unchanged on purpose. New game/icon.png (ChatGPT-made CCC icon; config/icon), site favicon, site/assets/ccc-hero.jpg banner, web_shell loading background (base64).

## 0.56.7 (code 117, 2026-11-23)
- New game/festive_shop.gd (built by main as fest_shop, HUB_C+(-14,0,-24)): boutique pavilion, extra_panels shop UI (try/buy/wear), items from festive.gd ITEMS, save keys progress/fest_own + fest_worn. main.gd hooks: interact + action button, _apply_look (suit tint via tint_look, then dress_player), _toggle_menu finish, _layout_panels right-hand panel, face_camera in _process, _smoke_boutique, --shop-shots (_shop_shots).

## 0.56.6 (code 116, 2026-11-23)
- game/models/car_0..4.glb replaced by rev2 rounded hover vehicles (source ~/hover-vehicle-study/rev2, converted by blender-src/convert_new_cars.py: ~9.5k tris, 2x4.2 m, ~1.2 m tall, materials Body/Cabin/Glass/Light/Tail/Seat/Jet/Dark/Chrome/Beacon; old cars in reports/old-cars/). main.gd: --car-shots (_car_shots), peer cop-light boxes y=1.25. Slots: 0 Silver Coupe, 1 Taxi, 2 Police, 3 Shuttle, 4 Racer.

## 0.56.5 (code 115, 2026-11-23)
- main.gd: _hub_christmas now builds only _xm_grand_tree(HUB_C+(-8,0,0)) (8 cone tiers, MultiMesh garlands/fairy lights/ornaments, star, 30 gifts with ribbons); ring of small trees and gate planters removed. Luxury furniture: _lux_sofa_mesh/_lux_chair_mesh/_lux_table_mesh/_lux_pouf_mesh (SurfaceTool ArrayMesh, velvet+gold+marble) placed with _lux_batch; replaces sofa/chair/game_table/beanbag glb in _build_hub and _hub_vip. dome_quests TREE=(-8,0,0), tree check radius 7. New-player spawn HUB_C+(-24,0.9,0). Shots: hub-grand-tree, hub-lux-tables, hub-lux-sofas.

## 0.56.4 (code 114, 2026-11-23)
- main.gd: snow removed from _hub_christmas; floor disc is a darker polished StandardMaterial3D. New _hub_polish() (gold plaza rings, compass spokes, wall uplights), _hub_gate() (gold arch, pillars, open glass doors, welcome signs, red carpet, lamps; geodesic lattice carved at the west doorway), _hub_vip() (VIP_C=(234,0,52): dais, five sofas with seats, curved bar with stools, velvet ropes, chandelier, palms). dome_quests.gd: 11th quest "Relax in the VIP Lounge (20 s)" via vip_secs. Shots: hub-gate-front, hub-vip-front, hub-vip-inside.

## 0.56.3 (code 113, 2026-11-23)
- game/dome_quests.gd (Dome Quests: 10 daily quests, 12 gift boxes, streak, all-done bonus; saved under [domequests]; selftest asserted in smoke). hourly_challenge.gd now builds its own Challenge Corner via build_terminal(HUB_C+(-18,0,12)) (no sun_dome dependency). _hub_geodesic() in main.gd: icosphere frequency 5 hemisphere frame (MultiMesh struts and joint balls), amber outside-only film, base ring, interior omni lights; glass alpha 0.13.

## 0.56.2 (code 112, 2026-11-23)
- _hub_christmas() in main.gd (end of _build_hub): CPUParticles3D snow, _xm_tree, presents, string-light rings, snowmen, MERRY CHRISTMAS sign; always on. New players (ch_idx 0, step 0, no deliveries) spawn at HUB_C+(-10,0.9,0) after _load_progress. Chapter 1 gained steps Dome gate (150,0,32) and Ridge Pass (69,0,5.5); saves without chapters/intro and step>0 get +2. Sun Dome call, SPAWN_SUN_DOME and --sundome-shots removed (sun_dome.gd left unused); hourly challenge has no terminal.

## 0.56.1 (code 111, 2026-11-23)
- Sun Dome (game/sun_dome.gd: lattice, glass, sun core, pylons, floor inlays, Challenge Core with seats; built after _build_commons, skip with HC_SKIP=sundome). Spawn moved to SPAWN_SUN_DOME (-93,0.9,-22). Hourly Challenge (game/hourly_challenge.gd: kinds by UTC hour %3, selftest(), save keys hr_done/hr_total, hooks in action handler and action button). Stream Mode no longer blocks online autostart. Shots: run-sundome-shots.command (--sundome-shots). Next: Christmas theme, hangout features (emotes, jukebox), Blender animals.

## 0.56.0 (code 110, 2026-11-23)
- Stream Mode: game/autoplay.gd (state machine boot/to_dome/dome_quests/dome_stroll/leave_dome/to_station/waiting/riding/city; steers via g.stick), hook in main.gd after `booted = true`, launched with `--autoplay --autoplay-hours=N`. Run notes: docs/stream/RUN-STREAM-MODE.md. Next: taxi/careers phase, 3 h soak, Blender animals.

## 0.55.13 (code 109, 2026-11-23)
- Extra animals (spawn k=100+, RESERVE_FILL groups k=120+ in empty slots), livelier free roam (rest 0.4-3.5 s, speed 1.0), lantern quest no longer needs dusk, smaller sign, monolith cap removed. Next idea: Blender animal model rework.

## 0.55.12 (code 108, 2026-11-23)
- AFRICA_Y 3.4 -> 2.4 (all reserve domes); path_clear() keeps zone trees/boulders/mounds off the bridges (dome 0 zone props unchanged); PATHS gates set to "" (gate code kept, unused).

## 0.55.11 (code 107, 2026-11-23)
- Open reserve layout in all 7 domes (game/world_biosphere.gd: RESERVE_DOMES, RESERVE_SLOTS, RESERVE_PLAN, THEMES, PATHS, reserve_build/reserve_zone/reserve_wow/reserve_detail, reserve(i)). Per-dome boardwalk design in PATHS (arms, width, pier end, gate). Dome-specific old layouts (rich_landscape, phase2_landscape, garden_ring, sky_gallery) skipped for reserve domes. Shots: HC_DOME=n with --africa-shots (run-reserve-shots.command).

## 0.55.10 (code 106, 2026-11-23)
- Africa fixes: foyer walkway width 5.0 starting at z -38.4 (was 7.2, left an open end edge beside the ramp foot); inside_signpost() no longer called in domes; lanterns moved to rail edge. Next job: Savanna-style open habitats for the other 6 domes.

## 0.55.9 (code 105, 2026-11-23)
- Africa dome (dome 0) rebuilt as open Savanna Reserve in game/world_biosphere.gd (africa_reserve, africa_wow, africa_detail, AFRICA_ZONES, AFRICA_ARM_W/E): no pens, `a["free"]` roaming, raised boardwalk (ramp, deck, pier, 2 arms), 30 m spotting. Other 6 domes NOT converted yet. Dev flag --africa-shots (run-africa-shots.command).

## 0.55.8 (code 104, 2026-11-23)
- Glowing car-only road barrier (game/road_barrier.gd), cars put back on the road, checkpoint cars on the road, job stops on the kerb, Central Park and Union Station checkpoints moved. Careers code split into game/careers.gd.

## 0.55.7 (code 103, 2026-11-22)
Trials and Chase removed from the PLAY menu; `HIDDEN_PLACES` (Ridge Trailhead, Bay Promenade, Marina Heights) hidden from fast travel, pads, minimap icons, Directions, job spots; chapter Sun, Sea and Speed shortened. Docs: CODE-MAP*.md, docs/handover/*. Road barrier NOT included (next job).

## 0.55.6 (code 102, 2026-11-22)
Koko's feedback after 0.55.5. Dome entrance sign boards (`NAME BIODOME`, ENTER, FREE ENTRY); hub wall solid except 8 doors via `shell(..., gaps)` + `hub_doors()`; 23 waypoint visitors (`build_visitors`, `tick_visitors`); quests auto-start on entering a dome, `quest_guide()` arrow + distance, marker beams, auto-run on arrival (`auto_quest`; smoke sets it false). Tests added to `smoke()`: hub wall solid, doors open, quest auto-start. Release https://github.com/kokolo2020/GTA2027/releases/tag/v0.55.6 , APK 53,195,258 bytes, SHA256 e57ac40470c3874aad15580d51024c17dfd7b5e6a9b23f82124ad2fd7fd34ade. Not phone-tested.

## 0.55.5 (code 101)
Hub door frames (main.gd, old hex hub), `sky_gallery()` spiral walkway + 8 m lookout in 6 domes (not Asia), ring rails (`collision_wall`) and car fence `BIO_CAR_FENCE_R=168`.

## 0.55.4 (code 95-100 line)
Gold ENTER/EXIT door markers, visible plinth + glass walls in `shell()`, open ring loop `RING_R=72`, city-style signposts.

## 0.55.3
Old Biosphere look: thick saturated ribs, flower hedges, lamp posts, oaks, `garden_ring`, `colonnade`.
