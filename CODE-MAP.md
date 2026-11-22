# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (33077 lines, 1193 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-566 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 567-639 | v0.34.6: futuristic towers for the old city | 1 |
| 640-718 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 719-779 | v0.34.4: futuristic road surface | 2 |
| 780-1985 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 1986-2465 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2466-2638 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2639-3154 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3155-3209 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3210-3312 | v0.11.0: online police vs thief | 4 |
| 3313-4256 | v0.10.0: chase mode (offline) | 38 |
| 4257-4923 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4924-5042 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5043-5080 | v0.30.1: nothing to collect stands in a road | 4 |
| 5081-5220 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5221-5588 | v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5589-6088 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6089-6339 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6340-6835 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6836-7129 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7130-8608 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 38 |
| 8609-10752 | v0.5.0: original synthesized radio and ambient pedestrians | 32 |
| 10753-11401 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11402-11505 | old city and Bay details | 1 |
| 11506-11915 | traffic | 10 |
| 11916-12268 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12269-12526 | camera views | 9 |
| 12527-12774 | v0.17.0: level-up celebration | 8 |
| 12775-12894 | v0.18.0: walk-in stadium | 5 |
| 12895-13056 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13057-13242 | checkpoints | 9 |
| 13243-13518 | v0.18.0: Harbor Dome social hub | 3 |
| 13519-13726 | people: sitting pose, bots, bubbles, emotes | 6 |
| 13727-13845 | seats | 6 |
| 13846-14002 | game panel | 7 |
| 14003-14123 | tic-tac-toe | 7 |
| 14124-14175 | rock paper scissors | 4 |
| 14176-14258 | online table messages | 2 |
| 14259-14334 | comedy show | 4 |
| 14335-14873 | quick chat and emotes | 16 |
| 14874-15036 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 15037-15277 | v0.18.2: nickname and HUD relayout | 12 |
| 15278-15565 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 15566-15675 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 15676-16003 | circuit geometry | 12 |
| 16004-16101 | race car rental | 5 |
| 16102-16116 | speed effects | 2 |
| 16117-16167 | track helpers | 5 |
| 16168-16404 | events | 11 |
| 16405-16457 | boosters and spikes | 4 |
| 16458-16515 | online races | 2 |
| 16516-16871 | raceway panel, HUD, board | 10 |
| 16872-17079 | v0.22.0: Call Car | 6 |
| 17080-17379 | v0.23: RUN toggle and fast travel between districts | 13 |
| 17380-17453 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 17454-17890 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 17891-18382 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 18383-18533 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 18534-18568 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 18569-18883 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 18884-19198 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 19199-19513 | v0.36: the daily puzzle | 17 |
| 19514-19702 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 19703-20075 | building blocks | 23 |
| 20076-20577 | building | 16 |
| 20578-20733 | garden planting | 11 |
| 20734-21141 | the four layouts | 4 |
| 21142-21412 | animals | 8 |
| 21413-21542 | animation, spotting and rewards | 6 |
| 21543-22060 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 22061-22209 | your look: apply, save, share | 9 |
| 22210-22637 | stores and the wardrobe | 23 |
| 22638-23105 | HARBOR GALLERIA: the shopping mall | 14 |
| 23106-23257 | featured outfits and the Sky Run | 7 |
| 23258-23354 | v0.41: THE SKY GARDEN | 5 |
| 23355-23492 | building | 5 |
| 23493-23673 | plants | 6 |
| 23674-23793 | interacting | 7 |
| 23794-24037 | the garden screen | 9 |
| 24038-24076 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 24077-24108 | album | 2 |
| 24109-24160 | season | 6 |
| 24161-24168 | Harbor Night | 1 |
| 24169-24200 | check-in calendar | 1 |
| 24201-24377 | the panel | 8 |
| 24378-24592 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 24593-25016 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 25017-25258 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 25259-25437 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 25438-25474 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 25475-25571 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 25572-25863 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 25864-25964 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 25965-26288 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 26289-26399 | v0.24.2: road map (for moving people off the road) | 8 |
| 26400-26695 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 26696-26890 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 26891-27531 | Harbor Loop sky train | 27 |
| 27532-27869 | Day and night | 9 |
| 27870-28505 | v0.27 smoke test and screenshots | 2 |
| 28506-28922 | v0.27: Harbor International Airport (north of the city) | 10 |
| 28923-29436 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 29437-29597 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 29598-29694 | the Directions panel and chip | 7 |
| 29695-30236 | v0.44: Grand Central | 16 |
| 30237-30528 | v0.44: filling the empty land | 8 |
| 30529-30563 | v0.45: hover car underglow | 1 |
| 30564-30728 | v0.46: what is inside the Grand Central shops | 1 |
| 30729-30760 | v0.47: street stalls downtown | 2 |
| 30761-30859 | v0.48: places that open as you level up | 6 |
| 30860-30904 | v0.50: city careers | 5 |
| 30905-30955 | v0.52: careers as clear job loops | 3 |
| 30956-30963 | taxi | 1 |
| 30964-30967 | paramedic | 0 |
| 30968-30972 | police | 1 |
| 30973-30978 | firefighter | 1 |
| 30979-30988 | the step bar | 2 |
| 30989-31015 | cut scenes | 1 |
| 31016-31020 | siren | 0 |
| 31021-31032 | the Careers panel | 3 |
| 31033-31456 | v0.50: homes | 17 |
| 31457-31791 | decorating | 7 |
| 31792-31926 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 31927-32357 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 32358-32396 | v0.51.1: join and leave messages | 3 |
| 32397-32661 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 32662-32960 | v0.51.3: stream joiners | 9 |
| 32961-33077 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 571-5577 |
| `_nearest_*` |  | 9 | 1219-15311 |
| `_car_*` |  | 6 | 1384-30532 |
| `_online_*` | Supabase realtime multiplayer | 23 | 1987-14935 |
| `_shop_*` | Marina Heights shops | 8 | 2596-3100 |
| `_bus_*` | Airport Line and city buses | 14 | 2640-25549 |
| `_level_*` | player levels | 7 | 3166-12640 |
| `_chase_*` | police chase mode | 11 | 3314-3561 |
| `_quest_*` | quests | 8 | 5127-18505 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5467-27510 |
| `_crew_*` | crews | 6 | 5656-5994 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5712-22626 |
| `_social_*` | friends, invites | 8 | 5760-6218 |
| `_soc_*` | social extras | 8 | 5799-6092 |
| `_c4_*` | Connect Four | 9 | 6433-6549 |
| `_rx_*` | Reaction Duel | 6 | 6576-6651 |
| `_quiz_*` | party quiz | 9 | 6899-7096 |
| `_ach_*` | achievements | 8 | 7317-22621 |
| `_radio_*` | radio and ambience | 8 | 8613-8777 |
| `_smoke_*` | smoke tests | 43 | 9023-33024 |
| `_shot_*` | screenshot modes | 8 | 10735-32496 |
| `_hub_*` | Harbor Dome hub | 7 | 13301-15542 |
| `_ttt_*` | tic-tac-toe | 7 | 14006-14097 |
| `_sg_*` | Sky Garden | 28 | 14824-23907 |
| `_rw_*` | Raceway | 30 | 15691-16619 |
| `_crate_*` | starter crate | 8 | 17474-17795 |
| `_quick_*` | quick quests | 11 | 17932-18241 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 18586-22162 |
| `_pz_*` | daily puzzle | 10 | 19222-19390 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 19576-23073 |
| `_ga_*` | Galleria mall | 13 | 22674-23185 |
| `_season_*` | season pass | 6 | 24110-24142 |
| `_lb_*` | leaderboard | 10 | 24483-24546 |
| `_ds_*` | digital signs | 6 | 25049-25210 |
| `_treasure_*` | treasure hunt | 10 | 25590-25849 |
| `_fm_*` | Find Me | 11 | 25986-26159 |
| `_ap_*` | Harbor Airport | 7 | 28716-28836 |
| `_nav_*` | walker nav grids | 9 | 28937-29183 |
| `_dir_*` | Directions panel | 7 | 29472-29668 |
| `_gc_*` | Grand Central | 9 | 29724-30565 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 30885-32878 |
| `_home_*` | homes | 21 | 31073-31871 |
| `_ch_*` | chapters | 6 | 31988-32035 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:292, `_apply_car`:1345, `_collider`:1603, `_level`:3184, `_input`:7631, `_physics_process`:7727, `_refresh_hud`:8085, `_toggle_menu`:8255, `_show_toast`:8327, `_save_progress`:8331, `_load_progress`:8414, `_process`:8790, `_blocked_at`:9980, `_blocker`:9995, `_apply_view`:12322, `_place_lock_of`:30774

