# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-605  Core (unlabelled)

`_symbol_font`:284, `_ready`:296, `_surf_texture`:548, `_surface_material`:570

## 606-678  v0.34.6: futuristic towers for the old city

`_future_tower`:610

## 679-757  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:686, `_skin_common`:721, `_future_wall`:729, `_future_roof`:743, `_future_pave`:751

## 758-818  v0.34.4: futuristic road surface

`_road_textures`:765, `_future_road`:799

## 819-2027  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:838, `_real_tex`:879, `_real_setup`:887, `_real_kind`:908, `_realify`:914, `_real_glass`:951, `_make_window_textures`:971, `_material`:1004, `_box`:1029, `_sign`:1051, `_build_world`:1063, `_future_kiosk`:1174, `_build_collectibles`:1200, `_auto_collect_tick`:1233, `_find_count`:1254, `_nearest_find`:1261, `_destination`:1275, `_toggle_activity`:1311, `_collect_find`:1340, `_owned_count`:1355, `_ridge_open`:1362, `_ridge_count`:1366, `_nearest_ridge`:1373, `_apply_car`:1387, `_tune_level`:1417, `_tune_cost`:1420, `_car_stats`:1426, `_buy_tune`:1433, `_open_tune`:1454, `_back_to_garage`:1460, `_refresh_tune`:1464, `_bay_open`:1475, `_area_open`:1478, `_bay_count`:1481, `_nearest_bay`:1488, `_build_bay`:1502, `_check_bay`:1555, `_discover_bay`:1568, `_north_count`:1581, `_north_open`:1588, `_nearest_north`:1591, `_check_north`:1605, `_discover_north`:1618, `_prop`:1631, `_collider`:1645, `_first_mesh`:1655, `_scatter`:1664, `_prop_stretch`:1698, `_north_token`:1707, `_nm_roads`:1734, `_prop_big`:1749, `_nm_near_cross`:1765, `_build_north`:1772, `_build_nm_blocks`:1889, `_build_north_landscape`:1974, `_nm_free`:2001, `_build_landscape`:2011

## 2028-2511  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2029, `_online_toggle`:2043, `_online_autostart`:2069, `_online_connect`:2088, `_online_stop`:2095, `_online_next_ref`:2106, `_online_send`:2110, `_online_join_frame`:2114, `_online_pos_frame`:2117, `_online_tick`:2126, `_online_handle`:2160, `_online_clean_name`:2213, `_online_peer_update`:2222, `_online_make_peer`:2291, `_peer_look`:2332, `_online_tint`:2389, `_paint_mat`:2405, `_online_update_peers`:2417, `_online_clear_peers`:2497, `_online_refresh_button`:2502

## 2512-2684  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2592, `_marina_count`:2595, `_nearest_marina`:2602, `_check_marina`:2616, `_discover_marina`:2629, `_shop_available`:2642, `_nearest_shop`:2645, `_premium_cars`:2653, `_glass`:2660, `_shop_building`:2666, `_shop_pad`:2676

## 2685-3200  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2686, `_bus_last`:2689, `_build_bus`:2692, `_bus_boxes`:2719, `_bus_skin`:2729, `_bus_side`:2742, `_bus_reset`:2745, `_bus_text`:2754, `_bus_tick`:2759, `_bus_near`:2799, `_bus_board`:2810, `_bus_alight`:2825, `_build_marina`:2839, `_set_hat`:2945, `_build_hat`:2948, `_cyl`:3013, `_hat_part`:3022, `_apply_avatar`:3031, `_shop_count`:3043, `_shop_open`:3053, `_shop_step`:3071, `_shop_close`:3077, `_owned_text`:3090, `_refresh_shop`:3093, `_shop_action`:3146, `_journal_flip`:3197

## 3201-3255  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3212, `_xp`:3215, `_level_for`:3222, `_level`:3230, `_level_text`:3233, `_check_level`:3243

## 3256-3358  v0.11.0: online police vs thief

`_orole_ready`:3257, `_orole_start`:3260, `_orole_end`:3287, `_orole_tick`:3296

## 3359-4302  v0.10.0: chase mode (offline)

`_chase_open`:3360, `_chase_clear`:3365, `_chase_make_unit`:3379, `_chase_spawn_point`:3409, `_chase_start`:3418, `_chase_end`:3454, `_chase_steer`:3473, `_chase_roadblock`:3509, `_chase_heli_build`:3554, `_chase_extras`:3580, `_chase_tick`:3607, `_start_trial`:3671, `_cancel_trial`:3698, `_check_trial`:3703, `_finish_trial`:3720, `_trial_count`:3736, `_open_trials`:3743, `_refresh_trials`:3747, `_update_gate`:3759, `_slab`:3777, `_build_ridge`:3795, `_check_ridge`:3858, `_discover`:3871, `_mission_progress`:3885, `_check_missions`:3947, `_open_garage`:3958, `_open_journal`:3963, `_close_sub`:3968, `_bar`:3971, `_refresh_garage`:3975, `_garage_step`:4000, `_garage_action`:4004, `_refresh_journal`:4024, `_visited_shops`:4057, `_build_panels`:4064, `_build_player`:4224, `_build_car`:4262, `_try_model`:4291

