# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (33080 lines, 1193 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-569 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 570-642 | v0.34.6: futuristic towers for the old city | 1 |
| 643-721 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 722-782 | v0.34.4: futuristic road surface | 2 |
| 783-1988 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 1989-2468 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2469-2641 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2642-3157 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3158-3212 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3213-3315 | v0.11.0: online police vs thief | 4 |
| 3316-4259 | v0.10.0: chase mode (offline) | 38 |
| 4260-4926 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4927-5045 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5046-5083 | v0.30.1: nothing to collect stands in a road | 4 |
| 5084-5223 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5224-5591 | v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5592-6091 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6092-6342 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6343-6838 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6839-7132 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7133-8611 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 38 |
| 8612-10755 | v0.5.0: original synthesized radio and ambient pedestrians | 32 |
| 10756-11404 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11405-11508 | old city and Bay details | 1 |
| 11509-11918 | traffic | 10 |
| 11919-12271 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12272-12529 | camera views | 9 |
| 12530-12777 | v0.17.0: level-up celebration | 8 |
| 12778-12897 | v0.18.0: walk-in stadium | 5 |
| 12898-13059 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13060-13245 | checkpoints | 9 |
| 13246-13521 | v0.18.0: Harbor Dome social hub | 3 |
| 13522-13729 | people: sitting pose, bots, bubbles, emotes | 6 |
| 13730-13848 | seats | 6 |
| 13849-14005 | game panel | 7 |
| 14006-14126 | tic-tac-toe | 7 |
| 14127-14178 | rock paper scissors | 4 |
| 14179-14261 | online table messages | 2 |
| 14262-14337 | comedy show | 4 |
| 14338-14876 | quick chat and emotes | 16 |
| 14877-15039 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 15040-15280 | v0.18.2: nickname and HUD relayout | 12 |
| 15281-15568 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 15569-15678 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 15679-16006 | circuit geometry | 12 |
| 16007-16104 | race car rental | 5 |
| 16105-16119 | speed effects | 2 |
| 16120-16170 | track helpers | 5 |
| 16171-16407 | events | 11 |
| 16408-16460 | boosters and spikes | 4 |
| 16461-16518 | online races | 2 |
| 16519-16874 | raceway panel, HUD, board | 10 |
| 16875-17082 | v0.22.0: Call Car | 6 |
| 17083-17382 | v0.23: RUN toggle and fast travel between districts | 13 |
| 17383-17456 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 17457-17893 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 17894-18385 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 18386-18536 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 18537-18571 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 18572-18886 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 18887-19201 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 19202-19516 | v0.36: the daily puzzle | 17 |
| 19517-19705 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 19706-20078 | building blocks | 23 |
| 20079-20580 | building | 16 |
| 20581-20736 | garden planting | 11 |
| 20737-21144 | the four layouts | 4 |
| 21145-21415 | animals | 8 |
| 21416-21545 | animation, spotting and rewards | 6 |
| 21546-22063 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 22064-22212 | your look: apply, save, share | 9 |
| 22213-22640 | stores and the wardrobe | 23 |
| 22641-23108 | HARBOR GALLERIA: the shopping mall | 14 |
| 23109-23260 | featured outfits and the Sky Run | 7 |
| 23261-23357 | v0.41: THE SKY GARDEN | 5 |
| 23358-23495 | building | 5 |
| 23496-23676 | plants | 6 |
| 23677-23796 | interacting | 7 |
| 23797-24040 | the garden screen | 9 |
| 24041-24079 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 24080-24111 | album | 2 |
| 24112-24163 | season | 6 |
| 24164-24171 | Harbor Night | 1 |
| 24172-24203 | check-in calendar | 1 |
| 24204-24380 | the panel | 8 |
| 24381-24595 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 24596-25019 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 25020-25261 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 25262-25440 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 25441-25477 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 25478-25574 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 25575-25866 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 25867-25967 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 25968-26291 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 26292-26402 | v0.24.2: road map (for moving people off the road) | 8 |
| 26403-26698 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 26699-26893 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 26894-27534 | Harbor Loop sky train | 27 |
| 27535-27872 | Day and night | 9 |
| 27873-28508 | v0.27 smoke test and screenshots | 2 |
| 28509-28925 | v0.27: Harbor International Airport (north of the city) | 10 |
| 28926-29439 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 29440-29600 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 29601-29697 | the Directions panel and chip | 7 |
| 29698-30239 | v0.44: Grand Central | 16 |
| 30240-30531 | v0.44: filling the empty land | 8 |
| 30532-30566 | v0.45: hover car underglow | 1 |
| 30567-30731 | v0.46: what is inside the Grand Central shops | 1 |
| 30732-30763 | v0.47: street stalls downtown | 2 |
| 30764-30862 | v0.48: places that open as you level up | 6 |
| 30863-30907 | v0.50: city careers | 5 |
| 30908-30958 | v0.52: careers as clear job loops | 3 |
| 30959-30966 | taxi | 1 |
| 30967-30970 | paramedic | 0 |
| 30971-30975 | police | 1 |
| 30976-30981 | firefighter | 1 |
| 30982-30991 | the step bar | 2 |
| 30992-31018 | cut scenes | 1 |
| 31019-31023 | siren | 0 |
| 31024-31035 | the Careers panel | 3 |
| 31036-31459 | v0.50: homes | 17 |
| 31460-31794 | decorating | 7 |
| 31795-31929 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 31930-32360 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 32361-32399 | v0.51.1: join and leave messages | 3 |
| 32400-32664 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 32665-32963 | v0.51.3: stream joiners | 9 |
| 32964-33080 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 574-5580 |
| `_nearest_*` |  | 9 | 1222-15314 |
| `_car_*` |  | 6 | 1387-30535 |
| `_online_*` | Supabase realtime multiplayer | 23 | 1990-14938 |
| `_shop_*` | Marina Heights shops | 8 | 2599-3103 |
| `_bus_*` | Airport Line and city buses | 14 | 2643-25552 |
| `_level_*` | player levels | 7 | 3169-12643 |
| `_chase_*` | police chase mode | 11 | 3317-3564 |
| `_quest_*` | quests | 8 | 5130-18508 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5470-27513 |
| `_crew_*` | crews | 6 | 5659-5997 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5715-22629 |
| `_social_*` | friends, invites | 8 | 5763-6221 |
| `_soc_*` | social extras | 8 | 5802-6095 |
| `_c4_*` | Connect Four | 9 | 6436-6552 |
| `_rx_*` | Reaction Duel | 6 | 6579-6654 |
| `_quiz_*` | party quiz | 9 | 6902-7099 |
| `_ach_*` | achievements | 8 | 7320-22624 |
| `_radio_*` | radio and ambience | 8 | 8616-8780 |
| `_smoke_*` | smoke tests | 43 | 9026-33027 |
| `_shot_*` | screenshot modes | 8 | 10738-32499 |
| `_hub_*` | Harbor Dome hub | 7 | 13304-15545 |
| `_ttt_*` | tic-tac-toe | 7 | 14009-14100 |
| `_sg_*` | Sky Garden | 28 | 14827-23910 |
| `_rw_*` | Raceway | 30 | 15694-16622 |
| `_crate_*` | starter crate | 8 | 17477-17798 |
| `_quick_*` | quick quests | 11 | 17935-18244 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 18589-22165 |
| `_pz_*` | daily puzzle | 10 | 19225-19393 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 19579-23076 |
| `_ga_*` | Galleria mall | 13 | 22677-23188 |
| `_season_*` | season pass | 6 | 24113-24145 |
| `_lb_*` | leaderboard | 10 | 24486-24549 |
| `_ds_*` | digital signs | 6 | 25052-25213 |
| `_treasure_*` | treasure hunt | 10 | 25593-25852 |
| `_fm_*` | Find Me | 11 | 25989-26162 |
| `_ap_*` | Harbor Airport | 7 | 28719-28839 |
| `_nav_*` | walker nav grids | 9 | 28940-29186 |
| `_dir_*` | Directions panel | 7 | 29475-29671 |
| `_gc_*` | Grand Central | 9 | 29727-30568 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 30888-32881 |
| `_home_*` | homes | 21 | 31076-31874 |
| `_ch_*` | chapters | 6 | 31991-32038 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:292, `_apply_car`:1348, `_collider`:1606, `_level`:3187, `_input`:7634, `_physics_process`:7730, `_refresh_hud`:8088, `_toggle_menu`:8258, `_show_toast`:8330, `_save_progress`:8334, `_load_progress`:8417, `_process`:8793, `_blocked_at`:9983, `_blocker`:9998, `_apply_view`:12325, `_place_lock_of`:30777

