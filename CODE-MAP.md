# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (34037 lines, 1222 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-580 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 581-653 | v0.34.6: futuristic towers for the old city | 1 |
| 654-732 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 733-793 | v0.34.4: futuristic road surface | 2 |
| 794-1999 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 2000-2479 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2480-2652 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2653-3168 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3169-3223 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3224-3326 | v0.11.0: online police vs thief | 4 |
| 3327-4270 | v0.10.0: chase mode (offline) | 38 |
| 4271-4944 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4945-5063 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5064-5101 | v0.30.1: nothing to collect stands in a road | 4 |
| 5102-5241 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5242-5609 | v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5610-6109 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6110-6360 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6361-6856 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6857-7150 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7151-8646 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 38 |
| 8647-10790 | v0.5.0: original synthesized radio and ambient pedestrians | 32 |
| 10791-11439 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11440-11543 | old city and Bay details | 1 |
| 11544-11953 | traffic | 10 |
| 11954-12306 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12307-12564 | camera views | 9 |
| 12565-12812 | v0.17.0: level-up celebration | 8 |
| 12813-12932 | v0.18.0: walk-in stadium | 5 |
| 12933-13094 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13095-13280 | checkpoints | 9 |
| 13281-13548 | v0.18.0: Harbor Dome social hub | 2 |
| 13549-13599 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 13600-13923 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 13924-14079 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14080-14328 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 14329-14536 | people: sitting pose, bots, bubbles, emotes | 6 |
| 14537-14655 | seats | 6 |
| 14656-14812 | game panel | 7 |
| 14813-14933 | tic-tac-toe | 7 |
| 14934-14985 | rock paper scissors | 4 |
| 14986-15068 | online table messages | 2 |
| 15069-15144 | comedy show | 4 |
| 15145-15824 | quick chat and emotes | 18 |
| 15825-15987 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 15988-16228 | v0.18.2: nickname and HUD relayout | 12 |
| 16229-16516 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 16517-16626 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 16627-16954 | circuit geometry | 12 |
| 16955-17052 | race car rental | 5 |
| 17053-17067 | speed effects | 2 |
| 17068-17118 | track helpers | 5 |
| 17119-17355 | events | 11 |
| 17356-17408 | boosters and spikes | 4 |
| 17409-17466 | online races | 2 |
| 17467-17822 | raceway panel, HUD, board | 10 |
| 17823-18030 | v0.22.0: Call Car | 6 |
| 18031-18330 | v0.23: RUN toggle and fast travel between districts | 13 |
| 18331-18404 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 18405-18841 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 18842-19333 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 19334-19484 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 19485-19519 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 19520-19834 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 19835-20154 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 20155-20469 | v0.36: the daily puzzle | 17 |
| 20470-20658 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 20659-21031 | building blocks | 23 |
| 21032-21533 | building | 16 |
| 21534-21689 | garden planting | 11 |
| 21690-22097 | the four layouts | 4 |
| 22098-22368 | animals | 8 |
| 22369-22498 | animation, spotting and rewards | 6 |
| 22499-23016 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 23017-23165 | your look: apply, save, share | 9 |
| 23166-23593 | stores and the wardrobe | 23 |
| 23594-24061 | HARBOR GALLERIA: the shopping mall | 14 |
| 24062-24213 | featured outfits and the Sky Run | 7 |
| 24214-24310 | v0.41: THE SKY GARDEN | 5 |
| 24311-24448 | building | 5 |
| 24449-24629 | plants | 6 |
| 24630-24749 | interacting | 7 |
| 24750-24993 | the garden screen | 9 |
| 24994-25032 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 25033-25064 | album | 2 |
| 25065-25116 | season | 6 |
| 25117-25124 | Harbor Night | 1 |
| 25125-25156 | check-in calendar | 1 |
| 25157-25333 | the panel | 8 |
| 25334-25548 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 25549-25972 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 25973-26214 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 26215-26393 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 26394-26430 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 26431-26527 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 26528-26819 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 26820-26920 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 26921-27244 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 27245-27355 | v0.24.2: road map (for moving people off the road) | 8 |
| 27356-27651 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 27652-27846 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 27847-28487 | Harbor Loop sky train | 27 |
| 28488-28825 | Day and night | 9 |
| 28826-29461 | v0.27 smoke test and screenshots | 2 |
| 29462-29878 | v0.27: Harbor International Airport (north of the city) | 10 |
| 29879-30392 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 30393-30553 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 30554-30650 | the Directions panel and chip | 7 |
| 30651-31192 | v0.44: Grand Central | 16 |
| 31193-31484 | v0.44: filling the empty land | 8 |
| 31485-31519 | v0.45: hover car underglow | 1 |
| 31520-31684 | v0.46: what is inside the Grand Central shops | 1 |
| 31685-31716 | v0.47: street stalls downtown | 2 |
| 31717-31815 | v0.48: places that open as you level up | 6 |
| 31816-31860 | v0.50: city careers | 5 |
| 31861-31911 | v0.52: careers as clear job loops | 3 |
| 31912-31919 | taxi | 1 |
| 31920-31923 | paramedic | 0 |
| 31924-31928 | police | 1 |
| 31929-31934 | firefighter | 1 |
| 31935-31944 | the step bar | 2 |
| 31945-31971 | cut scenes | 1 |
| 31972-31976 | siren | 0 |
| 31977-31988 | the Careers panel | 3 |
| 31989-32412 | v0.50: homes | 17 |
| 32413-32748 | decorating | 7 |
| 32749-32883 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 32884-33317 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 33318-33356 | v0.51.1: join and leave messages | 3 |
| 33357-33621 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 33622-33920 | v0.51.3: stream joiners | 9 |
| 33921-34037 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 585-5598 |
| `_nearest_*` |  | 9 | 1233-16262 |
| `_car_*` |  | 7 | 1398-31488 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2001-15886 |
| `_shop_*` | Marina Heights shops | 8 | 2610-3114 |
| `_bus_*` | Airport Line and city buses | 14 | 2654-26505 |
| `_level_*` | player levels | 7 | 3180-12678 |
| `_chase_*` | police chase mode | 11 | 3328-3575 |
| `_quest_*` | quests | 8 | 5148-19456 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5488-28466 |
| `_crew_*` | crews | 6 | 5677-6015 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5733-23582 |
| `_social_*` | friends, invites | 8 | 5781-6239 |
| `_soc_*` | social extras | 8 | 5820-6113 |
| `_c4_*` | Connect Four | 9 | 6454-6570 |
| `_rx_*` | Reaction Duel | 6 | 6597-6672 |
| `_quiz_*` | party quiz | 9 | 6920-7117 |
| `_ach_*` | achievements | 8 | 7338-23577 |
| `_radio_*` | radio and ambience | 8 | 8651-8815 |
| `_smoke_*` | smoke tests | 43 | 9061-33984 |
| `_shot_*` | screenshot modes | 8 | 10773-33456 |
| `_hub_*` | Harbor Dome hub | 12 | 13339-16493 |
| `_lux_*` |  | 12 | 13743-13872 |
| `_ttt_*` | tic-tac-toe | 7 | 14816-14907 |
| `_sg_*` | Sky Garden | 28 | 15775-24863 |
| `_rw_*` | Raceway | 30 | 16642-17570 |
| `_crate_*` | starter crate | 8 | 18425-18746 |
| `_quick_*` | quick quests | 11 | 18883-19192 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 19537-23118 |
| `_pz_*` | daily puzzle | 10 | 20178-20346 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 20532-24029 |
| `_ga_*` | Galleria mall | 13 | 23630-24141 |
| `_season_*` | season pass | 6 | 25066-25098 |
| `_lb_*` | leaderboard | 10 | 25439-25502 |
| `_ds_*` | digital signs | 6 | 26005-26166 |
| `_treasure_*` | treasure hunt | 10 | 26546-26805 |
| `_fm_*` | Find Me | 11 | 26942-27115 |
| `_ap_*` | Harbor Airport | 7 | 29672-29792 |
| `_nav_*` | walker nav grids | 9 | 29893-30139 |
| `_dir_*` | Directions panel | 7 | 30428-30624 |
| `_gc_*` | Grand Central | 9 | 30680-31521 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 31841-33838 |
| `_home_*` | homes | 21 | 32029-32828 |
| `_ch_*` | chapters | 6 | 32947-32994 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:292, `_apply_car`:1359, `_collider`:1617, `_level`:3198, `_input`:7652, `_physics_process`:7748, `_refresh_hud`:8109, `_toggle_menu`:8281, `_show_toast`:8353, `_save_progress`:8357, `_load_progress`:8445, `_process`:8828, `_blocked_at`:10018, `_blocker`:10033, `_apply_view`:12360, `_place_lock_of`:31730

