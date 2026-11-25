# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (34824 lines, 1250 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.
- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.
- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.
- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.

## Sections of main.gd (labelled in the source)

| Lines | Section | Funcs |
|---|---|---|
| 1-602 | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | 4 |
| 603-675 | v0.34.6: futuristic towers for the old city | 1 |
| 676-754 | v0.34.4: "100 years from now" skins for walls, roofs and pavements | 5 |
| 755-815 | v0.34.4: futuristic road surface | 2 |
| 816-2024 | v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt) | 57 |
| 2025-2508 | Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. | 20 |
| 2509-2681 | v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) | 11 |
| 2682-3197 | public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield | 26 |
| 3198-3252 | v0.12.0: player level (derived from progress, so old saves convert automatically) | 6 |
| 3253-3355 | v0.11.0: online police vs thief | 4 |
| 3356-4299 | v0.10.0: chase mode (offline) | 38 |
| 4300-4984 | v0.14.0: Blender-made people (player, pedestrians, online players on foot) | 23 |
| 4985-5103 | v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) | 7 |
| 5104-5141 | v0.30.1: nothing to collect stands in a road | 4 |
| 5142-5281 | v0.30.1: quests are offered when you get near them; you choose to take them | 7 |
| 5282-5649 | v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets) | 13 |
| 5650-6149 | v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos | 31 |
| 6150-6400 | v0.33.5: track a player (the arrow follows them around the city) | 9 |
| 6401-6896 | v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz | 25 |
| 6897-7190 | Party Quiz: everyone in the quiz zone gets the same question at the same time | 11 |
| 7191-8755 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 39 |
| 8756-11113 | v0.5.0: original synthesized radio and ambient pedestrians | 37 |
| 11114-11762 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 11763-11866 | old city and Bay details | 1 |
| 11867-12276 | traffic | 10 |
| 12277-12637 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12638-12895 | camera views | 9 |
| 12896-13143 | v0.17.0: level-up celebration | 8 |
| 13144-13263 | v0.18.0: walk-in stadium | 5 |
| 13264-13425 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13426-13611 | checkpoints | 9 |
| 13612-13890 | v0.18.0: Harbor Dome social hub | 2 |
| 13891-13941 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 13942-14265 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 14266-14421 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14422-14670 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 14671-14885 | people: sitting pose, bots, bubbles, emotes | 6 |
| 14886-15004 | seats | 6 |
| 15005-15161 | game panel | 7 |
| 15162-15282 | tic-tac-toe | 7 |
| 15283-15334 | rock paper scissors | 4 |
| 15335-15417 | online table messages | 2 |
| 15418-15493 | comedy show | 4 |
| 15494-16393 | quick chat and emotes | 26 |
| 16394-16556 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 16557-16798 | v0.18.2: nickname and HUD relayout | 12 |
| 16799-17086 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 17087-17196 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 17197-17524 | circuit geometry | 12 |
| 17525-17622 | race car rental | 5 |
| 17623-17637 | speed effects | 2 |
| 17638-17688 | track helpers | 5 |
| 17689-17925 | events | 11 |
| 17926-17978 | boosters and spikes | 4 |
| 17979-18036 | online races | 2 |
| 18037-18392 | raceway panel, HUD, board | 10 |
| 18393-18600 | v0.22.0: Call Car | 6 |
| 18601-19058 | v0.23: RUN toggle and fast travel between districts | 25 |
| 19059-19132 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 19133-19569 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 19570-20061 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 20062-20212 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 20213-20247 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 20248-20562 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 20563-20884 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 20885-21199 | v0.36: the daily puzzle | 17 |
| 21200-21388 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 21389-21761 | building blocks | 23 |
| 21762-22263 | building | 16 |
| 22264-22419 | garden planting | 11 |
| 22420-22827 | the four layouts | 4 |
| 22828-23098 | animals | 8 |
| 23099-23230 | animation, spotting and rewards | 6 |
| 23231-23748 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 23749-23902 | your look: apply, save, share | 9 |
| 23903-24330 | stores and the wardrobe | 23 |
| 24331-24798 | HARBOR GALLERIA: the shopping mall | 14 |
| 24799-24950 | featured outfits and the Sky Run | 7 |
| 24951-25047 | v0.41: THE SKY GARDEN | 5 |
| 25048-25185 | building | 5 |
| 25186-25366 | plants | 6 |
| 25367-25486 | interacting | 7 |
| 25487-25730 | the garden screen | 9 |
| 25731-25769 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 25770-25801 | album | 2 |
| 25802-25853 | season | 6 |
| 25854-25861 | Harbor Night | 1 |
| 25862-25893 | check-in calendar | 1 |
| 25894-26070 | the panel | 8 |
| 26071-26285 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 15 |
| 26286-26709 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 14 |
| 26710-26951 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 26952-27130 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 27131-27167 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 27168-27264 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 27265-27556 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 27557-27657 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 27658-27981 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 27982-28092 | v0.24.2: road map (for moving people off the road) | 8 |
| 28093-28388 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 28389-28583 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 28584-29251 | Harbor Loop sky train | 27 |
| 29252-29612 | Day and night | 11 |
| 29613-30248 | v0.27 smoke test and screenshots | 2 |
| 30249-30665 | v0.27: Harbor International Airport (north of the city) | 10 |
| 30666-31179 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 31180-31340 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 31341-31437 | the Directions panel and chip | 7 |
| 31438-31979 | v0.44: Grand Central | 16 |
| 31980-32271 | v0.44: filling the empty land | 8 |
| 32272-32306 | v0.45: hover car underglow | 1 |
| 32307-32471 | v0.46: what is inside the Grand Central shops | 1 |
| 32472-32503 | v0.47: street stalls downtown | 2 |
| 32504-32602 | v0.48: places that open as you level up | 6 |
| 32603-32647 | v0.50: city careers | 5 |
| 32648-32698 | v0.52: careers as clear job loops | 3 |
| 32699-32706 | taxi | 1 |
| 32707-32710 | paramedic | 0 |
| 32711-32715 | police | 1 |
| 32716-32721 | firefighter | 1 |
| 32722-32731 | the step bar | 2 |
| 32732-32758 | cut scenes | 1 |
| 32759-32763 | siren | 0 |
| 32764-32775 | the Careers panel | 3 |
| 32776-33199 | v0.50: homes | 17 |
| 33200-33535 | decorating | 7 |
| 33536-33670 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 33671-34104 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 34105-34143 | v0.51.1: join and leave messages | 3 |
| 34144-34408 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 34409-34707 | v0.51.3: stream joiners | 9 |
| 34708-34824 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 607-5638 |
| `_nearest_*` |  | 9 | 1258-16832 |
| `_car_*` |  | 7 | 1423-32275 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2026-16455 |
| `_shop_*` | Marina Heights shops | 9 | 2639-16081 |
| `_bus_*` | Airport Line and city buses | 14 | 2683-27242 |
| `_level_*` | player levels | 7 | 3209-13009 |
| `_chase_*` | police chase mode | 11 | 3357-3604 |
| `_quest_*` | quests | 8 | 5188-20184 |
| `_sky_*` | Harbor Loop sky train, sky look | 30 | 5528-29230 |
| `_crew_*` | crews | 6 | 5717-6055 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5773-24319 |
| `_social_*` | friends, invites | 8 | 5821-6279 |
| `_soc_*` | social extras | 8 | 5860-6153 |
| `_c4_*` | Connect Four | 9 | 6494-6610 |
| `_rx_*` | Reaction Duel | 6 | 6637-6712 |
| `_quiz_*` | party quiz | 9 | 6960-7157 |
| `_ach_*` | achievements | 8 | 7378-24314 |
| `_radio_*` | radio and ambience | 8 | 8760-8924 |
| `_smoke_*` | smoke tests | 47 | 9172-34771 |
| `_shot_*` | screenshot modes | 8 | 11096-34243 |
| `_hub_*` | Harbor Dome hub | 12 | 13670-17063 |
| `_lux_*` |  | 12 | 14085-14214 |
| `_ttt_*` | tic-tac-toe | 7 | 15165-15256 |
| `_chat_*` |  | 10 | 15633-16008 |
| `_sg_*` | Sky Garden | 28 | 16344-25600 |
| `_rw_*` | Raceway | 30 | 17212-18140 |
| `_crate_*` | starter crate | 8 | 19153-19474 |
| `_quick_*` | quick quests | 11 | 19611-19920 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 20265-23855 |
| `_pz_*` | daily puzzle | 10 | 20908-21076 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 21262-24766 |
| `_ga_*` | Galleria mall | 13 | 24367-24878 |
| `_season_*` | season pass | 6 | 25803-25835 |
| `_lb_*` | leaderboard | 10 | 26176-26239 |
| `_ds_*` | digital signs | 6 | 26742-26903 |
| `_treasure_*` | treasure hunt | 10 | 27283-27542 |
| `_fm_*` | Find Me | 11 | 27679-27852 |
| `_ap_*` | Harbor Airport | 7 | 30459-30579 |
| `_nav_*` | walker nav grids | 9 | 30680-30926 |
| `_dir_*` | Directions panel | 7 | 31215-31411 |
| `_gc_*` | Grand Central | 9 | 31467-32308 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 32628-34625 |
| `_home_*` | homes | 21 | 32816-33615 |
| `_ch_*` | chapters | 6 | 33734-33781 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:294, `_apply_car`:1384, `_collider`:1642, `_level`:3227, `_input`:7692, `_physics_process`:7818, `_refresh_hud`:8187, `_toggle_menu`:8373, `_show_toast`:8451, `_save_progress`:8455, `_load_progress`:8548, `_process`:8937, `_blocked_at`:10133, `_blocker`:10148, `_apply_view`:12691, `_place_lock_of`:32517

