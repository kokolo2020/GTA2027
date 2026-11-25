# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (34692 lines, 1244 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-602 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 603-675 | v0.34.6: futuristic towers for the old city | 1 |
| 676-754 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 755-815 | v0.34.4: futuristic road surface | 2 |
| 816-2024 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 2025-2508 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2509-2681 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2682-3197 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3198-3252 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3253-3355 | v0.11.0: online police vs thief | 4 |
| 3356-4299 | v0.10.0: chase mode (offline) | 38 |
| 4300-4984 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4985-5103 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5104-5141 | v0.30.1: nothing to collect stands in a road | 4 |
| 5142-5281 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5282-5649 | v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5650-6149 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6150-6400 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6401-6896 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6897-7190 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7191-8749 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 39 |
| 8750-11069 | v0.5.0: original synthesized radio and ambient pedestrians | 37 |
| 11070-11718 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11719-11822 | old city and Bay details | 1 |
| 11823-12232 | traffic | 10 |
| 12233-12593 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12594-12851 | camera views | 9 |
| 12852-13099 | v0.17.0: level-up celebration | 8 |
| 13100-13219 | v0.18.0: walk-in stadium | 5 |
| 13220-13381 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13382-13567 | checkpoints | 9 |
| 13568-13846 | v0.18.0: Harbor Dome social hub | 2 |
| 13847-13897 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 13898-14221 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 14222-14377 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14378-14626 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 14627-14841 | people: sitting pose, bots, bubbles, emotes | 6 |
| 14842-14960 | seats | 6 |
| 14961-15117 | game panel | 7 |
| 15118-15238 | tic-tac-toe | 7 |
| 15239-15290 | rock paper scissors | 4 |
| 15291-15373 | online table messages | 2 |
| 15374-15449 | comedy show | 4 |
| 15450-16349 | quick chat and emotes | 26 |
| 16350-16512 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 16513-16754 | v0.18.2: nickname and HUD relayout | 12 |
| 16755-17042 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 17043-17152 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 17153-17480 | circuit geometry | 12 |
| 17481-17578 | race car rental | 5 |
| 17579-17593 | speed effects | 2 |
| 17594-17644 | track helpers | 5 |
| 17645-17881 | events | 11 |
| 17882-17934 | boosters and spikes | 4 |
| 17935-17992 | online races | 2 |
| 17993-18348 | raceway panel, HUD, board | 10 |
| 18349-18556 | v0.22.0: Call Car | 6 |
| 18557-18926 | v0.23: RUN toggle and fast travel between districts | 19 |
| 18927-19000 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 19001-19437 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 19438-19929 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 19930-20080 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 20081-20115 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 20116-20430 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 20431-20752 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 20753-21067 | v0.36: the daily puzzle | 17 |
| 21068-21256 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 21257-21629 | building blocks | 23 |
| 21630-22131 | building | 16 |
| 22132-22287 | garden planting | 11 |
| 22288-22695 | the four layouts | 4 |
| 22696-22966 | animals | 8 |
| 22967-23098 | animation, spotting and rewards | 6 |
| 23099-23616 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 23617-23770 | your look: apply, save, share | 9 |
| 23771-24198 | stores and the wardrobe | 23 |
| 24199-24666 | HARBOR GALLERIA: the shopping mall | 14 |
| 24667-24818 | featured outfits and the Sky Run | 7 |
| 24819-24915 | v0.41: THE SKY GARDEN | 5 |
| 24916-25053 | building | 5 |
| 25054-25234 | plants | 6 |
| 25235-25354 | interacting | 7 |
| 25355-25598 | the garden screen | 9 |
| 25599-25637 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 25638-25669 | album | 2 |
| 25670-25721 | season | 6 |
| 25722-25729 | Harbor Night | 1 |
| 25730-25761 | check-in calendar | 1 |
| 25762-25938 | the panel | 8 |
| 25939-26153 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 26154-26577 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 26578-26819 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 26820-26998 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 26999-27035 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 27036-27132 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 27133-27424 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 27425-27525 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 27526-27849 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 27850-27960 | v0.24.2: road map (for moving people off the road) | 8 |
| 27961-28256 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 28257-28451 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 28452-29119 | Harbor Loop sky train | 27 |
| 29120-29480 | Day and night | 11 |
| 29481-30116 | v0.27 smoke test and screenshots | 2 |
| 30117-30533 | v0.27: Harbor International Airport (north of the city) | 10 |
| 30534-31047 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 31048-31208 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 31209-31305 | the Directions panel and chip | 7 |
| 31306-31847 | v0.44: Grand Central | 16 |
| 31848-32139 | v0.44: filling the empty land | 8 |
| 32140-32174 | v0.45: hover car underglow | 1 |
| 32175-32339 | v0.46: what is inside the Grand Central shops | 1 |
| 32340-32371 | v0.47: street stalls downtown | 2 |
| 32372-32470 | v0.48: places that open as you level up | 6 |
| 32471-32515 | v0.50: city careers | 5 |
| 32516-32566 | v0.52: careers as clear job loops | 3 |
| 32567-32574 | taxi | 1 |
| 32575-32578 | paramedic | 0 |
| 32579-32583 | police | 1 |
| 32584-32589 | firefighter | 1 |
| 32590-32599 | the step bar | 2 |
| 32600-32626 | cut scenes | 1 |
| 32627-32631 | siren | 0 |
| 32632-32643 | the Careers panel | 3 |
| 32644-33067 | v0.50: homes | 17 |
| 33068-33403 | decorating | 7 |
| 33404-33538 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 33539-33972 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 33973-34011 | v0.51.1: join and leave messages | 3 |
| 34012-34276 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 34277-34575 | v0.51.3: stream joiners | 9 |
| 34576-34692 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 607-5638 |
| `_nearest_*` |  | 9 | 1258-16788 |
| `_car_*` |  | 7 | 1423-32143 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2026-16411 |
| `_shop_*` | Marina Heights shops | 9 | 2639-16037 |
| `_bus_*` | Airport Line and city buses | 14 | 2683-27110 |
| `_level_*` | player levels | 7 | 3209-12965 |
| `_chase_*` | police chase mode | 11 | 3357-3604 |
| `_quest_*` | quests | 8 | 5188-20052 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5528-29098 |
| `_crew_*` | crews | 6 | 5717-6055 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5773-24187 |
| `_social_*` | friends, invites | 8 | 5821-6279 |
| `_soc_*` | social extras | 8 | 5860-6153 |
| `_c4_*` | Connect Four | 9 | 6494-6610 |
| `_rx_*` | Reaction Duel | 6 | 6637-6712 |
| `_quiz_*` | party quiz | 9 | 6960-7157 |
| `_ach_*` | achievements | 8 | 7378-24182 |
| `_radio_*` | radio and ambience | 8 | 8754-8918 |
| `_smoke_*` | smoke tests | 47 | 9166-34639 |
| `_shot_*` | screenshot modes | 8 | 11052-34111 |
| `_hub_*` | Harbor Dome hub | 12 | 13626-17019 |
| `_lux_*` |  | 12 | 14041-14170 |
| `_ttt_*` | tic-tac-toe | 7 | 15121-15212 |
| `_chat_*` |  | 10 | 15589-15964 |
| `_sg_*` | Sky Garden | 28 | 16300-25468 |
| `_rw_*` | Raceway | 30 | 17168-18096 |
| `_crate_*` | starter crate | 8 | 19021-19342 |
| `_quick_*` | quick quests | 11 | 19479-19788 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 20133-23723 |
| `_pz_*` | daily puzzle | 10 | 20776-20944 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 21130-24634 |
| `_ga_*` | Galleria mall | 13 | 24235-24746 |
| `_season_*` | season pass | 6 | 25671-25703 |
| `_lb_*` | leaderboard | 10 | 26044-26107 |
| `_ds_*` | digital signs | 6 | 26610-26771 |
| `_treasure_*` | treasure hunt | 10 | 27151-27410 |
| `_fm_*` | Find Me | 11 | 27547-27720 |
| `_ap_*` | Harbor Airport | 7 | 30327-30447 |
| `_nav_*` | walker nav grids | 9 | 30548-30794 |
| `_dir_*` | Directions panel | 7 | 31083-31279 |
| `_gc_*` | Grand Central | 9 | 31335-32176 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 32496-34493 |
| `_home_*` | homes | 21 | 32684-33483 |
| `_ch_*` | chapters | 6 | 33602-33649 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:294, `_apply_car`:1384, `_collider`:1642, `_level`:3227, `_input`:7692, `_physics_process`:7818, `_refresh_hud`:8187, `_toggle_menu`:8369, `_show_toast`:8445, `_save_progress`:8449, `_load_progress`:8542, `_process`:8931, `_blocked_at`:10127, `_blocker`:10142, `_apply_view`:12647, `_place_lock_of`:32385