## 4303-4987  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4304, `_kshader`:4378, `_ksync`:4384, `_kskin`:4399, `_make_kperson`:4405, `_hat_y`:4469, `_sit_drop`:4472, `_kplay`:4475, `_kpeople_tick`:4485, `_pose_person`:4514, `_pose_limbs`:4531, `_person_lift`:4593, `_snap_crowd_feet`:4606, `_people_life_tick`:4622, `_life_one`:4659, `_cull_person`:4669, `_recolor_car_model`:4677, `_apply_car_model`:4691, `_landmark`:4711, `_label`:4721, `_button`:4728, `_panel`:4740, `_build_hud`:4750

## 4988-5106  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4994, `_menu_tab`:5000, `_watch_tick`:5023, `_watch_count`:5065, `_online_pill_tap`:5072, `_online_pill_tick`:5078, `online_config_ok`:5104

## 5107-5144  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5110, `_offroad`:5116, `_ground_near`:5129, `_collectibles_on_road`:5136

## 5145-5284  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5157, `_build_quest_offer`:5161, `_quest_offer_tick`:5191, `_quest_auto_pick`:5241, `_quest_accept`:5256, `_quest_decline`:5270, `_quest_stop`:5276

## 5285-5652  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5309, `_holo_material`:5318, `_build_future`:5326, `_build_neon`:5340, `_model_profile`:5409, `_model_body_box`:5432, `_build_holograms`:5446, `_holo_tick`:5496, `_build_sky_traffic`:5513, `_sky_hover_car`:5531, `_sky_drone`:5578, `_sky_traffic_tick`:5622, `_future_lights`:5641

## 5653-6152  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5712, `_crew_col`:5720, `_peer_crewmate`:5723, `_set_ring_color`:5726, `_level_color`:5753, `_tier_color`:5766, `_my_ach_tier`:5769, `_style_ring`:5776, `_social_peer_extras`:5824, `_social_tag`:5838, `_my_tag_extra`:5850, `_soc_send`:5863, `_social_msg`:5878, `_social_accept`:5917, `_social_go`:5938, `_soc_friend`:5957, `_soc_invite`:5964, `_soc_goto`:5969, `_soc_high_five`:5977, `_soc_gift`:5997, `_soc_crew_invite`:6014, `_gift_day_check`:6021, `_crew_create`:6027, `_crew_cycle_color`:6037, `_crew_leave`:6042, `_crew_mate_near`:6050, `_crew_board`:6058, `_build_social`:6077, `_social_online`:6139, `_open_social`:6143, `_close_social`:6149

## 6153-6403  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6156, `_track_pos`:6165, `_social_row_button`:6176, `_refresh_social`:6183, `_on_dance_floor`:6245, `_toggle_dance`:6248, `_build_dance_floor`:6256, `_social_tick`:6282, `_photo`:6354

## 6404-6899  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6426, `_game_state`:6434, `_build_arcade`:6446, `_c4_empty`:6497, `_c4_drop_row`:6503, `_c4_winner`:6509, `_c4_bot_move`:6530, `_c4_code`:6559, `_c4_ready`:6565, `_c4_tap`:6568, `_c4_check`:6589, `_c4_tick`:6613, `_rx_ready`:6640, `_rx_start`:6643, `_rx_tap`:6657, `_rx_send_time`:6682, `_rx_resolve`:6689, `_rx_tick`:6715, `_mem_start`:6730, `_mem_tap`:6746, `_mem_finish`:6761, `_mem_tick`:6777, `_mem_board_text`:6784, `_build_arcade_panel`:6795, `_refresh_arcade_panel`:6838

## 6900-7193  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6963, `_quiz_slot`:6966, `_quiz_question`:6976, `_quiz_bot_score`:7005, `_in_quiz`:7014, `_build_quiz`:7017, `_quiz_answer`:7087, `_quiz_msg`:7100, `_quiz_board`:7108, `_quiz_tick`:7118, `_quiz_refresh`:7160

## 7194-8766  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7365, `_sites_found`:7368, `_sites_total`:7371, `_bits`:7374, `_ach_value`:7381, `_ach_tick`:7436, `_ach_check`:7461, `_ach_by_id`:7497, `_ach_msg`:7503, `_build_ach`:7516, `_ach_show`:7547, `_open_ach`:7567, `_close_ach`:7573, `_refresh_ach`:7577, `_ach_num`:7608, `_minimap_tap`:7611, `_menu_go`:7618, `_menu_stay`:7623, `_menu_call_car`:7627, `_toggle_clean_hud`:7633, `_refresh_menu_buttons`:7639, `_clean_hud_tick`:7649, `_draw_joystick`:7690, `_input`:7695, `_touch_text_focus`:7786, `_stick_zone`:7806, `_notification`:7810, `_physics_process`:7827, `_follow_camera`:7977, `_follow_walk_camera`:8013, `_interact`:8036, `_refresh_hud`:8198, `_open_panel`:8327, `_layout_panels`:8357, `_toggle_menu`:8384, `_rescue`:8430, `_show_toast`:8462, `_save_progress`:8466, `_load_progress`:8559

