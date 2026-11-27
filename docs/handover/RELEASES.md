# Release notes for handover (newest first; 0.55.x). Older releases: docs/handover/HISTORY.md and docs/releases/*.md

## 0.71.0 (code 139, 2026-11-27)
Fruit Garden: game/garden.gd (new, MultiMesh orchards, no collision) covers the Marina Heights island with 13 fruit blocks, paths, crates, signs; the three shops, fountain, yacht club, boardwalk and lighthouse are kept. Built at the end of _build_marina. Dev: --sky-shots now includes garden spots.

## 0.70.0 (code 138, 2026-11-27)
Sky view (View button: walk_view 4 / view_mode 3): high bay camera, far 3200, fog 700+. game/horizon.gd adds sea, mountains, boats only in Sky view. _sky_grade lifts photo grass to green in Sky view. Sunset DAY_KEYS made purple-blue. Dev flag --sky-shots.

## 0.69.0 (code 137, 2026-11-27)
Pets rebuilt (main.gd _build_pet): baby flying Mini Dragon (hovers, flapping wings), Robo Pup, Hover Cat, Star Fox; tails and wings animate (_pet_anim). Dev flag --pet-shots.

## 0.68.0 (code 136, 2026-11-26)
Quest tracker (game/tracker.gd): QUESTS panel, arrow and beam in Paris, Tokyo, New York, Bangkok.

## 0.67.0 (code 135, 2026-11-26)
- Infected zones in outbreak missions: game/infected.gd (brute/runner zombie kinds, wrecks, barricades, safe zone, dead palette via g.infect_amt in _daynight_apply). Dev check: --infected-shots (HC_WORLD index). Biodome Asia Godot rebuild is shelved in docs/shelved/asia-godot-rebuild (not in game).

## 0.66.0 (code 134, 2026-11-26)
- daily.gd (new, g.daily): login streak (check_in 5 s after boot, only when no cmdline args), 3 daily goals of 4 (seal, rescue, quests, earn), overlay panel from Menu > PLAY, save section "daily"; hooks in outbreak.gd rescue/seal; test prints DAILY.

## 0.65.0 (code 133, 2026-11-26)
- outbreak.gd: figure() uses person_N.glb (recoloured, posed arms/legs, tweens); block_figure fallback; zombies chase within 13 m (tick_zombies), hp bar + hurt flash, die() respawns at world RET; big countdown label; main.gd test prints DEATH.

## 0.64.0 (code 132, 2026-11-26)
- Look pass: main.gd DAY_KEYS midday sun 1.08/warm, ambient 0.4 cool, tonemap exposure 0.98, contrast/saturation 1.12; paris.gd vmat albedo 0.86 + concrete triplanar texture (_real_setup); worlds.gd ground/grass colours darker; outbreak.gd green vignette (vig) grows with time.

## 0.63.0 (code 131, 2026-11-26)
- outbreak.gd (new): per-world rescue mission (ob in paris.gd; post at RET+(-5,0), 3 survivors near clues, 3 valves, 240 s, wrong order -20 s). worlds.gd: sealed_count, check_seal_bonus ($50000), seal_bonus saved in "sky". paris.gd: prompt/interact/tick/save hooks. Smoke test banner check made robust (hides lvl_root first).

## 0.62.0 (code 130, 2026-11-25)
- Explore mode: free camera tour of the city, 4 worlds and sky island (game/explore.gd).

## 0.61.1 (code 129, 2026-11-25)
- worlds.gd: shrine reward $100000+5000 XP, wish $5000; paris.gd: relic $10000, daily case 2000/200. build_sky: shrine floor rings, halos (tweened torus), orbiting crystals, sky beam.

## 0.61.0 (code 128, 2026-11-25)
- paris.gd: mystery (W clues/riddles/code/relic; clue orbs, case board at ret+(5,0,0), found_clue, submit_case, clue/relic save keys). worlds.gd: sky island at (9600,260,700) built lazily, relic_count/sky_open/enter_sky, shrine prompt, "sky" save section. main.gd: case_panel (_open_case, digit spinners), sky_button in world picker, shots test runs the mystery + sky flow.

