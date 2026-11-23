# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-576  Core (unlabelled)

`_symbol_font`:280, `_ready`:292, `_surf_texture`:519, `_surface_material`:541

## 577-649  v0.34.6: futuristic towers for the old city

`_future_tower`:581

## 650-728  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:657, `_skin_common`:692, `_future_wall`:700, `_future_roof`:714, `_future_pave`:722

## 729-789  v0.34.4: futuristic road surface

`_road_textures`:736, `_future_road`:770

## 790-1995  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:809, `_real_tex`:850, `_real_setup`:858, `_real_kind`:879, `_realify`:885, `_real_glass`:922, `_make_window_textures`:942, `_material`:975, `_box`:1000, `_sign`:1022, `_build_world`:1034, `_future_kiosk`:1142, `_build_collectibles`:1168, `_auto_collect_tick`:1201, `_find_count`:1222, `_nearest_find`:1229, `_destination`:1243, `_toggle_activity`:1279, `_collect_find`:1308, `_owned_count`:1323, `_ridge_open`:1330, `_ridge_count`:1334, `_nearest_ridge`:1341, `_apply_car`:1355, `_tune_level`:1385, `_tune_cost`:1388, `_car_stats`:1394, `_buy_tune`:1401, `_open_tune`:1422, `_back_to_garage`:1428, `_refresh_tune`:1432, `_bay_open`:1443, `_area_open`:1446, `_bay_count`:1449, `_nearest_bay`:1456, `_build_bay`:1470, `_check_bay`:1523, `_discover_bay`:1536, `_north_count`:1549, `_north_open`:1556, `_nearest_north`:1559, `_check_north`:1573, `_discover_north`:1586, `_prop`:1599, `_collider`:1613, `_first_mesh`:1623, `_scatter`:1632, `_prop_stretch`:1666, `_north_token`:1675, `_nm_roads`:1702, `_prop_big`:1717, `_nm_near_cross`:1733, `_build_north`:1740, `_build_nm_blocks`:1857, `_build_north_landscape`:1942, `_nm_free`:1969, `_build_landscape`:1979

## 1996-2475  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:1997, `_online_toggle`:2011, `_online_autostart`:2037, `_online_connect`:2056, `_online_stop`:2063, `_online_next_ref`:2074, `_online_send`:2078, `_online_join_frame`:2082, `_online_pos_frame`:2085, `_online_tick`:2094, `_online_handle`:2128, `_online_clean_name`:2181, `_online_peer_update`:2190, `_online_make_peer`:2255, `_peer_look`:2296, `_online_tint`:2353, `_paint_mat`:2369, `_online_update_peers`:2381, `_online_clear_peers`:2461, `_online_refresh_button`:2466

## 2476-2648  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2556, `_marina_count`:2559, `_nearest_marina`:2566, `_check_marina`:2580, `_discover_marina`:2593, `_shop_available`:2606, `_nearest_shop`:2609, `_premium_cars`:2617, `_glass`:2624, `_shop_building`:2630, `_shop_pad`:2640

## 2649-3164  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2650, `_bus_last`:2653, `_build_bus`:2656, `_bus_boxes`:2683, `_bus_skin`:2693, `_bus_side`:2706, `_bus_reset`:2709, `_bus_text`:2718, `_bus_tick`:2723, `_bus_near`:2763, `_bus_board`:2774, `_bus_alight`:2789, `_build_marina`:2803, `_set_hat`:2909, `_build_hat`:2912, `_cyl`:2977, `_hat_part`:2986, `_apply_avatar`:2995, `_shop_count`:3007, `_shop_open`:3017, `_shop_step`:3035, `_shop_close`:3041, `_owned_text`:3054, `_refresh_shop`:3057, `_shop_action`:3110, `_journal_flip`:3161

## 3165-3219  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3176, `_xp`:3179, `_level_for`:3186, `_level`:3194, `_level_text`:3197, `_check_level`:3207

## 3220-3322  v0.11.0: online police vs thief

`_orole_ready`:3221, `_orole_start`:3224, `_orole_end`:3251, `_orole_tick`:3260

## 3323-4266  v0.10.0: chase mode (offline)

`_chase_open`:3324, `_chase_clear`:3329, `_chase_make_unit`:3343, `_chase_spawn_point`:3373, `_chase_start`:3382, `_chase_end`:3418, `_chase_steer`:3437, `_chase_roadblock`:3473, `_chase_heli_build`:3518, `_chase_extras`:3544, `_chase_tick`:3571, `_start_trial`:3635, `_cancel_trial`:3662, `_check_trial`:3667, `_finish_trial`:3684, `_trial_count`:3700, `_open_trials`:3707, `_refresh_trials`:3711, `_update_gate`:3723, `_slab`:3741, `_build_ridge`:3759, `_check_ridge`:3822, `_discover`:3835, `_mission_progress`:3849, `_check_missions`:3911, `_open_garage`:3922, `_open_journal`:3927, `_close_sub`:3932, `_bar`:3935, `_refresh_garage`:3939, `_garage_step`:3964, `_garage_action`:3968, `_refresh_journal`:3988, `_visited_shops`:4021, `_build_panels`:4028, `_build_player`:4188, `_build_car`:4226, `_try_model`:4255

