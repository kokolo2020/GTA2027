# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (34169 lines, 1239 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-538 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 539-611 | v0.34.6: futuristic towers for the old city | 1 |
| 612-690 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 691-751 | v0.34.4: futuristic road surface | 2 |
| 752-1957 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 1958-2437 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2438-2610 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2611-3126 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3127-3181 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3182-3284 | v0.11.0: online police vs thief | 4 |
| 3285-4228 | v0.10.0: chase mode (offline) | 38 |
| 4229-4895 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4896-5014 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5015-5052 | v0.30.1: nothing to collect stands in a road | 4 |
| 5053-5192 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5193-5560 | v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5561-6060 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6061-6311 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6312-6807 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6808-7101 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7102-8579 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 38 |
| 8580-10720 | v0.5.0: original synthesized radio and ambient pedestrians | 32 |
| 10721-11369 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11370-11473 | old city and Bay details | 1 |
| 11474-11883 | traffic | 10 |
| 11884-12236 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12237-12494 | camera views | 9 |
| 12495-12742 | v0.17.0: level-up celebration | 8 |
| 12743-12862 | v0.18.0: walk-in stadium | 5 |
| 12863-13024 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13025-13210 | checkpoints | 9 |
| 13211-13486 | v0.18.0: Harbor Dome social hub | 3 |
| 13487-13694 | people: sitting pose, bots, bubbles, emotes | 6 |
| 13695-13813 | seats | 6 |
| 13814-13970 | game panel | 7 |
| 13971-14091 | tic-tac-toe | 7 |
| 14092-14143 | rock paper scissors | 4 |
| 14144-14226 | online table messages | 2 |
| 14227-14302 | comedy show | 4 |
| 14303-14841 | quick chat and emotes | 16 |
| 14842-15004 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 15005-15245 | v0.18.2: nickname and HUD relayout | 12 |
| 15246-15533 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 15534-15643 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 15644-15971 | circuit geometry | 12 |
| 15972-16069 | race car rental | 5 |
| 16070-16084 | speed effects | 2 |
| 16085-16135 | track helpers | 5 |
| 16136-16372 | events | 11 |
| 16373-16425 | boosters and spikes | 4 |
| 16426-16483 | online races | 2 |
| 16484-16839 | raceway panel, HUD, board | 10 |
| 16840-17046 | v0.22.0: Call Car | 6 |
| 17047-17346 | v0.23: RUN toggle and fast travel between districts | 13 |
| 17347-17420 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 17421-17857 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 17858-18349 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 18350-18500 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 18501-18535 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 18536-18850 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 18851-19165 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 19166-19480 | v0.36: the daily puzzle | 17 |
| 19481-19669 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 19670-20042 | building blocks | 23 |
| 20043-20544 | building | 16 |
| 20545-20700 | garden planting | 11 |
| 20701-21108 | the four layouts | 4 |
| 21109-21379 | animals | 8 |
| 21380-21509 | animation, spotting and rewards | 6 |
| 21510-22027 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 22028-22176 | your look: apply, save, share | 9 |
| 22177-22604 | stores and the wardrobe | 23 |
| 22605-23072 | HARBOR GALLERIA: the shopping mall | 14 |
| 23073-23224 | featured outfits and the Sky Run | 7 |
| 23225-23321 | v0.41: THE SKY GARDEN | 5 |
| 23322-23459 | building | 5 |
| 23460-23640 | plants | 6 |
| 23641-23760 | interacting | 7 |
| 23761-24004 | the garden screen | 9 |
| 24005-24043 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 24044-24075 | album | 2 |
| 24076-24127 | season | 6 |
| 24128-24135 | Harbor Night | 1 |
| 24136-24167 | check-in calendar | 1 |
| 24168-24344 | the panel | 8 |
| 24345-24559 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 24560-24983 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 24984-25225 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 25226-25404 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 25405-25441 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 25442-25538 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 25539-25830 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 25831-25931 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 25932-26255 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 26256-26366 | v0.24.2: road map (for moving people off the road) | 8 |
| 26367-26662 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 26663-26857 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 26858-27498 | Harbor Loop sky train | 27 |
| 27499-27836 | Day and night | 9 |
| 27837-28472 | v0.27 smoke test and screenshots | 2 |
| 28473-28889 | v0.27: Harbor International Airport (north of the city) | 10 |
| 28890-29403 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 29404-29564 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 29565-29661 | the Directions panel and chip | 7 |
| 29662-30203 | v0.44: Grand Central | 16 |
| 30204-30495 | v0.44: filling the empty land | 8 |
| 30496-30530 | v0.45: hover car underglow | 1 |
| 30531-30695 | v0.46: what is inside the Grand Central shops | 1 |
| 30696-30727 | v0.47: street stalls downtown | 2 |
| 30728-30826 | v0.48: places that open as you level up | 6 |
| 30827-30986 | v0.50: city careers | 11 |
| 30987-31335 | v0.52: careers as clear job loops | 18 |
| 31336-31451 | taxi | 5 |
| 31452-31534 | paramedic | 3 |
| 31535-31591 | police | 2 |
| 31592-31688 | firefighter | 3 |
| 31689-31786 | the step bar | 5 |
| 31787-32005 | cut scenes | 9 |
| 32006-32043 | siren | 2 |
| 32044-32124 | the Careers panel | 5 |
| 32125-32548 | v0.50: homes | 17 |
| 32549-32883 | decorating | 7 |
| 32884-33018 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 33019-33449 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 33450-33488 | v0.51.1: join and leave messages | 3 |
| 33489-33753 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 33754-34052 | v0.51.3: stream joiners | 9 |
| 34053-34169 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 543-5549 |
| `_nearest_*` |  | 9 | 1191-15279 |
| `_car_*` |  | 6 | 1356-30499 |
| `_online_*` | Supabase realtime multiplayer | 23 | 1959-14903 |
| `_shop_*` | Marina Heights shops | 8 | 2568-3072 |
| `_bus_*` | Airport Line and city buses | 14 | 2612-25516 |
| `_level_*` | player levels | 7 | 3138-12608 |
| `_chase_*` | police chase mode | 11 | 3286-3533 |
| `_quest_*` | quests | 8 | 5099-18472 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5439-27477 |
| `_crew_*` | crews | 6 | 5628-5966 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5684-22593 |
| `_social_*` | friends, invites | 8 | 5732-6190 |
| `_soc_*` | social extras | 8 | 5771-6064 |
| `_c4_*` | Connect Four | 9 | 6405-6521 |
| `_rx_*` | Reaction Duel | 6 | 6548-6623 |
| `_quiz_*` | party quiz | 9 | 6871-7068 |
| `_ach_*` | achievements | 8 | 7289-22588 |
| `_radio_*` | radio and ambience | 8 | 8584-8748 |
| `_smoke_*` | smoke tests | 43 | 8994-34116 |
| `_shot_*` | screenshot modes | 8 | 10703-33588 |
| `_hub_*` | Harbor Dome hub | 7 | 13269-15510 |
| `_ttt_*` | tic-tac-toe | 7 | 13974-14065 |
| `_sg_*` | Sky Garden | 28 | 14792-23874 |
| `_rw_*` | Raceway | 30 | 15659-16587 |
| `_crate_*` | starter crate | 8 | 17441-17762 |
| `_quick_*` | quick quests | 11 | 17899-18208 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 18553-22129 |
| `_pz_*` | daily puzzle | 10 | 19189-19357 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 19543-23040 |
| `_ga_*` | Galleria mall | 13 | 22641-23152 |
| `_season_*` | season pass | 6 | 24077-24109 |
| `_lb_*` | leaderboard | 10 | 24450-24513 |
| `_ds_*` | digital signs | 6 | 25016-25177 |
| `_treasure_*` | treasure hunt | 10 | 25557-25816 |
| `_fm_*` | Find Me | 11 | 25953-26126 |
| `_ap_*` | Harbor Airport | 7 | 28683-28803 |
| `_nav_*` | walker nav grids | 9 | 28904-29150 |
| `_dir_*` | Directions panel | 7 | 29439-29635 |
| `_gc_*` | Grand Central | 9 | 29691-30532 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 32 | 30851-33970 |
| `_cj_*` | career job state | 6 | 31073-31115 |
| `_cs_*` | career cut scenes | 15 | 31363-31959 |
| `_home_*` | homes | 21 | 32165-32963 |
| `_ch_*` | chapters | 6 | 33080-33127 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:287, `_apply_car`:1317, `_collider`:1575, `_level`:3156, `_input`:7603, `_physics_process`:7699, `_refresh_hud`:8056, `_toggle_menu`:8226, `_show_toast`:8298, `_save_progress`:8302, `_load_progress`:8385, `_process`:8761, `_blocked_at`:9950, `_blocker`:9963, `_apply_view`:12290, `_place_lock_of`:30741

