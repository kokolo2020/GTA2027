# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (34393 lines, 1233 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-590 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 591-663 | v0.34.6: futuristic towers for the old city | 1 |
| 664-742 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 743-803 | v0.34.4: futuristic road surface | 2 |
| 804-2009 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 2010-2493 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2494-2666 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2667-3182 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3183-3237 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3238-3340 | v0.11.0: online police vs thief | 4 |
| 3341-4284 | v0.10.0: chase mode (offline) | 38 |
| 4285-4966 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4967-5085 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5086-5123 | v0.30.1: nothing to collect stands in a road | 4 |
| 5124-5263 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5264-5631 | v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5632-6131 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6132-6382 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6383-6878 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6879-7172 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7173-8689 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 38 |
| 8690-10911 | v0.5.0: original synthesized radio and ambient pedestrians | 35 |
| 10912-11560 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11561-11664 | old city and Bay details | 1 |
| 11665-12074 | traffic | 10 |
| 12075-12427 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12428-12685 | camera views | 9 |
| 12686-12933 | v0.17.0: level-up celebration | 8 |
| 12934-13053 | v0.18.0: walk-in stadium | 5 |
| 13054-13215 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13216-13401 | checkpoints | 9 |
| 13402-13669 | v0.18.0: Harbor Dome social hub | 2 |
| 13670-13720 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 13721-14044 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 14045-14200 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14201-14449 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 14450-14664 | people: sitting pose, bots, bubbles, emotes | 6 |
| 14665-14783 | seats | 6 |
| 14784-14940 | game panel | 7 |
| 14941-15061 | tic-tac-toe | 7 |
| 15062-15113 | rock paper scissors | 4 |
| 15114-15196 | online table messages | 2 |
| 15197-15272 | comedy show | 4 |
| 15273-16172 | quick chat and emotes | 26 |
| 16173-16335 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 16336-16576 | v0.18.2: nickname and HUD relayout | 12 |
| 16577-16864 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 16865-16974 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 16975-17302 | circuit geometry | 12 |
| 17303-17400 | race car rental | 5 |
| 17401-17415 | speed effects | 2 |
| 17416-17466 | track helpers | 5 |
| 17467-17703 | events | 11 |
| 17704-17756 | boosters and spikes | 4 |
| 17757-17814 | online races | 2 |
| 17815-18170 | raceway panel, HUD, board | 10 |
| 18171-18378 | v0.22.0: Call Car | 6 |
| 18379-18679 | v0.23: RUN toggle and fast travel between districts | 13 |
| 18680-18753 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 18754-19190 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 19191-19682 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 19683-19833 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 19834-19868 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 19869-20183 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 20184-20505 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 20506-20820 | v0.36: the daily puzzle | 17 |
| 20821-21009 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 21010-21382 | building blocks | 23 |
| 21383-21884 | building | 16 |
| 21885-22040 | garden planting | 11 |
| 22041-22448 | the four layouts | 4 |
| 22449-22719 | animals | 8 |
| 22720-22849 | animation, spotting and rewards | 6 |
| 22850-23367 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 23368-23521 | your look: apply, save, share | 9 |
| 23522-23949 | stores and the wardrobe | 23 |
| 23950-24417 | HARBOR GALLERIA: the shopping mall | 14 |
| 24418-24569 | featured outfits and the Sky Run | 7 |
| 24570-24666 | v0.41: THE SKY GARDEN | 5 |
| 24667-24804 | building | 5 |
| 24805-24985 | plants | 6 |
| 24986-25105 | interacting | 7 |
| 25106-25349 | the garden screen | 9 |
| 25350-25388 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 25389-25420 | album | 2 |
| 25421-25472 | season | 6 |
| 25473-25480 | Harbor Night | 1 |
| 25481-25512 | check-in calendar | 1 |
| 25513-25689 | the panel | 8 |
| 25690-25904 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 25905-26328 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 26329-26570 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 26571-26749 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 26750-26786 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 26787-26883 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 26884-27175 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 27176-27276 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 27277-27600 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 27601-27711 | v0.24.2: road map (for moving people off the road) | 8 |
| 27712-28007 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 28008-28202 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 28203-28843 | Harbor Loop sky train | 27 |
| 28844-29181 | Day and night | 9 |
| 29182-29817 | v0.27 smoke test and screenshots | 2 |
| 29818-30234 | v0.27: Harbor International Airport (north of the city) | 10 |
| 30235-30748 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 30749-30909 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 30910-31006 | the Directions panel and chip | 7 |
| 31007-31548 | v0.44: Grand Central | 16 |
| 31549-31840 | v0.44: filling the empty land | 8 |
| 31841-31875 | v0.45: hover car underglow | 1 |
| 31876-32040 | v0.46: what is inside the Grand Central shops | 1 |
| 32041-32072 | v0.47: street stalls downtown | 2 |
| 32073-32171 | v0.48: places that open as you level up | 6 |
| 32172-32216 | v0.50: city careers | 5 |
| 32217-32267 | v0.52: careers as clear job loops | 3 |
| 32268-32275 | taxi | 1 |
| 32276-32279 | paramedic | 0 |
| 32280-32284 | police | 1 |
| 32285-32290 | firefighter | 1 |
| 32291-32300 | the step bar | 2 |
| 32301-32327 | cut scenes | 1 |
| 32328-32332 | siren | 0 |
| 32333-32344 | the Careers panel | 3 |
| 32345-32768 | v0.50: homes | 17 |
| 32769-33104 | decorating | 7 |
| 33105-33239 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 33240-33673 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 33674-33712 | v0.51.1: join and leave messages | 3 |
| 33713-33977 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 33978-34276 | v0.51.3: stream joiners | 9 |
| 34277-34393 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 595-5620 |
| `_nearest_*` |  | 9 | 1243-16610 |
| `_car_*` |  | 7 | 1408-31844 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2011-16234 |
| `_shop_*` | Marina Heights shops | 9 | 2624-15860 |
| `_bus_*` | Airport Line and city buses | 14 | 2668-26861 |
| `_level_*` | player levels | 7 | 3194-12799 |
| `_chase_*` | police chase mode | 11 | 3342-3589 |
| `_quest_*` | quests | 8 | 5170-19805 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5510-28822 |
| `_crew_*` | crews | 6 | 5699-6037 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5755-23938 |
| `_social_*` | friends, invites | 8 | 5803-6261 |
| `_soc_*` | social extras | 8 | 5842-6135 |
| `_c4_*` | Connect Four | 9 | 6476-6592 |
| `_rx_*` | Reaction Duel | 6 | 6619-6694 |
| `_quiz_*` | party quiz | 9 | 6942-7139 |
| `_ach_*` | achievements | 8 | 7360-23933 |
| `_radio_*` | radio and ambience | 8 | 8694-8858 |
| `_smoke_*` | smoke tests | 46 | 9106-34340 |
| `_shot_*` | screenshot modes | 8 | 10894-33812 |
| `_hub_*` | Harbor Dome hub | 12 | 13460-16841 |
| `_lux_*` |  | 12 | 13864-13993 |
| `_ttt_*` | tic-tac-toe | 7 | 14944-15035 |
| `_chat_*` |  | 10 | 15412-15787 |
| `_sg_*` | Sky Garden | 28 | 16123-25219 |
| `_rw_*` | Raceway | 30 | 16990-17918 |
| `_crate_*` | starter crate | 8 | 18774-19095 |
| `_quick_*` | quick quests | 11 | 19232-19541 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 19886-23474 |
| `_pz_*` | daily puzzle | 10 | 20529-20697 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 20883-24385 |
| `_ga_*` | Galleria mall | 13 | 23986-24497 |
| `_season_*` | season pass | 6 | 25422-25454 |
| `_lb_*` | leaderboard | 10 | 25795-25858 |
| `_ds_*` | digital signs | 6 | 26361-26522 |
| `_treasure_*` | treasure hunt | 10 | 26902-27161 |
| `_fm_*` | Find Me | 11 | 27298-27471 |
| `_ap_*` | Harbor Airport | 7 | 30028-30148 |
| `_nav_*` | walker nav grids | 9 | 30249-30495 |
| `_dir_*` | Directions panel | 7 | 30784-30980 |
| `_gc_*` | Grand Central | 9 | 31036-31877 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 32197-34194 |
| `_home_*` | homes | 21 | 32385-33184 |
| `_ch_*` | chapters | 6 | 33303-33350 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:292, `_apply_car`:1369, `_collider`:1627, `_level`:3212, `_input`:7674, `_physics_process`:7775, `_refresh_hud`:8142, `_toggle_menu`:8318, `_show_toast`:8392, `_save_progress`:8396, `_load_progress`:8486, `_process`:8871, `_blocked_at`:10066, `_blocker`:10081, `_apply_view`:12481, `_place_lock_of`:32086

