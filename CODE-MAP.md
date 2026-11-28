# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (35372 lines, 1260 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-626 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 627-699 | v0.34.6: futuristic towers for the old city | 1 |
| 700-778 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 779-839 | v0.34.4: futuristic road surface | 2 |
| 840-2048 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 2049-2537 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2538-2710 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2711-3229 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3230-3284 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3285-3387 | v0.11.0: online police vs thief | 4 |
| 3388-4336 | v0.10.0: chase mode (offline) | 38 |
| 4337-5021 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 5022-5140 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5141-5178 | v0.30.1: nothing to collect stands in a road | 4 |
| 5179-5318 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5319-5686 | v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5687-6186 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6187-6437 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6438-6933 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6934-7227 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7228-8821 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 39 |
| 8822-11454 | v0.5.0: original synthesized radio and ambient pedestrians | 41 |
| 11455-12103 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 12104-12207 | old city and Bay details | 1 |
| 12208-12617 | traffic | 10 |
| 12618-12985 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12986-13266 | camera views | 10 |
| 13267-13514 | v0.17.0: level-up celebration | 8 |
| 13515-13636 | v0.18.0: walk-in stadium | 5 |
| 13637-13798 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13799-13984 | checkpoints | 9 |
| 13985-14263 | v0.18.0: Harbor Dome social hub | 2 |
| 14264-14314 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 14315-14638 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 14639-14794 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14795-15043 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 15044-15258 | people: sitting pose, bots, bubbles, emotes | 6 |
| 15259-15377 | seats | 6 |
| 15378-15534 | game panel | 7 |
| 15535-15655 | tic-tac-toe | 7 |
| 15656-15707 | rock paper scissors | 4 |
| 15708-15790 | online table messages | 2 |
| 15791-15866 | comedy show | 4 |
| 15867-16766 | quick chat and emotes | 26 |
| 16767-16932 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 16933-17174 | v0.18.2: nickname and HUD relayout | 12 |
| 17175-17462 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 17463-17572 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 17573-17900 | circuit geometry | 12 |
| 17901-17998 | race car rental | 5 |
| 17999-18013 | speed effects | 2 |
| 18014-18064 | track helpers | 5 |
| 18065-18301 | events | 11 |
| 18302-18354 | boosters and spikes | 4 |
| 18355-18412 | online races | 2 |
| 18413-18768 | raceway panel, HUD, board | 10 |
| 18769-18976 | v0.22.0: Call Car | 6 |
| 18977-19434 | v0.23: RUN toggle and fast travel between districts | 25 |
| 19435-19508 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 19509-19945 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 19946-20437 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 20438-20588 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 20589-20623 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 20624-20938 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 20939-21260 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 21261-21575 | v0.36: the daily puzzle | 17 |
| 21576-21764 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 21765-22137 | building blocks | 23 |
| 22138-22639 | building | 16 |
| 22640-22795 | garden planting | 11 |
| 22796-23203 | the four layouts | 4 |
| 23204-23474 | animals | 8 |
| 23475-23608 | animation, spotting and rewards | 6 |
| 23609-24126 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 24127-24280 | your look: apply, save, share | 9 |
| 24281-24708 | stores and the wardrobe | 23 |
| 24709-25176 | HARBOR GALLERIA: the shopping mall | 14 |
| 25177-25328 | featured outfits and the Sky Run | 7 |
| 25329-25425 | v0.41: THE SKY GARDEN | 5 |
| 25426-25563 | building | 5 |
| 25564-25744 | plants | 6 |
| 25745-25864 | interacting | 7 |
| 25865-26108 | the garden screen | 9 |
| 26109-26147 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 26148-26179 | album | 2 |
| 26180-26231 | season | 6 |
| 26232-26239 | Harbor Night | 1 |
| 26240-26271 | check-in calendar | 1 |
| 26272-26448 | the panel | 8 |
| 26449-26680 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 16 |
| 26681-27239 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 18 |
| 27240-27484 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 27485-27663 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 27664-27700 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 27701-27797 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 27798-28089 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 28090-28190 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 28191-28514 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 28515-28625 | v0.24.2: road map (for moving people off the road) | 8 |
| 28626-28921 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 28922-29116 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 29117-29784 | Harbor Loop sky train | 27 |
| 29785-30158 | Day and night | 11 |
| 30159-30796 | v0.27 smoke test and screenshots | 2 |
| 30797-31213 | v0.27: Harbor International Airport (north of the city) | 10 |
| 31214-31727 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 31728-31888 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 31889-31985 | the Directions panel and chip | 7 |
| 31986-32527 | v0.44: Grand Central | 16 |
| 32528-32819 | v0.44: filling the empty land | 8 |
| 32820-32854 | v0.45: hover car underglow | 1 |
| 32855-33019 | v0.46: what is inside the Grand Central shops | 1 |
| 33020-33051 | v0.47: street stalls downtown | 2 |
| 33052-33150 | v0.48: places that open as you level up | 6 |
| 33151-33195 | v0.50: city careers | 5 |
| 33196-33246 | v0.52: careers as clear job loops | 3 |
| 33247-33254 | taxi | 1 |
| 33255-33258 | paramedic | 0 |
| 33259-33263 | police | 1 |
| 33264-33269 | firefighter | 1 |
| 33270-33279 | the step bar | 2 |
| 33280-33306 | cut scenes | 1 |
| 33307-33311 | siren | 0 |
| 33312-33323 | the Careers panel | 3 |
| 33324-33747 | v0.50: homes | 17 |
| 33748-34083 | decorating | 7 |
| 34084-34218 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 34219-34652 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 34653-34691 | v0.51.1: join and leave messages | 3 |
| 34692-34956 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 34957-35255 | v0.51.3: stream joiners | 9 |
| 35256-35372 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 631-5675 |
| `_nearest_*` |  | 9 | 1282-17208 |
| `_car_*` |  | 7 | 1447-32823 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2050-16828 |
| `_shop_*` | Marina Heights shops | 9 | 2668-16454 |
| `_bus_*` | Airport Line and city buses | 14 | 2712-27775 |
| `_level_*` | player levels | 7 | 3241-13380 |
| `_chase_*` | police chase mode | 11 | 3389-3636 |
| `_quest_*` | quests | 8 | 5225-20560 |
| `_sky_*` | Harbor Loop sky train, sky look | 32 | 5565-29763 |
| `_crew_*` | crews | 6 | 5754-6092 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5810-24697 |
| `_social_*` | friends, invites | 8 | 5858-6316 |
| `_soc_*` | social extras | 8 | 5897-6190 |
| `_c4_*` | Connect Four | 9 | 6531-6647 |
| `_rx_*` | Reaction Duel | 6 | 6674-6749 |
| `_quiz_*` | party quiz | 9 | 6997-7194 |
| `_ach_*` | achievements | 8 | 7415-24692 |
| `_radio_*` | radio and ambience | 8 | 8826-8990 |
| `_smoke_*` | smoke tests | 47 | 9238-35319 |
| `_shot_*` | screenshot modes | 8 | 11437-34791 |
| `_hub_*` | Harbor Dome hub | 12 | 14043-17439 |
| `_lux_*` |  | 12 | 14458-14587 |
| `_ttt_*` | tic-tac-toe | 7 | 15538-15629 |
| `_chat_*` |  | 10 | 16006-16381 |
| `_sg_*` | Sky Garden | 28 | 16717-25978 |
| `_rw_*` | Raceway | 30 | 17588-18516 |
| `_crate_*` | starter crate | 8 | 19529-19850 |
| `_quick_*` | quick quests | 11 | 19987-20296 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 20641-24233 |
| `_pz_*` | daily puzzle | 10 | 21284-21452 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 21638-25144 |
| `_ga_*` | Galleria mall | 13 | 24745-25256 |
| `_season_*` | season pass | 6 | 26181-26213 |
| `_lb_*` | leaderboard | 11 | 26557-26634 |
| `_ds_*` | digital signs | 6 | 27272-27434 |
| `_treasure_*` | treasure hunt | 10 | 27816-28075 |
| `_fm_*` | Find Me | 11 | 28212-28385 |
| `_ap_*` | Harbor Airport | 7 | 31007-31127 |
| `_nav_*` | walker nav grids | 9 | 31228-31474 |
| `_dir_*` | Directions panel | 7 | 31763-31959 |
| `_gc_*` | Grand Central | 9 | 32015-32856 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 33176-35173 |
| `_home_*` | homes | 21 | 33364-34163 |
| `_ch_*` | chapters | 6 | 34282-34329 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:298, `_apply_car`:1408, `_collider`:1666, `_level`:3259, `_input`:7729, `_physics_process`:7865, `_refresh_hud`:8245, `_toggle_menu`:8431, `_show_toast`:8509, `_save_progress`:8513, `_load_progress`:8610, `_process`:9003, `_blocked_at`:10209, `_blocker`:10224, `_apply_view`:13054, `_place_lock_of`:33065

