# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (35253 lines, 1257 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-619 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 620-692 | v0.34.6: futuristic towers for the old city | 1 |
| 693-771 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 772-832 | v0.34.4: futuristic road surface | 2 |
| 833-2041 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 2042-2525 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2526-2698 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2699-3214 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3215-3269 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3270-3372 | v0.11.0: online police vs thief | 4 |
| 3373-4316 | v0.10.0: chase mode (offline) | 38 |
| 4317-5001 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 5002-5120 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5121-5158 | v0.30.1: nothing to collect stands in a road | 4 |
| 5159-5298 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5299-5666 | v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5667-6166 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6167-6417 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6418-6913 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6914-7207 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7208-8785 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 39 |
| 8786-11389 | v0.5.0: original synthesized radio and ambient pedestrians | 40 |
| 11390-12038 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 12039-12142 | old city and Bay details | 1 |
| 12143-12552 | traffic | 10 |
| 12553-12913 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12914-13174 | camera views | 9 |
| 13175-13422 | v0.17.0: level-up celebration | 8 |
| 13423-13542 | v0.18.0: walk-in stadium | 5 |
| 13543-13704 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13705-13890 | checkpoints | 9 |
| 13891-14169 | v0.18.0: Harbor Dome social hub | 2 |
| 14170-14220 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 14221-14544 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 14545-14700 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14701-14949 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 14950-15164 | people: sitting pose, bots, bubbles, emotes | 6 |
| 15165-15283 | seats | 6 |
| 15284-15440 | game panel | 7 |
| 15441-15561 | tic-tac-toe | 7 |
| 15562-15613 | rock paper scissors | 4 |
| 15614-15696 | online table messages | 2 |
| 15697-15772 | comedy show | 4 |
| 15773-16672 | quick chat and emotes | 26 |
| 16673-16835 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 16836-17077 | v0.18.2: nickname and HUD relayout | 12 |
| 17078-17365 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 17366-17475 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 17476-17803 | circuit geometry | 12 |
| 17804-17901 | race car rental | 5 |
| 17902-17916 | speed effects | 2 |
| 17917-17967 | track helpers | 5 |
| 17968-18204 | events | 11 |
| 18205-18257 | boosters and spikes | 4 |
| 18258-18315 | online races | 2 |
| 18316-18671 | raceway panel, HUD, board | 10 |
| 18672-18879 | v0.22.0: Call Car | 6 |
| 18880-19337 | v0.23: RUN toggle and fast travel between districts | 25 |
| 19338-19411 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 19412-19848 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 19849-20340 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 20341-20491 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 20492-20526 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 20527-20841 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 20842-21163 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 21164-21478 | v0.36: the daily puzzle | 17 |
| 21479-21667 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 21668-22040 | building blocks | 23 |
| 22041-22542 | building | 16 |
| 22543-22698 | garden planting | 11 |
| 22699-23106 | the four layouts | 4 |
| 23107-23377 | animals | 8 |
| 23378-23509 | animation, spotting and rewards | 6 |
| 23510-24027 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 24028-24181 | your look: apply, save, share | 9 |
| 24182-24609 | stores and the wardrobe | 23 |
| 24610-25077 | HARBOR GALLERIA: the shopping mall | 14 |
| 25078-25229 | featured outfits and the Sky Run | 7 |
| 25230-25326 | v0.41: THE SKY GARDEN | 5 |
| 25327-25464 | building | 5 |
| 25465-25645 | plants | 6 |
| 25646-25765 | interacting | 7 |
| 25766-26009 | the garden screen | 9 |
| 26010-26048 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 26049-26080 | album | 2 |
| 26081-26132 | season | 6 |
| 26133-26140 | Harbor Night | 1 |
| 26141-26172 | check-in calendar | 1 |
| 26173-26349 | the panel | 8 |
| 26350-26564 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 26565-27123 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 18 |
| 27124-27365 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 27366-27544 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 27545-27581 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 27582-27678 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 27679-27970 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 27971-28071 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 28072-28395 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 28396-28506 | v0.24.2: road map (for moving people off the road) | 8 |
| 28507-28802 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 28803-28997 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 28998-29665 | Harbor Loop sky train | 27 |
| 29666-30039 | Day and night | 11 |
| 30040-30677 | v0.27 smoke test and screenshots | 2 |
| 30678-31094 | v0.27: Harbor International Airport (north of the city) | 10 |
| 31095-31608 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 31609-31769 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 31770-31866 | the Directions panel and chip | 7 |
| 31867-32408 | v0.44: Grand Central | 16 |
| 32409-32700 | v0.44: filling the empty land | 8 |
| 32701-32735 | v0.45: hover car underglow | 1 |
| 32736-32900 | v0.46: what is inside the Grand Central shops | 1 |
| 32901-32932 | v0.47: street stalls downtown | 2 |
| 32933-33031 | v0.48: places that open as you level up | 6 |
| 33032-33076 | v0.50: city careers | 5 |
| 33077-33127 | v0.52: careers as clear job loops | 3 |
| 33128-33135 | taxi | 1 |
| 33136-33139 | paramedic | 0 |
| 33140-33144 | police | 1 |
| 33145-33150 | firefighter | 1 |
| 33151-33160 | the step bar | 2 |
| 33161-33187 | cut scenes | 1 |
| 33188-33192 | siren | 0 |
| 33193-33204 | the Careers panel | 3 |
| 33205-33628 | v0.50: homes | 17 |
| 33629-33964 | decorating | 7 |
| 33965-34099 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 34100-34533 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 34534-34572 | v0.51.1: join and leave messages | 3 |
| 34573-34837 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 34838-35136 | v0.51.3: stream joiners | 9 |
| 35137-35253 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 624-5655 |
| `_nearest_*` |  | 9 | 1275-17111 |
| `_car_*` |  | 7 | 1440-32704 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2043-16734 |
| `_shop_*` | Marina Heights shops | 9 | 2656-16360 |
| `_bus_*` | Airport Line and city buses | 14 | 2700-27656 |
| `_level_*` | player levels | 7 | 3226-13288 |
| `_chase_*` | police chase mode | 11 | 3374-3621 |
| `_quest_*` | quests | 8 | 5205-20463 |
| `_sky_*` | Harbor Loop sky train, sky look | 30 | 5545-29644 |
| `_crew_*` | crews | 6 | 5734-6072 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5790-24598 |
| `_social_*` | friends, invites | 8 | 5838-6296 |
| `_soc_*` | social extras | 8 | 5877-6170 |
| `_c4_*` | Connect Four | 9 | 6511-6627 |
| `_rx_*` | Reaction Duel | 6 | 6654-6729 |
| `_quiz_*` | party quiz | 9 | 6977-7174 |
| `_ach_*` | achievements | 8 | 7395-24593 |
| `_radio_*` | radio and ambience | 8 | 8790-8954 |
| `_smoke_*` | smoke tests | 47 | 9202-35200 |
| `_shot_*` | screenshot modes | 8 | 11372-34672 |
| `_hub_*` | Harbor Dome hub | 12 | 13949-17342 |
| `_lux_*` |  | 12 | 14364-14493 |
| `_ttt_*` | tic-tac-toe | 7 | 15444-15535 |
| `_chat_*` |  | 10 | 15912-16287 |
| `_sg_*` | Sky Garden | 28 | 16623-25879 |
| `_rw_*` | Raceway | 30 | 17491-18419 |
| `_crate_*` | starter crate | 8 | 19432-19753 |
| `_quick_*` | quick quests | 11 | 19890-20199 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 20544-24134 |
| `_pz_*` | daily puzzle | 10 | 21187-21355 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 21541-25045 |
| `_ga_*` | Galleria mall | 13 | 24646-25157 |
| `_season_*` | season pass | 6 | 26082-26114 |
| `_lb_*` | leaderboard | 10 | 26455-26518 |
| `_ds_*` | digital signs | 6 | 27156-27317 |
| `_treasure_*` | treasure hunt | 10 | 27697-27956 |
| `_fm_*` | Find Me | 11 | 28093-28266 |
| `_ap_*` | Harbor Airport | 7 | 30888-31008 |
| `_nav_*` | walker nav grids | 9 | 31109-31355 |
| `_dir_*` | Directions panel | 7 | 31644-31840 |
| `_gc_*` | Grand Central | 9 | 31896-32737 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 33057-35054 |
| `_home_*` | homes | 21 | 33245-34044 |
| `_ch_*` | chapters | 6 | 34163-34210 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:298, `_apply_car`:1401, `_collider`:1659, `_level`:3244, `_input`:7709, `_physics_process`:7841, `_refresh_hud`:8213, `_toggle_menu`:8399, `_show_toast`:8477, `_save_progress`:8481, `_load_progress`:8576, `_process`:8967, `_blocked_at`:10173, `_blocker`:10188, `_apply_view`:12967, `_place_lock_of`:32946