World builders (`_build_*`): `_build_world`:1024, `_build_collectibles`:1158, `_build_bay`:1460, `_build_north`:1730, `_build_nm_blocks`:1847, `_build_north_landscape`:1932, `_build_landscape`:1969, `_build_bus`:2646, `_build_marina`:2793, `_build_hat`:2902, `_build_ridge`:3749, `_build_panels`:4018, `_build_player`:4178, `_build_car`:4216, `_build_hud`:4704, `_build_quest_offer`:5097, `_build_future`:5262, `_build_neon`:5276, `_build_holograms`:5382, `_build_sky_traffic`:5449, `_build_social`:6013, `_build_dance_floor`:6192, `_build_arcade`:6382, `_build_arcade_panel`:6731, `_build_quiz`:6953, `_build_ach`:7452, `_build_peds`:8839, `_build_downtown`:11135, `_build_park`:11358, `_build_plaza`:11387, `_build_city_detail`:11403, `_build_traffic`:11507, `_build_minimap`:12055, `_build_view_controls`:12270, `_build_level_fx`:12538, `_build_stadium_walls`:12791, `_build_guidance`:12954, `_build_checkpoints`:13058, `_build_hub`:13305, `_build_hub_bots`:13545, `_build_game_panel`:13847, `_build_chat`:14352, `_build_feed`:14883, `_build_nick_panel`:15076, `_build_civic`:15377, `_build_raceway`:15777, `_build_rw_parking`:15811, `_build_rw_pits`:15856, `_build_rw_track`:15893, `_build_rw_trackside`:15934, `_build_raceway_ui`:16517, `_build_travel`:17100, `_build_qr`:17387, `_build_crate_ui`:17507, `_build_quick_props`:18043, `_build_quest_list`:18392, `_build_food_court`:18709, `_build_commons`:18935, `_build_puzzle_panel`:19359, `_build_biosphere`:20077, `_build_biosphere_legacy`:20081, `_build_style_panel`:22289, `_build_galleria`:22713, `_build_ga_fun`:23140, `_build_sky_garden`:23376, `_build_sg_panel`:23795, `_build_hp_panel`:24202, `_build_lb`:24428, `_build_market`:24617, `_build_gear`:24704, `_build_pet`:24757, `_build_market_panel`:24845, `_build_display`:25082, `_build_streamer`:25276, `_build_treasure_props`:25673, `_build_treasure`:25717, `_build_expansion`:26510, `_build_connect`:26737, `_build_skytrain`:27076, `_build_airport`:28540, `_build_signposts`:29495, `_build_dir_panel`:29599, `_build_grand_central`:29957, `_build_gc_towers`:30125, `_build_fill`:30306, `_build_gardens`:30374, `_build_fan_plaza`:30484, `_build_street_stalls`:30733, `_build_place_signs`:30791, `_build_career_panel`:31022, `_build_homes`:31088, `_build_home_panels`:31458, `_build_chapters_ui`:32127