World builders (`_build_*`): `_build_world`:1084, `_build_collectibles`:1221, `_build_bay`:1523, `_build_north`:1793, `_build_nm_blocks`:1910, `_build_north_landscape`:1995, `_build_landscape`:2032, `_build_bus`:2718, `_build_marina`:2865, `_build_hat`:2977, `_build_ridge`:3824, `_build_panels`:4098, `_build_player`:4258, `_build_car`:4296, `_build_hud`:4784, `_build_quest_offer`:5195, `_build_future`:5360, `_build_neon`:5374, `_build_holograms`:5480, `_build_sky_traffic`:5547, `_build_social`:6111, `_build_dance_floor`:6290, `_build_arcade`:6480, `_build_arcade_panel`:6829, `_build_quiz`:7051, `_build_ach`:7550, `_build_peds`:9054, `_build_downtown`:11837, `_build_park`:12060, `_build_plaza`:12089, `_build_city_detail`:12105, `_build_traffic`:12209, `_build_minimap`:12772, `_build_view_controls`:12987, `_build_level_fx`:13278, `_build_stadium_walls`:13531, `_build_guidance`:13696, `_build_checkpoints`:13800, `_build_hub`:14047, `_build_hub_bots`:15070, `_build_game_panel`:15379, `_build_chat`:15889, `_build_feed`:16776, `_build_nick_panel`:16972, `_build_civic`:17274, `_build_raceway`:17674, `_build_rw_parking`:17708, `_build_rw_pits`:17753, `_build_rw_track`:17790, `_build_rw_trackside`:17831, `_build_raceway_ui`:18414, `_build_travel`:19023, `_build_qr`:19442, `_build_crate_ui`:19562, `_build_quick_props`:20098, `_build_quest_list`:20447, `_build_food_court`:20764, `_build_commons`:20997, `_build_puzzle_panel`:21421, `_build_biosphere`:22139, `_build_biosphere_legacy`:22143, `_build_style_panel`:24360, `_build_galleria`:24784, `_build_ga_fun`:25211, `_build_sky_garden`:25447, `_build_sg_panel`:25866, `_build_hp_panel`:26273, `_build_lb`:26499, `_build_market`:26705, `_build_gear`:26794, `_build_pet`:26868, `_build_market_panel`:27068, `_build_display`:27305, `_build_streamer`:27502, `_build_treasure_props`:27899, `_build_treasure`:27943, `_build_expansion`:28736, `_build_connect`:28963, `_build_skytrain`:29302, `_build_airport`:30831, `_build_signposts`:31786, `_build_dir_panel`:31890, `_build_grand_central`:32248, `_build_gc_towers`:32416, `_build_fill`:32597, `_build_gardens`:32665, `_build_fan_plaza`:32775, `_build_street_stalls`:33024, `_build_place_signs`:33082, `_build_career_panel`:33313, `_build_homes`:33379, `_build_home_panels`:33749, `_build_chapters_ui`:34421


