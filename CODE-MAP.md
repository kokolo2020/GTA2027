# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (34301 lines, 1231 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-584 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 585-657 | v0.34.6: futuristic towers for the old city | 1 |
| 658-736 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 737-797 | v0.34.4: futuristic road surface | 2 |
| 798-2003 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 2004-2487 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2488-2660 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2661-3176 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3177-3231 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3232-3334 | v0.11.0: online police vs thief | 4 |
| 3335-4278 | v0.10.0: chase mode (offline) | 38 |
| 4279-4956 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4957-5075 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5076-5113 | v0.30.1: nothing to collect stands in a road | 4 |
| 5114-5253 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5254-5621 | v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5622-6121 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6122-6372 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6373-6868 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6869-7162 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7163-8674 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 38 |
| 8675-10869 | v0.5.0: original synthesized radio and ambient pedestrians | 34 |
| 10870-11518 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11519-11622 | old city and Bay details | 1 |
| 11623-12032 | traffic | 10 |
| 12033-12385 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12386-12643 | camera views | 9 |
| 12644-12891 | v0.17.0: level-up celebration | 8 |
| 12892-13011 | v0.18.0: walk-in stadium | 5 |
| 13012-13173 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13174-13359 | checkpoints | 9 |
| 13360-13627 | v0.18.0: Harbor Dome social hub | 2 |
| 13628-13678 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 13679-14002 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 14003-14158 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14159-14407 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 14408-14622 | people: sitting pose, bots, bubbles, emotes | 6 |
| 14623-14741 | seats | 6 |
| 14742-14898 | game panel | 7 |
| 14899-15019 | tic-tac-toe | 7 |
| 15020-15071 | rock paper scissors | 4 |
| 15072-15154 | online table messages | 2 |
| 15155-15230 | comedy show | 4 |
| 15231-16082 | quick chat and emotes | 25 |
| 16083-16245 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 16246-16486 | v0.18.2: nickname and HUD relayout | 12 |
| 16487-16774 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 16775-16884 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 16885-17212 | circuit geometry | 12 |
| 17213-17310 | race car rental | 5 |
| 17311-17325 | speed effects | 2 |
| 17326-17376 | track helpers | 5 |
| 17377-17613 | events | 11 |
| 17614-17666 | boosters and spikes | 4 |
| 17667-17724 | online races | 2 |
| 17725-18080 | raceway panel, HUD, board | 10 |
| 18081-18288 | v0.22.0: Call Car | 6 |
| 18289-18588 | v0.23: RUN toggle and fast travel between districts | 13 |
| 18589-18662 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 18663-19099 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 19100-19591 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 19592-19742 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 19743-19777 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 19778-20092 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 20093-20413 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 20414-20728 | v0.36: the daily puzzle | 17 |
| 20729-20917 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 20918-21290 | building blocks | 23 |
| 21291-21792 | building | 16 |
| 21793-21948 | garden planting | 11 |
| 21949-22356 | the four layouts | 4 |
| 22357-22627 | animals | 8 |
| 22628-22757 | animation, spotting and rewards | 6 |
| 22758-23275 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 23276-23429 | your look: apply, save, share | 9 |
| 23430-23857 | stores and the wardrobe | 23 |
| 23858-24325 | HARBOR GALLERIA: the shopping mall | 14 |
| 24326-24477 | featured outfits and the Sky Run | 7 |
| 24478-24574 | v0.41: THE SKY GARDEN | 5 |
| 24575-24712 | building | 5 |
| 24713-24893 | plants | 6 |
| 24894-25013 | interacting | 7 |
| 25014-25257 | the garden screen | 9 |
| 25258-25296 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 25297-25328 | album | 2 |
| 25329-25380 | season | 6 |
| 25381-25388 | Harbor Night | 1 |
| 25389-25420 | check-in calendar | 1 |
| 25421-25597 | the panel | 8 |
| 25598-25812 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 25813-26236 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 26237-26478 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 26479-26657 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 26658-26694 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 26695-26791 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 26792-27083 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 27084-27184 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 27185-27508 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 27509-27619 | v0.24.2: road map (for moving people off the road) | 8 |
| 27620-27915 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 27916-28110 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 28111-28751 | Harbor Loop sky train | 27 |
| 28752-29089 | Day and night | 9 |
| 29090-29725 | v0.27 smoke test and screenshots | 2 |
| 29726-30142 | v0.27: Harbor International Airport (north of the city) | 10 |
| 30143-30656 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 30657-30817 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 30818-30914 | the Directions panel and chip | 7 |
| 30915-31456 | v0.44: Grand Central | 16 |
| 31457-31748 | v0.44: filling the empty land | 8 |
| 31749-31783 | v0.45: hover car underglow | 1 |
| 31784-31948 | v0.46: what is inside the Grand Central shops | 1 |
| 31949-31980 | v0.47: street stalls downtown | 2 |
| 31981-32079 | v0.48: places that open as you level up | 6 |
| 32080-32124 | v0.50: city careers | 5 |
| 32125-32175 | v0.52: careers as clear job loops | 3 |
| 32176-32183 | taxi | 1 |
| 32184-32187 | paramedic | 0 |
| 32188-32192 | police | 1 |
| 32193-32198 | firefighter | 1 |
| 32199-32208 | the step bar | 2 |
| 32209-32235 | cut scenes | 1 |
| 32236-32240 | siren | 0 |
| 32241-32252 | the Careers panel | 3 |
| 32253-32676 | v0.50: homes | 17 |
| 32677-33012 | decorating | 7 |
| 33013-33147 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 33148-33581 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 33582-33620 | v0.51.1: join and leave messages | 3 |
| 33621-33885 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 33886-34184 | v0.51.3: stream joiners | 9 |
| 34185-34301 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 589-5610 |
| `_nearest_*` |  | 9 | 1237-16520 |
| `_car_*` |  | 7 | 1402-31752 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2005-16144 |
| `_shop_*` | Marina Heights shops | 9 | 2618-15770 |
| `_bus_*` | Airport Line and city buses | 14 | 2662-26769 |
| `_level_*` | player levels | 7 | 3188-12757 |
| `_chase_*` | police chase mode | 11 | 3336-3583 |
| `_quest_*` | quests | 8 | 5160-19714 |
| `_sky_*` | Harbor Loop sky train, sky look | 29 | 5500-28730 |
| `_crew_*` | crews | 6 | 5689-6027 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5745-23846 |
| `_social_*` | friends, invites | 8 | 5793-6251 |
| `_soc_*` | social extras | 8 | 5832-6125 |
| `_c4_*` | Connect Four | 9 | 6466-6582 |
| `_rx_*` | Reaction Duel | 6 | 6609-6684 |
| `_quiz_*` | party quiz | 9 | 6932-7129 |
| `_ach_*` | achievements | 8 | 7350-23841 |
| `_radio_*` | radio and ambience | 8 | 8679-8843 |
| `_smoke_*` | smoke tests | 45 | 9091-34248 |
| `_shot_*` | screenshot modes | 8 | 10852-33720 |
| `_hub_*` | Harbor Dome hub | 12 | 13418-16751 |
| `_lux_*` |  | 12 | 13822-13951 |
| `_ttt_*` | tic-tac-toe | 7 | 14902-14993 |
| `_chat_*` |  | 10 | 15370-15745 |
| `_sg_*` | Sky Garden | 28 | 16033-25127 |
| `_rw_*` | Raceway | 30 | 16900-17828 |
| `_crate_*` | starter crate | 8 | 18683-19004 |
| `_quick_*` | quick quests | 11 | 19141-19450 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 19795-23382 |
| `_pz_*` | daily puzzle | 10 | 20437-20605 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 20791-24293 |
| `_ga_*` | Galleria mall | 13 | 23894-24405 |
| `_season_*` | season pass | 6 | 25330-25362 |
| `_lb_*` | leaderboard | 10 | 25703-25766 |
| `_ds_*` | digital signs | 6 | 26269-26430 |
| `_treasure_*` | treasure hunt | 10 | 26810-27069 |
| `_fm_*` | Find Me | 11 | 27206-27379 |
| `_ap_*` | Harbor Airport | 7 | 29936-30056 |
| `_nav_*` | walker nav grids | 9 | 30157-30403 |
| `_dir_*` | Directions panel | 7 | 30692-30888 |
| `_gc_*` | Grand Central | 9 | 30944-31785 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 32105-34102 |
| `_home_*` | homes | 21 | 32293-33092 |
| `_ch_*` | chapters | 6 | 33211-33258 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:292, `_apply_car`:1363, `_collider`:1621, `_level`:3206, `_input`:7664, `_physics_process`:7765, `_refresh_hud`:8129, `_toggle_menu`:8303, `_show_toast`:8377, `_save_progress`:8381, `_load_progress`:8471, `_process`:8856, `_blocked_at`:10050, `_blocker`:10065, `_apply_view`:12439, `_place_lock_of`:31994