## Smoke tests in main.gd

- `_smoke_test` line 9023
- `_smoke_chase` line 9662
- `_smoke_orole` line 9695
- `_smoke_levels` line 9724
- `_smoke_bus` line 9765
- `_smoke_chase_extras` line 9850
- `_smoke_marina` line 9878
- `_smoke_radio_peds` line 10020
- `_smoke_models` line 10090
- `_smoke_garage_ridge` line 10114
- `_smoke_downtown` line 11758
- `_smoke_views` line 12466
- `_smoke_level_fx` line 12741
- `_smoke_stadium_eye` line 12828
- `_smoke_guidance_checkpoints` line 13167
- `_smoke_hub` line 14577
- `_smoke_nick` line 15197
- `_smoke_sites_reachable` line 15247
- `_smoke_raceway` line 16653
- `_smoke_follow_call` line 16974
- `_smoke_travel` line 17254
- `_smoke_qr` line 17447
- `_smoke_crate` line 17747
- `_smoke_quick` line 18274
- `_smoke_quests` line 18508
- `_smoke_chat` line 19431
- `_smoke_feet` line 19469
- `_smoke_commons` line 19490
- `_smoke_biosphere` line 21539
- `_smoke_style` line 21801
- `_smoke_car_barriers` line 23913
- `_smoke_sky_garden` line 23954
- `_smoke_pass` line 24315
- `_smoke_treasure` line 25922
- `_smoke_findme` line 26215
- `_smoke_v27` line 27871
- `_smoke_airport` line 28879
- `_smoke_strollers` line 29321
- `_smoke_careers_homes` line 31583
- `_smoke_chapters` line 32213
- `_smoke_photo` line 32568
- `_smoke_stream_join` line 32795
- `_smoke_streamer_clean` line 33024