World builders (`_build_*`): `_build_world`:1038, `_build_collectibles`:1172, `_build_bay`:1474, `_build_north`:1744, `_build_nm_blocks`:1861, `_build_north_landscape`:1946, `_build_landscape`:1983, `_build_bus`:2660, `_build_marina`:2807, `_build_hat`:2916, `_build_ridge`:3763, `_build_panels`:4032, `_build_player`:4192, `_build_car`:4230, `_build_hud`:4718, `_build_quest_offer`:5118, `_build_future`:5283, `_build_neon`:5297, `_build_holograms`:5403, `_build_sky_traffic`:5470, `_build_social`:6034, `_build_dance_floor`:6213, `_build_arcade`:6403, `_build_arcade_panel`:6752, `_build_quiz`:6974, `_build_ach`:7473, `_build_peds`:8877, `_build_downtown`:11173, `_build_park`:11396, `_build_plaza`:11425, `_build_city_detail`:11441, `_build_traffic`:11545, `_build_minimap`:12093, `_build_view_controls`:12308, `_build_level_fx`:12576, `_build_stadium_walls`:12829, `_build_guidance`:12992, `_build_checkpoints`:13096, `_build_hub`:13343, `_build_hub_bots`:14355, `_build_game_panel`:14657, `_build_chat`:15162, `_build_feed`:15834, `_build_nick_panel`:16027, `_build_civic`:16328, `_build_raceway`:16728, `_build_rw_parking`:16762, `_build_rw_pits`:16807, `_build_rw_track`:16844, `_build_rw_trackside`:16885, `_build_raceway_ui`:17468, `_build_travel`:18051, `_build_qr`:18338, `_build_crate_ui`:18458, `_build_quick_props`:18994, `_build_quest_list`:19343, `_build_food_court`:19660, `_build_commons`:19891, `_build_puzzle_panel`:20315, `_build_biosphere`:21033, `_build_biosphere_legacy`:21037, `_build_style_panel`:23245, `_build_galleria`:23669, `_build_ga_fun`:24096, `_build_sky_garden`:24332, `_build_sg_panel`:24751, `_build_hp_panel`:25158, `_build_lb`:25384, `_build_market`:25573, `_build_gear`:25660, `_build_pet`:25713, `_build_market_panel`:25801, `_build_display`:26038, `_build_streamer`:26232, `_build_treasure_props`:26629, `_build_treasure`:26673, `_build_expansion`:27466, `_build_connect`:27693, `_build_skytrain`:28032, `_build_airport`:29496, `_build_signposts`:30451, `_build_dir_panel`:30555, `_build_grand_central`:30913, `_build_gc_towers`:31081, `_build_fill`:31262, `_build_gardens`:31330, `_build_fan_plaza`:31440, `_build_street_stalls`:31689, `_build_place_signs`:31747, `_build_career_panel`:31978, `_build_homes`:32044, `_build_home_panels`:32414, `_build_chapters_ui`:33086


