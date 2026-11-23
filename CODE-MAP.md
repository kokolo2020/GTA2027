# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (33247 lines, 1197 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-576 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 577-649 | v0.34.6: futuristic towers for the old city | 1 |
| 650-728 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 729-789 | v0.34.4: futuristic road surface | 2 |
| 790-1995 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 1996-2475 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2476-2648 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2649-3164 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3165-3219 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3220-3322 | v0.11.0: online police vs thief | 4 |
| 3323-4266 | v0.10.0: chase mode (offline) | 38 |
| 4267-4936 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4937-5055 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5056-5093 | v0.30.1: nothing to collect stands in a road | 4 |
| 5094-5233 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5234-5601 | v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5602-6101 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6102-6352 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6353-6848 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6849-7142 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7143-8634 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 38 |
| 8635-10778 | v0.5.0: original synthesized radio and ambient pedestrians | 32 |
| 10779-11427 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11428-11531 | old city and Bay details | 1 |
| 11532-11941 | traffic | 10 |
| 11942-12294 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12295-12552 | camera views | 9 |
| 12553-12800 | v0.17.0: level-up celebration | 8 |
| 12801-12920 | v0.18.0: walk-in stadium | 5 |
| 12921-13082 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13083-13268 | checkpoints | 9 |
| 13269-13528 | v0.18.0: Harbor Dome social hub | 2 |
| 13529-13681 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 5 |
| 13682-13889 | people: sitting pose, bots, bubbles, emotes | 6 |
| 13890-14008 | seats | 6 |
| 14009-14165 | game panel | 7 |
| 14166-14286 | tic-tac-toe | 7 |
| 14287-14338 | rock paper scissors | 4 |
| 14339-14421 | online table messages | 2 |
| 14422-14497 | comedy show | 4 |
| 14498-15036 | quick chat and emotes | 16 |
| 15037-15199 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 15200-15440 | v0.18.2: nickname and HUD relayout | 12 |
| 15441-15728 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 15729-15838 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 15839-16166 | circuit geometry | 12 |
| 16167-16264 | race car rental | 5 |
| 16265-16279 | speed effects | 2 |
| 16280-16330 | track helpers | 5 |
| 16331-16567 | events | 11 |
| 16568-16620 | boosters and spikes | 4 |
| 16621-16678 | online races | 2 |
| 16679-17034 | raceway panel, HUD, board | 10 |
| 17035-17242 | v0.22.0: Call Car | 6 |
| 17243-17542 | v0.23: RUN toggle and fast travel between districts | 13 |
| 17543-17616 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 17617-18053 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 18054-18545 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 18546-18696 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 18697-18731 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 18732-19046 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 19047-19365 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 19366-19680 | v0.36: the daily puzzle | 17 |
| 19681-19869 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 19870-20242 | building blocks | 23 |
| 20243-20744 | building | 16 |
| 20745-20900 | garden planting | 11 |
| 20901-21308 | the four layouts | 4 |
| 21309-21579 | animals | 8 |
| 21580-21709 | animation, spotting and rewards | 6 |
| 21710-22227 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 22228-22376 | your look: apply, save, share | 9 |
| 22377-22804 | stores and the wardrobe | 23 |
| 22805-23272 | HARBOR GALLERIA: the shopping mall | 14 |
| 23273-23424 | featured outfits and the Sky Run | 7 |
| 23425-23521 | v0.41: THE SKY GARDEN | 5 |
| 23522-23659 | building | 5 |
| 23660-23840 | plants | 6 |
| 23841-23960 | interacting | 7 |
| 23961-24204 | the garden screen | 9 |
| 24205-24243 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 24244-24275 | album | 2 |
| 24276-24327 | season | 6 |
| 24328-24335 | Harbor Night | 1 |
| 24336-24367 | check-in calendar | 1 |
| 24368-24544 | the panel | 8 |
| 24545-24759 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 24760-25183 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 25184-25425 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 25426-25604 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 25605-25641 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 25642-25738 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 25739-26030 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 26031-26131 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 26132-26455 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 26456-26566 | v0.24.2: road map (for moving people off the road) | 8 |
| 26567-26862 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 26863-27057 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 27058-27698 | Harbor Loop sky train | 27 |
| 27699-28036 | Day and night | 9 |
| 28037-28672 | v0.27 smoke test and screenshots | 2 |
| 28673-29089 | v0.27: Harbor International Airport (north of the city) | 10 |
| 29090-29603 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 29604-29764 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 29765-29861 | the Directions panel and chip | 7 |
| 29862-30403 | v0.44: Grand Central | 16 |
| 30404-30695 | v0.44: filling the empty land | 8 |
| 30696-30730 | v0.45: hover car underglow | 1 |
| 30731-30895 | v0.46: what is inside the Grand Central shops | 1 |
| 30896-30927 | v0.47: street stalls downtown | 2 |
| 30928-31026 | v0.48: places that open as you level up | 6 |
| 31027-31071 | v0.50: city careers | 5 |
| 31072-31122 | v0.52: careers as clear job loops | 3 |
| 31123-31130 | taxi | 1 |
| 31131-31134 | paramedic | 0 |
| 31135-31139 | police | 1 |
| 31140-31145 | firefighter | 1 |
| 31146-31155 | the step bar | 2 |
| 31156-31182 | cut scenes | 1 |
| 31183-31187 | siren | 0 |
| 31188-31199 | the Careers panel | 3 |
| 31200-31623 | v0.50: homes | 17 |
| 31624-31959 | decorating | 7 |
| 31960-32094 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 32095-32527 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 32528-32566 | v0.51.1: join and leave messages | 3 |
| 32567-32831 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 32832-33130 | v0.51.3: stream joiners | 9 |
| 33131-33247 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 581-5590 |
| `_nearest_*` |  | 9 | 1229-15474 |
| `_car_*` |  | 6 | 1394-30699 |
| `_online_*` | Supabase realtime multiplayer | 23 | 1997-15098 |
| `_shop_*` | Marina Heights shops | 8 | 2606-3110 |
| `_bus_*` | Airport Line and city buses | 14 | 2650-25716 |
| `_level_*` | player levels | 7 | 3176-12666 |
| `_chase_*` | police chase mode | 11 | 3324-3571 |
| `_quest_*` | quests | 8 | 5140-18668 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5480-27677 |
| `_crew_*` | crews | 6 | 5669-6007 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5725-22793 |
| `_social_*` | friends, invites | 8 | 5773-6231 |
| `_soc_*` | social extras | 8 | 5812-6105 |
| `_c4_*` | Connect Four | 9 | 6446-6562 |
| `_rx_*` | Reaction Duel | 6 | 6589-6664 |
| `_quiz_*` | party quiz | 9 | 6912-7109 |
| `_ach_*` | achievements | 8 | 7330-22788 |
| `_radio_*` | radio and ambience | 8 | 8639-8803 |
| `_smoke_*` | smoke tests | 43 | 9049-33194 |
| `_shot_*` | screenshot modes | 8 | 10761-32666 |
| `_hub_*` | Harbor Dome hub | 8 | 13327-15705 |
| `_ttt_*` | tic-tac-toe | 7 | 14169-14260 |
| `_sg_*` | Sky Garden | 28 | 14987-24074 |
| `_rw_*` | Raceway | 30 | 15854-16782 |
| `_crate_*` | starter crate | 8 | 17637-17958 |
| `_quick_*` | quick quests | 11 | 18095-18404 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 18749-22329 |
| `_pz_*` | daily puzzle | 10 | 19389-19557 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 19743-23240 |
| `_ga_*` | Galleria mall | 13 | 22841-23352 |
| `_season_*` | season pass | 6 | 24277-24309 |
| `_lb_*` | leaderboard | 10 | 24650-24713 |
| `_ds_*` | digital signs | 6 | 25216-25377 |
| `_treasure_*` | treasure hunt | 10 | 25757-26016 |
| `_fm_*` | Find Me | 11 | 26153-26326 |
| `_ap_*` | Harbor Airport | 7 | 28883-29003 |
| `_nav_*` | walker nav grids | 9 | 29104-29350 |
| `_dir_*` | Directions panel | 7 | 29639-29835 |
| `_gc_*` | Grand Central | 9 | 29891-30732 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 31052-33048 |
| `_home_*` | homes | 21 | 31240-32039 |
| `_ch_*` | chapters | 6 | 32158-32205 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:292, `_apply_car`:1355, `_collider`:1613, `_level`:3194, `_input`:7644, `_physics_process`:7740, `_refresh_hud`:8101, `_toggle_menu`:8273, `_show_toast`:8345, `_save_progress`:8349, `_load_progress`:8435, `_process`:8816, `_blocked_at`:10006, `_blocker`:10021, `_apply_view`:12348, `_place_lock_of`:30941