World builders (`_build_*`): `_build_world`:1077, `_build_collectibles`:1214, `_build_bay`:1516, `_build_north`:1786, `_build_nm_blocks`:1903, `_build_north_landscape`:1988, `_build_landscape`:2025, `_build_bus`:2706, `_build_marina`:2853, `_build_hat`:2962, `_build_ridge`:3809, `_build_panels`:4078, `_build_player`:4238, `_build_car`:4276, `_build_hud`:4764, `_build_quest_offer`:5175, `_build_future`:5340, `_build_neon`:5354, `_build_holograms`:5460, `_build_sky_traffic`:5527, `_build_social`:6091, `_build_dance_floor`:6270, `_build_arcade`:6460, `_build_arcade_panel`:6809, `_build_quiz`:7031, `_build_ach`:7530, `_build_peds`:9018, `_build_downtown`:11772, `_build_park`:11995, `_build_plaza`:12024, `_build_city_detail`:12040, `_build_traffic`:12144, `_build_minimap`:12700, `_build_view_controls`:12915, `_build_level_fx`:13186, `_build_stadium_walls`:13439, `_build_guidance`:13602, `_build_checkpoints`:13706, `_build_hub`:13953, `_build_hub_bots`:14976, `_build_game_panel`:15285, `_build_chat`:15795, `_build_feed`:16682, `_build_nick_panel`:16875, `_build_civic`:17177, `_build_raceway`:17577, `_build_rw_parking`:17611, `_build_rw_pits`:17656, `_build_rw_track`:17693, `_build_rw_trackside`:17734, `_build_raceway_ui`:18317, `_build_travel`:18926, `_build_qr`:19345, `_build_crate_ui`:19465, `_build_quick_props`:20001, `_build_quest_list`:20350, `_build_food_court`:20667, `_build_commons`:20900, `_build_puzzle_panel`:21324, `_build_biosphere`:22042, `_build_biosphere_legacy`:22046, `_build_style_panel`:24261, `_build_galleria`:24685, `_build_ga_fun`:25112, `_build_sky_garden`:25348, `_build_sg_panel`:25767, `_build_hp_panel`:26174, `_build_lb`:26400, `_build_market`:26589, `_build_gear`:26678, `_build_pet`:26752, `_build_market_panel`:26952, `_build_display`:27189, `_build_streamer`:27383, `_build_treasure_props`:27780, `_build_treasure`:27824, `_build_expansion`:28617, `_build_connect`:28844, `_build_skytrain`:29183, `_build_airport`:30712, `_build_signposts`:31667, `_build_dir_panel`:31771, `_build_grand_central`:32129, `_build_gc_towers`:32297, `_build_fill`:32478, `_build_gardens`:32546, `_build_fan_plaza`:32656, `_build_street_stalls`:32905, `_build_place_signs`:32963, `_build_career_panel`:33194, `_build_homes`:33260, `_build_home_panels`:33630, `_build_chapters_ui`:34302