World builders (`_build_*`): `_build_world`:1060, `_build_collectibles`:1197, `_build_bay`:1499, `_build_north`:1769, `_build_nm_blocks`:1886, `_build_north_landscape`:1971, `_build_landscape`:2008, `_build_bus`:2689, `_build_marina`:2836, `_build_hat`:2945, `_build_ridge`:3792, `_build_panels`:4061, `_build_player`:4221, `_build_car`:4259, `_build_hud`:4747, `_build_quest_offer`:5158, `_build_future`:5323, `_build_neon`:5337, `_build_holograms`:5443, `_build_sky_traffic`:5510, `_build_social`:6074, `_build_dance_floor`:6253, `_build_arcade`:6443, `_build_arcade_panel`:6792, `_build_quiz`:7014, `_build_ach`:7513, `_build_peds`:8988, `_build_downtown`:11496, `_build_park`:11719, `_build_plaza`:11748, `_build_city_detail`:11764, `_build_traffic`:11868, `_build_minimap`:12424, `_build_view_controls`:12639, `_build_level_fx`:12907, `_build_stadium_walls`:13160, `_build_guidance`:13323, `_build_checkpoints`:13427, `_build_hub`:13674, `_build_hub_bots`:14697, `_build_game_panel`:15006, `_build_chat`:15516, `_build_feed`:16403, `_build_nick_panel`:16596, `_build_civic`:16898, `_build_raceway`:17298, `_build_rw_parking`:17332, `_build_rw_pits`:17377, `_build_rw_track`:17414, `_build_rw_trackside`:17455, `_build_raceway_ui`:18038, `_build_travel`:18647, `_build_qr`:19066, `_build_crate_ui`:19186, `_build_quick_props`:19722, `_build_quest_list`:20071, `_build_food_court`:20388, `_build_commons`:20621, `_build_puzzle_panel`:21045, `_build_biosphere`:21763, `_build_biosphere_legacy`:21767, `_build_style_panel`:23982, `_build_galleria`:24406, `_build_ga_fun`:24833, `_build_sky_garden`:25069, `_build_sg_panel`:25488, `_build_hp_panel`:25895, `_build_lb`:26121, `_build_market`:26310, `_build_gear`:26397, `_build_pet`:26450, `_build_market_panel`:26538, `_build_display`:26775, `_build_streamer`:26969, `_build_treasure_props`:27366, `_build_treasure`:27410, `_build_expansion`:28203, `_build_connect`:28430, `_build_skytrain`:28769, `_build_airport`:30283, `_build_signposts`:31238, `_build_dir_panel`:31342, `_build_grand_central`:31700, `_build_gc_towers`:31868, `_build_fill`:32049, `_build_gardens`:32117, `_build_fan_plaza`:32227, `_build_street_stalls`:32476, `_build_place_signs`:32534, `_build_career_panel`:32765, `_build_homes`:32831, `_build_home_panels`:33201, `_build_chapters_ui`:33873


