# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (34140 lines, 1224 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-582 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 583-655 | v0.34.6: futuristic towers for the old city | 1 |
| 656-734 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 735-795 | v0.34.4: futuristic road surface | 2 |
| 796-2001 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 2002-2481 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2482-2654 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2655-3170 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3171-3225 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3226-3328 | v0.11.0: online police vs thief | 4 |
| 3329-4272 | v0.10.0: chase mode (offline) | 38 |
| 4273-4950 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4951-5069 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5070-5107 | v0.30.1: nothing to collect stands in a road | 4 |
| 5108-5247 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5248-5615 | v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5616-6115 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6116-6366 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6367-6862 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6863-7156 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7157-8663 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 38 |
| 8664-10838 | v0.5.0: original synthesized radio and ambient pedestrians | 33 |
| 10839-11487 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11488-11591 | old city and Bay details | 1 |
| 11592-12001 | traffic | 10 |
| 12002-12354 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12355-12612 | camera views | 9 |
| 12613-12860 | v0.17.0: level-up celebration | 8 |
| 12861-12980 | v0.18.0: walk-in stadium | 5 |
| 12981-13142 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13143-13328 | checkpoints | 9 |
| 13329-13596 | v0.18.0: Harbor Dome social hub | 2 |
| 13597-13647 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 13648-13971 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 13972-14127 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14128-14376 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 14377-14584 | people: sitting pose, bots, bubbles, emotes | 6 |
| 14585-14703 | seats | 6 |
| 14704-14860 | game panel | 7 |
| 14861-14981 | tic-tac-toe | 7 |
| 14982-15033 | rock paper scissors | 4 |
| 15034-15116 | online table messages | 2 |
| 15117-15192 | comedy show | 4 |
| 15193-15921 | quick chat and emotes | 19 |
| 15922-16084 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 16085-16325 | v0.18.2: nickname and HUD relayout | 12 |
| 16326-16613 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 16614-16723 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 16724-17051 | circuit geometry | 12 |
| 17052-17149 | race car rental | 5 |
| 17150-17164 | speed effects | 2 |
| 17165-17215 | track helpers | 5 |
| 17216-17452 | events | 11 |
| 17453-17505 | boosters and spikes | 4 |
| 17506-17563 | online races | 2 |
| 17564-17919 | raceway panel, HUD, board | 10 |
| 17920-18127 | v0.22.0: Call Car | 6 |
| 18128-18427 | v0.23: RUN toggle and fast travel between districts | 13 |
| 18428-18501 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 18502-18938 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 18939-19430 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 19431-19581 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 19582-19616 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 19617-19931 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 19932-20252 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 20253-20567 | v0.36: the daily puzzle | 17 |
| 20568-20756 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 20757-21129 | building blocks | 23 |
| 21130-21631 | building | 16 |
| 21632-21787 | garden planting | 11 |
| 21788-22195 | the four layouts | 4 |
| 22196-22466 | animals | 8 |
| 22467-22596 | animation, spotting and rewards | 6 |
| 22597-23114 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 23115-23268 | your look: apply, save, share | 9 |
| 23269-23696 | stores and the wardrobe | 23 |
| 23697-24164 | HARBOR GALLERIA: the shopping mall | 14 |
| 24165-24316 | featured outfits and the Sky Run | 7 |
| 24317-24413 | v0.41: THE SKY GARDEN | 5 |
| 24414-24551 | building | 5 |
| 24552-24732 | plants | 6 |
| 24733-24852 | interacting | 7 |
| 24853-25096 | the garden screen | 9 |
| 25097-25135 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 25136-25167 | album | 2 |
| 25168-25219 | season | 6 |
| 25220-25227 | Harbor Night | 1 |
| 25228-25259 | check-in calendar | 1 |
| 25260-25436 | the panel | 8 |
| 25437-25651 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 25652-26075 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 26076-26317 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 26318-26496 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 26497-26533 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 26534-26630 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 26631-26922 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 26923-27023 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 27024-27347 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 27348-27458 | v0.24.2: road map (for moving people off the road) | 8 |
| 27459-27754 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 27755-27949 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 27950-28590 | Harbor Loop sky train | 27 |
| 28591-28928 | Day and night | 9 |
| 28929-29564 | v0.27 smoke test and screenshots | 2 |
| 29565-29981 | v0.27: Harbor International Airport (north of the city) | 10 |
| 29982-30495 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 30496-30656 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 30657-30753 | the Directions panel and chip | 7 |
| 30754-31295 | v0.44: Grand Central | 16 |
| 31296-31587 | v0.44: filling the empty land | 8 |
| 31588-31622 | v0.45: hover car underglow | 1 |
| 31623-31787 | v0.46: what is inside the Grand Central shops | 1 |
| 31788-31819 | v0.47: street stalls downtown | 2 |
| 31820-31918 | v0.48: places that open as you level up | 6 |
| 31919-31963 | v0.50: city careers | 5 |
| 31964-32014 | v0.52: careers as clear job loops | 3 |
| 32015-32022 | taxi | 1 |
| 32023-32026 | paramedic | 0 |
| 32027-32031 | police | 1 |
| 32032-32037 | firefighter | 1 |
| 32038-32047 | the step bar | 2 |
| 32048-32074 | cut scenes | 1 |
| 32075-32079 | siren | 0 |
| 32080-32091 | the Careers panel | 3 |
| 32092-32515 | v0.50: homes | 17 |
| 32516-32851 | decorating | 7 |
| 32852-32986 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 32987-33420 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 33421-33459 | v0.51.1: join and leave messages | 3 |
| 33460-33724 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 33725-34023 | v0.51.3: stream joiners | 9 |
| 34024-34140 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 587-5604 |
| `_nearest_*` |  | 9 | 1235-16359 |
| `_car_*` |  | 7 | 1400-31591 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2003-15983 |
| `_shop_*` | Marina Heights shops | 9 | 2612-15609 |
| `_bus_*` | Airport Line and city buses | 14 | 2656-26608 |
| `_level_*` | player levels | 7 | 3182-12726 |
| `_chase_*` | police chase mode | 11 | 3330-3577 |
| `_quest_*` | quests | 8 | 5154-19553 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5494-28569 |
| `_crew_*` | crews | 6 | 5683-6021 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5739-23685 |
| `_social_*` | friends, invites | 8 | 5787-6245 |
| `_soc_*` | social extras | 8 | 5826-6119 |
| `_c4_*` | Connect Four | 9 | 6460-6576 |
| `_rx_*` | Reaction Duel | 6 | 6603-6678 |
| `_quiz_*` | party quiz | 9 | 6926-7123 |
| `_ach_*` | achievements | 8 | 7344-23680 |
| `_radio_*` | radio and ambience | 8 | 8668-8832 |
| `_smoke_*` | smoke tests | 44 | 9080-34087 |
| `_shot_*` | screenshot modes | 8 | 10821-33559 |
| `_hub_*` | Harbor Dome hub | 12 | 13387-16590 |
| `_lux_*` |  | 12 | 13791-13920 |
| `_ttt_*` | tic-tac-toe | 7 | 14864-14955 |
| `_sg_*` | Sky Garden | 28 | 15872-24966 |
| `_rw_*` | Raceway | 30 | 16739-17667 |
| `_crate_*` | starter crate | 8 | 18522-18843 |
| `_quick_*` | quick quests | 11 | 18980-19289 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 19634-23221 |
| `_pz_*` | daily puzzle | 10 | 20276-20444 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 20630-24132 |
| `_ga_*` | Galleria mall | 13 | 23733-24244 |
| `_season_*` | season pass | 6 | 25169-25201 |
| `_lb_*` | leaderboard | 10 | 25542-25605 |
| `_ds_*` | digital signs | 6 | 26108-26269 |
| `_treasure_*` | treasure hunt | 10 | 26649-26908 |
| `_fm_*` | Find Me | 11 | 27045-27218 |
| `_ap_*` | Harbor Airport | 7 | 29775-29895 |
| `_nav_*` | walker nav grids | 9 | 29996-30242 |
| `_dir_*` | Directions panel | 7 | 30531-30727 |
| `_gc_*` | Grand Central | 9 | 30783-31624 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 31944-33941 |
| `_home_*` | homes | 21 | 32132-32931 |
| `_ch_*` | chapters | 6 | 33050-33097 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:292, `_apply_car`:1361, `_collider`:1619, `_level`:3200, `_input`:7658, `_physics_process`:7754, `_refresh_hud`:8118, `_toggle_menu`:8292, `_show_toast`:8366, `_save_progress`:8370, `_load_progress`:8460, `_process`:8845, `_blocked_at`:10038, `_blocker`:10053, `_apply_view`:12408, `_place_lock_of`:31833