## Smoke tests in main.gd

- `_smoke_test` line 9202
- `_smoke_chase` line 9855
- `_smoke_orole` line 9888
- `_smoke_levels` line 9917
- `_smoke_bus` line 9958
- `_smoke_chase_extras` line 10043
- `_smoke_marina` line 10071
- `_smoke_radio_peds` line 10213
- `_smoke_typed_chat` line 10283
- `_smoke_chat_touch` line 10302
- `_smoke_cafe` line 10323
- `_smoke_boutique` line 10349
- `_smoke_models` line 10377
- `_smoke_garage_ridge` line 10401
- `_smoke_downtown` line 12395
- `_smoke_views` line 13114
- `_smoke_level_fx` line 13389
- `_smoke_stadium_eye` line 13476
- `_smoke_guidance_checkpoints` line 13815
- `_smoke_hub` line 16113
- `_smoke_nick` line 16997
- `_smoke_sites_reachable` line 17047
- `_smoke_raceway` line 18453
- `_smoke_follow_call` line 18774
- `_smoke_travel` line 19212
- `_smoke_qr` line 19405
- `_smoke_crate` line 19705
- `_smoke_quick` line 20232
- `_smoke_quests` line 20466
- `_smoke_chat` line 21396
- `_smoke_feet` line 21434
- `_smoke_commons` line 21455
- `_smoke_biosphere` line 23506
- `_smoke_style` line 23768
- `_smoke_car_barriers` line 25885
- `_smoke_sky_garden` line 25926
- `_smoke_pass` line 26287
- `_smoke_treasure` line 28029
- `_smoke_findme` line 28322
- `_smoke_v27` line 30041
- `_smoke_airport` line 31051
- `_smoke_strollers` line 31493
- `_smoke_careers_homes` line 33755
- `_smoke_chapters` line 34388
- `_smoke_photo` line 34744
- `_smoke_stream_join` line 34971
- `_smoke_streamer_clean` line 35200