World builders (`_build_*`): `_build_world`:1048, `_build_collectibles`:1182, `_build_bay`:1484, `_build_north`:1754, `_build_nm_blocks`:1871, `_build_north_landscape`:1956, `_build_landscape`:1993, `_build_bus`:2674, `_build_marina`:2821, `_build_hat`:2930, `_build_ridge`:3777, `_build_panels`:4046, `_build_player`:4206, `_build_car`:4244, `_build_hud`:4732, `_build_quest_offer`:5140, `_build_future`:5305, `_build_neon`:5319, `_build_holograms`:5425, `_build_sky_traffic`:5492, `_build_social`:6056, `_build_dance_floor`:6235, `_build_arcade`:6425, `_build_arcade_panel`:6774, `_build_quiz`:6996, `_build_ach`:7495, `_build_peds`:8922, `_build_downtown`:11294, `_build_park`:11517, `_build_plaza`:11546, `_build_city_detail`:11562, `_build_traffic`:11666, `_build_minimap`:12214, `_build_view_controls`:12429, `_build_level_fx`:12697, `_build_stadium_walls`:12950, `_build_guidance`:13113, `_build_checkpoints`:13217, `_build_hub`:13464, `_build_hub_bots`:14476, `_build_game_panel`:14785, `_build_chat`:15295, `_build_feed`:16182, `_build_nick_panel`:16375, `_build_civic`:16676, `_build_raceway`:17076, `_build_rw_parking`:17110, `_build_rw_pits`:17155, `_build_rw_track`:17192, `_build_rw_trackside`:17233, `_build_raceway_ui`:17816, `_build_travel`:18400, `_build_qr`:18687, `_build_crate_ui`:18807, `_build_quick_props`:19343, `_build_quest_list`:19692, `_build_food_court`:20009, `_build_commons`:20242, `_build_puzzle_panel`:20666, `_build_biosphere`:21384, `_build_biosphere_legacy`:21388, `_build_style_panel`:23601, `_build_galleria`:24025, `_build_ga_fun`:24452, `_build_sky_garden`:24688, `_build_sg_panel`:25107, `_build_hp_panel`:25514, `_build_lb`:25740, `_build_market`:25929, `_build_gear`:26016, `_build_pet`:26069, `_build_market_panel`:26157, `_build_display`:26394, `_build_streamer`:26588, `_build_treasure_props`:26985, `_build_treasure`:27029, `_build_expansion`:27822, `_build_connect`:28049, `_build_skytrain`:28388, `_build_airport`:29852, `_build_signposts`:30807, `_build_dir_panel`:30911, `_build_grand_central`:31269, `_build_gc_towers`:31437, `_build_fill`:31618, `_build_gardens`:31686, `_build_fan_plaza`:31796, `_build_street_stalls`:32045, `_build_place_signs`:32103, `_build_career_panel`:32334, `_build_homes`:32400, `_build_home_panels`:32770, `_build_chapters_ui`:33442