World builders (`_build_*`): `_build_world`:1060, `_build_collectibles`:1197, `_build_bay`:1499, `_build_north`:1769, `_build_nm_blocks`:1886, `_build_north_landscape`:1971, `_build_landscape`:2008, `_build_bus`:2689, `_build_marina`:2836, `_build_hat`:2945, `_build_ridge`:3792, `_build_panels`:4061, `_build_player`:4221, `_build_car`:4259, `_build_hud`:4747, `_build_quest_offer`:5158, `_build_future`:5323, `_build_neon`:5337, `_build_holograms`:5443, `_build_sky_traffic`:5510, `_build_social`:6074, `_build_dance_floor`:6253, `_build_arcade`:6443, `_build_arcade_panel`:6792, `_build_quiz`:7014, `_build_ach`:7513, `_build_peds`:8982, `_build_downtown`:11452, `_build_park`:11675, `_build_plaza`:11704, `_build_city_detail`:11720, `_build_traffic`:11824, `_build_minimap`:12380, `_build_view_controls`:12595, `_build_level_fx`:12863, `_build_stadium_walls`:13116, `_build_guidance`:13279, `_build_checkpoints`:13383, `_build_hub`:13630, `_build_hub_bots`:14653, `_build_game_panel`:14962, `_build_chat`:15472, `_build_feed`:16359, `_build_nick_panel`:16552, `_build_civic`:16854, `_build_raceway`:17254, `_build_rw_parking`:17288, `_build_rw_pits`:17333, `_build_rw_track`:17370, `_build_rw_trackside`:17411, `_build_raceway_ui`:17994, `_build_travel`:18597, `_build_qr`:18934, `_build_crate_ui`:19054, `_build_quick_props`:19590, `_build_quest_list`:19939, `_build_food_court`:20256, `_build_commons`:20489, `_build_puzzle_panel`:20913, `_build_biosphere`:21631, `_build_biosphere_legacy`:21635, `_build_style_panel`:23850, `_build_galleria`:24274, `_build_ga_fun`:24701, `_build_sky_garden`:24937, `_build_sg_panel`:25356, `_build_hp_panel`:25763, `_build_lb`:25989, `_build_market`:26178, `_build_gear`:26265, `_build_pet`:26318, `_build_market_panel`:26406, `_build_display`:26643, `_build_streamer`:26837, `_build_treasure_props`:27234, `_build_treasure`:27278, `_build_expansion`:28071, `_build_connect`:28298, `_build_skytrain`:28637, `_build_airport`:30151, `_build_signposts`:31106, `_build_dir_panel`:31210, `_build_grand_central`:31568, `_build_gc_towers`:31736, `_build_fill`:31917, `_build_gardens`:31985, `_build_fan_plaza`:32095, `_build_street_stalls`:32344, `_build_place_signs`:32402, `_build_career_panel`:32633, `_build_homes`:32699, `_build_home_panels`:33069, `_build_chapters_ui`:33741