## Smoke tests in main.gd

- `_smoke_test` line 9172
- `_smoke_chase` line 9815
- `_smoke_orole` line 9848
- `_smoke_levels` line 9877
- `_smoke_bus` line 9918
- `_smoke_chase_extras` line 10003
- `_smoke_marina` line 10031
- `_smoke_radio_peds` line 10173
- `_smoke_typed_chat` line 10243
- `_smoke_chat_touch` line 10262
- `_smoke_cafe` line 10283
- `_smoke_boutique` line 10309
- `_smoke_models` line 10337
- `_smoke_garage_ridge` line 10361
- `_smoke_downtown` line 12119
- `_smoke_views` line 12835
- `_smoke_level_fx` line 13110
- `_smoke_stadium_eye` line 13197
- `_smoke_guidance_checkpoints` line 13536
- `_smoke_hub` line 15834
- `_smoke_nick` line 16718
- `_smoke_sites_reachable` line 16768
- `_smoke_raceway` line 18174
- `_smoke_follow_call` line 18495
- `_smoke_travel` line 18933
- `_smoke_qr` line 19126
- `_smoke_crate` line 19426
- `_smoke_quick` line 19953
- `_smoke_quests` line 20187
- `_smoke_chat` line 21117
- `_smoke_feet` line 21155
- `_smoke_commons` line 21176
- `_smoke_biosphere` line 23227
- `_smoke_style` line 23489
- `_smoke_car_barriers` line 25606
- `_smoke_sky_garden` line 25647
- `_smoke_pass` line 26008
- `_smoke_treasure` line 27615
- `_smoke_findme` line 27908
- `_smoke_v27` line 29614
- `_smoke_airport` line 30622
- `_smoke_strollers` line 31064
- `_smoke_careers_homes` line 33326
- `_smoke_chapters` line 33959
- `_smoke_photo` line 34315
- `_smoke_stream_join` line 34542
- `_smoke_streamer_clean` line 34771