World builders (`_build_*`): `_build_world`:996, `_build_collectibles`:1130, `_build_bay`:1432, `_build_north`:1702, `_build_nm_blocks`:1819, `_build_north_landscape`:1904, `_build_landscape`:1941, `_build_bus`:2618, `_build_marina`:2765, `_build_hat`:2874, `_build_ridge`:3721, `_build_panels`:3990, `_build_player`:4150, `_build_car`:4188, `_build_hud`:4676, `_build_quest_offer`:5069, `_build_future`:5234, `_build_neon`:5248, `_build_holograms`:5354, `_build_sky_traffic`:5421, `_build_social`:5985, `_build_dance_floor`:6164, `_build_arcade`:6354, `_build_arcade_panel`:6703, `_build_quiz`:6925, `_build_ach`:7424, `_build_peds`:8810, `_build_downtown`:11103, `_build_park`:11326, `_build_plaza`:11355, `_build_city_detail`:11371, `_build_traffic`:11475, `_build_minimap`:12023, `_build_view_controls`:12238, `_build_level_fx`:12506, `_build_stadium_walls`:12759, `_build_guidance`:12922, `_build_checkpoints`:13026, `_build_hub`:13273, `_build_hub_bots`:13513, `_build_game_panel`:13815, `_build_chat`:14320, `_build_feed`:14851, `_build_nick_panel`:15044, `_build_civic`:15345, `_build_raceway`:15745, `_build_rw_parking`:15779, `_build_rw_pits`:15824, `_build_rw_track`:15861, `_build_rw_trackside`:15902, `_build_raceway_ui`:16485, `_build_travel`:17067, `_build_qr`:17354, `_build_crate_ui`:17474, `_build_quick_props`:18010, `_build_quest_list`:18359, `_build_food_court`:18676, `_build_commons`:18902, `_build_puzzle_panel`:19326, `_build_biosphere`:20044, `_build_biosphere_legacy`:20048, `_build_style_panel`:22256, `_build_galleria`:22680, `_build_ga_fun`:23107, `_build_sky_garden`:23343, `_build_sg_panel`:23762, `_build_hp_panel`:24169, `_build_lb`:24395, `_build_market`:24584, `_build_gear`:24671, `_build_pet`:24724, `_build_market_panel`:24812, `_build_display`:25049, `_build_streamer`:25243, `_build_treasure_props`:25640, `_build_treasure`:25684, `_build_expansion`:26477, `_build_connect`:26704, `_build_skytrain`:27043, `_build_airport`:28507, `_build_signposts`:29462, `_build_dir_panel`:29566, `_build_grand_central`:29924, `_build_gc_towers`:30092, `_build_fill`:30273, `_build_gardens`:30341, `_build_fan_plaza`:30451, `_build_street_stalls`:30700, `_build_place_signs`:30758, `_build_career_panel`:32045, `_build_homes`:32180, `_build_home_panels`:32550, `_build_chapters_ui`:33219