## Other scripts

### game/autoplay.gd (498 lines, 26 funcs)

Functions: `_init`:44, `_ready`:47, `goto`:57, `steer`:64, `watchdog`:85, `ready_to_play`:103, `_physics_process`:106, `clear_screen`:173, `force_travel`:186, `start_dome_route`:204, `walk_route_tick`:218, `on_enter`:230, `dome_quest_tick`:246, `prepare_station`:269, `station_tick`:279, `wait_tick`:298, `ride_tick`:312, `arrive_city`:328, `road_edge_dist`:350, `sidewalk_ok`:363, `path_clear`:371, `note_trail`:399, `novelty`:405, `pick_wander`:412, `city_tick`:453, `shot_tick`:489

### game/cafe.gd (618 lines, 28 funcs)

Sections: 281 the lounge: a big partitioned hang-out area with booth bays (white, porthole screens, glowing strips); 406 interaction; 484 ordering

Functions: `_init`:40, `rng_f`:44, `lp`:48, `prop`:51, `solid`:62, `glass`:71, `tangent_box`:80, `build_cafe`:85, `build_lounge`:282, `in_lounge`:376, `counter_spot`:379, `holding_cup`:383, `build_cup`:387, `tint_cup`:395, `near`:407, `button_text`:412, `hour_number`:415, `special_index`:418, `price_of`:421, `speed_mult`:425, `_process`:428, `build_panel`:485, `open`:509, `close`:515, `refresh`:519, `player_name`:559, `pick`:563, `finish_order`:583

### game/careers.gd (1231 lines, 64 funcs)

