# CODE MAP (generated: do not edit by hand)

Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:
`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.

## How the code is organised

- `game/main.gd` (35370 lines, 1260 functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below.
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
| 7228-8819 | v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online) | 39 |
| 8820-11452 | v0.5.0: original synthesized radio and ambient pedestrians | 41 |
| 11453-12101 | v0.16.0: Skyline District (big downtown), traffic with signals, busier streets | 22 |
| 12102-12205 | old city and Bay details | 1 |
| 12206-12615 | traffic | 10 |
| 12616-12983 | v0.17.0: minimap, full map and camera views (Far / Close / In-car) | 14 |
| 12984-13264 | camera views | 10 |
| 13265-13512 | v0.17.0: level-up celebration | 8 |
| 13513-13634 | v0.18.0: walk-in stadium | 5 |
| 13635-13796 | v0.18.0: guidance arrows and checkpoints | 6 |
| 13797-13982 | checkpoints | 9 |
| 13983-14261 | v0.18.0: Harbor Dome social hub | 2 |
| 14262-14312 | v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents) | 3 |
| 14313-14636 | v0.56.5: one grand Christmas tree and luxury furniture | 16 |
| 14637-14792 | v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside | 1 |
| 14793-15041 | v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome | 8 |
| 15042-15256 | people: sitting pose, bots, bubbles, emotes | 6 |
| 15257-15375 | seats | 6 |
| 15376-15532 | game panel | 7 |
| 15533-15653 | tic-tac-toe | 7 |
| 15654-15705 | rock paper scissors | 4 |
| 15706-15788 | online table messages | 2 |
| 15789-15864 | comedy show | 4 |
| 15865-16764 | quick chat and emotes | 26 |
| 16765-16930 | v0.18.1: main chat feed and "looking for players" invites | 10 |
| 16931-17172 | v0.18.2: nickname and HUD relayout | 12 |
| 17173-17460 | v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) | 11 |
| 17461-17570 | v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) | 4 |
| 17571-17898 | circuit geometry | 12 |
| 17899-17996 | race car rental | 5 |
| 17997-18011 | speed effects | 2 |
| 18012-18062 | track helpers | 5 |
| 18063-18299 | events | 11 |
| 18300-18352 | boosters and spikes | 4 |
| 18353-18410 | online races | 2 |
| 18411-18766 | raceway panel, HUD, board | 10 |
| 18767-18974 | v0.22.0: Call Car | 6 |
| 18975-19432 | v0.23: RUN toggle and fast travel between districts | 25 |
| 19433-19506 | v0.24: "Scan to play" QR code (opens the browser version and turns Online on) | 4 |
| 19507-19943 | v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) | 12 |
| 19944-20435 | v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) | 15 |
| 20436-20586 | v0.24.1: Quests list (nearby quick quests, pick any one) | 8 |
| 20587-20621 | v0.24.1: your own name tag above your head (or above your car) | 2 |
| 20622-20936 | v0.33.6: Harbor Food Court (three street stands with crowds, old city) | 14 |
| 20937-21258 | v0.36: Harbor Commons, a modern park in the empty field by Bay Road | 4 |
| 21259-21573 | v0.36: the daily puzzle | 17 |
| 21574-21762 | v0.37 - v0.39: THE BIOSPHERE | 22 |
| 21763-22135 | building blocks | 23 |
| 22136-22637 | building | 16 |
| 22638-22793 | garden planting | 11 |
| 22794-23201 | the four layouts | 4 |
| 23202-23472 | animals | 8 |
| 23473-23606 | animation, spotting and rewards | 6 |
| 23607-24124 | v0.40: STYLE - hair, faces, builds, clothes, accessories and relics | 8 |
| 24125-24278 | your look: apply, save, share | 9 |
| 24279-24706 | stores and the wardrobe | 23 |
| 24707-25174 | HARBOR GALLERIA: the shopping mall | 14 |
| 25175-25326 | featured outfits and the Sky Run | 7 |
| 25327-25423 | v0.41: THE SKY GARDEN | 5 |
| 25424-25561 | building | 5 |
| 25562-25742 | plants | 6 |
| 25743-25862 | interacting | 7 |
| 25863-26106 | the garden screen | 9 |
| 26107-26145 | v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar | 2 |
| 26146-26177 | album | 2 |
| 26178-26229 | season | 6 |
| 26230-26237 | Harbor Night | 1 |
| 26238-26269 | check-in calendar | 1 |
| 26270-26446 | the panel | 8 |
| 26447-26678 | v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard") | 16 |
| 26679-27237 | v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard | 18 |
| 27238-27482 | v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news) | 8 |
| 27483-27661 | v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams) | 4 |
| 27662-27698 | v0.34.5: a parked car drives itself home after 2 minutes | 3 |
| 27699-27795 | v0.34.7: modern bus shelters with live displays, and city buses in traffic | 3 |
| 27796-28087 | v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) | 15 |
| 28088-28188 | v0.24.1: glowing ring under real players (NPC walkers have none) | 3 |
| 28189-28512 | v0.24.1: FIND ME! (online hide-and-seek with prize money) | 12 |
| 28513-28623 | v0.24.2: road map (for moving people off the road) | 8 |
| 28624-28919 | v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) | 7 |
| 28920-29114 | v0.27: one connected city, Harbor Loop sky train, day and night | 6 |
| 29115-29782 | Harbor Loop sky train | 27 |
| 29783-30156 | Day and night | 11 |
| 30157-30794 | v0.27 smoke test and screenshots | 2 |
| 30795-31211 | v0.27: Harbor International Airport (north of the city) | 10 |
| 31212-31725 | v0.44: people who walk around (Galleria, Biosphere, plazas) | 15 |
| 31726-31886 | v0.44: directions (signposts at junctions, Directions menu) | 4 |
| 31887-31983 | the Directions panel and chip | 7 |
| 31984-32525 | v0.44: Grand Central | 16 |
| 32526-32817 | v0.44: filling the empty land | 8 |
| 32818-32852 | v0.45: hover car underglow | 1 |
| 32853-33017 | v0.46: what is inside the Grand Central shops | 1 |
| 33018-33049 | v0.47: street stalls downtown | 2 |
| 33050-33148 | v0.48: places that open as you level up | 6 |
| 33149-33193 | v0.50: city careers | 5 |
| 33194-33244 | v0.52: careers as clear job loops | 3 |
| 33245-33252 | taxi | 1 |
| 33253-33256 | paramedic | 0 |
| 33257-33261 | police | 1 |
| 33262-33267 | firefighter | 1 |
| 33268-33277 | the step bar | 2 |
| 33278-33304 | cut scenes | 1 |
| 33305-33309 | siren | 0 |
| 33310-33321 | the Careers panel | 3 |
| 33322-33745 | v0.50: homes | 17 |
| 33746-34081 | decorating | 7 |
| 34082-34216 | v0.51: home layout (living room, bedroom, bathroom) | 6 |
| 34217-34650 | v0.51: Chapters (a guided story across the whole map) | 16 |
| 34651-34689 | v0.51.1: join and leave messages | 3 |
| 34690-34954 | v0.51.2: Photo mode (clean screenshots) | 9 |
| 34955-35253 | v0.51.3: stream joiners | 9 |
| 35254-35370 | v0.52.1: streamer mode shows only what the stream needs | 4 |

## Function families (name prefixes with 6+ functions)

The prefix usually names the system. Span = first to last function line (families can be interleaved with others).

| Prefix | What | Funcs | Lines (first-last) |
|---|---|---|---|
| `_future_*` | neon / futuristic look | 7 | 631-5675 |
| `_nearest_*` |  | 9 | 1282-17206 |
| `_car_*` |  | 7 | 1447-32821 |
| `_online_*` | Supabase realtime multiplayer | 23 | 2050-16826 |
| `_shop_*` | Marina Heights shops | 9 | 2668-16452 |
| `_bus_*` | Airport Line and city buses | 14 | 2712-27773 |
| `_level_*` | player levels | 7 | 3241-13378 |
| `_chase_*` | police chase mode | 11 | 3389-3636 |
| `_quest_*` | quests | 8 | 5225-20558 |
| `_sky_*` | Harbor Loop sky train, sky look | 32 | 5565-29761 |
| `_crew_*` | crews | 6 | 5754-6092 |
| `_style_*` | hair, clothes, wardrobe | 18 | 5810-24695 |
| `_social_*` | friends, invites | 8 | 5858-6316 |
| `_soc_*` | social extras | 8 | 5897-6190 |
| `_c4_*` | Connect Four | 9 | 6531-6647 |
| `_rx_*` | Reaction Duel | 6 | 6674-6749 |
| `_quiz_*` | party quiz | 9 | 6997-7194 |
| `_ach_*` | achievements | 8 | 7415-24690 |
| `_radio_*` | radio and ambience | 8 | 8824-8988 |
| `_smoke_*` | smoke tests | 47 | 9236-35317 |
| `_shot_*` | screenshot modes | 8 | 11435-34789 |
| `_hub_*` | Harbor Dome hub | 12 | 14041-17437 |
| `_lux_*` |  | 12 | 14456-14585 |
| `_ttt_*` | tic-tac-toe | 7 | 15536-15627 |
| `_chat_*` |  | 10 | 16004-16379 |
| `_sg_*` | Sky Garden | 28 | 16715-25976 |
| `_rw_*` | Raceway | 30 | 17586-18514 |
| `_crate_*` | starter crate | 8 | 19527-19848 |
| `_quick_*` | quick quests | 11 | 19985-20294 |
| `_fc_*` | food court and shared 3D part helpers | 13 | 20639-24231 |
| `_pz_*` | daily puzzle | 10 | 21282-21450 |
| `_bio_*` | OLD Biosphere (hex hub; the live one is world_biosphere.gd) | 79 | 21636-25142 |
| `_ga_*` | Galleria mall | 13 | 24743-25254 |
| `_season_*` | season pass | 6 | 26179-26211 |
| `_lb_*` | leaderboard | 11 | 26555-26632 |
| `_ds_*` | digital signs | 6 | 27270-27432 |
| `_treasure_*` | treasure hunt | 10 | 27814-28073 |
| `_fm_*` | Find Me | 11 | 28210-28383 |
| `_ap_*` | Harbor Airport | 7 | 31005-31125 |
| `_nav_*` | walker nav grids | 9 | 31226-31472 |
| `_dir_*` | Directions panel | 7 | 31761-31957 |
| `_gc_*` | Grand Central | 9 | 32013-32854 |
| `_career_*` | careers and jobs (taxi, medic, police, fire) | 12 | 33174-35171 |
| `_home_*` | homes | 21 | 33362-34161 |
| `_ch_*` | chapters | 6 | 34280-34327 |

## Landmarks: entry points and builders (the core lives here, spread across sections)

Entry points: `_ready`:298, `_apply_car`:1408, `_collider`:1666, `_level`:3259, `_input`:7729, `_physics_process`:7863, `_refresh_hud`:8243, `_toggle_menu`:8429, `_show_toast`:8507, `_save_progress`:8511, `_load_progress`:8608, `_process`:9001, `_blocked_at`:10207, `_blocker`:10222, `_apply_view`:13052, `_place_lock_of`:33063

World builders (`_build_*`): `_build_world`:1084, `_build_collectibles`:1221, `_build_bay`:1523, `_build_north`:1793, `_build_nm_blocks`:1910, `_build_north_landscape`:1995, `_build_landscape`:2032, `_build_bus`:2718, `_build_marina`:2865, `_build_hat`:2977, `_build_ridge`:3824, `_build_panels`:4098, `_build_player`:4258, `_build_car`:4296, `_build_hud`:4784, `_build_quest_offer`:5195, `_build_future`:5360, `_build_neon`:5374, `_build_holograms`:5480, `_build_sky_traffic`:5547, `_build_social`:6111, `_build_dance_floor`:6290, `_build_arcade`:6480, `_build_arcade_panel`:6829, `_build_quiz`:7051, `_build_ach`:7550, `_build_peds`:9052, `_build_downtown`:11835, `_build_park`:12058, `_build_plaza`:12087, `_build_city_detail`:12103, `_build_traffic`:12207, `_build_minimap`:12770, `_build_view_controls`:12985, `_build_level_fx`:13276, `_build_stadium_walls`:13529, `_build_guidance`:13694, `_build_checkpoints`:13798, `_build_hub`:14045, `_build_hub_bots`:15068, `_build_game_panel`:15377, `_build_chat`:15887, `_build_feed`:16774, `_build_nick_panel`:16970, `_build_civic`:17272, `_build_raceway`:17672, `_build_rw_parking`:17706, `_build_rw_pits`:17751, `_build_rw_track`:17788, `_build_rw_trackside`:17829, `_build_raceway_ui`:18412, `_build_travel`:19021, `_build_qr`:19440, `_build_crate_ui`:19560, `_build_quick_props`:20096, `_build_quest_list`:20445, `_build_food_court`:20762, `_build_commons`:20995, `_build_puzzle_panel`:21419, `_build_biosphere`:22137, `_build_biosphere_legacy`:22141, `_build_style_panel`:24358, `_build_galleria`:24782, `_build_ga_fun`:25209, `_build_sky_garden`:25445, `_build_sg_panel`:25864, `_build_hp_panel`:26271, `_build_lb`:26497, `_build_market`:26703, `_build_gear`:26792, `_build_pet`:26866, `_build_market_panel`:27066, `_build_display`:27303, `_build_streamer`:27500, `_build_treasure_props`:27897, `_build_treasure`:27941, `_build_expansion`:28734, `_build_connect`:28961, `_build_skytrain`:29300, `_build_airport`:30829, `_build_signposts`:31784, `_build_dir_panel`:31888, `_build_grand_central`:32246, `_build_gc_towers`:32414, `_build_fill`:32595, `_build_gardens`:32663, `_build_fan_plaza`:32773, `_build_street_stalls`:33022, `_build_place_signs`:33080, `_build_career_panel`:33311, `_build_homes`:33377, `_build_home_panels`:33747, `_build_chapters_ui`:34419


## Smoke tests in main.gd

- `_smoke_test` line 9236
- `_smoke_chase` line 9889
- `_smoke_orole` line 9922
- `_smoke_levels` line 9951
- `_smoke_bus` line 9992
- `_smoke_chase_extras` line 10077
- `_smoke_marina` line 10105
- `_smoke_radio_peds` line 10247
- `_smoke_typed_chat` line 10317
- `_smoke_chat_touch` line 10336
- `_smoke_cafe` line 10357
- `_smoke_boutique` line 10383
- `_smoke_models` line 10411
- `_smoke_garage_ridge` line 10435
- `_smoke_downtown` line 12458
- `_smoke_views` line 13202
- `_smoke_level_fx` line 13479
- `_smoke_stadium_eye` line 13566
- `_smoke_guidance_checkpoints` line 13907
- `_smoke_hub` line 16205
- `_smoke_nick` line 17092
- `_smoke_sites_reachable` line 17142
- `_smoke_raceway` line 18548
- `_smoke_follow_call` line 18869
- `_smoke_travel` line 19307
- `_smoke_qr` line 19500
- `_smoke_crate` line 19800
- `_smoke_quick` line 20327
- `_smoke_quests` line 20561
- `_smoke_chat` line 21491
- `_smoke_feet` line 21529
- `_smoke_commons` line 21550
- `_smoke_biosphere` line 23603
- `_smoke_style` line 23865
- `_smoke_car_barriers` line 25982
- `_smoke_sky_garden` line 26023
- `_smoke_pass` line 26384
- `_smoke_treasure` line 28146
- `_smoke_findme` line 28439
- `_smoke_v27` line 30158
- `_smoke_airport` line 31168
- `_smoke_strollers` line 31610
- `_smoke_careers_homes` line 33872
- `_smoke_chapters` line 34505
- `_smoke_photo` line 34861
- `_smoke_stream_join` line 35088
- `_smoke_streamer_clean` line 35317

## Other scripts

### game/autoplay.gd (498 lines, 26 funcs)

Functions: `_init`:44, `_ready`:47, `goto`:57, `steer`:64, `watchdog`:85, `ready_to_play`:103, `_physics_process`:106, `clear_screen`:173, `force_travel`:186, `start_dome_route`:204, `walk_route_tick`:218, `on_enter`:230, `dome_quest_tick`:246, `prepare_station`:269, `station_tick`:279, `wait_tick`:298, `ride_tick`:312, `arrive_city`:328, `road_edge_dist`:350, `sidewalk_ok`:363, `path_clear`:371, `note_trail`:399, `novelty`:405, `pick_wander`:412, `city_tick`:453, `shot_tick`:489

### game/cafe.gd (618 lines, 28 funcs)

Sections: 281 the lounge: a big partitioned hang-out area with booth bays (white, porthole screens, glowing strips); 406 interaction; 484 ordering

Functions: `_init`:40, `rng_f`:44, `lp`:48, `prop`:51, `solid`:62, `glass`:71, `tangent_box`:80, `build_cafe`:85, `build_lounge`:282, `in_lounge`:376, `counter_spot`:379, `holding_cup`:383, `build_cup`:387, `tint_cup`:395, `near`:407, `button_text`:412, `hour_number`:415, `special_index`:418, `price_of`:421, `speed_mult`:425, `_process`:428, `build_panel`:485, `open`:509, `close`:515, `refresh`:519, `player_name`:559, `pick`:563, `finish_order`:583

### game/careers.gd (1231 lines, 64 funcs)

Functions: `_init`:7, `_career_rank`:10, `_career_rank_name`:17, `_career_mult`:20, `_career_spots`:23, `_career_pick`:51, `_career_block_reason`:62, `_career_start`:75, `_career_lights`:94, `_career_lights_off`:109, `_career_end`:118, `_career_clear_job`:134, `_cid`:147, `_career_place_name`:150, `_career_tag`:162, `_career_person`:179, `_cj_pp`:206, `_cj_anim`:209, `_cj_pose`:215, `_cj_pose_tick`:240, `_cj_hands_up`:245, `_cj_face`:248, `_career_fire`:254, `_career_next`:318, `_career_target`:356, `_career_pay`:366, `_career_rank_line`:374, `_career_job_done`:380, `_career_job_failed`:399, `_career_tick`:407, `_taxi_meter`:469, `_taxi_tip`:489, `_cs_taxi_pickup`:495, `_taxi_seat`:528, `_cs_taxi_dropoff`:540, `_stretcher`:584, `_cs_medic_load`:596, `_cs_medic_unload`:635, `_cs_police_radio`:666, `_career_chase_over`:679, `_fire_aimed`:722, `_fire_hose_tick`:732, `_cs_fire_out`:789, `_career_bar_build`:818, `_career_steps_bbcode`:848, `_career_bar_text`:862, `_career_bar_tick`:891, `_career_hud`:908, `_cs_play`:915, `_cs_tick`:929, `_cs_skip`:946, `_cs_finish`:952, `_cs_side_cam`:968, `_cs_cam`:987, `_cs_ui`:1001, `_cs_caption`:1052, `_cs_mirror`:1071, `_siren_sound`:1118, `_siren`:1140, `_build_career_panel`:1153, `_open_careers`:1192, `_career_ach_line`:1210, `_career_close`:1225, `_career_end_close`:1229

### game/cure.gd (912 lines, 53 funcs)

Sections: 151 the infected that roam the city; 250 the cure gun; 392 every frame; 513 the boss; 743 quest tracker rows; 893 save

Functions: `_init`:79, `today`:84, `roll_day`:87, `boss_name`:96, `local`:99, `world`:102, `arena`:105, `arena_pos`:134, `players_here`:137, `power`:148, `bases`:152, `open_at`:161, `free_spot`:164, `add_zombie`:176, `populate`:187, `build_lair`:216, `despawn`:230, `targets`:247, `fire`:251, `hit_zombie`:282, `cure`:294, `check_quests`:325, `beam`:335, `tone`:360, `zap`:381, `roar`:384, `thud`:389, `tick`:393, `move_zombies`:434, `damage`:461, `die`:466, `tick_trapped`:474, `rescue`:491, `prompt`:514, `owns`:521, `interact`:524, `wake`:527, `call_help`:536, `send`:549, `net`:553, `boss_start`:573, `hit_boss`:617, `boss_tick`:630, `boss_end`:691, `goto_arena`:737, `quest_items`:744, `bar`:777, `out_label`:792, `build_hud`:802, `hud`:834, `set_sky`:885, `save_state`:894, `load_state`:904

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

### game/paris.gd (1142 lines, 60 funcs)

Sections: 102 helpers; 190 portals; 241 the district; 952 play

Functions: `_init`:82, `in_area`:103, `poly_area`:106, `to_poly`:113, `mm_boxes`:121, `seg_xf`:138, `beam_xf`:145, `finish`:154, `load_data`:180, `make_portal`:191, `label`:228, `ensure_built`:242, `build_ground`:278, `build_river`:288, `build_water`:331, `build_parks`:353, `build_roads`:380, `facade_details`:416, `dormers`:443, `prism`:454, `cap`:471, `build_buildings`:479, `in_building`:537, `build_trees`:554, `build_lamps`:639, `build_landmark`:687, `lm_radius`:700, `hw`:703, `build_tower`:706, `build_cafe`:760, `clue_world`:778, `build_mystery`:782, `update_clues`:803, `clue_text`:807, `found_clue`:810, `clue_count`:825, `submit_case`:832, `facing`:854, `panel`:858, `build_crossing`:870, `build_times`:899, `build_prang`:916, `build_statue`:940, `near`:953, `in_paris`:956, `lm_pos`:960, `prompt`:964, `busy`:982, `interact`:985, `move_player`:1008, `enter`:1016, `go_home`:1039, `order`:1046, `done_count`:1050, `roll_day`:1057, `pay`:1068, `award`:1081, `tick`:1094, `save_state`:1117, `load_state`:1130

### game/promo.gd (346 lines, 15 funcs)

Functions: `_init`:16, `_ready`:19, `_process`:24, `frames`:38, `smooth`:42, `mark`:45, `move`:48, `visitor`:59, `newest_only`:66, `me_say`:73, `say`:77, `emote`:86, `clear_cast`:93, `put_player`:102, `run`:109

### game/road_barrier.gd (314 lines, 18 funcs)

Sections: 167 finding the road; 260 safety net; 288 checks

Functions: `_init`:25, `in_zone`:28, `_inside`:36, `on_road`:40, `_in_gap`:46, `_solid_cell`:52, `build`:63, `_emit`:117, `_visuals`:127, `nearest_road`:168, `road_dist`:186, `cp_car`:190, `_free_road_spot`:196, `call_car_spot`:208, `kerb_spot`:215, `rescue`:261, `tick`:270, `smoke`:289

### game/sun_dome.gd (183 lines, 8 funcs)

Functions: `_init`:19, `pt`:25, `rib`:28, `multimesh`:39, `spin`:52, `part`:57, `build`:60, `build_core`:148

### game/tracker.gd (233 lines, 8 funcs)

Functions: `_init`:23, `build`:27, `place`:93, `set_open`:97, `collect`:102, `pick_default`:142, `rebuild_rows`:153, `tick`:189

### game/v72_check.gd (306 lines, 7 funcs)

Functions: `_init`:5, `ground_y`:8, `probe`:14, `run`:34, `frames`:68, `shots`:73, `checks`:130

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