## Smoke tests in main.gd

- `_smoke_test` line 8994
- `_smoke_chase` line 9632
- `_smoke_orole` line 9665
- `_smoke_levels` line 9694
- `_smoke_bus` line 9735
- `_smoke_chase_extras` line 9820
- `_smoke_marina` line 9848
- `_smoke_radio_peds` line 9988
- `_smoke_models` line 10058
- `_smoke_garage_ridge` line 10082
- `_smoke_downtown` line 11726
- `_smoke_views` line 12434
- `_smoke_level_fx` line 12709
- `_smoke_stadium_eye` line 12796
- `_smoke_guidance_checkpoints` line 13135
- `_smoke_hub` line 14545
- `_smoke_nick` line 15165
- `_smoke_sites_reachable` line 15215
- `_smoke_raceway` line 16621
- `_smoke_follow_call` line 16941
- `_smoke_travel` line 17221
- `_smoke_qr` line 17414
- `_smoke_crate` line 17714
- `_smoke_quick` line 18241
- `_smoke_quests` line 18475
- `_smoke_chat` line 19398
- `_smoke_feet` line 19436
- `_smoke_commons` line 19457
- `_smoke_biosphere` line 21506
- `_smoke_style` line 21768
- `_smoke_car_barriers` line 23880
- `_smoke_sky_garden` line 23921
- `_smoke_pass` line 24282
- `_smoke_treasure` line 25889
- `_smoke_findme` line 26182
- `_smoke_v27` line 27838
- `_smoke_airport` line 28846
- `_smoke_strollers` line 29288
- `_smoke_careers_homes` line 32675
- `_smoke_chapters` line 33305
- `_smoke_photo` line 33660
- `_smoke_stream_join` line 33887
- `_smoke_streamer_clean` line 34116