## 4267-4940  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4268, `_kshader`:4342, `_ksync`:4348, `_kskin`:4363, `_make_kperson`:4369, `_hat_y`:4433, `_sit_drop`:4436, `_kplay`:4439, `_kpeople_tick`:4449, `_pose_person`:4478, `_pose_limbs`:4495, `_person_lift`:4557, `_snap_crowd_feet`:4570, `_people_life_tick`:4586, `_life_one`:4623, `_cull_person`:4633, `_recolor_car_model`:4641, `_apply_car_model`:4655, `_landmark`:4675, `_label`:4685, `_button`:4692, `_panel`:4704, `_build_hud`:4714

## 4941-5059  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4947, `_menu_tab`:4953, `_watch_tick`:4976, `_watch_count`:5018, `_online_pill_tap`:5025, `_online_pill_tick`:5031, `online_config_ok`:5057

## 5060-5097  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5063, `_offroad`:5069, `_ground_near`:5082, `_collectibles_on_road`:5089

## 5098-5237  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5110, `_build_quest_offer`:5114, `_quest_offer_tick`:5144, `_quest_auto_pick`:5194, `_quest_accept`:5209, `_quest_decline`:5223, `_quest_stop`:5229

## 5238-5605  v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5262, `_holo_material`:5271, `_build_future`:5279, `_build_neon`:5293, `_model_profile`:5362, `_model_body_box`:5385, `_build_holograms`:5399, `_holo_tick`:5449, `_build_sky_traffic`:5466, `_sky_hover_car`:5484, `_sky_drone`:5531, `_sky_traffic_tick`:5575, `_future_lights`:5594

## 5606-6105  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5665, `_crew_col`:5673, `_peer_crewmate`:5676, `_set_ring_color`:5679, `_level_color`:5706, `_tier_color`:5719, `_my_ach_tier`:5722, `_style_ring`:5729, `_social_peer_extras`:5777, `_social_tag`:5791, `_my_tag_extra`:5803, `_soc_send`:5816, `_social_msg`:5831, `_social_accept`:5870, `_social_go`:5891, `_soc_friend`:5910, `_soc_invite`:5917, `_soc_goto`:5922, `_soc_high_five`:5930, `_soc_gift`:5950, `_soc_crew_invite`:5967, `_gift_day_check`:5974, `_crew_create`:5980, `_crew_cycle_color`:5990, `_crew_leave`:5995, `_crew_mate_near`:6003, `_crew_board`:6011, `_build_social`:6030, `_social_online`:6092, `_open_social`:6096, `_close_social`:6102

## 6106-6356  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6109, `_track_pos`:6118, `_social_row_button`:6129, `_refresh_social`:6136, `_on_dance_floor`:6198, `_toggle_dance`:6201, `_build_dance_floor`:6209, `_social_tick`:6235, `_photo`:6307

## 6357-6852  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6379, `_game_state`:6387, `_build_arcade`:6399, `_c4_empty`:6450, `_c4_drop_row`:6456, `_c4_winner`:6462, `_c4_bot_move`:6483, `_c4_code`:6512, `_c4_ready`:6518, `_c4_tap`:6521, `_c4_check`:6542, `_c4_tick`:6566, `_rx_ready`:6593, `_rx_start`:6596, `_rx_tap`:6610, `_rx_send_time`:6635, `_rx_resolve`:6642, `_rx_tick`:6668, `_mem_start`:6683, `_mem_tap`:6699, `_mem_finish`:6714, `_mem_tick`:6730, `_mem_board_text`:6737, `_build_arcade_panel`:6748, `_refresh_arcade_panel`:6791

## 6853-7146  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6916, `_quiz_slot`:6919, `_quiz_question`:6929, `_quiz_bot_score`:6958, `_in_quiz`:6967, `_build_quiz`:6970, `_quiz_answer`:7040, `_quiz_msg`:7053, `_quiz_board`:7061, `_quiz_tick`:7071, `_quiz_refresh`:7113

## 7147-8642  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7318, `_sites_found`:7321, `_sites_total`:7324, `_bits`:7327, `_ach_value`:7334, `_ach_tick`:7389, `_ach_check`:7414, `_ach_by_id`:7450, `_ach_msg`:7456, `_build_ach`:7469, `_ach_show`:7500, `_open_ach`:7520, `_close_ach`:7526, `_refresh_ach`:7530, `_ach_num`:7561, `_minimap_tap`:7564, `_menu_go`:7571, `_menu_stay`:7576, `_menu_call_car`:7580, `_toggle_clean_hud`:7586, `_refresh_menu_buttons`:7592, `_clean_hud_tick`:7602, `_draw_joystick`:7643, `_input`:7648, `_stick_zone`:7725, `_notification`:7729, `_physics_process`:7744, `_follow_camera`:7892, `_follow_walk_camera`:7928, `_interact`:7951, `_refresh_hud`:8105, `_open_panel`:8228, `_layout_panels`:8254, `_toggle_menu`:8277, `_rescue`:8317, `_show_toast`:8349, `_save_progress`:8353, `_load_progress`:8441