World builders (`_build_*`): `_build_world`:1040, `_build_collectibles`:1174, `_build_bay`:1476, `_build_north`:1746, `_build_nm_blocks`:1863, `_build_north_landscape`:1948, `_build_landscape`:1985, `_build_bus`:2662, `_build_marina`:2809, `_build_hat`:2918, `_build_ridge`:3765, `_build_panels`:4034, `_build_player`:4194, `_build_car`:4232, `_build_hud`:4720, `_build_quest_offer`:5124, `_build_future`:5289, `_build_neon`:5303, `_build_holograms`:5409, `_build_sky_traffic`:5476, `_build_social`:6040, `_build_dance_floor`:6219, `_build_arcade`:6409, `_build_arcade_panel`:6758, `_build_quiz`:6980, `_build_ach`:7479, `_build_peds`:8896, `_build_downtown`:11221, `_build_park`:11444, `_build_plaza`:11473, `_build_city_detail`:11489, `_build_traffic`:11593, `_build_minimap`:12141, `_build_view_controls`:12356, `_build_level_fx`:12624, `_build_stadium_walls`:12877, `_build_guidance`:13040, `_build_checkpoints`:13144, `_build_hub`:13391, `_build_hub_bots`:14403, `_build_game_panel`:14705, `_build_chat`:15210, `_build_feed`:15931, `_build_nick_panel`:16124, `_build_civic`:16425, `_build_raceway`:16825, `_build_rw_parking`:16859, `_build_rw_pits`:16904, `_build_rw_track`:16941, `_build_rw_trackside`:16982, `_build_raceway_ui`:17565, `_build_travel`:18148, `_build_qr`:18435, `_build_crate_ui`:18555, `_build_quick_props`:19091, `_build_quest_list`:19440, `_build_food_court`:19757, `_build_commons`:19989, `_build_puzzle_panel`:20413, `_build_biosphere`:21131, `_build_biosphere_legacy`:21135, `_build_style_panel`:23348, `_build_galleria`:23772, `_build_ga_fun`:24199, `_build_sky_garden`:24435, `_build_sg_panel`:24854, `_build_hp_panel`:25261, `_build_lb`:25487, `_build_market`:25676, `_build_gear`:25763, `_build_pet`:25816, `_build_market_panel`:25904, `_build_display`:26141, `_build_streamer`:26335, `_build_treasure_props`:26732, `_build_treasure`:26776, `_build_expansion`:27569, `_build_connect`:27796, `_build_skytrain`:28135, `_build_airport`:29599, `_build_signposts`:30554, `_build_dir_panel`:30658, `_build_grand_central`:31016, `_build_gc_towers`:31184, `_build_fill`:31365, `_build_gardens`:31433, `_build_fan_plaza`:31543, `_build_street_stalls`:31792, `_build_place_signs`:31850, `_build_career_panel`:32081, `_build_homes`:32147, `_build_home_panels`:32517, `_build_chapters_ui`:33189