World builders (`_build_*`): `_build_world`:1027, `_build_collectibles`:1161, `_build_bay`:1463, `_build_north`:1733, `_build_nm_blocks`:1850, `_build_north_landscape`:1935, `_build_landscape`:1972, `_build_bus`:2649, `_build_marina`:2796, `_build_hat`:2905, `_build_ridge`:3752, `_build_panels`:4021, `_build_player`:4181, `_build_car`:4219, `_build_hud`:4707, `_build_quest_offer`:5100, `_build_future`:5265, `_build_neon`:5279, `_build_holograms`:5385, `_build_sky_traffic`:5452, `_build_social`:6016, `_build_dance_floor`:6195, `_build_arcade`:6385, `_build_arcade_panel`:6734, `_build_quiz`:6956, `_build_ach`:7455, `_build_peds`:8842, `_build_downtown`:11138, `_build_park`:11361, `_build_plaza`:11390, `_build_city_detail`:11406, `_build_traffic`:11510, `_build_minimap`:12058, `_build_view_controls`:12273, `_build_level_fx`:12541, `_build_stadium_walls`:12794, `_build_guidance`:12957, `_build_checkpoints`:13061, `_build_hub`:13308, `_build_hub_bots`:13548, `_build_game_panel`:13850, `_build_chat`:14355, `_build_feed`:14886, `_build_nick_panel`:15079, `_build_civic`:15380, `_build_raceway`:15780, `_build_rw_parking`:15814, `_build_rw_pits`:15859, `_build_rw_track`:15896, `_build_rw_trackside`:15937, `_build_raceway_ui`:16520, `_build_travel`:17103, `_build_qr`:17390, `_build_crate_ui`:17510, `_build_quick_props`:18046, `_build_quest_list`:18395, `_build_food_court`:18712, `_build_commons`:18938, `_build_puzzle_panel`:19362, `_build_biosphere`:20080, `_build_biosphere_legacy`:20084, `_build_style_panel`:22292, `_build_galleria`:22716, `_build_ga_fun`:23143, `_build_sky_garden`:23379, `_build_sg_panel`:23798, `_build_hp_panel`:24205, `_build_lb`:24431, `_build_market`:24620, `_build_gear`:24707, `_build_pet`:24760, `_build_market_panel`:24848, `_build_display`:25085, `_build_streamer`:25279, `_build_treasure_props`:25676, `_build_treasure`:25720, `_build_expansion`:26513, `_build_connect`:26740, `_build_skytrain`:27079, `_build_airport`:28543, `_build_signposts`:29498, `_build_dir_panel`:29602, `_build_grand_central`:29960, `_build_gc_towers`:30128, `_build_fill`:30309, `_build_gardens`:30377, `_build_fan_plaza`:30487, `_build_street_stalls`:30736, `_build_place_signs`:30794, `_build_career_panel`:31025, `_build_homes`:31091, `_build_home_panels`:31461, `_build_chapters_ui`:32130