## Other scripts

### game/autoplay.gd (498 lines, 26 funcs)

Functions: `_init`:44, `_ready`:47, `goto`:57, `steer`:64, `watchdog`:85, `ready_to_play`:103, `_physics_process`:106, `clear_screen`:173, `force_travel`:186, `start_dome_route`:204, `walk_route_tick`:218, `on_enter`:230, `dome_quest_tick`:246, `prepare_station`:269, `station_tick`:279, `wait_tick`:298, `ride_tick`:312, `arrive_city`:328, `road_edge_dist`:350, `sidewalk_ok`:363, `path_clear`:371, `note_trail`:399, `novelty`:405, `pick_wander`:412, `city_tick`:453, `shot_tick`:489

### game/cafe.gd (618 lines, 28 funcs)

Sections: 281 the lounge: a big partitioned hang-out area with booth bays (white, porthole screens, glowing strips); 406 interaction; 484 ordering

Functions: `_init`:40, `rng_f`:44, `lp`:48, `prop`:51, `solid`:62, `glass`:71, `tangent_box`:80, `build_cafe`:85, `build_lounge`:282, `in_lounge`:376, `counter_spot`:379, `holding_cup`:383, `build_cup`:387, `tint_cup`:395, `near`:407, `button_text`:412, `hour_number`:415, `special_index`:418, `price_of`:421, `speed_mult`:425, `_process`:428, `build_panel`:485, `open`:509, `close`:515, `refresh`:519, `player_name`:559, `pick`:563, `finish_order`:583