## 8643-10786  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8644, `_radio_voice`:8647, `_radio_make`:8680, `_radio_set`:8751, `_radio_play`:8773, `_radio_next`:8778, `_radio_talk_line`:8782, `_radio_caption`:8803, `_radio_refresh`:8811, `_process`:8824, `_build_peds`:8873, `_update_peds`:8984, `_update_ped`:9003, `_smoke_test`:9057, `_smoke_chase`:9696, `_smoke_orole`:9729, `_smoke_levels`:9758, `_smoke_bus`:9799, `_smoke_chase_extras`:9884, `_smoke_marina`:9912, `_blocked_at`:10014, `_blocker`:10029, `_on_screen`:10042, `_wait_radio`:10047, `_smoke_radio_peds`:10054, `_smoke_models`:10124, `_smoke_garage_ridge`:10148, `_save_shot`:10524, `_people_shots`:10534, `_shots`:10575, `_shot_car`:10769, `_capture_preview`:10779

## 10787-11435  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10854, `_downtown_count`:10857, `_nearest_downtown`:10864, `_check_downtown`:10878, `_discover_downtown`:10891, `_box_batch`:10905, `_model_batch`:10925, `_cut_ranges`:10979, `_dt_ranges`:10991, `_dt_has`:10998, `_dt_near_cross`:11004, `_place`:11010, `_signal_pole`:11021, `_cyl_batch`:11040, `_city_signals`:11064, `_ensure_light_mats`:11115, `_city_lamps`:11125, `_build_downtown`:11169, `_dt_block`:11369, `_downtown_token`:11375, `_build_park`:11392, `_build_plaza`:11421

## 11436-11539  old city and Bay details

`_build_city_detail`:11437

## 11540-11949  traffic

`_build_traffic`:11541, `_path_sample`:11636, `_light_look`:11650, `_light_green`:11658, `_traffic_place`:11662, `_traffic_blocked_by`:11674, `_traffic_tick`:11686, `_smoke_downtown`:11792, `_skyline_shot`:11904, `_skyline_shots`:11912

## 11950-12302  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:11996, `_web_scale`:12051, `_web_fps_tick`:12061, `_world_to_uv`:12078, `_map_angle`:12081, `_build_minimap`:12089, `_open_map`:12162, `_close_map`:12173, `_mini_point`:12180, `_site_markers`:12184, `_draw_arrow`:12216, `_draw_minimap`:12223, `_draw_full_map`:12270, `_minimap_tick`:12295

## 12303-12560  camera views

`_build_view_controls`:12304, `_cycle_view`:12346, `_apply_view`:12356, `_hide_labels`:12394, `_unfade`:12400, `_bake_map`:12406, `_shot_stats`:12456, `_view_shots`:12459, `_smoke_views`:12500

## 12561-12808  v0.17.0: level-up celebration

`_build_level_fx`:12572, `_draw_level_rays`:12609, `_level_fx_tick`:12619, `_level_sound`:12624, `_fx_material`:12666, `_level_up_fx`:12674, `_smoke_level_fx`:12775, `_levelup_shots`:12784

## 12809-12928  v0.18.0: walk-in stadium

`_collider_yaw`:12814, `_build_stadium_walls`:12825, `_look`:12853, `_smoke_stadium_eye`:12862, `_stadium_shots`:12898

## 12929-13090  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:12953, `_arrow_mesh`:12965, `_build_guidance`:12988, `_guide_target`:13013, `_guidance_tick`:13042, `_draw_hud_arrow`:13068

## 13091-13276  checkpoints

`_build_checkpoints`:13092, `_refresh_checkpoints`:13137, `_check_checkpoints`:13143, `_activate_checkpoint`:13153, `_checkpoint_spawn`:13174, `_spawn_at_checkpoint`:13179, `_draw_checkpoint_icon`:13195, `_smoke_guidance_checkpoints`:13201, `_guide_shots`:13251

## 13277-13537  v0.18.0: Harbor Dome social hub

`_hub_seat`:13335, `_build_hub`:13339

## 13538-13673  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13539, `_xm_mesh`:13548, `_xm_tree`:13556, `_hub_christmas`:13589

## 13674-13843  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:13675, `_hub_glass`:13827

## 13844-14051  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:13845, `_build_hub_bots`:13870, `_seat_of`:13901, `_bubble`:13911, `_emote`:13960, `_hub_people_tick`:13974

## 14052-14170  seats

`_seat_taken`:14053, `_nearest_seat`:14061, `_seat_label`:14073, `_sit`:14089, `_stand_up`:14133, `_seated_tick`:14152

## 14171-14327  game panel