## Smoke tests in main.gd

- `_smoke_test` line 9026
- `_smoke_chase` line 9665
- `_smoke_orole` line 9698
- `_smoke_levels` line 9727
- `_smoke_bus` line 9768
- `_smoke_chase_extras` line 9853
- `_smoke_marina` line 9881
- `_smoke_radio_peds` line 10023
- `_smoke_models` line 10093
- `_smoke_garage_ridge` line 10117
- `_smoke_downtown` line 11761
- `_smoke_views` line 12469
- `_smoke_level_fx` line 12744
- `_smoke_stadium_eye` line 12831
- `_smoke_guidance_checkpoints` line 13170
- `_smoke_hub` line 14580
- `_smoke_nick` line 15200
- `_smoke_sites_reachable` line 15250
- `_smoke_raceway` line 16656
- `_smoke_follow_call` line 16977
- `_smoke_travel` line 17257
- `_smoke_qr` line 17450
- `_smoke_crate` line 17750
- `_smoke_quick` line 18277
- `_smoke_quests` line 18511
- `_smoke_chat` line 19434
- `_smoke_feet` line 19472
- `_smoke_commons` line 19493
- `_smoke_biosphere` line 21542
- `_smoke_style` line 21804
- `_smoke_car_barriers` line 23916
- `_smoke_sky_garden` line 23957
- `_smoke_pass` line 24318
- `_smoke_treasure` line 25925
- `_smoke_findme` line 26218
- `_smoke_v27` line 27874
- `_smoke_airport` line 28882
- `_smoke_strollers` line 29324
- `_smoke_careers_homes` line 31586
- `_smoke_chapters` line 32216
- `_smoke_photo` line 32571
- `_smoke_stream_join` line 32798
- `_smoke_streamer_clean` line 33027

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

### game/world_biosphere.gd (4236 lines, 180 funcs)