### game/careers.gd (1231 lines, 64 funcs)

Functions: `_init`:7, `_career_rank`:10, `_career_rank_name`:17, `_career_mult`:20, `_career_spots`:23, `_career_pick`:51, `_career_block_reason`:62, `_career_start`:75, `_career_lights`:94, `_career_lights_off`:109, `_career_end`:118, `_career_clear_job`:134, `_cid`:147, `_career_place_name`:150, `_career_tag`:162, `_career_person`:179, `_cj_pp`:206, `_cj_anim`:209, `_cj_pose`:215, `_cj_pose_tick`:240, `_cj_hands_up`:245, `_cj_face`:248, `_career_fire`:254, `_career_next`:318, `_career_target`:356, `_career_pay`:366, `_career_rank_line`:374, `_career_job_done`:380, `_career_job_failed`:399, `_career_tick`:407, `_taxi_meter`:469, `_taxi_tip`:489, `_cs_taxi_pickup`:495, `_taxi_seat`:528, `_cs_taxi_dropoff`:540, `_stretcher`:584, `_cs_medic_load`:596, `_cs_medic_unload`:635, `_cs_police_radio`:666, `_career_chase_over`:679, `_fire_aimed`:722, `_fire_hose_tick`:732, `_cs_fire_out`:789, `_career_bar_build`:818, `_career_steps_bbcode`:848, `_career_bar_text`:862, `_career_bar_tick`:891, `_career_hud`:908, `_cs_play`:915, `_cs_tick`:929, `_cs_skip`:946, `_cs_finish`:952, `_cs_side_cam`:968, `_cs_cam`:987, `_cs_ui`:1001, `_cs_caption`:1052, `_cs_mirror`:1071, `_siren_sound`:1118, `_siren`:1140, `_build_career_panel`:1153, `_open_careers`:1192, `_career_ach_line`:1210, `_career_close`:1225, `_career_end_close`:1229

### game/dome_quests.gd (531 lines, 30 funcs)

Sections: 148 state; 200 rewards; 312 3D gift boxes

Functions: `_init`:62, `today`:65, `done_count`:68, `gift_count`:75, `gift_pos`:82, `gift_pay`:94, `total_today`:97, `quest_pos`:105, `progress`:126, `_bits`:141, `new_day`:149, `save_state`:167, `load_state`:183, `pay`:201, `award`:213, `take_gift`:229, `cafe_order`:244, `cafe_check`:251, `check_at`:264, `build_presents`:313, `refresh_presents`:351, `build`:356, `in_dome`:387, `refresh_ui`:390, `draw`:397, `guide`:416, `open`:423, `close`:429, `_process`:433, `selftest`:466

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

### game/paris.gd (1112 lines, 60 funcs)

Sections: 93 helpers; 181 portals; 232 the district; 940 play

Functions: `_init`:76, `in_area`:94, `poly_area`:97, `to_poly`:104, `mm_boxes`:112, `seg_xf`:129, `beam_xf`:136, `finish`:145, `load_data`:171, `make_portal`:182, `label`:219, `ensure_built`:233, `build_ground`:266, `build_river`:276, `build_water`:319, `build_parks`:341, `build_roads`:368, `facade_details`:404, `dormers`:431, `prism`:442, `cap`:459, `build_buildings`:467, `in_building`:525, `build_trees`:542, `build_lamps`:627, `build_landmark`:675, `lm_radius`:688, `hw`:691, `build_tower`:694, `build_cafe`:748, `clue_world`:766, `build_mystery`:770, `update_clues`:791, `clue_text`:795, `found_clue`:798, `clue_count`:813, `submit_case`:820, `facing`:842, `panel`:846, `build_crossing`:858, `build_times`:887, `build_prang`:904, `build_statue`:928, `near`:941, `in_paris`:944, `lm_pos`:948, `prompt`:952, `busy`:964, `interact`:967, `move_player`:986, `enter`:994, `go_home`:1017, `order`:1023, `done_count`:1027, `roll_day`:1034, `pay`:1045, `award`:1058, `tick`:1071, `save_state`:1091, `load_state`:1102