## 8767-11218  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8768, `_radio_voice`:8771, `_radio_make`:8804, `_radio_set`:8875, `_radio_play`:8897, `_radio_next`:8902, `_radio_talk_line`:8906, `_radio_caption`:8927, `_radio_refresh`:8935, `_process`:8948, `_build_peds`:8999, `_update_peds`:9110, `_update_ped`:9129, `_smoke_test`:9183, `_smoke_chase`:9831, `_smoke_orole`:9864, `_smoke_levels`:9893, `_smoke_bus`:9934, `_smoke_chase_extras`:10019, `_smoke_marina`:10047, `_blocked_at`:10149, `_blocker`:10164, `_on_screen`:10177, `_wait_radio`:10182, `_smoke_radio_peds`:10189, `_smoke_typed_chat`:10259, `_smoke_chat_touch`:10278, `_smoke_cafe`:10299, `_smoke_boutique`:10325, `_smoke_models`:10353, `_smoke_garage_ridge`:10377, `_save_shot`:10753, `_paris_shots`:10763, `_people_shots`:10966, `_shots`:11007, `_shot_car`:11201, `_capture_preview`:11211

## 11219-11867  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11286, `_downtown_count`:11289, `_nearest_downtown`:11296, `_check_downtown`:11310, `_discover_downtown`:11323, `_box_batch`:11337, `_model_batch`:11357, `_cut_ranges`:11411, `_dt_ranges`:11423, `_dt_has`:11430, `_dt_near_cross`:11436, `_place`:11442, `_signal_pole`:11453, `_cyl_batch`:11472, `_city_signals`:11496, `_ensure_light_mats`:11547, `_city_lamps`:11557, `_build_downtown`:11601, `_dt_block`:11801, `_downtown_token`:11807, `_build_park`:11824, `_build_plaza`:11853

## 11868-11971  old city and Bay details

`_build_city_detail`:11869

## 11972-12381  traffic

`_build_traffic`:11973, `_path_sample`:12068, `_light_look`:12082, `_light_green`:12090, `_traffic_place`:12094, `_traffic_blocked_by`:12106, `_traffic_tick`:12118, `_smoke_downtown`:12224, `_skyline_shot`:12336, `_skyline_shots`:12344

## 12382-12742  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12428, `_web_scale`:12491, `_web_fps_tick`:12501, `_world_to_uv`:12518, `_map_angle`:12521, `_build_minimap`:12529, `_open_map`:12602, `_close_map`:12613, `_mini_point`:12620, `_site_markers`:12624, `_draw_arrow`:12656, `_draw_minimap`:12663, `_draw_full_map`:12710, `_minimap_tick`:12735

## 12743-13000  camera views

`_build_view_controls`:12744, `_cycle_view`:12786, `_apply_view`:12796, `_hide_labels`:12834, `_unfade`:12840, `_bake_map`:12846, `_shot_stats`:12896, `_view_shots`:12899, `_smoke_views`:12940

## 13001-13248  v0.17.0: level-up celebration

`_build_level_fx`:13012, `_draw_level_rays`:13049, `_level_fx_tick`:13059, `_level_sound`:13064, `_fx_material`:13106, `_level_up_fx`:13114, `_smoke_level_fx`:13215, `_levelup_shots`:13224

## 13249-13368  v0.18.0: walk-in stadium

`_collider_yaw`:13254, `_build_stadium_walls`:13265, `_look`:13293, `_smoke_stadium_eye`:13302, `_stadium_shots`:13338

## 13369-13530  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13393, `_arrow_mesh`:13405, `_build_guidance`:13428, `_guide_target`:13453, `_guidance_tick`:13482, `_draw_hud_arrow`:13508

## 13531-13716  checkpoints

`_build_checkpoints`:13532, `_refresh_checkpoints`:13577, `_check_checkpoints`:13583, `_activate_checkpoint`:13593, `_checkpoint_spawn`:13614, `_spawn_at_checkpoint`:13619, `_draw_checkpoint_icon`:13635, `_smoke_guidance_checkpoints`:13641, `_guide_shots`:13691

## 13717-13995  v0.18.0: Harbor Dome social hub

`_hub_seat`:13775, `_build_hub`:13779

## 13996-14046  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13997, `_xm_mesh`:14006, `_xm_tree`:14014

## 14047-14370  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14050, `_gt_surface`:14065, `_xm_grand_tree`:14075, `_lux_mat`:14190, `_lux_part`:14206, `_lux_box`:14209, `_lux_cyl`:14214, `_lux_ball`:14222, `_lux_new`:14230, `_lux_commit`:14235, `_lux_sofa_mesh`:14239, `_lux_chair_mesh`:14269, `_lux_table_mesh`:14289, `_lux_pouf_mesh`:14304, `_lux_batch`:14319, `_hub_christmas`:14335

## 14371-14526  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14372

## 14527-14775  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14530, `_vx_cyl`:14537, `_vx_ball`:14545, `_vx_ring`:14553, `_hub_polish`:14561, `_hub_gate`:14584, `_hub_vip`:14646, `_hub_glass`:14759

## 14776-14990  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14777, `_build_hub_bots`:14802, `_seat_of`:14833, `_bubble`:14843, `_emote`:14899, `_hub_people_tick`:14913