## Other scripts

### game/careers.gd (1231 lines, 64 funcs)

Functions: `_init`:7, `_career_rank`:10, `_career_rank_name`:17, `_career_mult`:20, `_career_spots`:23, `_career_pick`:51, `_career_block_reason`:62, `_career_start`:75, `_career_lights`:94, `_career_lights_off`:109, `_career_end`:118, `_career_clear_job`:134, `_cid`:147, `_career_place_name`:150, `_career_tag`:162, `_career_person`:179, `_cj_pp`:206, `_cj_anim`:209, `_cj_pose`:215, `_cj_pose_tick`:240, `_cj_hands_up`:245, `_cj_face`:248, `_career_fire`:254, `_career_next`:318, `_career_target`:356, `_career_pay`:366, `_career_rank_line`:374, `_career_job_done`:380, `_career_job_failed`:399, `_career_tick`:407, `_taxi_meter`:469, `_taxi_tip`:489, `_cs_taxi_pickup`:495, `_taxi_seat`:528, `_cs_taxi_dropoff`:540, `_stretcher`:584, `_cs_medic_load`:596, `_cs_medic_unload`:635, `_cs_police_radio`:666, `_career_chase_over`:679, `_fire_aimed`:722, `_fire_hose_tick`:732, `_cs_fire_out`:789, `_career_bar_build`:818, `_career_steps_bbcode`:848, `_career_bar_text`:862, `_career_bar_tick`:891, `_career_hud`:908, `_cs_play`:915, `_cs_tick`:929, `_cs_skip`:946, `_cs_finish`:952, `_cs_side_cam`:968, `_cs_cam`:987, `_cs_ui`:1001, `_cs_caption`:1052, `_cs_mirror`:1071, `_siren_sound`:1118, `_siren`:1140, `_build_career_panel`:1153, `_open_careers`:1192, `_career_ach_line`:1210, `_career_close`:1225, `_career_end_close`:1229

### game/hub_jokes.gd (102 lines, 0 funcs)

Functions: 

### game/natural_player_trial.gd (285 lines, 0 funcs)

Functions: 

### game/road_barrier.gd (314 lines, 18 funcs)

Sections: 167 finding the road; 260 safety net; 288 checks

Functions: `_init`:25, `in_zone`:28, `_inside`:36, `on_road`:40, `_in_gap`:46, `_solid_cell`:52, `build`:63, `_emit`:117, `_visuals`:127, `nearest_road`:168, `road_dist`:186, `cp_car`:190, `_free_road_spot`:196, `call_car_spot`:208, `kerb_spot`:215, `rescue`:261, `tick`:270, `smoke`:289

### game/world_biosphere.gd (3766 lines, 163 funcs)