### game/promo.gd (346 lines, 15 funcs)

Functions: `_init`:16, `_ready`:19, `_process`:24, `frames`:38, `smooth`:42, `mark`:45, `move`:48, `visitor`:59, `newest_only`:66, `me_say`:73, `say`:77, `emote`:86, `clear_cast`:93, `put_player`:102, `run`:109

### game/road_barrier.gd (314 lines, 18 funcs)

Sections: 167 finding the road; 260 safety net; 288 checks

Functions: `_init`:25, `in_zone`:28, `_inside`:36, `on_road`:40, `_in_gap`:46, `_solid_cell`:52, `build`:63, `_emit`:117, `_visuals`:127, `nearest_road`:168, `road_dist`:186, `cp_car`:190, `_free_road_spot`:196, `call_car_spot`:208, `kerb_spot`:215, `rescue`:261, `tick`:270, `smoke`:289

### game/sun_dome.gd (183 lines, 8 funcs)

Functions: `_init`:19, `pt`:25, `rib`:28, `multimesh`:39, `spin`:52, `part`:57, `build`:60, `build_core`:148

### game/weather.gd (129 lines, 7 funcs)

Functions: `_init`:23, `_ready`:26, `_hash01`:36, `target`:39, `_build_drops`:58, `under_roof`:88, `_physics_process`:101

### game/world_biosphere.gd (4427 lines, 187 funcs)

Sections: 2996 0.55.0: three new continents, stable appended animal and quest IDs.; 3318 0.55.1: continuous floor transitions, protected paths and rescue.; 3999 0.55.11: open reserve layout shared by all seven domes. No pens: every species roams a big open habitat

