# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (35080 lines, 1252 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-616 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 617-689 | v0.34.6: futuristic towers for the old city | 1 |
| 690-768 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 769-829 | v0.34.4: futuristic road surface | 2 |
| 830-2038 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 2039-2522 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2523-2695 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2696-3211 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3212-3266 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3267-3369 | v0.11.0: online police vs thief | 4 |
| 3370-4313 | v0.10.0: chase mode (offline) | 38 |
| 4314-4998 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4999-5117 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5118-5155 | v0.30.1: nothing to collect stands in a road | 4 |
| 5156-5295 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5296-5663 | v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5664-6163 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6164-6414 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6415-6910 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6911-7204 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7205-8782 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 39 |
| 8783-11351 | v0.5.0: original synthesized radio and ambient pedestrians | 39 |
| 11352-12000 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 12001-12104 | old city and Bay details | 1 |
| 12105-12514 | traffic | 10 |
| 12515-12875 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12876-13136 | camera views | 9 |
| 13137-13384 | v0.17.0: level-up celebration | 8 |
| 13385-13504 | v0.18.0: walk-in stadium | 5 |
| 13505-13666 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13667-13852 | checkpoints | 9 |
| 13853-14131 | v0.18.0: Harbor Dome social hub | 2 |
| 14132-14182 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 14183-14506 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 14507-14662 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14663-14911 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 14912-15126 | people: sitting pose, bots, bubbles, emotes | 6 |
| 15127-15245 | seats | 6 |
| 15246-15402 | game panel | 7 |
| 15403-15523 | tic-tac-toe | 7 |
| 15524-15575 | rock paper scissors | 4 |
| 15576-15658 | online table messages | 2 |
| 15659-15734 | comedy show | 4 |
| 15735-16634 | quick chat and emotes | 26 |
| 16635-16797 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 16798-17039 | v0.18.2: nickname and HUD relayout | 12 |
| 17040-17327 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 17328-17437 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 17438-17765 | circuit geometry | 12 |
| 17766-17863 | race car rental | 5 |
| 17864-17878 | speed effects | 2 |
| 17879-17929 | track helpers | 5 |
| 17930-18166 | events | 11 |
| 18167-18219 | boosters and spikes | 4 |
| 18220-18277 | online races | 2 |
| 18278-18633 | raceway panel, HUD, board | 10 |
| 18634-18841 | v0.22.0: Call Car | 6 |
| 18842-19299 | v0.23: RUN toggle and fast travel between districts | 25 |
| 19300-19373 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 19374-19810 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 19811-20302 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 20303-20453 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 20454-20488 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 20489-20803 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 20804-21125 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 21126-21440 | v0.36: the daily puzzle | 17 |
| 21441-21629 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 21630-22002 | building blocks | 23 |
| 22003-22504 | building | 16 |
| 22505-22660 | garden planting | 11 |
| 22661-23068 | the four layouts | 4 |
| 23069-23339 | animals | 8 |
| 23340-23471 | animation, spotting and rewards | 6 |
| 23472-23989 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 23990-24143 | your look: apply, save, share | 9 |
| 24144-24571 | stores and the wardrobe | 23 |
| 24572-25039 | HARBOR GALLERIA: the shopping mall | 14 |
| 25040-25191 | featured outfits and the Sky Run | 7 |
| 25192-25288 | v0.41: THE SKY GARDEN | 5 |
| 25289-25426 | building | 5 |
| 25427-25607 | plants | 6 |
| 25608-25727 | interacting | 7 |
| 25728-25971 | the garden screen | 9 |
| 25972-26010 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 26011-26042 | album | 2 |
| 26043-26094 | season | 6 |
| 26095-26102 | Harbor Night | 1 |
| 26103-26134 | check-in calendar | 1 |
| 26135-26311 | the panel | 8 |
| 26312-26526 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 26527-26950 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 26951-27192 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 27193-27371 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 27372-27408 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 27409-27505 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 27506-27797 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 27798-27898 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 27899-28222 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 28223-28333 | v0.24.2: road map (for moving people off the road) | 8 |
| 28334-28629 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 28630-28824 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 28825-29492 | Harbor Loop sky train | 27 |
| 29493-29866 | Day and night | 11 |
| 29867-30504 | v0.27 smoke test and screenshots | 2 |
| 30505-30921 | v0.27: Harbor International Airport (north of the city) | 10 |
| 30922-31435 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 31436-31596 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 31597-31693 | the Directions panel and chip | 7 |
| 31694-32235 | v0.44: Grand Central | 16 |
| 32236-32527 | v0.44: filling the empty land | 8 |
| 32528-32562 | v0.45: hover car underglow | 1 |
| 32563-32727 | v0.46: what is inside the Grand Central shops | 1 |
| 32728-32759 | v0.47: street stalls downtown | 2 |
| 32760-32858 | v0.48: places that open as you level up | 6 |
| 32859-32903 | v0.50: city careers | 5 |
| 32904-32954 | v0.52: careers as clear job loops | 3 |
| 32955-32962 | taxi | 1 |
| 32963-32966 | paramedic | 0 |
| 32967-32971 | police | 1 |
| 32972-32977 | firefighter | 1 |
| 32978-32987 | the step bar | 2 |
| 32988-33014 | cut scenes | 1 |
| 33015-33019 | siren | 0 |
| 33020-33031 | the Careers panel | 3 |
| 33032-33455 | v0.50: homes | 17 |
| 33456-33791 | decorating | 7 |
| 33792-33926 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 33927-34360 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 34361-34399 | v0.51.1: join and leave messages | 3 |
| 34400-34664 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 34665-34963 | v0.51.3: stream joiners | 9 |
| 34964-35080 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 621-5652 |
| `_nearest_*` |  | 9 | 1272-17073 |
| `_car_*` |  | 7 | 1437-32531 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2040-16696 |
| `_shop_*` | Marina Heights shops | 9 | 2653-16322 |
| `_bus_*` | Airport Line and city buses | 14 | 2697-27483 |
| `_level_*` | player levels | 7 | 3223-13250 |
| `_chase_*` | police chase mode | 11 | 3371-3618 |
| `_quest_*` | quests | 8 | 5202-20425 |
| `_sky_*` | Harbor Loop sky train, sky look | 30 | 5542-29471 |
| `_crew_*` | crews | 6 | 5731-6069 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5787-24560 |
| `_social_*` | friends, invites | 8 | 5835-6293 |
| `_soc_*` | social extras | 8 | 5874-6167 |
| `_c4_*` | Connect Four | 9 | 6508-6624 |
| `_rx_*` | Reaction Duel | 6 | 6651-6726 |
| `_quiz_*` | party quiz | 9 | 6974-7171 |
| `_ach_*` | achievements | 8 | 7392-24555 |
| `_radio_*` | radio and ambience | 8 | 8787-8951 |
| `_smoke_*` | smoke tests | 47 | 9199-35027 |
| `_shot_*` | screenshot modes | 8 | 11334-34499 |
| `_hub_*` | Harbor Dome hub | 12 | 13911-17304 |
| `_lux_*` |  | 12 | 14326-14455 |
| `_ttt_*` | tic-tac-toe | 7 | 15406-15497 |
| `_chat_*` |  | 10 | 15874-16249 |
| `_sg_*` | Sky Garden | 28 | 16585-25841 |
| `_rw_*` | Raceway | 30 | 17453-18381 |
| `_crate_*` | starter crate | 8 | 19394-19715 |
| `_quick_*` | quick quests | 11 | 19852-20161 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 20506-24096 |
| `_pz_*` | daily puzzle | 10 | 21149-21317 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 21503-25007 |
| `_ga_*` | Galleria mall | 13 | 24608-25119 |
| `_season_*` | season pass | 6 | 26044-26076 |
| `_lb_*` | leaderboard | 10 | 26417-26480 |
| `_ds_*` | digital signs | 6 | 26983-27144 |
| `_treasure_*` | treasure hunt | 10 | 27524-27783 |
| `_fm_*` | Find Me | 11 | 27920-28093 |
| `_ap_*` | Harbor Airport | 7 | 30715-30835 |
| `_nav_*` | walker nav grids | 9 | 30936-31182 |
| `_dir_*` | Directions panel | 7 | 31471-31667 |
| `_gc_*` | Grand Central | 9 | 31723-32564 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 32884-34881 |
| `_home_*` | homes | 21 | 33072-33871 |
| `_ch_*` | chapters | 6 | 33990-34037 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:298, `_apply_car`:1398, `_collider`:1656, `_level`:3241, `_input`:7706, `_physics_process`:7838, `_refresh_hud`:8210, `_toggle_menu`:8396, `_show_toast`:8474, `_save_progress`:8478, `_load_progress`:8573, `_process`:8964, `_blocked_at`:10170, `_blocker`:10185, `_apply_view`:12929, `_place_lock_of`:32773