## Other scripts

### game/hub_jokes.gd (102 lines, 0 funcs)

Functions: 

### game/natural_player_trial.gd (285 lines, 0 funcs)

Functions: 

### game/world_biosphere.gd (3766 lines, 163 funcs)

Sections: 2776 0.55.0: three new continents, stable appended animal and quest IDs.; 3098 0.55.1: continuous floor transitions, protected paths and rescue.

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:242, `flush`:255, `disc`:274, `entrance_ramp`:286, `build`:298, `shell`:399, `hub_doors`:528, `gate`:554, `nature`:578, `tree`:599, `tree_parts`:605, `landscape`:619, `walkway`:687, `habitats`:690, `recolor`:773, `spawn_animal`:782, `quest_markers`:820, `quest_point`:846, `now`:863, `today`:866, `day_number`:869, `feeding`:872, `rare_event`:879, `baby_dome`:886, `rank_index`:889, `rank_name`:896, `reward`:899, `achieve`:906, `species_mask`:912, `page_ready`:919, `finish_passport`:926, `claim_page`:932, `spot`:941, `start_quest`:948, `quest_step`:955, `coop_near`:958, `advance_quest`:967, `prompt`:993, `dusk`:1006, `interact`:1009, `keeper`:1057, `keeper_here`:1066, `auto_keeper`:1070, `finish_keeper`:1074, `photo_target`:1108, `photo_capture`:1132, `tick`:1147, `tick_impl`:1159, `animate_animal`:1316, `reset_stick`:1378, `close_panel`:1385, `open_panel`:1391, `ui_label`:1416, `ui_button`:1424, `select_page`:1429, `forget_buttons`:1433, `refresh_panel`:1440, `smoke`:1488, `drive_body`:1819, `screenshots`:1825, `backdrop`:1904, `walk_route`:1933, `rich_landscape`:1965, `planting_clear`:2024, `rain_ring`:2056, `gallery_points`:2083, `gallery_clear`:2094, `sky_gallery`:2115, `route_clear`:2140, `build_dome_loop`:2154, `quest_guide`:2193, `visitor_y`:2212, `add_visitor`:2221, `build_visitors`:2239, `tick_visitors`:2258, `door_point`:2309, `dome_signpost`:2312, `outside_signposts`:2343, `inside_signpost`:2356, `door_markers`:2365, `colonnade`:2383, `garden_ring`:2416, `glass_edge`:2448, `waterfall`:2456, `soft_mist`:2480, `ground_route`:2509, `ground_trails`:2524, `africa_lookout`:2536, `asia_route`:2557, `asia_rainwalk`:2566, `antarctic_route`:2596, `antarctic_spiral`:2605, `tree_fort`:2621, `floe_approach`:2631, `habitat_layers`:2650, `upper_animal`:2704, `high_habitat`:2741, `x_layer`:2760, `z_layer`:2764, `tall_tree`:2767, `phase2_pen`:2777, `phase2_route`:2781, `phase2_quest_point`:2792, `phase2_interact`:2813, `phase2_action`:2838, `phase2_landscape`:2851, `phase2_layers`:2950, `phase2_walkway`:2961, `sweep_join`:2968, `build_sweeps`:2996, `refined_coat`:3031, `profile_report`:3050, `profile_node_count`:3064, `profile_node`:3070, `rim_bevel`:3099, `collision_wall`:3131, `flush_guard_batches`:3141, `detail_index`:3157, `register_walk`:3163, `register_deck`:3170, `project_segment`:3179, `surface_distance`:3184, `finish_guards`:3198, `inside_pen`:3238, `open_path_point`:3245, `safety_net`:3264, `can_fly`:3289, `record_scenery`:3293, `scenery_aabb`:3302, `clear_scenery_bounds`:3310, `resolve_scenery`:3358, `register_habitats`:3415, `unload_detail`:3440, `load_dome`:3473, `activate_dome`:3517, `capture_exterior`:3537, `campus_surface`:3545, `build_open_paths`:3549, `build_garden_edges`:3576, `foliage_mesh`:3617, `small_foliage_texture`:3645, `apply_dome_quality`:3661, `restore_dome_quality`:3674, `profile_audio`:3682, `assign_feeding_slots`:3692, `feeding_target`:3703, `visitor_stage_route`:3717, `path_floor`:3732, `flush_walk_meshes`:3740

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