## 14991-15109  seats

`_seat_taken`:14992, `_nearest_seat`:15000, `_seat_label`:15012, `_sit`:15028, `_stand_up`:15072, `_seated_tick`:15091

## 15110-15266  game panel

`_build_game_panel`:15111, `_open_game_panel`:15166, `_refresh_game_panel`:15185, `_play_robot`:15230, `_peer_at`:15244, `_opponent_name`:15251, `_pay`:15259

## 15267-15387  tic-tac-toe

`_ttt_ready`:15270, `_ttt_winner`:15276, `_ttt_bot_move`:15286, `_ttt_tap`:15312, `_ttt_code`:15332, `_ttt_check`:15338, `_ttt_tick`:15361

## 15388-15439  rock paper scissors

`_rps_ready`:15389, `_rps_pick`:15395, `_rps_resolve`:15413, `_rps_tick`:15437

## 15440-15522  online table messages

`_online_game_send`:15441, `_hub_game_msg`:15447

## 15523-15598  comedy show

`_joke_start`:15524, `_joke_tick`:15536, `_speak`:15562, `_play_rimshot`:15571

## 15599-16498  quick chat and emotes

`_build_chat`:15621, `_chat_toggle_to`:15738, `_chat_log_add`:15746, `_chat_area`:15752, `_chat_near_count`:15770, `_chat_tick`:15779, `_toggle_chat`:15828, `_chat_fit`:15843, `_chat_clean`:15849, `_chat_wrap`:15866, `_chat_send_text`:15888, `_typing`:15911, `_say`:15914, `_do_emote`:15930, `_smoke_hub`:15939, `_chat_shots`:16113, `_cafe_shots`:16138, `_shop_shots`:16186, `_car_shots`:16235, `_outfit_shots`:16266, `_hub_shots`:16314, `_sg_on_terrace`:16449, `_people_only`:16452, `_people_only_keep_cars_out`:16456, `_car_barrier`:16468, `_hub_keep_cars_out`:16482

## 16499-16661  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16508, `_feed_add`:16517, `_feed_render`:16523, `_feed_tick`:16551, `_online_event_send`:16560, `_at_pvp_table`:16567, `_game_name`:16574, `_send_lfp`:16577, `_lfp_msg`:16594, `_accept_invite`:16615

## 16662-16903  v0.18.2: nickname and HUD relayout

`_nick_rude`:16674, `_clean_nick`:16689, `_build_nick_panel`:16701, `_open_nick`:16739, `_random_nick`:16748, `_save_nick`:16754, `_close_nick`:16773, `_refresh_nick_button`:16782, `_relayout_hud`:16786, `_smoke_nick`:16823, `_nick_shots`:16855, `_smoke_sites_reachable`:16873

## 16904-17191  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16930, `_nearest_civic`:16937, `_check_civic`:16951, `_discover_civic`:16964, `_civ_ranges`:16977, `_civ_has`:16991, `_civ_near_cross`:16997, `_build_civic`:17003, `_civic_token`:17129, `_civic_shots`:17146, `_hub_focus`:17168

## 17192-17301  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17263, `_in_rw_lot`:17266, `_box_batch_rot`:17269, `_multi_collider`:17287

## 17302-17629  circuit geometry

`_cr_point`:17303, `_rw_build_path`:17317, `_rw_dir`:17345, `_rw_bend`:17350, `_ribbon`:17356, `_rw_band`:17376, `_rw_keepout`:17394, `_build_raceway`:17403, `_build_rw_parking`:17437, `_build_rw_pits`:17482, `_build_rw_track`:17519, `_build_rw_trackside`:17560

## 17630-17727  race car rental

`_model_key`:17631, `_race_car_start`:17634, `_tint_ghost`:17672, `_race_car_end`:17685, `_race_keep_cars_out`:17710

## 17728-17742  speed effects

`_eff_max`:17729, `_eff_accel`:17740

## 17743-17793  track helpers

`_rw_seg_progress`:17744, `_rw_track_dist`:17764, `_rw_point_dist`:17775, `_rw_player_progress`:17782, `_rw_target`:17788

## 17794-18030  events

`_rec_stop`:17795, `_rw_place`:17811, `_rw_grid_pos`:17818, `_rw_start`:17823, `_rw_spawn_ai`:17855, `_rw_ai_place`:17879, `_rw_tick`:17890, `_rw_ai_tick`:17943, `_rw_lap_done`:17985, `_rw_finish`:17997, `_rw_fmt`:18028

## 18031-18083  boosters and spikes

`_rw_buy`:18032, `_rw_use_boost`:18050, `_rw_use_spike`:18058, `_rw_drop_spike_at`:18069

## 18084-18141  online races

`_race_msg`:18085, `_join_race`:18107

## 18142-18497  raceway panel, HUD, board

`_build_raceway_ui`:18143, `_rw_layout`:18203, `_rw_open`:18210, `_rw_close`:18216, `_rw_refresh_panel`:18220, `_rw_refresh_board`:18233, `_rw_hud`:18245, `_peer_car_model`:18269, `_smoke_raceway`:18279, `_race_shots`:18460

## 18498-18705  v0.22.0: Call Car