World builders (`_build_*`): `_build_world`:1074, `_build_collectibles`:1211, `_build_bay`:1513, `_build_north`:1783, `_build_nm_blocks`:1900, `_build_north_landscape`:1985, `_build_landscape`:2022, `_build_bus`:2703, `_build_marina`:2850, `_build_hat`:2959, `_build_ridge`:3806, `_build_panels`:4075, `_build_player`:4235, `_build_car`:4273, `_build_hud`:4761, `_build_quest_offer`:5172, `_build_future`:5337, `_build_neon`:5351, `_build_holograms`:5457, `_build_sky_traffic`:5524, `_build_social`:6088, `_build_dance_floor`:6267, `_build_arcade`:6457, `_build_arcade_panel`:6806, `_build_quiz`:7028, `_build_ach`:7527, `_build_peds`:9015, `_build_downtown`:11734, `_build_park`:11957, `_build_plaza`:11986, `_build_city_detail`:12002, `_build_traffic`:12106, `_build_minimap`:12662, `_build_view_controls`:12877, `_build_level_fx`:13148, `_build_stadium_walls`:13401, `_build_guidance`:13564, `_build_checkpoints`:13668, `_build_hub`:13915, `_build_hub_bots`:14938, `_build_game_panel`:15247, `_build_chat`:15757, `_build_feed`:16644, `_build_nick_panel`:16837, `_build_civic`:17139, `_build_raceway`:17539, `_build_rw_parking`:17573, `_build_rw_pits`:17618, `_build_rw_track`:17655, `_build_rw_trackside`:17696, `_build_raceway_ui`:18279, `_build_travel`:18888, `_build_qr`:19307, `_build_crate_ui`:19427, `_build_quick_props`:19963, `_build_quest_list`:20312, `_build_food_court`:20629, `_build_commons`:20862, `_build_puzzle_panel`:21286, `_build_biosphere`:22004, `_build_biosphere_legacy`:22008, `_build_style_panel`:24223, `_build_galleria`:24647, `_build_ga_fun`:25074, `_build_sky_garden`:25310, `_build_sg_panel`:25729, `_build_hp_panel`:26136, `_build_lb`:26362, `_build_market`:26551, `_build_gear`:26638, `_build_pet`:26691, `_build_market_panel`:26779, `_build_display`:27016, `_build_streamer`:27210, `_build_treasure_props`:27607, `_build_treasure`:27651, `_build_expansion`:28444, `_build_connect`:28671, `_build_skytrain`:29010, `_build_airport`:30539, `_build_signposts`:31494, `_build_dir_panel`:31598, `_build_grand_central`:31956, `_build_gc_towers`:32124, `_build_fill`:32305, `_build_gardens`:32373, `_build_fan_plaza`:32483, `_build_street_stalls`:32732, `_build_place_signs`:32790, `_build_career_panel`:33021, `_build_homes`:33087, `_build_home_panels`:33457, `_build_chapters_ui`:34129