## Smoke tests in main.gd

- `_smoke_test` line 9166
- `_smoke_chase` line 9809
- `_smoke_orole` line 9842
- `_smoke_levels` line 9871
- `_smoke_bus` line 9912
- `_smoke_chase_extras` line 9997
- `_smoke_marina` line 10025
- `_smoke_radio_peds` line 10167
- `_smoke_typed_chat` line 10237
- `_smoke_chat_touch` line 10256
- `_smoke_cafe` line 10277
- `_smoke_boutique` line 10303
- `_smoke_models` line 10331
- `_smoke_garage_ridge` line 10355
- `_smoke_downtown` line 12075
- `_smoke_views` line 12791
- `_smoke_level_fx` line 13066
- `_smoke_stadium_eye` line 13153
- `_smoke_guidance_checkpoints` line 13492
- `_smoke_hub` line 15790
- `_smoke_nick` line 16674
- `_smoke_sites_reachable` line 16724
- `_smoke_raceway` line 18130
- `_smoke_follow_call` line 18451
- `_smoke_travel` line 18801
- `_smoke_qr` line 18994
- `_smoke_crate` line 19294
- `_smoke_quick` line 19821
- `_smoke_quests` line 20055
- `_smoke_chat` line 20985
- `_smoke_feet` line 21023
- `_smoke_commons` line 21044
- `_smoke_biosphere` line 23095
- `_smoke_style` line 23357
- `_smoke_car_barriers` line 25474
- `_smoke_sky_garden` line 25515
- `_smoke_pass` line 25876
- `_smoke_treasure` line 27483
- `_smoke_findme` line 27776
- `_smoke_v27` line 29482
- `_smoke_airport` line 30490
- `_smoke_strollers` line 30932
- `_smoke_careers_homes` line 33194
- `_smoke_chapters` line 33827
- `_smoke_photo` line 34183
- `_smoke_stream_join` line 34410
- `_smoke_streamer_clean` line 34639