World builders (`_build_*`): `_build_world`:1034, `_build_collectibles`:1168, `_build_bay`:1470, `_build_north`:1740, `_build_nm_blocks`:1857, `_build_north_landscape`:1942, `_build_landscape`:1979, `_build_bus`:2656, `_build_marina`:2803, `_build_hat`:2912, `_build_ridge`:3759, `_build_panels`:4028, `_build_player`:4188, `_build_car`:4226, `_build_hud`:4714, `_build_quest_offer`:5110, `_build_future`:5275, `_build_neon`:5289, `_build_holograms`:5395, `_build_sky_traffic`:5462, `_build_social`:6026, `_build_dance_floor`:6205, `_build_arcade`:6395, `_build_arcade_panel`:6744, `_build_quiz`:6966, `_build_ach`:7465, `_build_peds`:8865, `_build_downtown`:11161, `_build_park`:11384, `_build_plaza`:11413, `_build_city_detail`:11429, `_build_traffic`:11533, `_build_minimap`:12081, `_build_view_controls`:12296, `_build_level_fx`:12564, `_build_stadium_walls`:12817, `_build_guidance`:12980, `_build_checkpoints`:13084, `_build_hub`:13331, `_build_hub_bots`:13708, `_build_game_panel`:14010, `_build_chat`:14515, `_build_feed`:15046, `_build_nick_panel`:15239, `_build_civic`:15540, `_build_raceway`:15940, `_build_rw_parking`:15974, `_build_rw_pits`:16019, `_build_rw_track`:16056, `_build_rw_trackside`:16097, `_build_raceway_ui`:16680, `_build_travel`:17263, `_build_qr`:17550, `_build_crate_ui`:17670, `_build_quick_props`:18206, `_build_quest_list`:18555, `_build_food_court`:18872, `_build_commons`:19102, `_build_puzzle_panel`:19526, `_build_biosphere`:20244, `_build_biosphere_legacy`:20248, `_build_style_panel`:22456, `_build_galleria`:22880, `_build_ga_fun`:23307, `_build_sky_garden`:23543, `_build_sg_panel`:23962, `_build_hp_panel`:24369, `_build_lb`:24595, `_build_market`:24784, `_build_gear`:24871, `_build_pet`:24924, `_build_market_panel`:25012, `_build_display`:25249, `_build_streamer`:25443, `_build_treasure_props`:25840, `_build_treasure`:25884, `_build_expansion`:26677, `_build_connect`:26904, `_build_skytrain`:27243, `_build_airport`:28707, `_build_signposts`:29662, `_build_dir_panel`:29766, `_build_grand_central`:30124, `_build_gc_towers`:30292, `_build_fill`:30473, `_build_gardens`:30541, `_build_fan_plaza`:30651, `_build_street_stalls`:30900, `_build_place_signs`:30958, `_build_career_panel`:31189, `_build_homes`:31255, `_build_home_panels`:31625, `_build_chapters_ui`:32297


