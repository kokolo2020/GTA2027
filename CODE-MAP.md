# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (33084 lines, 1193 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-573 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 574-646 | v0.34.6: futuristic towers for the old city | 1 |
| 647-725 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 726-786 | v0.34.4: futuristic road surface | 2 |
| 787-1992 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 1993-2472 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2473-2645 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2646-3161 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3162-3216 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3217-3319 | v0.11.0: online police vs thief | 4 |
| 3320-4263 | v0.10.0: chase mode (offline) | 38 |
| 4264-4930 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4931-5049 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5050-5087 | v0.30.1: nothing to collect stands in a road | 4 |
| 5088-5227 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5228-5595 | v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5596-6095 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6096-6346 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6347-6842 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6843-7136 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7137-8615 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 38 |
| 8616-10759 | v0.5.0: original synthesized radio and ambient pedestrians | 32 |
| 10760-11408 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11409-11512 | old city and Bay details | 1 |
| 11513-11922 | traffic | 10 |
| 11923-12275 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12276-12533 | camera views | 9 |
| 12534-12781 | v0.17.0: level-up celebration | 8 |
| 12782-12901 | v0.18.0: walk-in stadium | 5 |
| 12902-13063 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13064-13249 | checkpoints | 9 |
| 13250-13525 | v0.18.0: Harbor Dome social hub | 3 |
| 13526-13733 | people: sitting pose, bots, bubbles, emotes | 6 |
| 13734-13852 | seats | 6 |
| 13853-14009 | game panel | 7 |
| 14010-14130 | tic-tac-toe | 7 |
| 14131-14182 | rock paper scissors | 4 |
| 14183-14265 | online table messages | 2 |
| 14266-14341 | comedy show | 4 |
| 14342-14880 | quick chat and emotes | 16 |
| 14881-15043 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 15044-15284 | v0.18.2: nickname and HUD relayout | 12 |
| 15285-15572 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 15573-15682 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 15683-16010 | circuit geometry | 12 |
| 16011-16108 | race car rental | 5 |
| 16109-16123 | speed effects | 2 |
| 16124-16174 | track helpers | 5 |
| 16175-16411 | events | 11 |
| 16412-16464 | boosters and spikes | 4 |
| 16465-16522 | online races | 2 |
| 16523-16878 | raceway panel, HUD, board | 10 |
| 16879-17086 | v0.22.0: Call Car | 6 |
| 17087-17386 | v0.23: RUN toggle and fast travel between districts | 13 |
| 17387-17460 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 17461-17897 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 17898-18389 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 18390-18540 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 18541-18575 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 18576-18890 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 18891-19205 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 19206-19520 | v0.36: the daily puzzle | 17 |
| 19521-19709 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 19710-20082 | building blocks | 23 |
| 20083-20584 | building | 16 |
| 20585-20740 | garden planting | 11 |
| 20741-21148 | the four layouts | 4 |
| 21149-21419 | animals | 8 |
| 21420-21549 | animation, spotting and rewards | 6 |
| 21550-22067 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 22068-22216 | your look: apply, save, share | 9 |
| 22217-22644 | stores and the wardrobe | 23 |
| 22645-23112 | HARBOR GALLERIA: the shopping mall | 14 |
| 23113-23264 | featured outfits and the Sky Run | 7 |
| 23265-23361 | v0.41: THE SKY GARDEN | 5 |
| 23362-23499 | building | 5 |
| 23500-23680 | plants | 6 |
| 23681-23800 | interacting | 7 |
| 23801-24044 | the garden screen | 9 |
| 24045-24083 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 24084-24115 | album | 2 |
| 24116-24167 | season | 6 |
| 24168-24175 | Harbor Night | 1 |
| 24176-24207 | check-in calendar | 1 |
| 24208-24384 | the panel | 8 |
| 24385-24599 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 24600-25023 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 25024-25265 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 25266-25444 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 25445-25481 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 25482-25578 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 25579-25870 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 25871-25971 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 25972-26295 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 26296-26406 | v0.24.2: road map (for moving people off the road) | 8 |
| 26407-26702 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 26703-26897 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 26898-27538 | Harbor Loop sky train | 27 |
| 27539-27876 | Day and night | 9 |
| 27877-28512 | v0.27 smoke test and screenshots | 2 |
| 28513-28929 | v0.27: Harbor International Airport (north of the city) | 10 |
| 28930-29443 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 29444-29604 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 29605-29701 | the Directions panel and chip | 7 |
| 29702-30243 | v0.44: Grand Central | 16 |
| 30244-30535 | v0.44: filling the empty land | 8 |
| 30536-30570 | v0.45: hover car underglow | 1 |
| 30571-30735 | v0.46: what is inside the Grand Central shops | 1 |
| 30736-30767 | v0.47: street stalls downtown | 2 |
| 30768-30866 | v0.48: places that open as you level up | 6 |
| 30867-30911 | v0.50: city careers | 5 |
| 30912-30962 | v0.52: careers as clear job loops | 3 |
| 30963-30970 | taxi | 1 |
| 30971-30974 | paramedic | 0 |
| 30975-30979 | police | 1 |
| 30980-30985 | firefighter | 1 |
| 30986-30995 | the step bar | 2 |
| 30996-31022 | cut scenes | 1 |
| 31023-31027 | siren | 0 |
| 31028-31039 | the Careers panel | 3 |
| 31040-31463 | v0.50: homes | 17 |
| 31464-31798 | decorating | 7 |
| 31799-31933 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 31934-32364 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 32365-32403 | v0.51.1: join and leave messages | 3 |
| 32404-32668 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 32669-32967 | v0.51.3: stream joiners | 9 |
| 32968-33084 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 578-5584 |
| `_nearest_*` |  | 9 | 1226-15318 |
| `_car_*` |  | 6 | 1391-30539 |
| `_online_*` | Supabase realtime multiplayer | 23 | 1994-14942 |
| `_shop_*` | Marina Heights shops | 8 | 2603-3107 |
| `_bus_*` | Airport Line and city buses | 14 | 2647-25556 |
| `_level_*` | player levels | 7 | 3173-12647 |
| `_chase_*` | police chase mode | 11 | 3321-3568 |
| `_quest_*` | quests | 8 | 5134-18512 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5474-27517 |
| `_crew_*` | crews | 6 | 5663-6001 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5719-22633 |
| `_social_*` | friends, invites | 8 | 5767-6225 |
| `_soc_*` | social extras | 8 | 5806-6099 |
| `_c4_*` | Connect Four | 9 | 6440-6556 |
| `_rx_*` | Reaction Duel | 6 | 6583-6658 |
| `_quiz_*` | party quiz | 9 | 6906-7103 |
| `_ach_*` | achievements | 8 | 7324-22628 |
| `_radio_*` | radio and ambience | 8 | 8620-8784 |
| `_smoke_*` | smoke tests | 43 | 9030-33031 |
| `_shot_*` | screenshot modes | 8 | 10742-32503 |
| `_hub_*` | Harbor Dome hub | 7 | 13308-15549 |
| `_ttt_*` | tic-tac-toe | 7 | 14013-14104 |
| `_sg_*` | Sky Garden | 28 | 14831-23914 |
| `_rw_*` | Raceway | 30 | 15698-16626 |
| `_crate_*` | starter crate | 8 | 17481-17802 |
| `_quick_*` | quick quests | 11 | 17939-18248 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 18593-22169 |
| `_pz_*` | daily puzzle | 10 | 19229-19397 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 19583-23080 |
| `_ga_*` | Galleria mall | 13 | 22681-23192 |
| `_season_*` | season pass | 6 | 24117-24149 |
| `_lb_*` | leaderboard | 10 | 24490-24553 |
| `_ds_*` | digital signs | 6 | 25056-25217 |
| `_treasure_*` | treasure hunt | 10 | 25597-25856 |
| `_fm_*` | Find Me | 11 | 25993-26166 |
| `_ap_*` | Harbor Airport | 7 | 28723-28843 |
| `_nav_*` | walker nav grids | 9 | 28944-29190 |
| `_dir_*` | Directions panel | 7 | 29479-29675 |
| `_gc_*` | Grand Central | 9 | 29731-30572 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 30892-32885 |
| `_home_*` | homes | 21 | 31080-31878 |
| `_ch_*` | chapters | 6 | 31995-32042 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:292, `_apply_car`:1352, `_collider`:1610, `_level`:3191, `_input`:7638, `_physics_process`:7734, `_refresh_hud`:8092, `_toggle_menu`:8262, `_show_toast`:8334, `_save_progress`:8338, `_load_progress`:8421, `_process`:8797, `_blocked_at`:9987, `_blocker`:10002, `_apply_view`:12329, `_place_lock_of`:30781