## Smoke tests in main.gd

- `_smoke_test` line 9080
- `_smoke_chase` line 9720
- `_smoke_orole` line 9753
- `_smoke_levels` line 9782
- `_smoke_bus` line 9823
- `_smoke_chase_extras` line 9908
- `_smoke_marina` line 9936
- `_smoke_radio_peds` line 10078
- `_smoke_boutique` line 10148
- `_smoke_models` line 10176
- `_smoke_garage_ridge` line 10200
- `_smoke_downtown` line 11844
- `_smoke_views` line 12552
- `_smoke_level_fx` line 12827
- `_smoke_stadium_eye` line 12914
- `_smoke_guidance_checkpoints` line 13253
- `_smoke_hub` line 15435
- `_smoke_nick` line 16245
- `_smoke_sites_reachable` line 16295
- `_smoke_raceway` line 17701
- `_smoke_follow_call` line 18022
- `_smoke_travel` line 18302
- `_smoke_qr` line 18495
- `_smoke_crate` line 18795
- `_smoke_quick` line 19322
- `_smoke_quests` line 19556
- `_smoke_chat` line 20485
- `_smoke_feet` line 20523
- `_smoke_commons` line 20544
- `_smoke_biosphere` line 22593
- `_smoke_style` line 22855
- `_smoke_car_barriers` line 24972
- `_smoke_sky_garden` line 25013
- `_smoke_pass` line 25374
- `_smoke_treasure` line 26981
- `_smoke_findme` line 27274
- `_smoke_v27` line 28930
- `_smoke_airport` line 29938
- `_smoke_strollers` line 30380
- `_smoke_careers_homes` line 32642
- `_smoke_chapters` line 33275
- `_smoke_photo` line 33631
- `_smoke_stream_join` line 33858
- `_smoke_streamer_clean` line 34087