Functions: `_init`:7, `_career_rank`:10, `_career_rank_name`:17, `_career_mult`:20, `_career_spots`:23, `_career_pick`:51, `_career_block_reason`:62, `_career_start`:75, `_career_lights`:94, `_career_lights_off`:109, `_career_end`:118, `_career_clear_job`:134, `_cid`:147, `_career_place_name`:150, `_career_tag`:162, `_career_person`:179, `_cj_pp`:206, `_cj_anim`:209, `_cj_pose`:215, `_cj_pose_tick`:240, `_cj_hands_up`:245, `_cj_face`:248, `_career_fire`:254, `_career_next`:318, `_career_target`:356, `_career_pay`:366, `_career_rank_line`:374, `_career_job_done`:380, `_career_job_failed`:399, `_career_tick`:407, `_taxi_meter`:469, `_taxi_tip`:489, `_cs_taxi_pickup`:495, `_taxi_seat`:528, `_cs_taxi_dropoff`:540, `_stretcher`:584, `_cs_medic_load`:596, `_cs_medic_unload`:635, `_cs_police_radio`:666, `_career_chase_over`:679, `_fire_aimed`:722, `_fire_hose_tick`:732, `_cs_fire_out`:789, `_career_bar_build`:818, `_career_steps_bbcode`:848, `_career_bar_text`:862, `_career_bar_tick`:891, `_career_hud`:908, `_cs_play`:915, `_cs_tick`:929, `_cs_skip`:946, `_cs_finish`:952, `_cs_side_cam`:968, `_cs_cam`:987, `_cs_ui`:1001, `_cs_caption`:1052, `_cs_mirror`:1071, `_siren_sound`:1118, `_siren`:1140, `_build_career_panel`:1153, `_open_careers`:1192, `_career_ach_line`:1210, `_career_close`:1225, `_career_end_close`:1229

### game/daily.gd (224 lines, 18 funcs)

Functions: `_init`:30, `live`:33, `today`:37, `day_num`:40, `roll`:43, `check_in`:57, `bump`:84, `value`:92, `settle`:95, `tick`:118, `bump_quiet`:136, `summary`:143, `refresh`:156, `open`:160, `close`:166, `build`:170, `save_state`:198, `load_state`:209

### game/dome_quests.gd (531 lines, 30 funcs)

Sections: 148 state; 200 rewards; 312 3D gift boxes

Functions: `_init`:62, `today`:65, `done_count`:68, `gift_count`:75, `gift_pos`:82, `gift_pay`:94, `total_today`:97, `quest_pos`:105, `progress`:126, `_bits`:141, `new_day`:149, `save_state`:167, `load_state`:183, `pay`:201, `award`:213, `take_gift`:229, `cafe_order`:244, `cafe_check`:251, `check_at`:264, `build_presents`:313, `refresh_presents`:351, `build`:356, `in_dome`:387, `refresh_ui`:390, `draw`:397, `guide`:416, `open`:423, `close`:429, `_process`:433, `selftest`:466

### game/explore.gd (298 lines, 20 funcs)

Functions: `noop`:31, `_init`:34, `can_enter`:37, `enter`:40, `exit`:69, `add_button`:88, `build_ui`:98, `cycle_speed`:126, `update_speed`:130, `aim`:134, `jump`:140, `min_y`:166, `apply_camera`:172, `tick`:178, `look`:199, `hit_button`:204, `press`:211, `release`:229, `drag`:244, `input`:266

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

### game/infected.gd (352 lines, 16 funcs)

Functions: `_init`:25, `post_local`:30, `ash_ground`:33, `reset`:90, `clear`:96, `dress`:121, `part`:155, `box`:167, `wreck`:172, `smoke`:208, `litter`:260, `barricade`:282, `fire`:292, `safe_zone`:306, `spawn_runners`:324, `tick`:339

### game/natural_player_trial.gd (285 lines, 0 funcs)

Functions: 

### game/outbreak.gd (526 lines, 25 funcs)

Functions: `_init`:42, `build_post`:47, `refresh_post`:57, `prompt`:61, `owns`:73, `interact`:76, `spot`:87, `figure`:100, `block_figure`:184, `mist`:197, `start`:214, `build_hud`:270, `order_text`:328, `update_hud`:334, `tick`:347, `tick_zombies`:377, `die`:415, `rescue`:426, `press_valve`:437, `seal`:461, `timeout`:483, `abort`:490, `cleanup`:498, `save_state`:519, `load_state`:523

### game/paris.gd (1131 lines, 60 funcs)

Sections: 99 helpers; 187 portals; 238 the district; 949 play