## Smoke tests in main.gd

- `_smoke_test` line 9061
- `_smoke_chase` line 9700
- `_smoke_orole` line 9733
- `_smoke_levels` line 9762
- `_smoke_bus` line 9803
- `_smoke_chase_extras` line 9888
- `_smoke_marina` line 9916
- `_smoke_radio_peds` line 10058
- `_smoke_models` line 10128
- `_smoke_garage_ridge` line 10152
- `_smoke_downtown` line 11796
- `_smoke_views` line 12504
- `_smoke_level_fx` line 12779
- `_smoke_stadium_eye` line 12866
- `_smoke_guidance_checkpoints` line 13205
- `_smoke_hub` line 15387
- `_smoke_nick` line 16148
- `_smoke_sites_reachable` line 16198
- `_smoke_raceway` line 17604
- `_smoke_follow_call` line 17925
- `_smoke_travel` line 18205
- `_smoke_qr` line 18398
- `_smoke_crate` line 18698
- `_smoke_quick` line 19225
- `_smoke_quests` line 19459
- `_smoke_chat` line 20387
- `_smoke_feet` line 20425
- `_smoke_commons` line 20446
- `_smoke_biosphere` line 22495
- `_smoke_style` line 22757
- `_smoke_car_barriers` line 24869
- `_smoke_sky_garden` line 24910
- `_smoke_pass` line 25271
- `_smoke_treasure` line 26878
- `_smoke_findme` line 27171
- `_smoke_v27` line 28827
- `_smoke_airport` line 29835
- `_smoke_strollers` line 30277
- `_smoke_careers_homes` line 32539
- `_smoke_chapters` line 33172
- `_smoke_photo` line 33528
- `_smoke_stream_join` line 33755
- `_smoke_streamer_clean` line 33984

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