## Other scripts

### game/autoplay.gd (335 lines, 19 funcs)

Functions: `_init`:37, `_ready`:40, `goto`:50, `steer`:57, `watchdog`:78, `ready_to_play`:96, `_physics_process`:99, `start_dome_route`:155, `walk_route_tick`:169, `on_enter`:181, `dome_quest_tick`:197, `prepare_station`:220, `station_tick`:230, `wait_tick`:249, `ride_tick`:263, `arrive_city`:279, `pick_wander`:296, `city_tick`:301, `shot_tick`:326

### game/careers.gd (1231 lines, 64 funcs)

Functions: `_init`:7, `_career_rank`:10, `_career_rank_name`:17, `_career_mult`:20, `_career_spots`:23, `_career_pick`:51, `_career_block_reason`:62, `_career_start`:75, `_career_lights`:94, `_career_lights_off`:109, `_career_end`:118, `_career_clear_job`:134, `_cid`:147, `_career_place_name`:150, `_career_tag`:162, `_career_person`:179, `_cj_pp`:206, `_cj_anim`:209, `_cj_pose`:215, `_cj_pose_tick`:240, `_cj_hands_up`:245, `_cj_face`:248, `_career_fire`:254, `_career_next`:318, `_career_target`:356, `_career_pay`:366, `_career_rank_line`:374, `_career_job_done`:380, `_career_job_failed`:399, `_career_tick`:407, `_taxi_meter`:469, `_taxi_tip`:489, `_cs_taxi_pickup`:495, `_taxi_seat`:528, `_cs_taxi_dropoff`:540, `_stretcher`:584, `_cs_medic_load`:596, `_cs_medic_unload`:635, `_cs_police_radio`:666, `_career_chase_over`:679, `_fire_aimed`:722, `_fire_hose_tick`:732, `_cs_fire_out`:789, `_career_bar_build`:818, `_career_steps_bbcode`:848, `_career_bar_text`:862, `_career_bar_tick`:891, `_career_hud`:908, `_cs_play`:915, `_cs_tick`:929, `_cs_skip`:946, `_cs_finish`:952, `_cs_side_cam`:968, `_cs_cam`:987, `_cs_ui`:1001, `_cs_caption`:1052, `_cs_mirror`:1071, `_siren_sound`:1118, `_siren`:1140, `_build_career_panel`:1153, `_open_careers`:1192, `_career_ach_line`:1210, `_career_close`:1225, `_career_end_close`:1229

### game/dome_quests.gd (421 lines, 27 funcs)

Sections: 108 state; 145 rewards; 220 3D gift boxes

Functions: `_init`:46, `today`:49, `done_count`:52, `gift_count`:59, `gift_pos`:66, `gift_pay`:71, `total_today`:74, `quest_pos`:82, `progress`:98, `new_day`:109, `save_state`:122, `load_state`:133, `pay`:146, `award`:158, `take_gift`:174, `check_at`:189, `build_presents`:221, `refresh_presents`:259, `build`:264, `in_dome`:295, `refresh_ui`:298, `draw`:305, `guide`:324, `open`:331, `close`:337, `_process`:341, `selftest`:372

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

### game/world_biosphere.gd (4236 lines, 180 funcs)