Functions: `_init`:80, `in_area`:100, `poly_area`:103, `to_poly`:110, `mm_boxes`:118, `seg_xf`:135, `beam_xf`:142, `finish`:151, `load_data`:177, `make_portal`:188, `label`:225, `ensure_built`:239, `build_ground`:275, `build_river`:285, `build_water`:328, `build_parks`:350, `build_roads`:377, `facade_details`:413, `dormers`:440, `prism`:451, `cap`:468, `build_buildings`:476, `in_building`:534, `build_trees`:551, `build_lamps`:636, `build_landmark`:684, `lm_radius`:697, `hw`:700, `build_tower`:703, `build_cafe`:757, `clue_world`:775, `build_mystery`:779, `update_clues`:800, `clue_text`:804, `found_clue`:807, `clue_count`:822, `submit_case`:829, `facing`:851, `panel`:855, `build_crossing`:867, `build_times`:896, `build_prang`:913, `build_statue`:937, `near`:950, `in_paris`:953, `lm_pos`:957, `prompt`:961, `busy`:976, `interact`:979, `move_player`:1000, `enter`:1008, `go_home`:1031, `order`:1038, `done_count`:1042, `roll_day`:1049, `pay`:1060, `award`:1073, `tick`:1086, `save_state`:1108, `load_state`:1120

### game/promo.gd (346 lines, 15 funcs)

Functions: `_init`:16, `_ready`:19, `_process`:24, `frames`:38, `smooth`:42, `mark`:45, `move`:48, `visitor`:59, `newest_only`:66, `me_say`:73, `say`:77, `emote`:86, `clear_cast`:93, `put_player`:102, `run`:109

### game/road_barrier.gd (314 lines, 18 funcs)

Sections: 167 finding the road; 260 safety net; 288 checks

Functions: `_init`:25, `in_zone`:28, `_inside`:36, `on_road`:40, `_in_gap`:46, `_solid_cell`:52, `build`:63, `_emit`:117, `_visuals`:127, `nearest_road`:168, `road_dist`:186, `cp_car`:190, `_free_road_spot`:196, `call_car_spot`:208, `kerb_spot`:215, `rescue`:261, `tick`:270, `smoke`:289

### game/sun_dome.gd (183 lines, 8 funcs)

Functions: `_init`:19, `pt`:25, `rib`:28, `multimesh`:39, `spin`:52, `part`:57, `build`:60, `build_core`:148

### game/tracker.gd (224 lines, 8 funcs)

Functions: `_init`:23, `build`:27, `place`:92, `set_open`:96, `collect`:101, `pick_default`:138, `rebuild_rows`:149, `tick`:181

### game/weather.gd (129 lines, 7 funcs)

Functions: `_init`:23, `_ready`:26, `_hash01`:36, `target`:39, `_build_drops`:58, `under_roof`:88, `_physics_process`:101

### game/world_biosphere.gd (4427 lines, 187 funcs)