## 0.60.0 (code 127, 2026-11-25)
- New game/worlds.gd (manager, DEFS for Paris/Tokyo/New York/Bangkok at C x=900/3200/5200/7200, z=700; hub portal + beam; picker API; save/load forwarding). paris.gd is now a data-driven per-world instance (W dict: landmark eiffel/crossing/times/prang, café, quests, save section). New data game/map/{tokyo,newyork,bangkok}_osm.json. main.gd: `paris` var is now a Worlds instance; world_panel picker (_open_worlds/_world_go), _portal_pressed, GO menu "World portal", _paris_shots loops all worlds.

## 0.59.2 (code 126, 2026-11-25)
- paris.gd PORTAL_REL now (-126,0,-40) = world (84,0,-8) on the Ridge lawn (the old south-of-dome spot was water); in_paris(). main.gd: portal_button "WORLD PORTAL"/"PORTAL HOME" (_build_travel, _place_portal_button, _portal_pressed, shown in the HUD refresh, hidden on clean screen / Stream Mode).

## 0.59.1 (code 125, 2026-11-25)
- paris.gd: light beam (140 m CylinderMesh, unshaded alpha) over the hub portal; go_portal() teleports next to it. main.gd: Menu GO list gets "Paris portal" (_menu_go.bind(paris.go_portal)).

## 0.59.0 (code 124, 2026-11-25)
- New game/paris.gd (RefCounted, built lazily on first portal entry at C=(900,0,700); hub portal at HUB_C+(0,0,64), return portal at C+(95,0,115)). Data game/map/paris_osm.json (OSM metres from the tower, lat0 48.8583 lon0 2.2945). Chunked building meshes + trimesh collider, window mesh visibility_range_end 170, MultiMesh roads/trees/lamps/tower. 4 quests, state saved via save_state/load_state. main.gd hooks: paris var, interact, action button prompt, save/load, _biosphere_tick, --paris-shots. OSM credit in menu line + credits.txt.

## 0.58.0 (code 123, 2026-11-24)
- New game/weather.gd (clock-seeded random showers, GPUParticles3D drops, under_roof ray, sets g.rain_amt; main.gd _daynight_apply greys sky/sun, fog closes in, road_mats go wet; Menu > Settings > Weather, saved as progress/weather_on; --rain forces it; dev modes stay dry). main.gd: _touch_text_focus() (touch -> LineEdit.edit(), tested in _smoke_typed_chat), filmic tonemap + new DAY_KEYS day rows, SSAO + radiance 128 on desktop only, sky train _speak() lines, Harbor Dome wall 40 m + lid. world_biosphere.gd: build_corner_rails()/rail(), park_lamp(), hedges via nature("nature_hedge"/"nature_hedge2") from blender-src/make_hedge.py. cafe.gd: toy palette (make_cafe.py TOY_COL override), barista arm pose with ForeArm. dome_quests.gd gift_pos keeps 14 m off the café. Sky train pillars over roads become portal frames (legs 1.1 m past the road edge, beam in caps). autoplay.gd: sidewalk_ok/path_clear/road_edge_dist, force_travel() every TRAVEL_EVERY=300 s, clear_screen() (AUTOPLAY_UI=1 keeps the HUD).

## 0.57.1 (code 122, 2026-11-24)
- cafe.gd rebuilt: pearl layout (alcove, wallpanel, canopy), StaticBody solids (solid()), barista arms +1.05, counter_spot at the plaza, plaza + lounge seats via g._hub_seat(...,"lounge"), lounge opens toward the tree. blender-src/make_cafe.py adds cafe_alcove/cafe_wallpanel. world_biosphere.gd hex_roof: edges clipped to the base ring. --cafe-shots sets dq.dry.

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