World builders (`_build_*`): `_build_world`:1042, `_build_collectibles`:1176, `_build_bay`:1478, `_build_north`:1748, `_build_nm_blocks`:1865, `_build_north_landscape`:1950, `_build_landscape`:1987, `_build_bus`:2668, `_build_marina`:2815, `_build_hat`:2924, `_build_ridge`:3771, `_build_panels`:4040, `_build_player`:4200, `_build_car`:4238, `_build_hud`:4726, `_build_quest_offer`:5130, `_build_future`:5295, `_build_neon`:5309, `_build_holograms`:5415, `_build_sky_traffic`:5482, `_build_social`:6046, `_build_dance_floor`:6225, `_build_arcade`:6415, `_build_arcade_panel`:6764, `_build_quiz`:6986, `_build_ach`:7485, `_build_peds`:8907, `_build_downtown`:11252, `_build_park`:11475, `_build_plaza`:11504, `_build_city_detail`:11520, `_build_traffic`:11624, `_build_minimap`:12172, `_build_view_controls`:12387, `_build_level_fx`:12655, `_build_stadium_walls`:12908, `_build_guidance`:13071, `_build_checkpoints`:13175, `_build_hub`:13422, `_build_hub_bots`:14434, `_build_game_panel`:14743, `_build_chat`:15253, `_build_feed`:16092, `_build_nick_panel`:16285, `_build_civic`:16586, `_build_raceway`:16986, `_build_rw_parking`:17020, `_build_rw_pits`:17065, `_build_rw_track`:17102, `_build_rw_trackside`:17143, `_build_raceway_ui`:17726, `_build_travel`:18309, `_build_qr`:18596, `_build_crate_ui`:18716, `_build_quick_props`:19252, `_build_quest_list`:19601, `_build_food_court`:19918, `_build_commons`:20150, `_build_puzzle_panel`:20574, `_build_biosphere`:21292, `_build_biosphere_legacy`:21296, `_build_style_panel`:23509, `_build_galleria`:23933, `_build_ga_fun`:24360, `_build_sky_garden`:24596, `_build_sg_panel`:25015, `_build_hp_panel`:25422, `_build_lb`:25648, `_build_market`:25837, `_build_gear`:25924, `_build_pet`:25977, `_build_market_panel`:26065, `_build_display`:26302, `_build_streamer`:26496, `_build_treasure_props`:26893, `_build_treasure`:26937, `_build_expansion`:27730, `_build_connect`:27957, `_build_skytrain`:28296, `_build_airport`:29760, `_build_signposts`:30715, `_build_dir_panel`:30819, `_build_grand_central`:31177, `_build_gc_towers`:31345, `_build_fill`:31526, `_build_gardens`:31594, `_build_fan_plaza`:31704, `_build_street_stalls`:31953, `_build_place_signs`:32011, `_build_career_panel`:32242, `_build_homes`:32308, `_build_home_panels`:32678, `_build_chapters_ui`:33350