`_build_game_panel`:14172, `_open_game_panel`:14227, `_refresh_game_panel`:14246, `_play_robot`:14291, `_peer_at`:14305, `_opponent_name`:14312, `_pay`:14320

## 14328-14448  tic-tac-toe

`_ttt_ready`:14331, `_ttt_winner`:14337, `_ttt_bot_move`:14347, `_ttt_tap`:14373, `_ttt_code`:14393, `_ttt_check`:14399, `_ttt_tick`:14422

## 14449-14500  rock paper scissors

`_rps_ready`:14450, `_rps_pick`:14456, `_rps_resolve`:14474, `_rps_tick`:14498

## 14501-14583  online table messages

`_online_game_send`:14502, `_hub_game_msg`:14508

## 14584-14659  comedy show

`_joke_start`:14585, `_joke_tick`:14597, `_speak`:14623, `_play_rimshot`:14632

## 14660-15220  quick chat and emotes

`_build_chat`:14677, `_chat_toggle_to`:14777, `_chat_log_add`:14785, `_chat_area`:14791, `_chat_near_count`:14809, `_chat_tick`:14818, `_toggle_chat`:14865, `_say`:14879, `_do_emote`:14893, `_smoke_hub`:14902, `_hub_shots`:15076, `_sg_on_terrace`:15171, `_people_only`:15174, `_people_only_keep_cars_out`:15178, `_car_barrier`:15190, `_hub_keep_cars_out`:15204

## 15221-15383  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:15230, `_feed_add`:15239, `_feed_render`:15245, `_feed_tick`:15273, `_online_event_send`:15282, `_at_pvp_table`:15289, `_game_name`:15296, `_send_lfp`:15299, `_lfp_msg`:15316, `_accept_invite`:15337

## 15384-15624  v0.18.2: nickname and HUD relayout

`_nick_rude`:15396, `_clean_nick`:15411, `_build_nick_panel`:15423, `_open_nick`:15461, `_random_nick`:15470, `_save_nick`:15476, `_close_nick`:15495, `_refresh_nick_button`:15504, `_relayout_hud`:15508, `_smoke_nick`:15544, `_nick_shots`:15576, `_smoke_sites_reachable`:15594

## 15625-15912  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:15651, `_nearest_civic`:15658, `_check_civic`:15672, `_discover_civic`:15685, `_civ_ranges`:15698, `_civ_has`:15712, `_civ_near_cross`:15718, `_build_civic`:15724, `_civic_token`:15850, `_civic_shots`:15867, `_hub_focus`:15889

## 15913-16022  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:15984, `_in_rw_lot`:15987, `_box_batch_rot`:15990, `_multi_collider`:16008

## 16023-16350  circuit geometry

`_cr_point`:16024, `_rw_build_path`:16038, `_rw_dir`:16066, `_rw_bend`:16071, `_ribbon`:16077, `_rw_band`:16097, `_rw_keepout`:16115, `_build_raceway`:16124, `_build_rw_parking`:16158, `_build_rw_pits`:16203, `_build_rw_track`:16240, `_build_rw_trackside`:16281

## 16351-16448  race car rental

`_model_key`:16352, `_race_car_start`:16355, `_tint_ghost`:16393, `_race_car_end`:16406, `_race_keep_cars_out`:16431

## 16449-16463  speed effects

`_eff_max`:16450, `_eff_accel`:16461

## 16464-16514  track helpers

`_rw_seg_progress`:16465, `_rw_track_dist`:16485, `_rw_point_dist`:16496, `_rw_player_progress`:16503, `_rw_target`:16509

## 16515-16751  events

`_rec_stop`:16516, `_rw_place`:16532, `_rw_grid_pos`:16539, `_rw_start`:16544, `_rw_spawn_ai`:16576, `_rw_ai_place`:16600, `_rw_tick`:16611, `_rw_ai_tick`:16664, `_rw_lap_done`:16706, `_rw_finish`:16718, `_rw_fmt`:16749

## 16752-16804  boosters and spikes

`_rw_buy`:16753, `_rw_use_boost`:16771, `_rw_use_spike`:16779, `_rw_drop_spike_at`:16790

## 16805-16862  online races

`_race_msg`:16806, `_join_race`:16828

## 16863-17218  raceway panel, HUD, board

`_build_raceway_ui`:16864, `_rw_layout`:16924, `_rw_open`:16931, `_rw_close`:16937, `_rw_refresh_panel`:16941, `_rw_refresh_board`:16954, `_rw_hud`:16966, `_peer_car_model`:16990, `_smoke_raceway`:17000, `_race_shots`:17181

## 17219-17426  v0.22.0: Call Car

`_call_block_reason`:17225, `_call_spot`:17242, `_call_car`:17273, `_play_horn`:17297, `_smoke_follow_call`:17321, `_follow_shots`:17394

## 17427-17726  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:17442, `_build_travel`:17447, `_toggle_run`:17489, `_refresh_run`:17493, `_hud_v23_tick`:17501, `_travel_block_reason`:17530, `_travel_open`:17550, `_open_travel`:17556, `_close_travel`:17562, `_refresh_travel`:17566, `_travel_to`:17574, `_smoke_travel`:17601, `_v23_shots`:17639