Sections: 2776 0.55.0: three new continents, stable appended animal and quest IDs.; 3098 0.55.1: continuous floor transitions, protected paths and rescue.

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:242, `flush`:255, `disc`:274, `entrance_ramp`:286, `build`:298, `shell`:399, `hub_doors`:528, `gate`:554, `nature`:578, `tree`:599, `tree_parts`:605, `landscape`:619, `walkway`:687, `habitats`:690, `recolor`:773, `spawn_animal`:782, `quest_markers`:820, `quest_point`:846, `now`:863, `today`:866, `day_number`:869, `feeding`:872, `rare_event`:879, `baby_dome`:886, `rank_index`:889, `rank_name`:896, `reward`:899, `achieve`:906, `species_mask`:912, `page_ready`:919, `finish_passport`:926, `claim_page`:932, `spot`:941, `start_quest`:948, `quest_step`:955, `coop_near`:958, `advance_quest`:967, `prompt`:993, `dusk`:1006, `interact`:1009, `keeper`:1057, `keeper_here`:1066, `auto_keeper`:1070, `finish_keeper`:1074, `photo_target`:1108, `photo_capture`:1132, `tick`:1147, `tick_impl`:1159, `animate_animal`:1316, `reset_stick`:1378, `close_panel`:1385, `open_panel`:1391, `ui_label`:1416, `ui_button`:1424, `select_page`:1429, `forget_buttons`:1433, `refresh_panel`:1440, `smoke`:1488, `drive_body`:1819, `screenshots`:1825, `backdrop`:1904, `walk_route`:1933, `rich_landscape`:1965, `planting_clear`:2024, `rain_ring`:2056, `gallery_points`:2083, `gallery_clear`:2094, `sky_gallery`:2115, `route_clear`:2140, `build_dome_loop`:2154, `quest_guide`:2193, `visitor_y`:2212, `add_visitor`:2221, `build_visitors`:2239, `tick_visitors`:2258, `door_point`:2309, `dome_signpost`:2312, `outside_signposts`:2343, `inside_signpost`:2356, `door_markers`:2365, `colonnade`:2383, `garden_ring`:2416, `glass_edge`:2448, `waterfall`:2456, `soft_mist`:2480, `ground_route`:2509, `ground_trails`:2524, `africa_lookout`:2536, `asia_route`:2557, `asia_rainwalk`:2566, `antarctic_route`:2596, `antarctic_spiral`:2605, `tree_fort`:2621, `floe_approach`:2631, `habitat_layers`:2650, `upper_animal`:2704, `high_habitat`:2741, `x_layer`:2760, `z_layer`:2764, `tall_tree`:2767, `phase2_pen`:2777, `phase2_route`:2781, `phase2_quest_point`:2792, `phase2_interact`:2813, `phase2_action`:2838, `phase2_landscape`:2851, `phase2_layers`:2950, `phase2_walkway`:2961, `sweep_join`:2968, `build_sweeps`:2996, `refined_coat`:3031, `profile_report`:3050, `profile_node_count`:3064, `profile_node`:3070, `rim_bevel`:3099, `collision_wall`:3131, `flush_guard_batches`:3141, `detail_index`:3157, `register_walk`:3163, `register_deck`:3170, `project_segment`:3179, `surface_distance`:3184, `finish_guards`:3198, `inside_pen`:3238, `open_path_point`:3245, `safety_net`:3264, `can_fly`:3289, `record_scenery`:3293, `scenery_aabb`:3302, `clear_scenery_bounds`:3310, `resolve_scenery`:3358, `register_habitats`:3415, `unload_detail`:3440, `load_dome`:3473, `activate_dome`:3517, `capture_exterior`:3537, `campus_surface`:3545, `build_open_paths`:3549, `build_garden_edges`:3576, `foliage_mesh`:3617, `small_foliage_texture`:3645, `apply_dome_quality`:3661, `restore_dome_quality`:3674, `profile_audio`:3682, `assign_feeding_slots`:3692, `feeding_target`:3703, `visitor_stage_route`:3717, `path_floor`:3732, `flush_walk_meshes`:3740

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