## Smoke tests in main.gd

- `_smoke_test` line 9091
- `_smoke_chase` line 9732
- `_smoke_orole` line 9765
- `_smoke_levels` line 9794
- `_smoke_bus` line 9835
- `_smoke_chase_extras` line 9920
- `_smoke_marina` line 9948
- `_smoke_radio_peds` line 10090
- `_smoke_typed_chat` line 10160
- `_smoke_boutique` line 10179
- `_smoke_models` line 10207
- `_smoke_garage_ridge` line 10231
- `_smoke_downtown` line 11875
- `_smoke_views` line 12583
- `_smoke_level_fx` line 12858
- `_smoke_stadium_eye` line 12945
- `_smoke_guidance_checkpoints` line 13284
- `_smoke_hub` line 15571
- `_smoke_nick` line 16406
- `_smoke_sites_reachable` line 16456
- `_smoke_raceway` line 17862
- `_smoke_follow_call` line 18183
- `_smoke_travel` line 18463
- `_smoke_qr` line 18656
- `_smoke_crate` line 18956
- `_smoke_quick` line 19483
- `_smoke_quests` line 19717
- `_smoke_chat` line 20646
- `_smoke_feet` line 20684
- `_smoke_commons` line 20705
- `_smoke_biosphere` line 22754
- `_smoke_style` line 23016
- `_smoke_car_barriers` line 25133
- `_smoke_sky_garden` line 25174
- `_smoke_pass` line 25535
- `_smoke_treasure` line 27142
- `_smoke_findme` line 27435
- `_smoke_v27` line 29091
- `_smoke_airport` line 30099
- `_smoke_strollers` line 30541
- `_smoke_careers_homes` line 32803
- `_smoke_chapters` line 33436
- `_smoke_photo` line 33792
- `_smoke_stream_join` line 34019
- `_smoke_streamer_clean` line 34248

## Other scripts

### game/autoplay.gd (333 lines, 19 funcs)

Functions: `_init`:37, `_ready`:40, `goto`:50, `steer`:57, `watchdog`:78, `ready_to_play`:96, `_physics_process`:99, `start_dome_route`:154, `walk_route_tick`:167, `on_enter`:179, `dome_quest_tick`:195, `prepare_station`:218, `station_tick`:228, `wait_tick`:247, `ride_tick`:261, `arrive_city`:277, `pick_wander`:294, `city_tick`:299, `shot_tick`:324

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