## 17727-17800  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:17734, `_qr_button`:17749, `_qr_layout`:17788, `_smoke_qr`:17794

## 17801-18237  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:17821, `_open_crate`:17837, `_build_crate_ui`:17854, `_crate_pick`:17941, `_crate_reveal`:17964, `_crate_draw_car`:17991, `_crate_confetti`:18010, `_crate_sound`:18035, `_crate_drive`:18061, `_feed_add_system`:18091, `_smoke_crate`:18094, `_crate_shots`:18142

## 18238-18729  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:18279, `_quick_today`:18284, `_quick_is_done`:18287, `_quick_left`:18290, `_quick_next`:18297, `_quick_fix_target`:18310, `_quick_daily_check`:18324, `_quick_complete`:18338, `_quick_side`:18372, `_build_quick_props`:18390, `_daily_shots`:18542, `_quick_props_refresh`:18584, `_quick_fx`:18588, `_play_coin`:18604, `_smoke_quick`:18621

## 18730-18880  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:18739, `_quest_nearby`:18794, `_open_quests`:18801, `_close_quests`:18808, `_refresh_quests`:18812, `_quest_pick`:18838, `_quest_mode`:18852, `_smoke_quests`:18855

## 18881-18915  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:18885, `_my_tag_tick`:18888

## 18916-19230  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:18933, `_fc_torus`:18943, `_fc_pearl`:18951, `_fc_chrome`:18961, `_fc_glass`:18970, `_fc_glow`:18980, `_fc_ghost`:18989, `_fc_holo`:19001, `_fc_mesh`:19011, `_fc_sphere`:19031, `_fc_capsule`:19039, `_fc_cone`:19047, `_build_food_court`:19056, `_food_court_tick`:19210

## 19231-19550  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:19258, `_cm_bench`:19274, `_build_commons`:19287, `_commons_tick`:19509

## 19551-19865  v0.36: the daily puzzle

`_pz_today`:19574, `_pz_new`:19577, `_pz_neighbours`:19622, `_pz_flip`:19632, `_pz_done`:19637, `_pz_tap`:19645, `_pz_win`:19661, `_pz_reset`:19682, `_puzzle_near`:19686, `_open_puzzle`:19691, `_close_puzzle`:19699, `_pz_refresh_sign`:19703, `_build_puzzle_panel`:19711, `_pz_draw`:19742, `_smoke_chat`:19783, `_smoke_feet`:19821, `_smoke_commons`:19842

## 19866-20054  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:19928, `_bio_theta`:19932, `_bio_sec_n`:19937, `_bio_sec_of`:19940, `_bio_pt`:19943, `_bio_lp`:19948, `_bio_la`:19952, `_bio_dir`:19956, `_bio_hex_r`:19959, `_bio_apo`:19964, `_bio_open_angles`:19970, `_bio_si`:19980, `_bm`:19986, `_bsph`:19991, `_blow`:19994, `_bcone`:20005, `_bbox`:20008, `_bp`:20011, `_bq`:20016, `_bio_glass_mat`:20020, `_bio_water_mat`:20033, `_bio_mat`:20045

## 20055-20427  building blocks

`_bio_inst`:20056, `_bio_add`:20062, `_bio_model`:20065, `_bio_nature_mesh`:20071, `_bio_flush`:20105, `_bio_bar`:20140, `_bio_slab`:20153, `_bio_body`:20168, `_bio_cyl_col`:20181, `_bio_hexmesh`:20194, `_bio_hexslab`:20206, `_bio_hexpt`:20212, `_bio_gridshell`:20219, `_bio_rail`:20326, `_bio_rail_arc`:20331, `_bio_disc_deck`:20343, `_bio_ring_deck`:20349, `_bio_helix`:20360, `_bio_pillar`:20380, `_bio_cafe`:20386, `_bio_fence_line`:20400, `_bio_fence_seg`:20405, `_bio_pen`:20415

## 20428-20929  building

`_build_biosphere`:20429, `_build_biosphere_legacy`:20433, `_bio_text`:20595, `_bio_plaque`:20613, `_bio_ticket_hall`:20627, `_on_foot_collision_guard`:20683, `_bio_inside`:20693, `_bio_pass_ok`:20696, `_ticket_near`:20700, `_bio_buy_pass`:20705, `_bio_gates_update`:20721, `_bio_gate_tick`:20747, `_bio_tunnel`:20759, `_bio_grounds`:20812, `_bio_dome`:20858, `_bio_deck_mats`:20926

## 20930-21085  garden planting

`_bio_free`:20931, `_bio_spot`:20948, `_bio_garden`:20956, `_bio_pine`:20997, `_bio_tree`:21000, `_bio_big_tree`:21010, `_bio_rock`:21015, `_bio_pond`:21018, `_bio_particles`:21022, `_bio_mist`:21050, `_bio_mini_dome`:21079