`_call_block_reason`:18504, `_call_spot`:18521, `_call_car`:18552, `_play_horn`:18576, `_smoke_follow_call`:18600, `_follow_shots`:18673

## 18706-19163  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18731, `_place_portal_button`:18737, `_portal_pressed`:18744, `_build_travel`:18752, `_toggle_run`:18857, `_refresh_run`:18861, `_hud_v23_tick`:18869, `_travel_block_reason`:18901, `_travel_open`:18921, `_open_travel`:18927, `_open_worlds`:18933, `_open_case`:18939, `_case_step`:18951, `_case_refresh`:18955, `_case_submit`:18959, `_close_case`:18968, `_sky_go`:18972, `_close_worlds`:18982, `_refresh_worlds`:18986, `_world_go`:18992, `_close_travel`:18999, `_refresh_travel`:19003, `_travel_to`:19011, `_smoke_travel`:19038, `_v23_shots`:19076

## 19164-19237  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19171, `_qr_button`:19186, `_qr_layout`:19225, `_smoke_qr`:19231

## 19238-19674  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19258, `_open_crate`:19274, `_build_crate_ui`:19291, `_crate_pick`:19378, `_crate_reveal`:19401, `_crate_draw_car`:19428, `_crate_confetti`:19447, `_crate_sound`:19472, `_crate_drive`:19498, `_feed_add_system`:19528, `_smoke_crate`:19531, `_crate_shots`:19579

## 19675-20166  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19716, `_quick_today`:19721, `_quick_is_done`:19724, `_quick_left`:19727, `_quick_next`:19734, `_quick_fix_target`:19747, `_quick_daily_check`:19761, `_quick_complete`:19775, `_quick_side`:19809, `_build_quick_props`:19827, `_daily_shots`:19979, `_quick_props_refresh`:20021, `_quick_fx`:20025, `_play_coin`:20041, `_smoke_quick`:20058

## 20167-20317  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20176, `_quest_nearby`:20231, `_open_quests`:20238, `_close_quests`:20245, `_refresh_quests`:20249, `_quest_pick`:20275, `_quest_mode`:20289, `_smoke_quests`:20292

## 20318-20352  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20322, `_my_tag_tick`:20325

## 20353-20667  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20370, `_fc_torus`:20380, `_fc_pearl`:20388, `_fc_chrome`:20398, `_fc_glass`:20407, `_fc_glow`:20417, `_fc_ghost`:20426, `_fc_holo`:20438, `_fc_mesh`:20448, `_fc_sphere`:20468, `_fc_capsule`:20476, `_fc_cone`:20484, `_build_food_court`:20493, `_food_court_tick`:20647

## 20668-20989  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20697, `_cm_bench`:20713, `_build_commons`:20726, `_commons_tick`:20948

## 20990-21304  v0.36: the daily puzzle

`_pz_today`:21013, `_pz_new`:21016, `_pz_neighbours`:21061, `_pz_flip`:21071, `_pz_done`:21076, `_pz_tap`:21084, `_pz_win`:21100, `_pz_reset`:21121, `_puzzle_near`:21125, `_open_puzzle`:21130, `_close_puzzle`:21138, `_pz_refresh_sign`:21142, `_build_puzzle_panel`:21150, `_pz_draw`:21181, `_smoke_chat`:21222, `_smoke_feet`:21260, `_smoke_commons`:21281

## 21305-21493  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21367, `_bio_theta`:21371, `_bio_sec_n`:21376, `_bio_sec_of`:21379, `_bio_pt`:21382, `_bio_lp`:21387, `_bio_la`:21391, `_bio_dir`:21395, `_bio_hex_r`:21398, `_bio_apo`:21403, `_bio_open_angles`:21409, `_bio_si`:21419, `_bm`:21425, `_bsph`:21430, `_blow`:21433, `_bcone`:21444, `_bbox`:21447, `_bp`:21450, `_bq`:21455, `_bio_glass_mat`:21459, `_bio_water_mat`:21472, `_bio_mat`:21484

## 21494-21866  building blocks

`_bio_inst`:21495, `_bio_add`:21501, `_bio_model`:21504, `_bio_nature_mesh`:21510, `_bio_flush`:21544, `_bio_bar`:21579, `_bio_slab`:21592, `_bio_body`:21607, `_bio_cyl_col`:21620, `_bio_hexmesh`:21633, `_bio_hexslab`:21645, `_bio_hexpt`:21651, `_bio_gridshell`:21658, `_bio_rail`:21765, `_bio_rail_arc`:21770, `_bio_disc_deck`:21782, `_bio_ring_deck`:21788, `_bio_helix`:21799, `_bio_pillar`:21819, `_bio_cafe`:21825, `_bio_fence_line`:21839, `_bio_fence_seg`:21844, `_bio_pen`:21854

## 21867-22368  building

`_build_biosphere`:21868, `_build_biosphere_legacy`:21872, `_bio_text`:22034, `_bio_plaque`:22052, `_bio_ticket_hall`:22066, `_on_foot_collision_guard`:22122, `_bio_inside`:22132, `_bio_pass_ok`:22135, `_ticket_near`:22139, `_bio_buy_pass`:22144, `_bio_gates_update`:22160, `_bio_gate_tick`:22186, `_bio_tunnel`:22198, `_bio_grounds`:22251, `_bio_dome`:22297, `_bio_deck_mats`:22365