World builders (`_build_*`): `_build_world`:1031, `_build_collectibles`:1165, `_build_bay`:1467, `_build_north`:1737, `_build_nm_blocks`:1854, `_build_north_landscape`:1939, `_build_landscape`:1976, `_build_bus`:2653, `_build_marina`:2800, `_build_hat`:2909, `_build_ridge`:3756, `_build_panels`:4025, `_build_player`:4185, `_build_car`:4223, `_build_hud`:4711, `_build_quest_offer`:5104, `_build_future`:5269, `_build_neon`:5283, `_build_holograms`:5389, `_build_sky_traffic`:5456, `_build_social`:6020, `_build_dance_floor`:6199, `_build_arcade`:6389, `_build_arcade_panel`:6738, `_build_quiz`:6960, `_build_ach`:7459, `_build_peds`:8846, `_build_downtown`:11142, `_build_park`:11365, `_build_plaza`:11394, `_build_city_detail`:11410, `_build_traffic`:11514, `_build_minimap`:12062, `_build_view_controls`:12277, `_build_level_fx`:12545, `_build_stadium_walls`:12798, `_build_guidance`:12961, `_build_checkpoints`:13065, `_build_hub`:13312, `_build_hub_bots`:13552, `_build_game_panel`:13854, `_build_chat`:14359, `_build_feed`:14890, `_build_nick_panel`:15083, `_build_civic`:15384, `_build_raceway`:15784, `_build_rw_parking`:15818, `_build_rw_pits`:15863, `_build_rw_track`:15900, `_build_rw_trackside`:15941, `_build_raceway_ui`:16524, `_build_travel`:17107, `_build_qr`:17394, `_build_crate_ui`:17514, `_build_quick_props`:18050, `_build_quest_list`:18399, `_build_food_court`:18716, `_build_commons`:18942, `_build_puzzle_panel`:19366, `_build_biosphere`:20084, `_build_biosphere_legacy`:20088, `_build_style_panel`:22296, `_build_galleria`:22720, `_build_ga_fun`:23147, `_build_sky_garden`:23383, `_build_sg_panel`:23802, `_build_hp_panel`:24209, `_build_lb`:24435, `_build_market`:24624, `_build_gear`:24711, `_build_pet`:24764, `_build_market_panel`:24852, `_build_display`:25089, `_build_streamer`:25283, `_build_treasure_props`:25680, `_build_treasure`:25724, `_build_expansion`:26517, `_build_connect`:26744, `_build_skytrain`:27083, `_build_airport`:28547, `_build_signposts`:29502, `_build_dir_panel`:29606, `_build_grand_central`:29964, `_build_gc_towers`:30132, `_build_fill`:30313, `_build_gardens`:30381, `_build_fan_plaza`:30491, `_build_street_stalls`:30740, `_build_place_signs`:30798, `_build_career_panel`:31029, `_build_homes`:31095, `_build_home_panels`:31465, `_build_chapters_ui`:32134