## Smoke tests in main.gd

- `_smoke_test` line 9199
- `_smoke_chase` line 9852
- `_smoke_orole` line 9885
- `_smoke_levels` line 9914
- `_smoke_bus` line 9955
- `_smoke_chase_extras` line 10040
- `_smoke_marina` line 10068
- `_smoke_radio_peds` line 10210
- `_smoke_typed_chat` line 10280
- `_smoke_chat_touch` line 10299
- `_smoke_cafe` line 10320
- `_smoke_boutique` line 10346
- `_smoke_models` line 10374
- `_smoke_garage_ridge` line 10398
- `_smoke_downtown` line 12357
- `_smoke_views` line 13076
- `_smoke_level_fx` line 13351
- `_smoke_stadium_eye` line 13438
- `_smoke_guidance_checkpoints` line 13777
- `_smoke_hub` line 16075
- `_smoke_nick` line 16959
- `_smoke_sites_reachable` line 17009
- `_smoke_raceway` line 18415
- `_smoke_follow_call` line 18736
- `_smoke_travel` line 19174
- `_smoke_qr` line 19367
- `_smoke_crate` line 19667
- `_smoke_quick` line 20194
- `_smoke_quests` line 20428
- `_smoke_chat` line 21358
- `_smoke_feet` line 21396
- `_smoke_commons` line 21417
- `_smoke_biosphere` line 23468
- `_smoke_style` line 23730
- `_smoke_car_barriers` line 25847
- `_smoke_sky_garden` line 25888
- `_smoke_pass` line 26249
- `_smoke_treasure` line 27856
- `_smoke_findme` line 28149
- `_smoke_v27` line 29868
- `_smoke_airport` line 30878
- `_smoke_strollers` line 31320
- `_smoke_careers_homes` line 33582
- `_smoke_chapters` line 34215
- `_smoke_photo` line 34571
- `_smoke_stream_join` line 34798
- `_smoke_streamer_clean` line 35027

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