## 22369-22524  garden planting

`_bio_free`:22370, `_bio_spot`:22387, `_bio_garden`:22395, `_bio_pine`:22436, `_bio_tree`:22439, `_bio_big_tree`:22449, `_bio_rock`:22454, `_bio_pond`:22457, `_bio_particles`:22461, `_bio_mist`:22489, `_bio_mini_dome`:22518

## 22525-22932  the four layouts

`_bio_winter`:22526, `_bio_spring`:22618, `_bio_summer`:22743, `_bio_autumn`:22827

## 22933-23203  animals

`_bio_spawn`:22934, `_bio_load_animal`:23006, `_bio_make_quad`:23027, `_bio_load_bird`:23104, `_bio_make_penguin`:23124, `_bio_make_bird`:23146, `_bio_make_flamingo`:23170, `_bio_make_butterfly`:23191

## 23204-23335  animation, spotting and rewards

`_bio_stuck_check`:23209, `_biosphere_tick`:23227, `_bio_animate`:23236, `_bio_spot_check`:23316, `_bio_spotted`:23328, `_smoke_biosphere`:23332

## 23336-23853  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23423, `_wear_piece`:23426, `_wear_mat`:23449, `_person_index`:23465, `_dress`:23488, `_smoke_style`:23594, `_style_shots`:23745, `_npc_look`:23817

## 23854-24007  your look: apply, save, share

`_look_clean`:23858, `_look_pack`:23873, `_owns`:23879, `_apply_look`:23884, `_relic_model`:23895, `_fc_mesh_mat`:23960, `_relic_refresh`:23963, `_relic_tick`:23977, `_peer_style`:23988

## 24008-24435  stores and the wardrobe

`_style_today`:24027, `_style_items`:24030, `_style_cat`:24038, `_style_price`:24041, `_style_deal`:24055, `_style_price_base`:24068, `_relic_stock`:24075, `_build_style_panel`:24087, `_open_store`:24127, `_open_wardrobe`:24146, `_style_close`:24149, `_style_finish`:24153, `_sync_old_avatar`:24168, `_style_tabs_for`:24175, `_refresh_style`:24180, `_style_body_rows`:24331, `_style_set_tab`:24348, `_style_step`:24352, `_style_color`:24357, `_style_pick`:24362, `_style_buy`:24397, `_ach_relics_check`:24419, `_style_face_camera`:24424

## 24436-24903  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24472, `_ga_text`:24478, `_ga_box`:24495, `_build_galleria`:24511, `_ga_inner_tick`:24652, `_ga_shell`:24668, `_ga_inside`:24718, `_bio_cyl_col_on`:24721, `_ga_models`:24733, `_ga_lbox`:24748, `_ga_ltext`:24762, `_ga_store`:24769, `_bio_cafe_on`:24871, `_ga_mannequins`:24879

## 24904-25055  featured outfits and the Sky Run

`_ga_featured_look`:24917, `_build_ga_fun`:24938, `_ga_fun_tick`:24983, `_sky_finish`:25010, `_extra_near`:25029, `_extra_open`:25038, `_store_near`:25047

## 25056-25152  v0.41: THE SKY GARDEN

`_sg_now`:25110, `_sg_progress`:25113, `_sg_time`:25119, `_sg_stock`:25126, `_sg_mut_roll`:25141

## 25153-25290  building

`_sg_box`:25154, `_sg_text`:25160, `_build_sky_garden`:25174, `_sg_seed_spot`:25285, `_sg_codex_spot`:25288

## 25291-25471  plants

`_sg_plant_model`:25292, `_sg_refresh_all`:25397, `_sg_refresh`:25401, `_sky_garden_tick`:25437, `_sg_ready_count`:25456, `_sg_boot_note`:25463

## 25472-25591  interacting

`_sg_near`:25473, `_sg_button_text`:25496, `_sg_value`:25509, `_sg_interact`:25513, `_sg_buy`:25529, `_sg_plant`:25551, `_sg_harvest`:25562

## 25592-25835  the garden screen

`_build_sg_panel`:25593, `_sg_open`:25628, `_sg_close`:25637, `_sg_row`:25641, `_sg_refresh_panel`:25656, `_sg_pick_buy`:25701, `_sg_pick_plant`:25705, `_smoke_car_barriers`:25711, `_smoke_sky_garden`:25752

## 25836-25874  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25867, `_pass_day`:25870

## 25875-25906  album

`_album_pages`:25876, `_album_claim`:25891

## 25907-25958  season

`_season_index`:25908, `_season_tick`:25911, `_season_xp`:25920, `_season_tier`:25923, `_season_reward`:25926, `_season_claim`:25940

## 25959-25966  Harbor Night

`_harbor_night`:25960

## 25967-25998  check-in calendar

`_cal_tick`:25968

## 25999-26175  the panel

`_build_hp_panel`:26000, `_open_pass`:26035, `_hp_open`:26038, `_hp_close`:26045, `_hp_row`:26049, `_hp_bar`:26064, `_hp_refresh`:26068, `_smoke_pass`:26113