Sections: 2809 0.55.0: three new continents, stable appended animal and quest IDs.; 3131 0.55.1: continuous floor transitions, protected paths and rescue.; 3808 0.55.11: open reserve layout shared by all seven domes. No pens: every species roams a big open habitat

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:242, `flush`:255, `disc`:274, `entrance_ramp`:286, `build`:298, `shell`:399, `hub_doors`:528, `gate`:554, `nature`:578, `tree`:599, `tree_parts`:605, `landscape`:619, `walkway`:684, `habitats`:687, `recolor`:788, `spawn_animal`:797, `quest_markers`:842, `quest_point`:868, `now`:891, `today`:894, `day_number`:897, `feeding`:900, `rare_event`:907, `baby_dome`:914, `rank_index`:917, `rank_name`:924, `reward`:927, `achieve`:934, `species_mask`:940, `page_ready`:947, `finish_passport`:954, `claim_page`:960, `spot`:969, `start_quest`:976, `quest_step`:983, `coop_near`:986, `advance_quest`:995, `prompt`:1021, `dusk`:1032, `interact`:1035, `keeper`:1080, `keeper_here`:1089, `auto_keeper`:1093, `finish_keeper`:1097, `photo_target`:1131, `photo_capture`:1155, `tick`:1170, `tick_impl`:1182, `animate_animal`:1339, `reset_stick`:1411, `close_panel`:1418, `open_panel`:1424, `ui_label`:1449, `ui_button`:1457, `select_page`:1462, `forget_buttons`:1466, `refresh_panel`:1473, `smoke`:1521, `drive_body`:1852, `screenshots`:1858, `backdrop`:1937, `walk_route`:1966, `rich_landscape`:1998, `planting_clear`:2057, `rain_ring`:2089, `gallery_points`:2116, `gallery_clear`:2127, `sky_gallery`:2148, `route_clear`:2173, `build_dome_loop`:2187, `quest_guide`:2226, `visitor_y`:2245, `add_visitor`:2254, `build_visitors`:2272, `tick_visitors`:2291, `door_point`:2342, `dome_signpost`:2345, `outside_signposts`:2376, `inside_signpost`:2389, `door_markers`:2398, `colonnade`:2416, `garden_ring`:2449, `glass_edge`:2481, `waterfall`:2489, `soft_mist`:2513, `ground_route`:2542, `ground_trails`:2557, `africa_lookout`:2569, `asia_route`:2590, `asia_rainwalk`:2599, `antarctic_route`:2629, `antarctic_spiral`:2638, `tree_fort`:2654, `floe_approach`:2664, `habitat_layers`:2683, `upper_animal`:2737, `high_habitat`:2774, `x_layer`:2793, `z_layer`:2797, `tall_tree`:2800, `phase2_pen`:2810, `phase2_route`:2814, `phase2_quest_point`:2825, `phase2_interact`:2846, `phase2_action`:2871, `phase2_landscape`:2884, `phase2_layers`:2983, `phase2_walkway`:2994, `sweep_join`:3001, `build_sweeps`:3029, `refined_coat`:3064, `profile_report`:3083, `profile_node_count`:3097, `profile_node`:3103, `rim_bevel`:3132, `collision_wall`:3164, `flush_guard_batches`:3174, `detail_index`:3190, `register_walk`:3196, `register_deck`:3203, `project_segment`:3212, `surface_distance`:3217, `finish_guards`:3231, `inside_pen`:3271, `open_path_point`:3278, `safety_net`:3297, `can_fly`:3322, `record_scenery`:3326, `scenery_aabb`:3335, `clear_scenery_bounds`:3343, `resolve_scenery`:3391, `register_habitats`:3448, `unload_detail`:3477, `load_dome`:3510, `activate_dome`:3555, `capture_exterior`:3575, `campus_surface`:3583, `build_open_paths`:3587, `build_garden_edges`:3614, `foliage_mesh`:3655, `small_foliage_texture`:3683, `apply_dome_quality`:3699, `restore_dome_quality`:3712, `profile_audio`:3720, `assign_feeding_slots`:3730, `feeding_target`:3741, `visitor_stage_route`:3756, `path_floor`:3771, `flush_walk_meshes`:3779, `reserve`:3852, `reserve_zone`:3855, `path_arms`:3861, `africa_path_nodes`:3864, `africa_blob`:3870, `africa_ramp_y`:3881, `reserve_station`:3884, `reserve_tree`:3888, `reserve_build`:3897, `path_clear`:3992, `reserve_zone_props`:3998, `africa_zone_props`:4016, `reserve_wow`:4041, `africa_path_segs`:4094, `africa_path_dist`:4103, `reserve_detail`:4113, `africa_shots`:4199

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