## Smoke tests in main.gd

- `_smoke_test` line 9106
- `_smoke_chase` line 9748
- `_smoke_orole` line 9781
- `_smoke_levels` line 9810
- `_smoke_bus` line 9851
- `_smoke_chase_extras` line 9936
- `_smoke_marina` line 9964
- `_smoke_radio_peds` line 10106
- `_smoke_typed_chat` line 10176
- `_smoke_cafe` line 10195
- `_smoke_boutique` line 10221
- `_smoke_models` line 10249
- `_smoke_garage_ridge` line 10273
- `_smoke_downtown` line 11917
- `_smoke_views` line 12625
- `_smoke_level_fx` line 12900
- `_smoke_stadium_eye` line 12987
- `_smoke_guidance_checkpoints` line 13326
- `_smoke_hub` line 15613
- `_smoke_nick` line 16496
- `_smoke_sites_reachable` line 16546
- `_smoke_raceway` line 17952
- `_smoke_follow_call` line 18273
- `_smoke_travel` line 18554
- `_smoke_qr` line 18747
- `_smoke_crate` line 19047
- `_smoke_quick` line 19574
- `_smoke_quests` line 19808
- `_smoke_chat` line 20738
- `_smoke_feet` line 20776
- `_smoke_commons` line 20797
- `_smoke_biosphere` line 22846
- `_smoke_style` line 23108
- `_smoke_car_barriers` line 25225
- `_smoke_sky_garden` line 25266
- `_smoke_pass` line 25627
- `_smoke_treasure` line 27234
- `_smoke_findme` line 27527
- `_smoke_v27` line 29183
- `_smoke_airport` line 30191
- `_smoke_strollers` line 30633
- `_smoke_careers_homes` line 32895
- `_smoke_chapters` line 33528
- `_smoke_photo` line 33884
- `_smoke_stream_join` line 34111
- `_smoke_streamer_clean` line 34340