## Smoke tests in main.gd

- `_smoke_test` line 9238
- `_smoke_chase` line 9891
- `_smoke_orole` line 9924
- `_smoke_levels` line 9953
- `_smoke_bus` line 9994
- `_smoke_chase_extras` line 10079
- `_smoke_marina` line 10107
- `_smoke_radio_peds` line 10249
- `_smoke_typed_chat` line 10319
- `_smoke_chat_touch` line 10338
- `_smoke_cafe` line 10359
- `_smoke_boutique` line 10385
- `_smoke_models` line 10413
- `_smoke_garage_ridge` line 10437
- `_smoke_downtown` line 12460
- `_smoke_views` line 13204
- `_smoke_level_fx` line 13481
- `_smoke_stadium_eye` line 13568
- `_smoke_guidance_checkpoints` line 13909
- `_smoke_hub` line 16207
- `_smoke_nick` line 17094
- `_smoke_sites_reachable` line 17144
- `_smoke_raceway` line 18550
- `_smoke_follow_call` line 18871
- `_smoke_travel` line 19309
- `_smoke_qr` line 19502
- `_smoke_crate` line 19802
- `_smoke_quick` line 20329
- `_smoke_quests` line 20563
- `_smoke_chat` line 21493
- `_smoke_feet` line 21531
- `_smoke_commons` line 21552
- `_smoke_biosphere` line 23605
- `_smoke_style` line 23867
- `_smoke_car_barriers` line 25984
- `_smoke_sky_garden` line 26025
- `_smoke_pass` line 26386
- `_smoke_treasure` line 28148
- `_smoke_findme` line 28441
- `_smoke_v27` line 30160
- `_smoke_airport` line 31170
- `_smoke_strollers` line 31612
- `_smoke_careers_homes` line 33874
- `_smoke_chapters` line 34507
- `_smoke_photo` line 34863
- `_smoke_stream_join` line 35090
- `_smoke_streamer_clean` line 35319