## 21086-21493  the four layouts

`_bio_winter`:21087, `_bio_spring`:21179, `_bio_summer`:21304, `_bio_autumn`:21388

## 21494-21764  animals

`_bio_spawn`:21495, `_bio_load_animal`:21567, `_bio_make_quad`:21588, `_bio_load_bird`:21665, `_bio_make_penguin`:21685, `_bio_make_bird`:21707, `_bio_make_flamingo`:21731, `_bio_make_butterfly`:21752

## 21765-21894  animation, spotting and rewards

`_bio_stuck_check`:21770, `_biosphere_tick`:21788, `_bio_animate`:21795, `_bio_spot_check`:21875, `_bio_spotted`:21887, `_smoke_biosphere`:21891

## 21895-22412  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:21982, `_wear_piece`:21985, `_wear_mat`:22008, `_person_index`:22024, `_dress`:22047, `_smoke_style`:22153, `_style_shots`:22304, `_npc_look`:22376

## 22413-22561  your look: apply, save, share

`_look_clean`:22417, `_look_pack`:22432, `_owns`:22438, `_apply_look`:22443, `_relic_model`:22449, `_fc_mesh_mat`:22514, `_relic_refresh`:22517, `_relic_tick`:22531, `_peer_style`:22542

## 22562-22989  stores and the wardrobe

`_style_today`:22581, `_style_items`:22584, `_style_cat`:22592, `_style_price`:22595, `_style_deal`:22609, `_style_price_base`:22622, `_relic_stock`:22629, `_build_style_panel`:22641, `_open_store`:22681, `_open_wardrobe`:22700, `_style_close`:22703, `_style_finish`:22707, `_sync_old_avatar`:22722, `_style_tabs_for`:22729, `_refresh_style`:22734, `_style_body_rows`:22885, `_style_set_tab`:22902, `_style_step`:22906, `_style_color`:22911, `_style_pick`:22916, `_style_buy`:22951, `_ach_relics_check`:22973, `_style_face_camera`:22978

## 22990-23457  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:23026, `_ga_text`:23032, `_ga_box`:23049, `_build_galleria`:23065, `_ga_inner_tick`:23206, `_ga_shell`:23222, `_ga_inside`:23272, `_bio_cyl_col_on`:23275, `_ga_models`:23287, `_ga_lbox`:23302, `_ga_ltext`:23316, `_ga_store`:23323, `_bio_cafe_on`:23425, `_ga_mannequins`:23433

## 23458-23609  featured outfits and the Sky Run

`_ga_featured_look`:23471, `_build_ga_fun`:23492, `_ga_fun_tick`:23537, `_sky_finish`:23564, `_extra_near`:23583, `_extra_open`:23592, `_store_near`:23601

## 23610-23706  v0.41: THE SKY GARDEN

`_sg_now`:23664, `_sg_progress`:23667, `_sg_time`:23673, `_sg_stock`:23680, `_sg_mut_roll`:23695

## 23707-23844  building

`_sg_box`:23708, `_sg_text`:23714, `_build_sky_garden`:23728, `_sg_seed_spot`:23839, `_sg_codex_spot`:23842

## 23845-24025  plants

`_sg_plant_model`:23846, `_sg_refresh_all`:23951, `_sg_refresh`:23955, `_sky_garden_tick`:23991, `_sg_ready_count`:24010, `_sg_boot_note`:24017

## 24026-24145  interacting

`_sg_near`:24027, `_sg_button_text`:24050, `_sg_value`:24063, `_sg_interact`:24067, `_sg_buy`:24083, `_sg_plant`:24105, `_sg_harvest`:24116

## 24146-24389  the garden screen

`_build_sg_panel`:24147, `_sg_open`:24182, `_sg_close`:24191, `_sg_row`:24195, `_sg_refresh_panel`:24210, `_sg_pick_buy`:24255, `_sg_pick_plant`:24259, `_smoke_car_barriers`:24265, `_smoke_sky_garden`:24306

## 24390-24428  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:24421, `_pass_day`:24424

## 24429-24460  album

`_album_pages`:24430, `_album_claim`:24445

## 24461-24512  season

`_season_index`:24462, `_season_tick`:24465, `_season_xp`:24474, `_season_tier`:24477, `_season_reward`:24480, `_season_claim`:24494

## 24513-24520  Harbor Night

`_harbor_night`:24514

## 24521-24552  check-in calendar

`_cal_tick`:24522

## 24553-24729  the panel

`_build_hp_panel`:24554, `_open_pass`:24589, `_hp_open`:24592, `_hp_close`:24599, `_hp_row`:24603, `_hp_bar`:24618, `_hp_refresh`:24622, `_smoke_pass`:24667

## 24730-24944  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:24734, `_cash_pill_tick`:24742, `_build_lb`:24780, `_open_lb`:24823, `_close_lb`:24831, `_lb_pick`:24835, `_lb_headers`:24840, `_lb_url`:24844, `_lb_me`:24847, `_lb_tick`:24850, `_lb_upload`:24858, `_lb_fetch`:24868, `_lb_got`:24876, `_lb_value`:24887, `_lb_refresh_ui`:24898