## 26176-26390  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26180, `_cash_pill_tick`:26188, `_build_lb`:26226, `_open_lb`:26269, `_close_lb`:26277, `_lb_pick`:26281, `_lb_headers`:26286, `_lb_url`:26290, `_lb_me`:26293, `_lb_tick`:26296, `_lb_upload`:26304, `_lb_fetch`:26314, `_lb_got`:26322, `_lb_value`:26333, `_lb_refresh_ui`:26344

## 26391-26814  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26415, `_market_near`:26492, `_build_gear`:26502, `_gear_piece`:26510, `_build_pet`:26555, `_market_apply`:26597, `_market_tick`:26621, `_build_market_panel`:26643, `_open_market`:26669, `_close_market`:26676, `_refresh_market`:26680, `_market_pick`:26733, `_toggle_board`:26771, `_board_tick`:26778

## 26815-27056  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26847, `_ds_label`:26866, `_build_display`:26880, `_ds_got`:26959, `_ds_sorted`:26968, `_ds_render_board`:26982, `_ds_render_news`:27008, `_display_tick`:27027

## 27057-27235  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27074, `_toggle_streamer`:27161, `_streamer_badge_tap`:27177, `_streamer_tick`:27181

## 27236-27272  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27242, `_car_back`:27249, `_car_park_tick`:27256

## 27273-27369  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27277, `_bus_eta`:27331, `_bus_displays_tick`:27347

## 27370-27661  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27388, `_treasure_pick`:27391, `_treasure_spot`:27400, `_treasure_district`:27404, `_treasure_clue`:27416, `_treasure_prop`:27429, `_tp_part`:27432, `_tp_sphere`:27442, `_tp_cyl`:27450, `_treasure_prop_side`:27459, `_build_treasure_props`:27471, `_build_treasure`:27515, `_treasure_dir_char`:27584, `_treasure_tick`:27593, `_treasure_claim`:27647

## 27662-27762  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27663, `_halo_mat`:27695, `_smoke_treasure`:27720

## 27763-28086  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27784, `_fm_send`:27787, `_fm_area`:27793, `_fm_glow_mesh`:27809, `_fm_block_reason`:27827, `_fm_start`:27839, `_fm_announce`:27867, `_fm_finish`:27870, `_fm_msg`:27888, `_fm_check_paid`:27939, `_fm_tick`:27957, `_smoke_findme`:28013

## 28087-28197  v0.24.2: road map (for moving people off the road)

`_floor_note`:28093, `_floor_disc`:28107, `_floor_top`:28116, `_ground_at`:28134, `_note_road`:28152, `_on_road`:28159, `_ped_curb`:28169, `_curb_spot`:28179

## 28198-28493  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28220, `_ex_grid`:28228, `_ex_lamps`:28263, `_ex_umbrella`:28286, `_ex_yards`:28293, `_build_expansion`:28308, `_expand_shots`:28471

## 28494-28688  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28535, `_v27_near_cross`:28627, `_v27_near_any_road`:28634, `_v27_in_district`:28640, `_sea_tick`:28654, `_sea_tow`:28673

## 28689-29356  Harbor Loop sky train

`_sky_build_path`:28740, `_sky_pos`:28781, `_sky_dir`:28795, `_sky_project`:28800, `_sky_trip_time`:28819, `_sky_trip_dist`:28825, `_sky_now`:28836, `_sky_state`:28839, `_sky_time_at_station`:28854, `_sky_next_arrival`:28861, `_build_skytrain`:28874, `_sky_make_car`:29026, `_sky_skin`:29063, `_sky_place_trains`:29083, `_sky_build_station`:29102, `_sky_near`:29167, `_sky_fmt`:29176, `_sky_enter`:29180, `_sky_leave_platform`:29198, `_sky_board`:29208, `_sky_alight`:29222, `_sky_action`:29236, `_sky_tick`:29253, `_sky_camera`:29293, `_tour_today`:29309, `_tour_stamp`:29312, `_sky_hud`:29335

## 29357-29717  Day and night

`_toggle_weather`:29440, `_refresh_weather_button`:29446, `_game_hour`:29452, `_day_key`:29464, `_night_setup`:29479, `_night_scan_mesh`:29569, `_daynight_tick`:29594, `_daynight_apply`:29601, `_daynight_lights`:29702, `_cycle_day_mode`:29707, `_refresh_time_button`:29714

## 29718-30353  v0.27 smoke test and screenshots

`_smoke_v27`:29719, `_city_shots`:29922

## 30354-30770  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30388, `_ap_plane`:30564, `_ap_truck`:30584, `_ap_baggage_train`:30625, `_ap_loop_pos`:30638, `_ap_loop_len`:30654, `_ap_flight_at`:30660, `_ap_tick`:30684, `_airport_ped_plan`:30707, `_smoke_airport`:30727

## 30771-31284  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30785, `_nav_spot`:30792, `_nav_idx`:30796, `_nav_pos`:30803, `_nav_blocked`:30807, `_nav_nearest_free`:30817, `_nav_bfs`:30845, `_nav_build`:30889, `_stroller`:30960, `_stroll_place`:30976, `_stroll_next`:30997, `_nav_clear_line`:31031, `_stroll_aim`:31042, `_strollers_tick`:31074, `_smoke_strollers`:31169