## Smoke tests in main.gd

- `_smoke_test` line 9030
- `_smoke_chase` line 9669
- `_smoke_orole` line 9702
- `_smoke_levels` line 9731
- `_smoke_bus` line 9772
- `_smoke_chase_extras` line 9857
- `_smoke_marina` line 9885
- `_smoke_radio_peds` line 10027
- `_smoke_models` line 10097
- `_smoke_garage_ridge` line 10121
- `_smoke_downtown` line 11765
- `_smoke_views` line 12473
- `_smoke_level_fx` line 12748
- `_smoke_stadium_eye` line 12835
- `_smoke_guidance_checkpoints` line 13174
- `_smoke_hub` line 14584
- `_smoke_nick` line 15204
- `_smoke_sites_reachable` line 15254
- `_smoke_raceway` line 16660
- `_smoke_follow_call` line 16981
- `_smoke_travel` line 17261
- `_smoke_qr` line 17454
- `_smoke_crate` line 17754
- `_smoke_quick` line 18281
- `_smoke_quests` line 18515
- `_smoke_chat` line 19438
- `_smoke_feet` line 19476
- `_smoke_commons` line 19497
- `_smoke_biosphere` line 21546
- `_smoke_style` line 21808
- `_smoke_car_barriers` line 23920
- `_smoke_sky_garden` line 23961
- `_smoke_pass` line 24322
- `_smoke_treasure` line 25929
- `_smoke_findme` line 26222
- `_smoke_v27` line 27878
- `_smoke_airport` line 28886
- `_smoke_strollers` line 29328
- `_smoke_careers_homes` line 31590
- `_smoke_chapters` line 32220
- `_smoke_photo` line 32575
- `_smoke_stream_join` line 32802
- `_smoke_streamer_clean` line 33031

## Other scripts

### game/autoplay.gd (335 lines, 19 funcs)

Functions: `_init`:37, `_ready`:40, `goto`:50, `steer`:57, `watchdog`:78, `ready_to_play`:96, `_physics_process`:99, `start_dome_route`:155, `walk_route_tick`:169, `on_enter`:181, `dome_quest_tick`:197, `prepare_station`:220, `station_tick`:230, `wait_tick`:249, `ride_tick`:263, `arrive_city`:279, `pick_wander`:296, `city_tick`:301, `shot_tick`:326

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