## Other scripts

### game/autoplay.gd (333 lines, 19 funcs)

Functions: `_init`:37, `_ready`:40, `goto`:50, `steer`:57, `watchdog`:78, `ready_to_play`:96, `_physics_process`:99, `start_dome_route`:154, `walk_route_tick`:167, `on_enter`:179, `dome_quest_tick`:195, `prepare_station`:218, `station_tick`:228, `wait_tick`:247, `ride_tick`:261, `arrive_city`:277, `pick_wander`:294, `city_tick`:299, `shot_tick`:324

### game/cafe.gd (609 lines, 28 funcs)

Sections: 281 the lounge: a big partitioned hang-out area with booth bays (white, porthole screens, glowing strips); 406 interaction; 475 ordering

Functions: `_init`:40, `rng_f`:44, `lp`:48, `prop`:51, `solid`:62, `glass`:71, `tangent_box`:80, `build_cafe`:85, `build_lounge`:282, `in_lounge`:376, `counter_spot`:379, `holding_cup`:383, `build_cup`:387, `tint_cup`:395, `near`:407, `button_text`:412, `hour_number`:415, `special_index`:418, `price_of`:421, `speed_mult`:425, `_process`:428, `build_panel`:476, `open`:500, `close`:506, `refresh`:510, `player_name`:550, `pick`:554, `finish_order`:574

### game/careers.gd (1231 lines, 64 funcs)