Sections: 2996 0.55.0: three new continents, stable appended animal and quest IDs.; 3318 0.55.1: continuous floor transitions, protected paths and rescue.; 3999 0.55.11: open reserve layout shared by all seven domes. No pens: every species roams a big open habitat

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:241, `flush`:254, `disc`:273, `entrance_ramp`:285, `build`:297, `round_rail_mesh`:402, `hex_roof`:422, `shell`:465, `sign_frame`:593, `hub_doors`:602, `gate`:633, `nature`:657, `tree`:678, `tree_parts`:684, `landscape`:698, `walkway`:763, `habitats`:766, `recolor`:867, `spawn_animal`:876, `quest_markers`:921, `quest_point`:947, `now`:970, `today`:973, `day_number`:976, `feeding`:979, `rare_event`:986, `baby_dome`:993, `rank_index`:996, `rank_name`:1003, `reward`:1006, `achieve`:1013, `species_mask`:1019, `page_ready`:1026, `finish_passport`:1033, `claim_page`:1039, `spot`:1048, `start_quest`:1055, `quest_step`:1062, `coop_near`:1065, `advance_quest`:1074, `prompt`:1100, `dusk`:1111, `interact`:1114, `keeper`:1159, `keeper_here`:1168, `auto_keeper`:1172, `finish_keeper`:1176, `photo_target`:1210, `photo_capture`:1234, `tick`:1249, `tick_impl`:1261, `animate_animal`:1422, `reset_stick`:1494, `close_panel`:1501, `open_panel`:1507, `ui_label`:1532, `ui_button`:1540, `select_page`:1545, `forget_buttons`:1549, `refresh_panel`:1556, `smoke`:1610, `drive_body`:1941, `dome_shots`:1947, `screenshots`:1985, `backdrop`:2077, `walk_route`:2106, `rich_landscape`:2138, `planting_clear`:2197, `rain_ring`:2229, `gallery_points`:2256, `gallery_clear`:2267, `sky_gallery`:2288, `route_clear`:2313, `park_lamp`:2327, `rail`:2342, `build_corner_rails`:2346, `build_dome_loop`:2375, `quest_guide`:2413, `visitor_y`:2432, `add_visitor`:2441, `build_visitors`:2459, `tick_visitors`:2478, `door_point`:2529, `dome_signpost`:2532, `outside_signposts`:2563, `inside_signpost`:2576, `door_markers`:2585, `colonnade`:2603, `garden_ring`:2636, `glass_edge`:2668, `waterfall`:2676, `soft_mist`:2700, `ground_route`:2729, `ground_trails`:2744, `africa_lookout`:2756, `asia_route`:2777, `asia_rainwalk`:2786, `antarctic_route`:2816, `antarctic_spiral`:2825, `tree_fort`:2841, `floe_approach`:2851, `habitat_layers`:2870, `upper_animal`:2924, `high_habitat`:2961, `x_layer`:2980, `z_layer`:2984, `tall_tree`:2987, `phase2_pen`:2997, `phase2_route`:3001, `phase2_quest_point`:3012, `phase2_interact`:3033, `phase2_action`:3058, `phase2_landscape`:3071, `phase2_layers`:3170, `phase2_walkway`:3181, `sweep_join`:3188, `build_sweeps`:3216, `refined_coat`:3251, `profile_report`:3270, `profile_node_count`:3284, `profile_node`:3290, `rim_bevel`:3319, `collision_wall`:3351, `flush_guard_batches`:3361, `detail_index`:3377, `register_walk`:3383, `register_deck`:3390, `project_segment`:3399, `surface_distance`:3404, `finish_guards`:3418, `inside_pen`:3458, `open_path_point`:3465, `safety_net`:3484, `can_fly`:3509, `record_scenery`:3513, `scenery_aabb`:3522, `clear_scenery_bounds`:3530, `resolve_scenery`:3578, `register_habitats`:3635, `unload_detail`:3664, `load_dome`:3697, `activate_dome`:3742, `capture_exterior`:3762, `campus_surface`:3770, `build_open_paths`:3774, `build_garden_edges`:3801, `foliage_mesh`:3846, `small_foliage_texture`:3874, `apply_dome_quality`:3890, `restore_dome_quality`:3903, `profile_audio`:3911, `assign_feeding_slots`:3921, `feeding_target`:3932, `visitor_stage_route`:3947, `path_floor`:3962, `flush_walk_meshes`:3970, `reserve`:4043, `reserve_zone`:4046, `path_arms`:4052, `africa_path_nodes`:4055, `africa_blob`:4061, `africa_ramp_y`:4072, `reserve_station`:4075, `reserve_tree`:4079, `reserve_build`:4088, `path_clear`:4183, `reserve_zone_props`:4189, `africa_zone_props`:4207, `reserve_wow`:4232, `africa_path_segs`:4285, `africa_path_dist`:4294, `reserve_detail`:4304, `africa_shots`:4390

### game/worlds.gd (414 lines, 26 funcs)

Functions: `relic_count`:101, `sky_open`:108, `in_sky`:111, `sky_portal_pos`:114, `build_sky`:117, `enter_sky`:204, `sky_prompt`:215, `sky_interact`:227, `_init`:250, `_set_dry`:256, `build_hub`:261, `current`:286, `player_in_world`:295, `near_hub`:300, `prompt`:306, `interact`:318, `busy`:334, `enter`:340, `go_home`:345, `go_portal`:355, `tick`:363, `sealed_count`:379, `check_seal_bonus`:386, `save_state`:397, `load_state`:404, `summary`:411

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