## Other scripts

### game/autoplay.gd (498 lines, 26 funcs)

Functions: `_init`:44, `_ready`:47, `goto`:57, `steer`:64, `watchdog`:85, `ready_to_play`:103, `_physics_process`:106, `clear_screen`:173, `force_travel`:186, `start_dome_route`:204, `walk_route_tick`:218, `on_enter`:230, `dome_quest_tick`:246, `prepare_station`:269, `station_tick`:279, `wait_tick`:298, `ride_tick`:312, `arrive_city`:328, `road_edge_dist`:350, `sidewalk_ok`:363, `path_clear`:371, `note_trail`:399, `novelty`:405, `pick_wander`:412, `city_tick`:453, `shot_tick`:489

### game/cafe.gd (618 lines, 28 funcs)

Sections: 281 the lounge: a big partitioned hang-out area with booth bays (white, porthole screens, glowing strips); 406 interaction; 484 ordering

Functions: `_init`:40, `rng_f`:44, `lp`:48, `prop`:51, `solid`:62, `glass`:71, `tangent_box`:80, `build_cafe`:85, `build_lounge`:282, `in_lounge`:376, `counter_spot`:379, `holding_cup`:383, `build_cup`:387, `tint_cup`:395, `near`:407, `button_text`:412, `hour_number`:415, `special_index`:418, `price_of`:421, `speed_mult`:425, `_process`:428, `build_panel`:485, `open`:509, `close`:515, `refresh`:519, `player_name`:559, `pick`:563, `finish_order`:583

### game/careers.gd (1231 lines, 64 funcs)

Functions: `_init`:7, `_career_rank`:10, `_career_rank_name`:17, `_career_mult`:20, `_career_spots`:23, `_career_pick`:51, `_career_block_reason`:62, `_career_start`:75, `_career_lights`:94, `_career_lights_off`:109, `_career_end`:118, `_career_clear_job`:134, `_cid`:147, `_career_place_name`:150, `_career_tag`:162, `_career_person`:179, `_cj_pp`:206, `_cj_anim`:209, `_cj_pose`:215, `_cj_pose_tick`:240, `_cj_hands_up`:245, `_cj_face`:248, `_career_fire`:254, `_career_next`:318, `_career_target`:356, `_career_pay`:366, `_career_rank_line`:374, `_career_job_done`:380, `_career_job_failed`:399, `_career_tick`:407, `_taxi_meter`:469, `_taxi_tip`:489, `_cs_taxi_pickup`:495, `_taxi_seat`:528, `_cs_taxi_dropoff`:540, `_stretcher`:584, `_cs_medic_load`:596, `_cs_medic_unload`:635, `_cs_police_radio`:666, `_career_chase_over`:679, `_fire_aimed`:722, `_fire_hose_tick`:732, `_cs_fire_out`:789, `_career_bar_build`:818, `_career_steps_bbcode`:848, `_career_bar_text`:862, `_career_bar_tick`:891, `_career_hud`:908, `_cs_play`:915, `_cs_tick`:929, `_cs_skip`:946, `_cs_finish`:952, `_cs_side_cam`:968, `_cs_cam`:987, `_cs_ui`:1001, `_cs_caption`:1052, `_cs_mirror`:1071, `_siren_sound`:1118, `_siren`:1140, `_build_career_panel`:1153, `_open_careers`:1192, `_career_ach_line`:1210, `_career_close`:1225, `_career_end_close`:1229