Sections: 2809 0.55.0: three new continents, stable appended animal and quest IDs.; 3131 0.55.1: continuous floor transitions, protected paths and rescue.; 3808 0.55.11: open reserve layout shared by all seven domes. No pens: every species roams a big open habitat

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:242, `flush`:255, `disc`:274, `entrance_ramp`:286, `build`:298, `shell`:399, `hub_doors`:528, `gate`:554, `nature`:578, `tree`:599, `tree_parts`:605, `landscape`:619, `walkway`:684, `habitats`:687, `recolor`:788, `spawn_animal`:797, `quest_markers`:842, `quest_point`:868, `now`:891, `today`:894, `day_number`:897, `feeding`:900, `rare_event`:907, `baby_dome`:914, `rank_index`:917, `rank_name`:924, `reward`:927, `achieve`:934, `species_mask`:940, `page_ready`:947, `finish_passport`:954, `claim_page`:960, `spot`:969, `start_quest`:976, `quest_step`:983, `coop_near`:986, `advance_quest`:995, `prompt`:1021, `dusk`:1032, `interact`:1035, `keeper`:1080, `keeper_here`:1089, `auto_keeper`:1093, `finish_keeper`:1097, `photo_target`:1131, `photo_capture`:1155, `tick`:1170, `tick_impl`:1182, `animate_animal`:1339, `reset_stick`:1411, `close_panel`:1418, `open_panel`:1424, `ui_label`:1449, `ui_button`:1457, `select_page`:1462, `forget_buttons`:1466, `refresh_panel`:1473, `smoke`:1521, `drive_body`:1852, `screenshots`:1858, `backdrop`:1937, `walk_route`:1966, `rich_landscape`:1998, `planting_clear`:2057, `rain_ring`:2089, `gallery_points`:2116, `gallery_clear`:2127, `sky_gallery`:2148, `route_clear`:2173, `build_dome_loop`:2187, `quest_guide`:2226, `visitor_y`:2245, `add_visitor`:2254, `build_visitors`:2272, `tick_visitors`:2291, `door_point`:2342, `dome_signpost`:2345, `outside_signposts`:2376, `inside_signpost`:2389, `door_markers`:2398, `colonnade`:2416, `garden_ring`:2449, `glass_edge`:2481, `waterfall`:2489, `soft_mist`:2513, `ground_route`:2542, `ground_trails`:2557, `africa_lookout`:2569, `asia_route`:2590, `asia_rainwalk`:2599, `antarctic_route`:2629, `antarctic_spiral`:2638, `tree_fort`:2654, `floe_approach`:2664, `habitat_layers`:2683, `upper_animal`:2737, `high_habitat`:2774, `x_layer`:2793, `z_layer`:2797, `tall_tree`:2800, `phase2_pen`:2810, `phase2_route`:2814, `phase2_quest_point`:2825, `phase2_interact`:2846, `phase2_action`:2871, `phase2_landscape`:2884, `phase2_layers`:2983, `phase2_walkway`:2994, `sweep_join`:3001, `build_sweeps`:3029, `refined_coat`:3064, `profile_report`:3083, `profile_node_count`:3097, `profile_node`:3103, `rim_bevel`:3132, `collision_wall`:3164, `flush_guard_batches`:3174, `detail_index`:3190, `register_walk`:3196, `register_deck`:3203, `project_segment`:3212, `surface_distance`:3217, `finish_guards`:3231, `inside_pen`:3271, `open_path_point`:3278, `safety_net`:3297, `can_fly`:3322, `record_scenery`:3326, `scenery_aabb`:3335, `clear_scenery_bounds`:3343, `resolve_scenery`:3391, `register_habitats`:3448, `unload_detail`:3477, `load_dome`:3510, `activate_dome`:3555, `capture_exterior`:3575, `campus_surface`:3583, `build_open_paths`:3587, `build_garden_edges`:3614, `foliage_mesh`:3655, `small_foliage_texture`:3683, `apply_dome_quality`:3699, `restore_dome_quality`:3712, `profile_audio`:3720, `assign_feeding_slots`:3730, `feeding_target`:3741, `visitor_stage_route`:3756, `path_floor`:3771, `flush_walk_meshes`:3779, `reserve`:3852, `reserve_zone`:3855, `path_arms`:3861, `africa_path_nodes`:3864, `africa_blob`:3870, `africa_ramp_y`:3881, `reserve_station`:3884, `reserve_tree`:3888, `reserve_build`:3897, `path_clear`:3992, `reserve_zone_props`:3998, `africa_zone_props`:4016, `reserve_wow`:4041, `africa_path_segs`:4094, `africa_path_dist`:4103, `reserve_detail`:4113, `africa_shots`:4199

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