### game/world_biosphere.gd (4246 lines, 180 funcs)

Sections: 2819 0.55.0: three new continents, stable appended animal and quest IDs.; 3141 0.55.1: continuous floor transitions, protected paths and rescue.; 3818 0.55.11: open reserve layout shared by all seven domes. No pens: every species roams a big open habitat

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:242, `flush`:255, `disc`:274, `entrance_ramp`:286, `build`:298, `shell`:399, `hub_doors`:528, `gate`:554, `nature`:578, `tree`:599, `tree_parts`:605, `landscape`:619, `walkway`:684, `habitats`:687, `recolor`:788, `spawn_animal`:797, `quest_markers`:842, `quest_point`:868, `now`:891, `today`:894, `day_number`:897, `feeding`:900, `rare_event`:907, `baby_dome`:914, `rank_index`:917, `rank_name`:924, `reward`:927, `achieve`:934, `species_mask`:940, `page_ready`:947, `finish_passport`:954, `claim_page`:960, `spot`:969, `start_quest`:976, `quest_step`:983, `coop_near`:986, `advance_quest`:995, `prompt`:1021, `dusk`:1032, `interact`:1035, `keeper`:1080, `keeper_here`:1089, `auto_keeper`:1093, `finish_keeper`:1097, `photo_target`:1131, `photo_capture`:1155, `tick`:1170, `tick_impl`:1182, `animate_animal`:1343, `reset_stick`:1415, `close_panel`:1422, `open_panel`:1428, `ui_label`:1453, `ui_button`:1461, `select_page`:1466, `forget_buttons`:1470, `refresh_panel`:1477, `smoke`:1531, `drive_body`:1862, `screenshots`:1868, `backdrop`:1947, `walk_route`:1976, `rich_landscape`:2008, `planting_clear`:2067, `rain_ring`:2099, `gallery_points`:2126, `gallery_clear`:2137, `sky_gallery`:2158, `route_clear`:2183, `build_dome_loop`:2197, `quest_guide`:2236, `visitor_y`:2255, `add_visitor`:2264, `build_visitors`:2282, `tick_visitors`:2301, `door_point`:2352, `dome_signpost`:2355, `outside_signposts`:2386, `inside_signpost`:2399, `door_markers`:2408, `colonnade`:2426, `garden_ring`:2459, `glass_edge`:2491, `waterfall`:2499, `soft_mist`:2523, `ground_route`:2552, `ground_trails`:2567, `africa_lookout`:2579, `asia_route`:2600, `asia_rainwalk`:2609, `antarctic_route`:2639, `antarctic_spiral`:2648, `tree_fort`:2664, `floe_approach`:2674, `habitat_layers`:2693, `upper_animal`:2747, `high_habitat`:2784, `x_layer`:2803, `z_layer`:2807, `tall_tree`:2810, `phase2_pen`:2820, `phase2_route`:2824, `phase2_quest_point`:2835, `phase2_interact`:2856, `phase2_action`:2881, `phase2_landscape`:2894, `phase2_layers`:2993, `phase2_walkway`:3004, `sweep_join`:3011, `build_sweeps`:3039, `refined_coat`:3074, `profile_report`:3093, `profile_node_count`:3107, `profile_node`:3113, `rim_bevel`:3142, `collision_wall`:3174, `flush_guard_batches`:3184, `detail_index`:3200, `register_walk`:3206, `register_deck`:3213, `project_segment`:3222, `surface_distance`:3227, `finish_guards`:3241, `inside_pen`:3281, `open_path_point`:3288, `safety_net`:3307, `can_fly`:3332, `record_scenery`:3336, `scenery_aabb`:3345, `clear_scenery_bounds`:3353, `resolve_scenery`:3401, `register_habitats`:3458, `unload_detail`:3487, `load_dome`:3520, `activate_dome`:3565, `capture_exterior`:3585, `campus_surface`:3593, `build_open_paths`:3597, `build_garden_edges`:3624, `foliage_mesh`:3665, `small_foliage_texture`:3693, `apply_dome_quality`:3709, `restore_dome_quality`:3722, `profile_audio`:3730, `assign_feeding_slots`:3740, `feeding_target`:3751, `visitor_stage_route`:3766, `path_floor`:3781, `flush_walk_meshes`:3789, `reserve`:3862, `reserve_zone`:3865, `path_arms`:3871, `africa_path_nodes`:3874, `africa_blob`:3880, `africa_ramp_y`:3891, `reserve_station`:3894, `reserve_tree`:3898, `reserve_build`:3907, `path_clear`:4002, `reserve_zone_props`:4008, `africa_zone_props`:4026, `reserve_wow`:4051, `africa_path_segs`:4104, `africa_path_dist`:4113, `reserve_detail`:4123, `africa_shots`:4209

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