Functions: `_init`:7, `_career_rank`:10, `_career_rank_name`:17, `_career_mult`:20, `_career_spots`:23, `_career_pick`:51, `_career_block_reason`:62, `_career_start`:75, `_career_lights`:94, `_career_lights_off`:109, `_career_end`:118, `_career_clear_job`:134, `_cid`:147, `_career_place_name`:150, `_career_tag`:162, `_career_person`:179, `_cj_pp`:206, `_cj_anim`:209, `_cj_pose`:215, `_cj_pose_tick`:240, `_cj_hands_up`:245, `_cj_face`:248, `_career_fire`:254, `_career_next`:318, `_career_target`:356, `_career_pay`:366, `_career_rank_line`:374, `_career_job_done`:380, `_career_job_failed`:399, `_career_tick`:407, `_taxi_meter`:469, `_taxi_tip`:489, `_cs_taxi_pickup`:495, `_taxi_seat`:528, `_cs_taxi_dropoff`:540, `_stretcher`:584, `_cs_medic_load`:596, `_cs_medic_unload`:635, `_cs_police_radio`:666, `_career_chase_over`:679, `_fire_aimed`:722, `_fire_hose_tick`:732, `_cs_fire_out`:789, `_career_bar_build`:818, `_career_steps_bbcode`:848, `_career_bar_text`:862, `_career_bar_tick`:891, `_career_hud`:908, `_cs_play`:915, `_cs_tick`:929, `_cs_skip`:946, `_cs_finish`:952, `_cs_side_cam`:968, `_cs_cam`:987, `_cs_ui`:1001, `_cs_caption`:1052, `_cs_mirror`:1071, `_siren_sound`:1118, `_siren`:1140, `_build_career_panel`:1153, `_open_careers`:1192, `_career_ach_line`:1210, `_career_close`:1225, `_career_end_close`:1229

### game/dome_quests.gd (524 lines, 30 funcs)

Sections: 141 state; 193 rewards; 305 3D gift boxes

Functions: `_init`:62, `today`:65, `done_count`:68, `gift_count`:75, `gift_pos`:82, `gift_pay`:87, `total_today`:90, `quest_pos`:98, `progress`:119, `_bits`:134, `new_day`:142, `save_state`:160, `load_state`:176, `pay`:194, `award`:206, `take_gift`:222, `cafe_order`:237, `cafe_check`:244, `check_at`:257, `build_presents`:306, `refresh_presents`:344, `build`:349, `in_dome`:380, `refresh_ui`:383, `draw`:390, `guide`:409, `open`:416, `close`:422, `_process`:426, `selftest`:459

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

### game/road_barrier.gd (314 lines, 18 funcs)

Sections: 167 finding the road; 260 safety net; 288 checks

Functions: `_init`:25, `in_zone`:28, `_inside`:36, `on_road`:40, `_in_gap`:46, `_solid_cell`:52, `build`:63, `_emit`:117, `_visuals`:127, `nearest_road`:168, `road_dist`:186, `cp_car`:190, `_free_road_spot`:196, `call_car_spot`:208, `kerb_spot`:215, `rescue`:261, `tick`:270, `smoke`:289

### game/sun_dome.gd (183 lines, 8 funcs)

Functions: `_init`:19, `pt`:25, `rib`:28, `multimesh`:39, `spin`:52, `part`:57, `build`:60, `build_core`:148

### game/world_biosphere.gd (4362 lines, 184 funcs)