## 24945-25368  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:24969, `_market_near`:25046, `_build_gear`:25056, `_gear_piece`:25064, `_build_pet`:25109, `_market_apply`:25151, `_market_tick`:25175, `_build_market_panel`:25197, `_open_market`:25223, `_close_market`:25230, `_refresh_market`:25234, `_market_pick`:25287, `_toggle_board`:25325, `_board_tick`:25332

## 25369-25610  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:25401, `_ds_label`:25420, `_build_display`:25434, `_ds_got`:25513, `_ds_sorted`:25522, `_ds_render_board`:25536, `_ds_render_news`:25562, `_display_tick`:25581

## 25611-25789  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:25628, `_toggle_streamer`:25715, `_streamer_badge_tap`:25731, `_streamer_tick`:25735

## 25790-25826  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:25796, `_car_back`:25803, `_car_park_tick`:25810

## 25827-25923  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:25831, `_bus_eta`:25885, `_bus_displays_tick`:25901

## 25924-26215  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:25942, `_treasure_pick`:25945, `_treasure_spot`:25954, `_treasure_district`:25958, `_treasure_clue`:25970, `_treasure_prop`:25983, `_tp_part`:25986, `_tp_sphere`:25996, `_tp_cyl`:26004, `_treasure_prop_side`:26013, `_build_treasure_props`:26025, `_build_treasure`:26069, `_treasure_dir_char`:26138, `_treasure_tick`:26147, `_treasure_claim`:26201

## 26216-26316  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:26217, `_halo_mat`:26249, `_smoke_treasure`:26274

## 26317-26640  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:26338, `_fm_send`:26341, `_fm_area`:26347, `_fm_glow_mesh`:26363, `_fm_block_reason`:26381, `_fm_start`:26393, `_fm_announce`:26421, `_fm_finish`:26424, `_fm_msg`:26442, `_fm_check_paid`:26493, `_fm_tick`:26511, `_smoke_findme`:26567

## 26641-26751  v0.24.2: road map (for moving people off the road)

`_floor_note`:26647, `_floor_disc`:26661, `_floor_top`:26670, `_ground_at`:26688, `_note_road`:26706, `_on_road`:26713, `_ped_curb`:26723, `_curb_spot`:26733

## 26752-27047  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:26774, `_ex_grid`:26782, `_ex_lamps`:26817, `_ex_umbrella`:26840, `_ex_yards`:26847, `_build_expansion`:26862, `_expand_shots`:27025

## 27048-27242  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:27089, `_v27_near_cross`:27181, `_v27_near_any_road`:27188, `_v27_in_district`:27194, `_sea_tick`:27208, `_sea_tow`:27227

## 27243-27883  Harbor Loop sky train

`_sky_build_path`:27294, `_sky_pos`:27335, `_sky_dir`:27349, `_sky_project`:27354, `_sky_trip_time`:27373, `_sky_trip_dist`:27379, `_sky_now`:27390, `_sky_state`:27393, `_sky_time_at_station`:27408, `_sky_next_arrival`:27415, `_build_skytrain`:27428, `_sky_make_car`:27557, `_sky_skin`:27594, `_sky_place_trains`:27614, `_sky_build_station`:27633, `_sky_near`:27698, `_sky_fmt`:27707, `_sky_enter`:27711, `_sky_leave_platform`:27729, `_sky_board`:27739, `_sky_alight`:27752, `_sky_action`:27765, `_sky_tick`:27782, `_sky_camera`:27820, `_tour_today`:27836, `_tour_stamp`:27839, `_sky_hud`:27862

## 27884-28221  Day and night

`_game_hour`:27965, `_day_key`:27977, `_night_setup`:27992, `_night_scan_mesh`:28082, `_daynight_tick`:28107, `_daynight_apply`:28114, `_daynight_lights`:28206, `_cycle_day_mode`:28211, `_refresh_time_button`:28218

## 28222-28857  v0.27 smoke test and screenshots

`_smoke_v27`:28223, `_city_shots`:28426

## 28858-29274  v0.27: Harbor International Airport (north of the city)

`_build_airport`:28892, `_ap_plane`:29068, `_ap_truck`:29088, `_ap_baggage_train`:29129, `_ap_loop_pos`:29142, `_ap_loop_len`:29158, `_ap_flight_at`:29164, `_ap_tick`:29188, `_airport_ped_plan`:29211, `_smoke_airport`:29231

## 29275-29788  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:29289, `_nav_spot`:29296, `_nav_idx`:29300, `_nav_pos`:29307, `_nav_blocked`:29311, `_nav_nearest_free`:29321, `_nav_bfs`:29349, `_nav_build`:29393, `_stroller`:29464, `_stroll_place`:29480, `_stroll_next`:29501, `_nav_clear_line`:29535, `_stroll_aim`:29546, `_strollers_tick`:29578, `_smoke_strollers`:29673