### game/cure.gd (1428 lines, 66 funcs)

Sections: 213 the infected that roam the city; 404 the cure gun; 621 boss music: an original loop, made in code a little each frame so nothing stutters; 746 every frame; 868 the boss; 1199 quest tracker rows; 1409 save

Functions: `_init`:115, `today`:120, `roll_day`:123, `boss_name`:132, `local`:135, `world`:138, `arena`:141, `arena_pos`:196, `players_here`:199, `power`:210, `bases`:214, `open_at`:223, `free_spot`:226, `add_zombie`:238, `populate`:256, `build_lair`:285, `make_sleeper`:340, `boss_dress`:350, `simple`:358, `despawn`:375, `targets`:401, `fire`:405, `add_charge`:438, `blast`:445, `blast_fx`:474, `hit_zombie`:496, `cure`:508, `check_quests`:547, `beam`:557, `tone`:582, `zap`:603, `roar`:606, `thunder`:611, `show_title`:615, `music_begin`:622, `music_score`:627, `music_step`:660, `music_play`:724, `music_stop`:737, `thud`:743, `tick`:747, `move_zombies`:789, `damage`:816, `die`:821, `tick_trapped`:829, `rescue`:846, `prompt`:869, `owns`:876, `interact`:879, `wake`:882, `call_help`:891, `send`:904, `net`:908, `boss_start`:928, `hit_boss`:993, `boss_tick`:1006, `boss_end`:1134, `goto_arena`:1193, `quest_items`:1200, `bar`:1233, `out_label`:1248, `build_hud`:1258, `hud`:1317, `set_sky`:1401, `save_state`:1410, `load_state`:1420

### game/daily.gd (227 lines, 18 funcs)

Functions: `_init`:33, `live`:36, `today`:40, `day_num`:43, `roll`:46, `check_in`:60, `bump`:87, `value`:95, `settle`:98, `tick`:121, `bump_quiet`:139, `summary`:146, `refresh`:159, `open`:163, `close`:169, `build`:173, `save_state`:201, `load_state`:212

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

### game/garden.gd (322 lines, 20 funcs)

Functions: `_init`:20, `_reset`:61, `_ground`:64, `_tint`:74, `_add`:78, `_flush`:82, `_ok`:105, `_dir`:114, `_build`:120, `_block`:154, `_plant`:173, `_round_tree`:186, `_palm`:201, `_banana`:217, `_papaya`:231, `_dragon`:243, `_melon`:255, `_rows`:263, `_grapes`:284, `_extras`:299

### game/garden_quests.gd (431 lines, 22 funcs)

Sections: 113 fruit on the ground; 209 picking and rewards; 375 save

Functions: `_init`:70, `in_garden`:73, `today`:76, `chain_done`:79, `current`:82, `title`:92, `qname`:101, `kinds_found`:106, `spot_in`:116, `clear_picks`:139, `add_pick`:145, `spawn`:175, `pay`:210, `pick`:220, `finish`:244, `fail_speed`:262, `build_hud`:271, `refresh`:304, `tick`:309, `save_state`:376, `load_state`:384, `selftest`:406

### game/horizon.gd (95 lines, 7 funcs)

Functions: `_init`:11, `_mat`:21, `_part`:28, `_sea`:37, `_mountains`:43, `_boats`:61, `tick`:85

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

### game/paris.gd (1144 lines, 60 funcs)

Sections: 103 helpers; 191 portals; 242 the district; 954 play