Functions: `_init`:139, `reset_state`:143, `load_state`:146, `save_state`:155, `changed`:158, `dome_c`:162, `local_point`:166, `inside`:172, `dome_at`:184, `material`:191, `shape`:197, `box`:219, `ball`:222, `beam`:225, `text`:241, `flush`:254, `disc`:273, `entrance_ramp`:285, `build`:297, `round_rail_mesh`:402, `hex_roof`:422, `shell`:465, `sign_frame`:593, `hub_doors`:602, `gate`:633, `nature`:657, `tree`:678, `tree_parts`:684, `landscape`:698, `walkway`:763, `habitats`:766, `recolor`:867, `spawn_animal`:876, `quest_markers`:921, `quest_point`:947, `now`:970, `today`:973, `day_number`:976, `feeding`:979, `rare_event`:986, `baby_dome`:993, `rank_index`:996, `rank_name`:1003, `reward`:1006, `achieve`:1013, `species_mask`:1019, `page_ready`:1026, `finish_passport`:1033, `claim_page`:1039, `spot`:1048, `start_quest`:1055, `quest_step`:1062, `coop_near`:1065, `advance_quest`:1074, `prompt`:1100, `dusk`:1111, `interact`:1114, `keeper`:1159, `keeper_here`:1168, `auto_keeper`:1172, `finish_keeper`:1176, `photo_target`:1210, `photo_capture`:1234, `tick`:1249, `tick_impl`:1261, `animate_animal`:1422, `reset_stick`:1494, `close_panel`:1501, `open_panel`:1507, `ui_label`:1532, `ui_button`:1540, `select_page`:1545, `forget_buttons`:1549, `refresh_panel`:1556, `smoke`:1610, `drive_body`:1941, `dome_shots`:1947, `screenshots`:1985, `backdrop`:2077, `walk_route`:2106, `rich_landscape`:2138, `planting_clear`:2197, `rain_ring`:2229, `gallery_points`:2256, `gallery_clear`:2267, `sky_gallery`:2288, `route_clear`:2313, `park_lamp`:2327, `rail`:2342, `build_corner_rails`:2346, `build_dome_loop`:2375, `quest_guide`:2413, `visitor_y`:2432, `add_visitor`:2441, `build_visitors`:2459, `tick_visitors`:2478, `door_point`:2529, `dome_signpost`:2532, `outside_signposts`:2563, `inside_signpost`:2576, `door_markers`:2585, `colonnade`:2603, `garden_ring`:2636, `glass_edge`:2668, `waterfall`:2676, `soft_mist`:2700, `ground_route`:2729, `ground_trails`:2744, `africa_lookout`:2756, `asia_route`:2777, `asia_rainwalk`:2786, `antarctic_route`:2816, `antarctic_spiral`:2825, `tree_fort`:2841, `floe_approach`:2851, `habitat_layers`:2870, `upper_animal`:2924, `high_habitat`:2961, `x_layer`:2980, `z_layer`:2984, `tall_tree`:2987, `phase2_pen`:2997, `phase2_route`:3001, `phase2_quest_point`:3012, `phase2_interact`:3033, `phase2_action`:3058, `phase2_landscape`:3071, `phase2_layers`:3170, `phase2_walkway`:3181, `sweep_join`:3188, `build_sweeps`:3216, `refined_coat`:3251, `profile_report`:3270, `profile_node_count`:3284, `profile_node`:3290, `rim_bevel`:3319, `collision_wall`:3351, `flush_guard_batches`:3361, `detail_index`:3377, `register_walk`:3383, `register_deck`:3390, `project_segment`:3399, `surface_distance`:3404, `finish_guards`:3418, `inside_pen`:3458, `open_path_point`:3465, `safety_net`:3484, `can_fly`:3509, `record_scenery`:3513, `scenery_aabb`:3522, `clear_scenery_bounds`:3530, `resolve_scenery`:3578, `register_habitats`:3635, `unload_detail`:3664, `load_dome`:3697, `activate_dome`:3742, `capture_exterior`:3762, `campus_surface`:3770, `build_open_paths`:3774, `build_garden_edges`:3801, `foliage_mesh`:3846, `small_foliage_texture`:3874, `apply_dome_quality`:3890, `restore_dome_quality`:3903, `profile_audio`:3911, `assign_feeding_slots`:3921, `feeding_target`:3932, `visitor_stage_route`:3947, `path_floor`:3962, `flush_walk_meshes`:3970, `reserve`:4043, `reserve_zone`:4046, `path_arms`:4052, `africa_path_nodes`:4055, `africa_blob`:4061, `africa_ramp_y`:4072, `reserve_station`:4075, `reserve_tree`:4079, `reserve_build`:4088, `path_clear`:4183, `reserve_zone_props`:4189, `africa_zone_props`:4207, `reserve_wow`:4232, `africa_path_segs`:4285, `africa_path_dist`:4294, `reserve_detail`:4304, `africa_shots`:4390

### game/worlds.gd (343 lines, 24 funcs)

Functions: `relic_count`:101, `sky_open`:108, `in_sky`:111, `sky_portal_pos`:114, `build_sky`:117, `enter_sky`:155, `sky_prompt`:166, `sky_interact`:178, `_init`:201, `_set_dry`:207, `build_hub`:212, `current`:237, `player_in_world`:246, `near_hub`:251, `prompt`:257, `interact`:269, `busy`:285, `enter`:291, `go_home`:296, `go_portal`:306, `tick`:314, `save_state`:328, `load_state`:334, `summary`:340

## Finding things fast

- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.
- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.
- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.
- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.
- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.