## 29789-29949  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:29824, `_dir_fmt`:29827, `_signpost_spot`:29830, `_build_signposts`:29847

## 29950-30046  the Directions panel and chip

`_build_dir_panel`:29951, `_open_dir`:29993, `_dir_close`:30002, `_dir_pick`:30006, `_dir_stop`:30011, `_dir_stop_and_close`:30016, `_dir_tick`:30020

## 30047-30588  v0.44: Grand Central

`_gc_mesh`:30076, `_gc_mat`:30109, `_gc_glass`:30118, `_gb`:30128, `_gb_solid`:30134, `_gb_flush`:30138, `_gc_tree`:30168, `_gc_text`:30173, `_gc_planter`:30188, `_gc_kiosk`:30194, `_goods_color`:30224, `_goods_mat`:30227, `_kiosk_goods`:30231, `_build_grand_central`:30309, `_build_gc_towers`:30477, `_gc_tick`:30572

## 30589-30880  v0.44: filling the empty land

`_loft`:30606, `_fill_clear`:30648, `_build_fill`:30658, `_hg_in_lake`:30706, `_hg_path`:30710, `_floor_note_rot`:30718, `_build_gardens`:30726, `_build_fan_plaza`:30836

## 30881-30915  v0.45: hover car underglow

`_car_underglow`:30884

## 30916-31080  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:30917

## 31081-31112  v0.47: street stalls downtown

`_build_street_stalls`:31085, `_cull_people_in`:31105

## 31113-31211  v0.48: places that open as you level up

`_place_lock_of`:31126, `_place_root`:31132, `_place_unlocked`:31135, `_build_place_signs`:31143, `_places_refresh`:31188, `_places_tick`:31205

## 31212-31256  v0.50: city careers

`_career_rank_name`:31237, `_career_mult`:31240, `_career_block_reason`:31245, `_career_start`:31248, `_career_end`:31253

## 31257-31307  v0.52: careers as clear job loops

`_cid`:31284, `_career_target`:31298, `_career_tick`:31305

## 31308-31315  taxi

`_taxi_meter`:31309

## 31316-31319  paramedic

(no functions)

## 31320-31324  police

`_career_chase_over`:31322

## 31325-31330  firefighter

`_fire_aimed`:31326

## 31331-31340  the step bar

`_career_bar_text`:31334, `_career_hud`:31338

## 31341-31367  cut scenes

`_cs_skip`:31359

## 31368-31372  siren

(no functions)

## 31373-31384  the Careers panel

`_build_career_panel`:31374, `_open_careers`:31377, `_career_close`:31381

## 31385-31808  v0.50: homes

`_home_door_spots`:31425, `_build_homes`:31440, `_home_labels`:31469, `_home_door_near`:31478, `_home_origin`:31487, `_home_slot_near`:31490, `_home_exit_near`:31501, `_home_btn`:31508, `_home_interact`:31521, `_home_buy`:31540, `_home_default_layout`:31554, `_home_enter`:31562, `_home_leave`:31582, `_hm`:31590, `_home_build_room`:31609, `_home_refresh_room`:31718, `_furni_build`:31732

## 31809-32144  decorating

`_build_home_panels`:31810, `_open_homes`:31855, `_home_row_go`:31865, `_home_panel_close`:31885, `_deco_open`:31889, `_deco_pick`:31912, `_smoke_careers_homes`:31935

## 32145-32279  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:32149, `_home_slots`:32157, `_home_ring`:32184, `_furni_cat`:32190, `_home_fix_layout`:32196, `_home_build_layout`:32224

## 32280-32713  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:32343, `_ch_homes`:32349, `_ch_step_text`:32356, `_ch_step_done`:32367, `_ch_target`:32381, `_ch_finish_chapter`:32390, `_chapters_tick`:32412, `_hud_top_stack`:32452, `_build_chapters_ui`:32482, `_chapters_restart_ask`:32524, `_chapters_restart`:32527, `_chapters_text`:32537, `_open_chapters`:32557, `_chapters_close`:32564, `_smoke_chapters`:32568, `_step_sound`:32689

## 32714-32752  v0.51.1: join and leave messages

`_announce_join`:32721, `_announce_already_here`:32740, `_announce_leave`:32748

## 32753-33017  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:32769, `_shot_tick`:32775, `_draw_shot_icon`:32807, `_shot_enter`:32816, `_shot_exit`:32830, `_shot_release_controls`:32842, `_shot_stick_zone`:32849, `_shot_input`:32852, `_smoke_photo`:32924

## 33018-33316  v0.51.3: stream joiners

`_viewer_count`:33038, `_stream_join_check`:33044, `_stream_join_start`:33051, `_sj_streamer`:33068, `_stream_join_tick`:33077, `_stream_join_land`:33101, `_sj_welcome`:33117, `_smoke_stream_join`:33151, `_career_shot`:33234

## 33317-33433  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:33321, `_st_restore`:33359, `_smoke_streamer_clean`:33380, `_world_bio_passport`:33431