## Other scripts

### game/autoplay.gd (498 lines, 26 funcs)

Functions: `_init`:44, `_ready`:47, `goto`:57, `steer`:64, `watchdog`:85, `ready_to_play`:103, `_physics_process`:106, `clear_screen`:173, `force_travel`:186, `start_dome_route`:204, `walk_route_tick`:218, `on_enter`:230, `dome_quest_tick`:246, `prepare_station`:269, `station_tick`:279, `wait_tick`:298, `ride_tick`:312, `arrive_city`:328, `road_edge_dist`:350, `sidewalk_ok`:363, `path_clear`:371, `note_trail`:399, `novelty`:405, `pick_wander`:412, `city_tick`:453, `shot_tick`:489

### game/cafe.gd (618 lines, 28 funcs)

Sections: 281 the lounge: a big partitioned hang-out area with booth bays (white, porthole screens, glowing strips); 406 interaction; 484 ordering

Functions: `_init`:40, `rng_f`:44, `lp`:48, `prop`:51, `solid`:62, `glass`:71, `tangent_box`:80, `build_cafe`:85, `build_lounge`:282, `in_lounge`:376, `counter_spot`:379, `holding_cup`:383, `build_cup`:387, `tint_cup`:395, `near`:407, `button_text`:412, `hour_number`:415, `special_index`:418, `price_of`:421, `speed_mult`:425, `_process`:428, `build_panel`:485, `open`:509, `close`:515, `refresh`:519, `player_name`:559, `pick`:563, `finish_order`:583

### game/careers.gd (1231 lines, 64 funcs)