## Smoke tests in main.gd

- `_smoke_test` line 9049
- `_smoke_chase` line 9688
- `_smoke_orole` line 9721
- `_smoke_levels` line 9750
- `_smoke_bus` line 9791
- `_smoke_chase_extras` line 9876
- `_smoke_marina` line 9904
- `_smoke_radio_peds` line 10046
- `_smoke_models` line 10116
- `_smoke_garage_ridge` line 10140
- `_smoke_downtown` line 11784
- `_smoke_views` line 12492
- `_smoke_level_fx` line 12767
- `_smoke_stadium_eye` line 12854
- `_smoke_guidance_checkpoints` line 13193
- `_smoke_hub` line 14740
- `_smoke_nick` line 15360
- `_smoke_sites_reachable` line 15410
- `_smoke_raceway` line 16816
- `_smoke_follow_call` line 17137
- `_smoke_travel` line 17417
- `_smoke_qr` line 17610
- `_smoke_crate` line 17910
- `_smoke_quick` line 18437
- `_smoke_quests` line 18671
- `_smoke_chat` line 19598
- `_smoke_feet` line 19636
- `_smoke_commons` line 19657
- `_smoke_biosphere` line 21706
- `_smoke_style` line 21968
- `_smoke_car_barriers` line 24080
- `_smoke_sky_garden` line 24121
- `_smoke_pass` line 24482
- `_smoke_treasure` line 26089
- `_smoke_findme` line 26382
- `_smoke_v27` line 28038
- `_smoke_airport` line 29046
- `_smoke_strollers` line 29488
- `_smoke_careers_homes` line 31750
- `_smoke_chapters` line 32383
- `_smoke_photo` line 32738
- `_smoke_stream_join` line 32965
- `_smoke_streamer_clean` line 33194