Functions: `_init`:83, `in_area`:104, `poly_area`:107, `to_poly`:114, `mm_boxes`:122, `seg_xf`:139, `beam_xf`:146, `finish`:155, `load_data`:181, `make_portal`:192, `label`:229, `ensure_built`:243, `build_ground`:279, `build_river`:289, `build_water`:332, `build_parks`:354, `build_roads`:381, `facade_details`:417, `dormers`:444, `prism`:455, `cap`:472, `build_buildings`:480, `in_building`:538, `build_trees`:555, `build_lamps`:641, `build_landmark`:689, `lm_radius`:702, `hw`:705, `build_tower`:708, `build_cafe`:762, `clue_world`:780, `build_mystery`:784, `update_clues`:805, `clue_text`:809, `found_clue`:812, `clue_count`:827, `submit_case`:834, `facing`:856, `panel`:860, `build_crossing`:872, `build_times`:901, `build_prang`:918, `build_statue`:942, `near`:955, `in_paris`:958, `lm_pos`:962, `prompt`:966, `busy`:984, `interact`:987, `move_player`:1010, `enter`:1018, `go_home`:1041, `order`:1048, `done_count`:1052, `roll_day`:1059, `pay`:1070, `award`:1083, `tick`:1096, `save_state`:1119, `load_state`:1132

### game/promo.gd (346 lines, 15 funcs)

Functions: `_init`:16, `_ready`:19, `_process`:24, `frames`:38, `smooth`:42, `mark`:45, `move`:48, `visitor`:59, `newest_only`:66, `me_say`:73, `say`:77, `emote`:86, `clear_cast`:93, `put_player`:102, `run`:109

### game/road_barrier.gd (314 lines, 18 funcs)

Sections: 167 finding the road; 260 safety net; 288 checks

Functions: `_init`:25, `in_zone`:28, `_inside`:36, `on_road`:40, `_in_gap`:46, `_solid_cell`:52, `build`:63, `_emit`:117, `_visuals`:127, `nearest_road`:168, `road_dist`:186, `cp_car`:190, `_free_road_spot`:196, `call_car_spot`:208, `kerb_spot`:215, `rescue`:261, `tick`:270, `smoke`:289

### game/sun_dome.gd (183 lines, 8 funcs)

Functions: `_init`:19, `pt`:25, `rib`:28, `multimesh`:39, `spin`:52, `part`:57, `build`:60, `build_core`:148

### game/tracker.gd (233 lines, 8 funcs)

Functions: `_init`:23, `build`:27, `place`:93, `set_open`:97, `collect`:102, `pick_default`:142, `rebuild_rows`:153, `tick`:189

### game/v72_check.gd (379 lines, 7 funcs)

Functions: `_init`:5, `ground_y`:8, `probe`:14, `run`:34, `frames`:68, `shots`:73, `checks`:147

### game/weather.gd (129 lines, 7 funcs)

Functions: `_init`:23, `_ready`:26, `_hash01`:36, `target`:39, `_build_drops`:58, `under_roof`:88, `_physics_process`:101

### game/world_biosphere.gd (4427 lines, 187 funcs)