Functions: `_init`:7, `_career_rank`:10, `_career_rank_name`:17, `_career_mult`:20, `_career_spots`:23, `_career_pick`:51, `_career_block_reason`:62, `_career_start`:75, `_career_lights`:94, `_career_lights_off`:109, `_career_end`:118, `_career_clear_job`:134, `_cid`:147, `_career_place_name`:150, `_career_tag`:162, `_career_person`:179, `_cj_pp`:206, `_cj_anim`:209, `_cj_pose`:215, `_cj_pose_tick`:240, `_cj_hands_up`:245, `_cj_face`:248, `_career_fire`:254, `_career_next`:318, `_career_target`:356, `_career_pay`:366, `_career_rank_line`:374, `_career_job_done`:380, `_career_job_failed`:399, `_career_tick`:407, `_taxi_meter`:469, `_taxi_tip`:489, `_cs_taxi_pickup`:495, `_taxi_seat`:528, `_cs_taxi_dropoff`:540, `_stretcher`:584, `_cs_medic_load`:596, `_cs_medic_unload`:635, `_cs_police_radio`:666, `_career_chase_over`:679, `_fire_aimed`:722, `_fire_hose_tick`:732, `_cs_fire_out`:789, `_career_bar_build`:818, `_career_steps_bbcode`:848, `_career_bar_text`:862, `_career_bar_tick`:891, `_career_hud`:908, `_cs_play`:915, `_cs_tick`:929, `_cs_skip`:946, `_cs_finish`:952, `_cs_side_cam`:968, `_cs_cam`:987, `_cs_ui`:1001, `_cs_caption`:1052, `_cs_mirror`:1071, `_siren_sound`:1118, `_siren`:1140, `_build_career_panel`:1153, `_open_careers`:1192, `_career_ach_line`:1210, `_career_close`:1225, `_career_end_close`:1229

### game/dome_quests.gd (531 lines, 30 funcs)

Sections: 148 state; 200 rewards; 312 3D gift boxes

Functions: `_init`:62, `today`:65, `done_count`:68, `gift_count`:75, `gift_pos`:82, `gift_pay`:94, `total_today`:97, `quest_pos`:105, `progress`:126, `_bits`:141, `new_day`:149, `save_state`:167, `load_state`:183, `pay`:201, `award`:213, `take_gift`:229, `cafe_order`:244, `cafe_check`:251, `check_at`:264, `build_presents`:313, `refresh_presents`:351, `build`:356, `in_dome`:387, `refresh_ui`:390, `draw`:397, `guide`:416, `open`:423, `close`:429, `_process`:433, `selftest`:466

### game/festive.gd (270 lines, 13 funcs)

Sections: 91 the catalogue: [id, name, slot, price]. Suits also recolour the shirt and trousers.

Functions: `_init`:11, `mat`:14, `add`:28, `box`:37, `ball`:42, `torus`:52, `cyl`:60, `rod`:69, `feather`:81, `suit_colors`:110, `build`:119, `dress`:248, `spin`:265

### game/festive_shop.gd (318 lines, 20 funcs)

Sections: 22 the building; 115 ownership / wearing; 149 the panel; 304 save

Functions: `_init`:18, `build_boutique`:23, `near`:99, `button_text`:104, `_process`:107, `item`:116, `shown`:122, `put_on`:125, `tint_look`:136, `dress_player`:144, `build_panel`:150, `open`:180, `finish`:193, `close`:199, `face_camera`:203, `refresh`:213, `pick`:262, `strip`:296, `save_to`:305, `load_from`:309

### game/hourly_challenge.gd (424 lines, 25 funcs)

Sections: 116 puzzle generation (deterministic per hour); 267 panel; 379 sign + announcements

Functions: `build_terminal`:34, `_init`:70, `now_hour`:73, `secs_left`:76, `near`:79, `button_text`:85, `build_panel`:88, `neighbours`:117, `flip`:127, `make`:131, `is_done`:185, `tap`:198, `cycle`:214, `check`:220, `win`:244, `open`:268, `close`:279, `reset`:283, `style_btn`:290, `draw`:294, `reward_line`:336, `draw_code`:341, `refresh_sign`:380, `_process`:392, `selftest`:405

### game/hub_jokes.gd (102 lines, 0 funcs)

Functions: 

### game/natural_player_trial.gd (285 lines, 0 funcs)

Functions: 

### game/paris.gd (1003 lines, 53 funcs)