## 31285-31445  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31320, `_dir_fmt`:31323, `_signpost_spot`:31326, `_build_signposts`:31343

## 31446-31542  the Directions panel and chip

`_build_dir_panel`:31447, `_open_dir`:31489, `_dir_close`:31498, `_dir_pick`:31502, `_dir_stop`:31507, `_dir_stop_and_close`:31512, `_dir_tick`:31516

## 31543-32084  v0.44: Grand Central

`_gc_mesh`:31572, `_gc_mat`:31605, `_gc_glass`:31614, `_gb`:31624, `_gb_solid`:31630, `_gb_flush`:31634, `_gc_tree`:31664, `_gc_text`:31669, `_gc_planter`:31684, `_gc_kiosk`:31690, `_goods_color`:31720, `_goods_mat`:31723, `_kiosk_goods`:31727, `_build_grand_central`:31805, `_build_gc_towers`:31973, `_gc_tick`:32068

## 32085-32376  v0.44: filling the empty land

`_loft`:32102, `_fill_clear`:32144, `_build_fill`:32154, `_hg_in_lake`:32202, `_hg_path`:32206, `_floor_note_rot`:32214, `_build_gardens`:32222, `_build_fan_plaza`:32332

## 32377-32411  v0.45: hover car underglow

`_car_underglow`:32380

## 32412-32576  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32413

## 32577-32608  v0.47: street stalls downtown

`_build_street_stalls`:32581, `_cull_people_in`:32601

## 32609-32707  v0.48: places that open as you level up

`_place_lock_of`:32622, `_place_root`:32628, `_place_unlocked`:32631, `_build_place_signs`:32639, `_places_refresh`:32684, `_places_tick`:32701

## 32708-32752  v0.50: city careers

`_career_rank_name`:32733, `_career_mult`:32736, `_career_block_reason`:32741, `_career_start`:32744, `_career_end`:32749

## 32753-32803  v0.52: careers as clear job loops

`_cid`:32780, `_career_target`:32794, `_career_tick`:32801

## 32804-32811  taxi

`_taxi_meter`:32805

## 32812-32815  paramedic

(no functions)

## 32816-32820  police

`_career_chase_over`:32818

## 32821-32826  firefighter

`_fire_aimed`:32822

## 32827-32836  the step bar

`_career_bar_text`:32830, `_career_hud`:32834

## 32837-32863  cut scenes

`_cs_skip`:32855

## 32864-32868  siren

(no functions)

## 32869-32880  the Careers panel

`_build_career_panel`:32870, `_open_careers`:32873, `_career_close`:32877

## 32881-33304  v0.50: homes

`_home_door_spots`:32921, `_build_homes`:32936, `_home_labels`:32965, `_home_door_near`:32974, `_home_origin`:32983, `_home_slot_near`:32986, `_home_exit_near`:32997, `_home_btn`:33004, `_home_interact`:33017, `_home_buy`:33036, `_home_default_layout`:33050, `_home_enter`:33058, `_home_leave`:33078, `_hm`:33086, `_home_build_room`:33105, `_home_refresh_room`:33214, `_furni_build`:33228

## 33305-33640  decorating

`_build_home_panels`:33306, `_open_homes`:33351, `_home_row_go`:33361, `_home_panel_close`:33381, `_deco_open`:33385, `_deco_pick`:33408, `_smoke_careers_homes`:33431

## 33641-33775  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33645, `_home_slots`:33653, `_home_ring`:33680, `_furni_cat`:33686, `_home_fix_layout`:33692, `_home_build_layout`:33720

## 33776-34209  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33839, `_ch_homes`:33845, `_ch_step_text`:33852, `_ch_step_done`:33863, `_ch_target`:33877, `_ch_finish_chapter`:33886, `_chapters_tick`:33908, `_hud_top_stack`:33948, `_build_chapters_ui`:33978, `_chapters_restart_ask`:34020, `_chapters_restart`:34023, `_chapters_text`:34033, `_open_chapters`:34053, `_chapters_close`:34060, `_smoke_chapters`:34064, `_step_sound`:34185

## 34210-34248  v0.51.1: join and leave messages

`_announce_join`:34217, `_announce_already_here`:34236, `_announce_leave`:34244

## 34249-34513  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34265, `_shot_tick`:34271, `_draw_shot_icon`:34303, `_shot_enter`:34312, `_shot_exit`:34326, `_shot_release_controls`:34338, `_shot_stick_zone`:34345, `_shot_input`:34348, `_smoke_photo`:34420

## 34514-34812  v0.51.3: stream joiners

`_viewer_count`:34534, `_stream_join_check`:34540, `_stream_join_start`:34547, `_sj_streamer`:34564, `_stream_join_tick`:34573, `_stream_join_land`:34597, `_sj_welcome`:34613, `_smoke_stream_join`:34647, `_career_shot`:34730

## 34813-34929  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34817, `_st_restore`:34855, `_smoke_streamer_clean`:34876, `_world_bio_passport`:34927