## Other scripts

### game/autoplay.gd (335 lines, 19 funcs)

Functions: `_init`:37, `_ready`:40, `goto`:50, `steer`:57, `watchdog`:78, `ready_to_play`:96, `_physics_process`:99, `start_dome_route`:155, `walk_route_tick`:169, `on_enter`:181, `dome_quest_tick`:197, `prepare_station`:220, `station_tick`:230, `wait_tick`:249, `ride_tick`:263, `arrive_city`:279, `pick_wander`:296, `city_tick`:301, `shot_tick`:326

### game/careers.gd (1231 lines, 64 funcs)

Functions: `_init`:7, `_career_rank`:10, `_career_rank_name`:17, `_career_mult`:20, `_career_spots`:23, `_career_pick`:51, `_career_block_reason`:62, `_career_start`:75, `_career_lights`:94, `_career_lights_off`:109, `_career_end`:118, `_career_clear_job`:134, `_cid`:147, `_career_place_name`:150, `_career_tag`:162, `_career_person`:179, `_cj_pp`:206, `_cj_anim`:209, `_cj_pose`:215, `_cj_pose_tick`:240, `_cj_hands_up`:245, `_cj_face`:248, `_career_fire`:254, `_career_next`:318, `_career_target`:356, `_career_pay`:366, `_career_rank_line`:374, `_career_job_done`:380, `_career_job_failed`:399, `_career_tick`:407, `_taxi_meter`:469, `_taxi_tip`:489, `_cs_taxi_pickup`:495, `_taxi_seat`:528, `_cs_taxi_dropoff`:540, `_stretcher`:584, `_cs_medic_load`:596, `_cs_medic_unload`:635, `_cs_police_radio`:666, `_career_chase_over`:679, `_fire_aimed`:722, `_fire_hose_tick`:732, `_cs_fire_out`:789, `_career_bar_build`:818, `_career_steps_bbcode`:848, `_career_bar_text`:862, `_career_bar_tick`:891, `_career_hud`:908, `_cs_play`:915, `_cs_tick`:929, `_cs_skip`:946, `_cs_finish`:952, `_cs_side_cam`:968, `_cs_cam`:987, `_cs_ui`:1001, `_cs_caption`:1052, `_cs_mirror`:1071, `_siren_sound`:1118, `_siren`:1140, `_build_career_panel`:1153, `_open_careers`:1192, `_career_ach_line`:1210, `_career_close`:1225, `_career_end_close`:1229

### game/hourly_challenge.gd (385 lines, 24 funcs)

Sections: 77 puzzle generation (deterministic per hour); 228 panel; 340 sign + announcements

Functions: `_init`:31, `now_hour`:34, `secs_left`:37, `near`:40, `button_text`:46, `build_panel`:49, `neighbours`:78, `flip`:88, `make`:92, `is_done`:146, `tap`:159, `cycle`:175, `check`:181, `win`:205, `open`:229, `close`:240, `reset`:244, `style_btn`:251, `draw`:255, `reward_line`:297, `draw_code`:302, `refresh_sign`:341, `_process`:353, `selftest`:366

### game/hub_jokes.gd (102 lines, 0 funcs)

Functions: 

### game/natural_player_trial.gd (285 lines, 0 funcs)

Functions: 

### game/road_barrier.gd (314 lines, 18 funcs)

Sections: 167 finding the road; 260 safety net; 288 checks

Functions: `_init`:25, `in_zone`:28, `_inside`:36, `on_road`:40, `_in_gap`:46, `_solid_cell`:52, `build`:63, `_emit`:117, `_visuals`:127, `nearest_road`:168, `road_dist`:186, `cp_car`:190, `_free_road_spot`:196, `call_car_spot`:208, `kerb_spot`:215, `rescue`:261, `tick`:270, `smoke`:289

### game/sun_dome.gd (183 lines, 8 funcs)

Functions: `_init`:19, `pt`:25, `rib`:28, `multimesh`:39, `spin`:52, `part`:57, `build`:60, `build_core`:148

### game/world_biosphere.gd (4236 lines, 180 funcs)