Sections: 86 helpers; 174 portals; 225 the district; 856 play

Functions: `_init`:70, `in_area`:87, `poly_area`:90, `to_poly`:97, `mm_boxes`:105, `seg_xf`:122, `beam_xf`:129, `finish`:138, `load_data`:164, `make_portal`:175, `label`:212, `ensure_built`:226, `build_ground`:258, `build_river`:268, `build_water`:311, `build_parks`:333, `build_roads`:360, `facade_details`:396, `dormers`:423, `prism`:434, `cap`:451, `build_buildings`:459, `in_building`:517, `build_trees`:534, `build_lamps`:619, `build_landmark`:667, `lm_radius`:680, `hw`:683, `build_tower`:686, `build_cafe`:740, `facing`:758, `panel`:762, `build_crossing`:774, `build_times`:803, `build_prang`:820, `build_statue`:844, `near`:857, `in_paris`:860, `lm_pos`:864, `prompt`:868, `busy`:878, `interact`:881, `move_player`:894, `enter`:902, `go_home`:925, `order`:931, `done_count`:935, `roll_day`:942, `pay`:949, `award`:962, `tick`:975, `save_state`:991, `load_state`:998

### game/promo.gd (346 lines, 15 funcs)

Functions: `_init`:16, `_ready`:19, `_process`:24, `frames`:38, `smooth`:42, `mark`:45, `move`:48, `visitor`:59, `newest_only`:66, `me_say`:73, `say`:77, `emote`:86, `clear_cast`:93, `put_player`:102, `run`:109

### game/road_barrier.gd (314 lines, 18 funcs)

Sections: 167 finding the road; 260 safety net; 288 checks

Functions: `_init`:25, `in_zone`:28, `_inside`:36, `on_road`:40, `_in_gap`:46, `_solid_cell`:52, `build`:63, `_emit`:117, `_visuals`:127, `nearest_road`:168, `road_dist`:186, `cp_car`:190, `_free_road_spot`:196, `call_car_spot`:208, `kerb_spot`:215, `rescue`:261, `tick`:270, `smoke`:289

### game/sun_dome.gd (183 lines, 8 funcs)

Functions: `_init`:19, `pt`:25, `rib`:28, `multimesh`:39, `spin`:52, `part`:57, `build`:60, `build_core`:148

### game/weather.gd (129 lines, 7 funcs)

Functions: `_init`:23, `_ready`:26, `_hash01`:36, `target`:39, `_build_drops`:58, `under_roof`:88, `_physics_process`:101

### game/world_biosphere.gd (4427 lines, 187 funcs)