Sections: 2935 0.55.0: three new continents, stable appended animal and quest IDs.; 3257 0.55.1: continuous floor transitions, protected paths and rescue.; 3934 0.55.11: open reserve layout shared by all seven domes. No pens: every species roams a big open habitat

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:241, `flush`:254, `disc`:273, `entrance_ramp`:285, `build`:297, `round_rail_mesh`:401, `hex_roof`:421, `shell`:464, `sign_frame`:592, `hub_doors`:601, `gate`:632, `nature`:656, `tree`:677, `tree_parts`:683, `landscape`:697, `walkway`:762, `habitats`:765, `recolor`:866, `spawn_animal`:875, `quest_markers`:920, `quest_point`:946, `now`:969, `today`:972, `day_number`:975, `feeding`:978, `rare_event`:985, `baby_dome`:992, `rank_index`:995, `rank_name`:1002, `reward`:1005, `achieve`:1012, `species_mask`:1018, `page_ready`:1025, `finish_passport`:1032, `claim_page`:1038, `spot`:1047, `start_quest`:1054, `quest_step`:1061, `coop_near`:1064, `advance_quest`:1073, `prompt`:1099, `dusk`:1110, `interact`:1113, `keeper`:1158, `keeper_here`:1167, `auto_keeper`:1171, `finish_keeper`:1175, `photo_target`:1209, `photo_capture`:1233, `tick`:1248, `tick_impl`:1260, `animate_animal`:1421, `reset_stick`:1493, `close_panel`:1500, `open_panel`:1506, `ui_label`:1531, `ui_button`:1539, `select_page`:1544, `forget_buttons`:1548, `refresh_panel`:1555, `smoke`:1609, `drive_body`:1940, `dome_shots`:1946, `screenshots`:1984, `backdrop`:2063, `walk_route`:2092, `rich_landscape`:2124, `planting_clear`:2183, `rain_ring`:2215, `gallery_points`:2242, `gallery_clear`:2253, `sky_gallery`:2274, `route_clear`:2299, `build_dome_loop`:2313, `quest_guide`:2352, `visitor_y`:2371, `add_visitor`:2380, `build_visitors`:2398, `tick_visitors`:2417, `door_point`:2468, `dome_signpost`:2471, `outside_signposts`:2502, `inside_signpost`:2515, `door_markers`:2524, `colonnade`:2542, `garden_ring`:2575, `glass_edge`:2607, `waterfall`:2615, `soft_mist`:2639, `ground_route`:2668, `ground_trails`:2683, `africa_lookout`:2695, `asia_route`:2716, `asia_rainwalk`:2725, `antarctic_route`:2755, `antarctic_spiral`:2764, `tree_fort`:2780, `floe_approach`:2790, `habitat_layers`:2809, `upper_animal`:2863, `high_habitat`:2900, `x_layer`:2919, `z_layer`:2923, `tall_tree`:2926, `phase2_pen`:2936, `phase2_route`:2940, `phase2_quest_point`:2951, `phase2_interact`:2972, `phase2_action`:2997, `phase2_landscape`:3010, `phase2_layers`:3109, `phase2_walkway`:3120, `sweep_join`:3127, `build_sweeps`:3155, `refined_coat`:3190, `profile_report`:3209, `profile_node_count`:3223, `profile_node`:3229, `rim_bevel`:3258, `collision_wall`:3290, `flush_guard_batches`:3300, `detail_index`:3316, `register_walk`:3322, `register_deck`:3329, `project_segment`:3338, `surface_distance`:3343, `finish_guards`:3357, `inside_pen`:3397, `open_path_point`:3404, `safety_net`:3423, `can_fly`:3448, `record_scenery`:3452, `scenery_aabb`:3461, `clear_scenery_bounds`:3469, `resolve_scenery`:3517, `register_habitats`:3574, `unload_detail`:3603, `load_dome`:3636, `activate_dome`:3681, `capture_exterior`:3701, `campus_surface`:3709, `build_open_paths`:3713, `build_garden_edges`:3740, `foliage_mesh`:3781, `small_foliage_texture`:3809, `apply_dome_quality`:3825, `restore_dome_quality`:3838, `profile_audio`:3846, `assign_feeding_slots`:3856, `feeding_target`:3867, `visitor_stage_route`:3882, `path_floor`:3897, `flush_walk_meshes`:3905, `reserve`:3978, `reserve_zone`:3981, `path_arms`:3987, `africa_path_nodes`:3990, `africa_blob`:3996, `africa_ramp_y`:4007, `reserve_station`:4010, `reserve_tree`:4014, `reserve_build`:4023, `path_clear`:4118, `reserve_zone_props`:4124, `africa_zone_props`:4142, `reserve_wow`:4167, `africa_path_segs`:4220, `africa_path_dist`:4229, `reserve_detail`:4239, `africa_shots`:4325

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