Sections: 2809 0.55.0: three new continents, stable appended animal and quest IDs.; 3131 0.55.1: continuous floor transitions, protected paths and rescue.; 3808 0.55.11: open reserve layout shared by all seven domes. No pens: every species roams a big open habitat

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:242, `flush`:255, `disc`:274, `entrance_ramp`:286, `build`:298, `shell`:399, `hub_doors`:528, `gate`:554, `nature`:578, `tree`:599, `tree_parts`:605, `landscape`:619, `walkway`:684, `habitats`:687, `recolor`:788, `spawn_animal`:797, `quest_markers`:842, `quest_point`:868, `now`:891, `today`:894, `day_number`:897, `feeding`:900, `rare_event`:907, `baby_dome`:914, `rank_index`:917, `rank_name`:924, `reward`:927, `achieve`:934, `species_mask`:940, `page_ready`:947, `finish_passport`:954, `claim_page`:960, `spot`:969, `start_quest`:976, `quest_step`:983, `coop_near`:986, `advance_quest`:995, `prompt`:1021, `dusk`:1032, `interact`:1035, `keeper`:1080, `keeper_here`:1089, `auto_keeper`:1093, `finish_keeper`:1097, `photo_target`:1131, `photo_capture`:1155, `tick`:1170, `tick_impl`:1182, `animate_animal`:1339, `reset_stick`:1411, `close_panel`:1418, `open_panel`:1424, `ui_label`:1449, `ui_button`:1457, `select_page`:1462, `forget_buttons`:1466, `refresh_panel`:1473, `smoke`:1521, `drive_body`:1852, `screenshots`:1858, `backdrop`:1937, `walk_route`:1966, `rich_landscape`:1998, `planting_clear`:2057, `rain_ring`:2089, `gallery_points`:2116, `gallery_clear`:2127, `sky_gallery`:2148, `route_clear`:2173, `build_dome_loop`:2187, `quest_guide`:2226, `visitor_y`:2245, `add_visitor`:2254, `build_visitors`:2272, `tick_visitors`:2291, `door_point`:2342, `dome_signpost`:2345, `outside_signposts`:2376, `inside_signpost`:2389, `door_markers`:2398, `colonnade`:2416, `garden_ring`:2449, `glass_edge`:2481, `waterfall`:2489, `soft_mist`:2513, `ground_route`:2542, `ground_trails`:2557, `africa_lookout`:2569, `asia_route`:2590, `asia_rainwalk`:2599, `antarctic_route`:2629, `antarctic_spiral`:2638, `tree_fort`:2654, `floe_approach`:2664, `habitat_layers`:2683, `upper_animal`:2737, `high_habitat`:2774, `x_layer`:2793, `z_layer`:2797, `tall_tree`:2800, `phase2_pen`:2810, `phase2_route`:2814, `phase2_quest_point`:2825, `phase2_interact`:2846, `phase2_action`:2871, `phase2_landscape`:2884, `phase2_layers`:2983, `phase2_walkway`:2994, `sweep_join`:3001, `build_sweeps`:3029, `refined_coat`:3064, `profile_report`:3083, `profile_node_count`:3097, `profile_node`:3103, `rim_bevel`:3132, `collision_wall`:3164, `flush_guard_batches`:3174, `detail_index`:3190, `register_walk`:3196, `register_deck`:3203, `project_segment`:3212, `surface_distance`:3217, `finish_guards`:3231, `inside_pen`:3271, `open_path_point`:3278, `safety_net`:3297, `can_fly`:3322, `record_scenery`:3326, `scenery_aabb`:3335, `clear_scenery_bounds`:3343, `resolve_scenery`:3391, `register_habitats`:3448, `unload_detail`:3477, `load_dome`:3510, `activate_dome`:3555, `capture_exterior`:3575, `campus_surface`:3583, `build_open_paths`:3587, `build_garden_edges`:3614, `foliage_mesh`:3655, `small_foliage_texture`:3683, `apply_dome_quality`:3699, `restore_dome_quality`:3712, `profile_audio`:3720, `assign_feeding_slots`:3730, `feeding_target`:3741, `visitor_stage_route`:3756, `path_floor`:3771, `flush_walk_meshes`:3779, `reserve`:3852, `reserve_zone`:3855, `path_arms`:3861, `africa_path_nodes`:3864, `africa_blob`:3870, `africa_ramp_y`:3881, `reserve_station`:3884, `reserve_tree`:3888, `reserve_build`:3897, `path_clear`:3992, `reserve_zone_props`:3998, `africa_zone_props`:4016, `reserve_wow`:4041, `africa_path_segs`:4094, `africa_path_dist`:4103, `reserve_detail`:4113, `africa_shots`:4199

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