Sections: 2996 0.55.0: three new continents, stable appended animal and quest IDs.; 3318 0.55.1: continuous floor transitions, protected paths and rescue.; 3999 0.55.11: open reserve layout shared by all seven domes. No pens: every species roams a big open habitat

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:241, `flush`:254, `disc`:273, `entrance_ramp`:285, `build`:297, `round_rail_mesh`:402, `hex_roof`:422, `shell`:465, `sign_frame`:593, `hub_doors`:602, `gate`:633, `nature`:657, `tree`:678, `tree_parts`:684, `landscape`:698, `walkway`:763, `habitats`:766, `recolor`:867, `spawn_animal`:876, `quest_markers`:921, `quest_point`:947, `now`:970, `today`:973, `day_number`:976, `feeding`:979, `rare_event`:986, `baby_dome`:993, `rank_index`:996, `rank_name`:1003, `reward`:1006, `achieve`:1013, `species_mask`:1019, `page_ready`:1026, `finish_passport`:1033, `claim_page`:1039, `spot`:1048, `start_quest`:1055, `quest_step`:1062, `coop_near`:1065, `advance_quest`:1074, `prompt`:1100, `dusk`:1111, `interact`:1114, `keeper`:1159, `keeper_here`:1168, `auto_keeper`:1172, `finish_keeper`:1176, `photo_target`:1210, `photo_capture`:1234, `tick`:1249, `tick_impl`:1261, `animate_animal`:1422, `reset_stick`:1494, `close_panel`:1501, `open_panel`:1507, `ui_label`:1532, `ui_button`:1540, `select_page`:1545, `forget_buttons`:1549, `refresh_panel`:1556, `smoke`:1610, `drive_body`:1941, `dome_shots`:1947, `screenshots`:1985, `backdrop`:2077, `walk_route`:2106, `rich_landscape`:2138, `planting_clear`:2197, `rain_ring`:2229, `gallery_points`:2256, `gallery_clear`:2267, `sky_gallery`:2288, `route_clear`:2313, `park_lamp`:2327, `rail`:2342, `build_corner_rails`:2346, `build_dome_loop`:2375, `quest_guide`:2413, `visitor_y`:2432, `add_visitor`:2441, `build_visitors`:2459, `tick_visitors`:2478, `door_point`:2529, `dome_signpost`:2532, `outside_signposts`:2563, `inside_signpost`:2576, `door_markers`:2585, `colonnade`:2603, `garden_ring`:2636, `glass_edge`:2668, `waterfall`:2676, `soft_mist`:2700, `ground_route`:2729, `ground_trails`:2744, `africa_lookout`:2756, `asia_route`:2777, `asia_rainwalk`:2786, `antarctic_route`:2816, `antarctic_spiral`:2825, `tree_fort`:2841, `floe_approach`:2851, `habitat_layers`:2870, `upper_animal`:2924, `high_habitat`:2961, `x_layer`:2980, `z_layer`:2984, `tall_tree`:2987, `phase2_pen`:2997, `phase2_route`:3001, `phase2_quest_point`:3012, `phase2_interact`:3033, `phase2_action`:3058, `phase2_landscape`:3071, `phase2_layers`:3170, `phase2_walkway`:3181, `sweep_join`:3188, `build_sweeps`:3216, `refined_coat`:3251, `profile_report`:3270, `profile_node_count`:3284, `profile_node`:3290, `rim_bevel`:3319, `collision_wall`:3351, `flush_guard_batches`:3361, `detail_index`:3377, `register_walk`:3383, `register_deck`:3390, `project_segment`:3399, `surface_distance`:3404, `finish_guards`:3418, `inside_pen`:3458, `open_path_point`:3465, `safety_net`:3484, `can_fly`:3509, `record_scenery`:3513, `scenery_aabb`:3522, `clear_scenery_bounds`:3530, `resolve_scenery`:3578, `register_habitats`:3635, `unload_detail`:3664, `load_dome`:3697, `activate_dome`:3742, `capture_exterior`:3762, `campus_surface`:3770, `build_open_paths`:3774, `build_garden_edges`:3801, `foliage_mesh`:3846, `small_foliage_texture`:3874, `apply_dome_quality`:3890, `restore_dome_quality`:3903, `profile_audio`:3911, `assign_feeding_slots`:3921, `feeding_target`:3932, `visitor_stage_route`:3947, `path_floor`:3962, `flush_walk_meshes`:3970, `reserve`:4043, `reserve_zone`:4046, `path_arms`:4052, `africa_path_nodes`:4055, `africa_blob`:4061, `africa_ramp_y`:4072, `reserve_station`:4075, `reserve_tree`:4079, `reserve_build`:4088, `path_clear`:4183, `reserve_zone_props`:4189, `africa_zone_props`:4207, `reserve_wow`:4232, `africa_path_segs`:4285, `africa_path_dist`:4294, `reserve_detail`:4304, `africa_shots`:4390

### game/worlds.gd (209 lines, 16 funcs)

Functions: `_init`:89, `_set_dry`:95, `build_hub`:100, `current`:125, `player_in_world`:134, `near_hub`:137, `prompt`:143, `interact`:152, `busy`:164, `enter`:170, `go_home`:175, `go_portal`:182, `tick`:190, `save_state`:198, `load_state`:202, `summary`:206

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