Sections: 2996 0.55.0: three new continents, stable appended animal and quest IDs.; 3318 0.55.1: continuous floor transitions, protected paths and rescue.; 3999 0.55.11: open reserve layout shared by all seven domes. No pens: every species roams a big open habitat

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:241, `flush`:254, `disc`:273, `entrance_ramp`:285, `build`:297, `round_rail_mesh`:402, `hex_roof`:422, `shell`:465, `sign_frame`:593, `hub_doors`:602, `gate`:633, `nature`:657, `tree`:678, `tree_parts`:684, `landscape`:698, `walkway`:763, `habitats`:766, `recolor`:867, `spawn_animal`:876, `quest_markers`:921, `quest_point`:947, `now`:970, `today`:973, `day_number`:976, `feeding`:979, `rare_event`:986, `baby_dome`:993, `rank_index`:996, `rank_name`:1003, `reward`:1006, `achieve`:1013, `species_mask`:1019, `page_ready`:1026, `finish_passport`:1033, `claim_page`:1039, `spot`:1048, `start_quest`:1055, `quest_step`:1062, `coop_near`:1065, `advance_quest`:1074, `prompt`:1100, `dusk`:1111, `interact`:1114, `keeper`:1159, `keeper_here`:1168, `auto_keeper`:1172, `finish_keeper`:1176, `photo_target`:1210, `photo_capture`:1234, `tick`:1249, `tick_impl`:1261, `animate_animal`:1422, `reset_stick`:1494, `close_panel`:1501, `open_panel`:1507, `ui_label`:1532, `ui_button`:1540, `select_page`:1545, `forget_buttons`:1549, `refresh_panel`:1556, `smoke`:1610, `drive_body`:1941, `dome_shots`:1947, `screenshots`:1985, `backdrop`:2077, `walk_route`:2106, `rich_landscape`:2138, `planting_clear`:2197, `rain_ring`:2229, `gallery_points`:2256, `gallery_clear`:2267, `sky_gallery`:2288, `route_clear`:2313, `park_lamp`:2327, `rail`:2342, `build_corner_rails`:2346, `build_dome_loop`:2375, `quest_guide`:2413, `visitor_y`:2432, `add_visitor`:2441, `build_visitors`:2459, `tick_visitors`:2478, `door_point`:2529, `dome_signpost`:2532, `outside_signposts`:2563, `inside_signpost`:2576, `door_markers`:2585, `colonnade`:2603, `garden_ring`:2636, `glass_edge`:2668, `waterfall`:2676, `soft_mist`:2700, `ground_route`:2729, `ground_trails`:2744, `africa_lookout`:2756, `asia_route`:2777, `asia_rainwalk`:2786, `antarctic_route`:2816, `antarctic_spiral`:2825, `tree_fort`:2841, `floe_approach`:2851, `habitat_layers`:2870, `upper_animal`:2924, `high_habitat`:2961, `x_layer`:2980, `z_layer`:2984, `tall_tree`:2987, `phase2_pen`:2997, `phase2_route`:3001, `phase2_quest_point`:3012, `phase2_interact`:3033, `phase2_action`:3058, `phase2_landscape`:3071, `phase2_layers`:3170, `phase2_walkway`:3181, `sweep_join`:3188, `build_sweeps`:3216, `refined_coat`:3251, `profile_report`:3270, `profile_node_count`:3284, `profile_node`:3290, `rim_bevel`:3319, `collision_wall`:3351, `flush_guard_batches`:3361, `detail_index`:3377, `register_walk`:3383, `register_deck`:3390, `project_segment`:3399, `surface_distance`:3404, `finish_guards`:3418, `inside_pen`:3458, `open_path_point`:3465, `safety_net`:3484, `can_fly`:3509, `record_scenery`:3513, `scenery_aabb`:3522, `clear_scenery_bounds`:3530, `resolve_scenery`:3578, `register_habitats`:3635, `unload_detail`:3664, `load_dome`:3697, `activate_dome`:3742, `capture_exterior`:3762, `campus_surface`:3770, `build_open_paths`:3774, `build_garden_edges`:3801, `foliage_mesh`:3846, `small_foliage_texture`:3874, `apply_dome_quality`:3890, `restore_dome_quality`:3903, `profile_audio`:3911, `assign_feeding_slots`:3921, `feeding_target`:3932, `visitor_stage_route`:3947, `path_floor`:3962, `flush_walk_meshes`:3970, `reserve`:4043, `reserve_zone`:4046, `path_arms`:4052, `africa_path_nodes`:4055, `africa_blob`:4061, `africa_ramp_y`:4072, `reserve_station`:4075, `reserve_tree`:4079, `reserve_build`:4088, `path_clear`:4183, `reserve_zone_props`:4189, `africa_zone_props`:4207, `reserve_wow`:4232, `africa_path_segs`:4285, `africa_path_dist`:4294, `reserve_detail`:4304, `africa_shots`:4390

### game/worlds.gd (696 lines, 31 funcs)

Sections: 506 v0.72: calls for help and the boss channel

Functions: `relic_count`:108, `sky_open`:115, `in_sky`:118, `sky_portal_pos`:121, `build_sky`:124, `enter_sky`:211, `sky_prompt`:222, `sky_interact`:234, `_init`:257, `_set_dry`:264, `build_hub`:269, `current`:457, `player_in_world`:466, `near_hub`:471, `gate_tick`:475, `players_in`:507, `net_msg`:519, `join_call`:553, `live_line`:570, `prompt`:578, `interact`:590, `busy`:606, `enter`:612, `go_home`:617, `go_portal`:627, `tick`:636, `sealed_count`:653, `check_seal_bonus`:660, `save_state`:671, `load_state`:678, `summary`:685

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

