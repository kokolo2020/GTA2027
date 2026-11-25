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

## 8767-11157  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8768, `_radio_voice`:8771, `_radio_make`:8804, `_radio_set`:8875, `_radio_play`:8897, `_radio_next`:8902, `_radio_talk_line`:8906, `_radio_caption`:8927, `_radio_refresh`:8935, `_process`:8948, `_build_peds`:8999, `_update_peds`:9110, `_update_ped`:9129, `_smoke_test`:9183, `_smoke_chase`:9831, `_smoke_orole`:9864, `_smoke_levels`:9893, `_smoke_bus`:9934, `_smoke_chase_extras`:10019, `_smoke_marina`:10047, `_blocked_at`:10149, `_blocker`:10164, `_on_screen`:10177, `_wait_radio`:10182, `_smoke_radio_peds`:10189, `_smoke_typed_chat`:10259, `_smoke_chat_touch`:10278, `_smoke_cafe`:10299, `_smoke_boutique`:10325, `_smoke_models`:10353, `_smoke_garage_ridge`:10377, `_save_shot`:10753, `_paris_shots`:10763, `_people_shots`:10905, `_shots`:10946, `_shot_car`:11140, `_capture_preview`:11150

## 11158-11806  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11225, `_downtown_count`:11228, `_nearest_downtown`:11235, `_check_downtown`:11249, `_discover_downtown`:11262, `_box_batch`:11276, `_model_batch`:11296, `_cut_ranges`:11350, `_dt_ranges`:11362, `_dt_has`:11369, `_dt_near_cross`:11375, `_place`:11381, `_signal_pole`:11392, `_cyl_batch`:11411, `_city_signals`:11435, `_ensure_light_mats`:11486, `_city_lamps`:11496, `_build_downtown`:11540, `_dt_block`:11740, `_downtown_token`:11746, `_build_park`:11763, `_build_plaza`:11792

## 11807-11910  old city and Bay details

`_build_city_detail`:11808

## 11911-12320  traffic

`_build_traffic`:11912, `_path_sample`:12007, `_light_look`:12021, `_light_green`:12029, `_traffic_place`:12033, `_traffic_blocked_by`:12045, `_traffic_tick`:12057, `_smoke_downtown`:12163, `_skyline_shot`:12275, `_skyline_shots`:12283

## 12321-12681  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12367, `_web_scale`:12430, `_web_fps_tick`:12440, `_world_to_uv`:12457, `_map_angle`:12460, `_build_minimap`:12468, `_open_map`:12541, `_close_map`:12552, `_mini_point`:12559, `_site_markers`:12563, `_draw_arrow`:12595, `_draw_minimap`:12602, `_draw_full_map`:12649, `_minimap_tick`:12674

## 12682-12939  camera views

`_build_view_controls`:12683, `_cycle_view`:12725, `_apply_view`:12735, `_hide_labels`:12773, `_unfade`:12779, `_bake_map`:12785, `_shot_stats`:12835, `_view_shots`:12838, `_smoke_views`:12879

## 12940-13187  v0.17.0: level-up celebration

`_build_level_fx`:12951, `_draw_level_rays`:12988, `_level_fx_tick`:12998, `_level_sound`:13003, `_fx_material`:13045, `_level_up_fx`:13053, `_smoke_level_fx`:13154, `_levelup_shots`:13163

## 13188-13307  v0.18.0: walk-in stadium

`_collider_yaw`:13193, `_build_stadium_walls`:13204, `_look`:13232, `_smoke_stadium_eye`:13241, `_stadium_shots`:13277

## 13308-13469  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13332, `_arrow_mesh`:13344, `_build_guidance`:13367, `_guide_target`:13392, `_guidance_tick`:13421, `_draw_hud_arrow`:13447

## 13470-13655  checkpoints

`_build_checkpoints`:13471, `_refresh_checkpoints`:13516, `_check_checkpoints`:13522, `_activate_checkpoint`:13532, `_checkpoint_spawn`:13553, `_spawn_at_checkpoint`:13558, `_draw_checkpoint_icon`:13574, `_smoke_guidance_checkpoints`:13580, `_guide_shots`:13630

## 13656-13934  v0.18.0: Harbor Dome social hub

`_hub_seat`:13714, `_build_hub`:13718

## 13935-13985  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13936, `_xm_mesh`:13945, `_xm_tree`:13953

## 13986-14309  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13989, `_gt_surface`:14004, `_xm_grand_tree`:14014, `_lux_mat`:14129, `_lux_part`:14145, `_lux_box`:14148, `_lux_cyl`:14153, `_lux_ball`:14161, `_lux_new`:14169, `_lux_commit`:14174, `_lux_sofa_mesh`:14178, `_lux_chair_mesh`:14208, `_lux_table_mesh`:14228, `_lux_pouf_mesh`:14243, `_lux_batch`:14258, `_hub_christmas`:14274

## 14310-14465  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14311

## 14466-14714  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14469, `_vx_cyl`:14476, `_vx_ball`:14484, `_vx_ring`:14492, `_hub_polish`:14500, `_hub_gate`:14523, `_hub_vip`:14585, `_hub_glass`:14698

## 14715-14929  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14716, `_build_hub_bots`:14741, `_seat_of`:14772, `_bubble`:14782, `_emote`:14838, `_hub_people_tick`:14852

## 14930-15048  seats

`_seat_taken`:14931, `_nearest_seat`:14939, `_seat_label`:14951, `_sit`:14967, `_stand_up`:15011, `_seated_tick`:15030

## 15049-15205  game panel

`_build_game_panel`:15050, `_open_game_panel`:15105, `_refresh_game_panel`:15124, `_play_robot`:15169, `_peer_at`:15183, `_opponent_name`:15190, `_pay`:15198

## 15206-15326  tic-tac-toe

`_ttt_ready`:15209, `_ttt_winner`:15215, `_ttt_bot_move`:15225, `_ttt_tap`:15251, `_ttt_code`:15271, `_ttt_check`:15277, `_ttt_tick`:15300

## 15327-15378  rock paper scissors

`_rps_ready`:15328, `_rps_pick`:15334, `_rps_resolve`:15352, `_rps_tick`:15376

## 15379-15461  online table messages

`_online_game_send`:15380, `_hub_game_msg`:15386

## 15462-15537  comedy show

`_joke_start`:15463, `_joke_tick`:15475, `_speak`:15501, `_play_rimshot`:15510

## 15538-16437  quick chat and emotes

`_build_chat`:15560, `_chat_toggle_to`:15677, `_chat_log_add`:15685, `_chat_area`:15691, `_chat_near_count`:15709, `_chat_tick`:15718, `_toggle_chat`:15767, `_chat_fit`:15782, `_chat_clean`:15788, `_chat_wrap`:15805, `_chat_send_text`:15827, `_typing`:15850, `_say`:15853, `_do_emote`:15869, `_smoke_hub`:15878, `_chat_shots`:16052, `_cafe_shots`:16077, `_shop_shots`:16125, `_car_shots`:16174, `_outfit_shots`:16205, `_hub_shots`:16253, `_sg_on_terrace`:16388, `_people_only`:16391, `_people_only_keep_cars_out`:16395, `_car_barrier`:16407, `_hub_keep_cars_out`:16421

## 16438-16600  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16447, `_feed_add`:16456, `_feed_render`:16462, `_feed_tick`:16490, `_online_event_send`:16499, `_at_pvp_table`:16506, `_game_name`:16513, `_send_lfp`:16516, `_lfp_msg`:16533, `_accept_invite`:16554

## 16601-16842  v0.18.2: nickname and HUD relayout

`_nick_rude`:16613, `_clean_nick`:16628, `_build_nick_panel`:16640, `_open_nick`:16678, `_random_nick`:16687, `_save_nick`:16693, `_close_nick`:16712, `_refresh_nick_button`:16721, `_relayout_hud`:16725, `_smoke_nick`:16762, `_nick_shots`:16794, `_smoke_sites_reachable`:16812

## 16843-17130  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16869, `_nearest_civic`:16876, `_check_civic`:16890, `_discover_civic`:16903, `_civ_ranges`:16916, `_civ_has`:16930, `_civ_near_cross`:16936, `_build_civic`:16942, `_civic_token`:17068, `_civic_shots`:17085, `_hub_focus`:17107

## 17131-17240  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17202, `_in_rw_lot`:17205, `_box_batch_rot`:17208, `_multi_collider`:17226

## 17241-17568  circuit geometry

`_cr_point`:17242, `_rw_build_path`:17256, `_rw_dir`:17284, `_rw_bend`:17289, `_ribbon`:17295, `_rw_band`:17315, `_rw_keepout`:17333, `_build_raceway`:17342, `_build_rw_parking`:17376, `_build_rw_pits`:17421, `_build_rw_track`:17458, `_build_rw_trackside`:17499

## 17569-17666  race car rental

`_model_key`:17570, `_race_car_start`:17573, `_tint_ghost`:17611, `_race_car_end`:17624, `_race_keep_cars_out`:17649

## 17667-17681  speed effects

`_eff_max`:17668, `_eff_accel`:17679

## 17682-17732  track helpers

`_rw_seg_progress`:17683, `_rw_track_dist`:17703, `_rw_point_dist`:17714, `_rw_player_progress`:17721, `_rw_target`:17727

## 17733-17969  events

`_rec_stop`:17734, `_rw_place`:17750, `_rw_grid_pos`:17757, `_rw_start`:17762, `_rw_spawn_ai`:17794, `_rw_ai_place`:17818, `_rw_tick`:17829, `_rw_ai_tick`:17882, `_rw_lap_done`:17924, `_rw_finish`:17936, `_rw_fmt`:17967

## 17970-18022  boosters and spikes

`_rw_buy`:17971, `_rw_use_boost`:17989, `_rw_use_spike`:17997, `_rw_drop_spike_at`:18008

## 18023-18080  online races

`_race_msg`:18024, `_join_race`:18046

## 18081-18436  raceway panel, HUD, board

`_build_raceway_ui`:18082, `_rw_layout`:18142, `_rw_open`:18149, `_rw_close`:18155, `_rw_refresh_panel`:18159, `_rw_refresh_board`:18172, `_rw_hud`:18184, `_peer_car_model`:18208, `_smoke_raceway`:18218, `_race_shots`:18399

## 18437-18644  v0.22.0: Call Car

`_call_block_reason`:18443, `_call_spot`:18460, `_call_car`:18491, `_play_horn`:18515, `_smoke_follow_call`:18539, `_follow_shots`:18612

## 18645-19102  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18670, `_place_portal_button`:18676, `_portal_pressed`:18683, `_build_travel`:18691, `_toggle_run`:18796, `_refresh_run`:18800, `_hud_v23_tick`:18808, `_travel_block_reason`:18840, `_travel_open`:18860, `_open_travel`:18866, `_open_worlds`:18872, `_open_case`:18878, `_case_step`:18890, `_case_refresh`:18894, `_case_submit`:18898, `_close_case`:18907, `_sky_go`:18911, `_close_worlds`:18921, `_refresh_worlds`:18925, `_world_go`:18931, `_close_travel`:18938, `_refresh_travel`:18942, `_travel_to`:18950, `_smoke_travel`:18977, `_v23_shots`:19015

## 19103-19176  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19110, `_qr_button`:19125, `_qr_layout`:19164, `_smoke_qr`:19170

## 19177-19613  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19197, `_open_crate`:19213, `_build_crate_ui`:19230, `_crate_pick`:19317, `_crate_reveal`:19340, `_crate_draw_car`:19367, `_crate_confetti`:19386, `_crate_sound`:19411, `_crate_drive`:19437, `_feed_add_system`:19467, `_smoke_crate`:19470, `_crate_shots`:19518

## 19614-20105  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19655, `_quick_today`:19660, `_quick_is_done`:19663, `_quick_left`:19666, `_quick_next`:19673, `_quick_fix_target`:19686, `_quick_daily_check`:19700, `_quick_complete`:19714, `_quick_side`:19748, `_build_quick_props`:19766, `_daily_shots`:19918, `_quick_props_refresh`:19960, `_quick_fx`:19964, `_play_coin`:19980, `_smoke_quick`:19997

## 20106-20256  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20115, `_quest_nearby`:20170, `_open_quests`:20177, `_close_quests`:20184, `_refresh_quests`:20188, `_quest_pick`:20214, `_quest_mode`:20228, `_smoke_quests`:20231

## 20257-20291  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20261, `_my_tag_tick`:20264

## 20292-20606  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20309, `_fc_torus`:20319, `_fc_pearl`:20327, `_fc_chrome`:20337, `_fc_glass`:20346, `_fc_glow`:20356, `_fc_ghost`:20365, `_fc_holo`:20377, `_fc_mesh`:20387, `_fc_sphere`:20407, `_fc_capsule`:20415, `_fc_cone`:20423, `_build_food_court`:20432, `_food_court_tick`:20586

## 20607-20928  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20636, `_cm_bench`:20652, `_build_commons`:20665, `_commons_tick`:20887

## 20929-21243  v0.36: the daily puzzle

`_pz_today`:20952, `_pz_new`:20955, `_pz_neighbours`:21000, `_pz_flip`:21010, `_pz_done`:21015, `_pz_tap`:21023, `_pz_win`:21039, `_pz_reset`:21060, `_puzzle_near`:21064, `_open_puzzle`:21069, `_close_puzzle`:21077, `_pz_refresh_sign`:21081, `_build_puzzle_panel`:21089, `_pz_draw`:21120, `_smoke_chat`:21161, `_smoke_feet`:21199, `_smoke_commons`:21220

## 21244-21432  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21306, `_bio_theta`:21310, `_bio_sec_n`:21315, `_bio_sec_of`:21318, `_bio_pt`:21321, `_bio_lp`:21326, `_bio_la`:21330, `_bio_dir`:21334, `_bio_hex_r`:21337, `_bio_apo`:21342, `_bio_open_angles`:21348, `_bio_si`:21358, `_bm`:21364, `_bsph`:21369, `_blow`:21372, `_bcone`:21383, `_bbox`:21386, `_bp`:21389, `_bq`:21394, `_bio_glass_mat`:21398, `_bio_water_mat`:21411, `_bio_mat`:21423

## 21433-21805  building blocks

`_bio_inst`:21434, `_bio_add`:21440, `_bio_model`:21443, `_bio_nature_mesh`:21449, `_bio_flush`:21483, `_bio_bar`:21518, `_bio_slab`:21531, `_bio_body`:21546, `_bio_cyl_col`:21559, `_bio_hexmesh`:21572, `_bio_hexslab`:21584, `_bio_hexpt`:21590, `_bio_gridshell`:21597, `_bio_rail`:21704, `_bio_rail_arc`:21709, `_bio_disc_deck`:21721, `_bio_ring_deck`:21727, `_bio_helix`:21738, `_bio_pillar`:21758, `_bio_cafe`:21764, `_bio_fence_line`:21778, `_bio_fence_seg`:21783, `_bio_pen`:21793

## 21806-22307  building

`_build_biosphere`:21807, `_build_biosphere_legacy`:21811, `_bio_text`:21973, `_bio_plaque`:21991, `_bio_ticket_hall`:22005, `_on_foot_collision_guard`:22061, `_bio_inside`:22071, `_bio_pass_ok`:22074, `_ticket_near`:22078, `_bio_buy_pass`:22083, `_bio_gates_update`:22099, `_bio_gate_tick`:22125, `_bio_tunnel`:22137, `_bio_grounds`:22190, `_bio_dome`:22236, `_bio_deck_mats`:22304

## 22308-22463  garden planting

`_bio_free`:22309, `_bio_spot`:22326, `_bio_garden`:22334, `_bio_pine`:22375, `_bio_tree`:22378, `_bio_big_tree`:22388, `_bio_rock`:22393, `_bio_pond`:22396, `_bio_particles`:22400, `_bio_mist`:22428, `_bio_mini_dome`:22457

## 22464-22871  the four layouts

`_bio_winter`:22465, `_bio_spring`:22557, `_bio_summer`:22682, `_bio_autumn`:22766

## 22872-23142  animals

`_bio_spawn`:22873, `_bio_load_animal`:22945, `_bio_make_quad`:22966, `_bio_load_bird`:23043, `_bio_make_penguin`:23063, `_bio_make_bird`:23085, `_bio_make_flamingo`:23109, `_bio_make_butterfly`:23130

## 23143-23274  animation, spotting and rewards

`_bio_stuck_check`:23148, `_biosphere_tick`:23166, `_bio_animate`:23175, `_bio_spot_check`:23255, `_bio_spotted`:23267, `_smoke_biosphere`:23271

## 23275-23792  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23362, `_wear_piece`:23365, `_wear_mat`:23388, `_person_index`:23404, `_dress`:23427, `_smoke_style`:23533, `_style_shots`:23684, `_npc_look`:23756

## 23793-23946  your look: apply, save, share

`_look_clean`:23797, `_look_pack`:23812, `_owns`:23818, `_apply_look`:23823, `_relic_model`:23834, `_fc_mesh_mat`:23899, `_relic_refresh`:23902, `_relic_tick`:23916, `_peer_style`:23927

## 23947-24374  stores and the wardrobe

`_style_today`:23966, `_style_items`:23969, `_style_cat`:23977, `_style_price`:23980, `_style_deal`:23994, `_style_price_base`:24007, `_relic_stock`:24014, `_build_style_panel`:24026, `_open_store`:24066, `_open_wardrobe`:24085, `_style_close`:24088, `_style_finish`:24092, `_sync_old_avatar`:24107, `_style_tabs_for`:24114, `_refresh_style`:24119, `_style_body_rows`:24270, `_style_set_tab`:24287, `_style_step`:24291, `_style_color`:24296, `_style_pick`:24301, `_style_buy`:24336, `_ach_relics_check`:24358, `_style_face_camera`:24363

## 24375-24842  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24411, `_ga_text`:24417, `_ga_box`:24434, `_build_galleria`:24450, `_ga_inner_tick`:24591, `_ga_shell`:24607, `_ga_inside`:24657, `_bio_cyl_col_on`:24660, `_ga_models`:24672, `_ga_lbox`:24687, `_ga_ltext`:24701, `_ga_store`:24708, `_bio_cafe_on`:24810, `_ga_mannequins`:24818

## 24843-24994  featured outfits and the Sky Run

`_ga_featured_look`:24856, `_build_ga_fun`:24877, `_ga_fun_tick`:24922, `_sky_finish`:24949, `_extra_near`:24968, `_extra_open`:24977, `_store_near`:24986

## 24995-25091  v0.41: THE SKY GARDEN

`_sg_now`:25049, `_sg_progress`:25052, `_sg_time`:25058, `_sg_stock`:25065, `_sg_mut_roll`:25080

## 25092-25229  building

`_sg_box`:25093, `_sg_text`:25099, `_build_sky_garden`:25113, `_sg_seed_spot`:25224, `_sg_codex_spot`:25227

## 25230-25410  plants

`_sg_plant_model`:25231, `_sg_refresh_all`:25336, `_sg_refresh`:25340, `_sky_garden_tick`:25376, `_sg_ready_count`:25395, `_sg_boot_note`:25402

## 25411-25530  interacting

`_sg_near`:25412, `_sg_button_text`:25435, `_sg_value`:25448, `_sg_interact`:25452, `_sg_buy`:25468, `_sg_plant`:25490, `_sg_harvest`:25501

## 25531-25774  the garden screen

`_build_sg_panel`:25532, `_sg_open`:25567, `_sg_close`:25576, `_sg_row`:25580, `_sg_refresh_panel`:25595, `_sg_pick_buy`:25640, `_sg_pick_plant`:25644, `_smoke_car_barriers`:25650, `_smoke_sky_garden`:25691

## 25775-25813  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25806, `_pass_day`:25809

## 25814-25845  album

`_album_pages`:25815, `_album_claim`:25830

## 25846-25897  season

`_season_index`:25847, `_season_tick`:25850, `_season_xp`:25859, `_season_tier`:25862, `_season_reward`:25865, `_season_claim`:25879

## 25898-25905  Harbor Night

`_harbor_night`:25899

## 25906-25937  check-in calendar

`_cal_tick`:25907

## 25938-26114  the panel

`_build_hp_panel`:25939, `_open_pass`:25974, `_hp_open`:25977, `_hp_close`:25984, `_hp_row`:25988, `_hp_bar`:26003, `_hp_refresh`:26007, `_smoke_pass`:26052

## 26115-26329  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26119, `_cash_pill_tick`:26127, `_build_lb`:26165, `_open_lb`:26208, `_close_lb`:26216, `_lb_pick`:26220, `_lb_headers`:26225, `_lb_url`:26229, `_lb_me`:26232, `_lb_tick`:26235, `_lb_upload`:26243, `_lb_fetch`:26253, `_lb_got`:26261, `_lb_value`:26272, `_lb_refresh_ui`:26283

## 26330-26753  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26354, `_market_near`:26431, `_build_gear`:26441, `_gear_piece`:26449, `_build_pet`:26494, `_market_apply`:26536, `_market_tick`:26560, `_build_market_panel`:26582, `_open_market`:26608, `_close_market`:26615, `_refresh_market`:26619, `_market_pick`:26672, `_toggle_board`:26710, `_board_tick`:26717

## 26754-26995  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26786, `_ds_label`:26805, `_build_display`:26819, `_ds_got`:26898, `_ds_sorted`:26907, `_ds_render_board`:26921, `_ds_render_news`:26947, `_display_tick`:26966

## 26996-27174  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27013, `_toggle_streamer`:27100, `_streamer_badge_tap`:27116, `_streamer_tick`:27120

## 27175-27211  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27181, `_car_back`:27188, `_car_park_tick`:27195

## 27212-27308  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27216, `_bus_eta`:27270, `_bus_displays_tick`:27286

## 27309-27600  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27327, `_treasure_pick`:27330, `_treasure_spot`:27339, `_treasure_district`:27343, `_treasure_clue`:27355, `_treasure_prop`:27368, `_tp_part`:27371, `_tp_sphere`:27381, `_tp_cyl`:27389, `_treasure_prop_side`:27398, `_build_treasure_props`:27410, `_build_treasure`:27454, `_treasure_dir_char`:27523, `_treasure_tick`:27532, `_treasure_claim`:27586

## 27601-27701  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27602, `_halo_mat`:27634, `_smoke_treasure`:27659

## 27702-28025  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27723, `_fm_send`:27726, `_fm_area`:27732, `_fm_glow_mesh`:27748, `_fm_block_reason`:27766, `_fm_start`:27778, `_fm_announce`:27806, `_fm_finish`:27809, `_fm_msg`:27827, `_fm_check_paid`:27878, `_fm_tick`:27896, `_smoke_findme`:27952

## 28026-28136  v0.24.2: road map (for moving people off the road)

`_floor_note`:28032, `_floor_disc`:28046, `_floor_top`:28055, `_ground_at`:28073, `_note_road`:28091, `_on_road`:28098, `_ped_curb`:28108, `_curb_spot`:28118

## 28137-28432  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28159, `_ex_grid`:28167, `_ex_lamps`:28202, `_ex_umbrella`:28225, `_ex_yards`:28232, `_build_expansion`:28247, `_expand_shots`:28410

## 28433-28627  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28474, `_v27_near_cross`:28566, `_v27_near_any_road`:28573, `_v27_in_district`:28579, `_sea_tick`:28593, `_sea_tow`:28612

## 28628-29295  Harbor Loop sky train

`_sky_build_path`:28679, `_sky_pos`:28720, `_sky_dir`:28734, `_sky_project`:28739, `_sky_trip_time`:28758, `_sky_trip_dist`:28764, `_sky_now`:28775, `_sky_state`:28778, `_sky_time_at_station`:28793, `_sky_next_arrival`:28800, `_build_skytrain`:28813, `_sky_make_car`:28965, `_sky_skin`:29002, `_sky_place_trains`:29022, `_sky_build_station`:29041, `_sky_near`:29106, `_sky_fmt`:29115, `_sky_enter`:29119, `_sky_leave_platform`:29137, `_sky_board`:29147, `_sky_alight`:29161, `_sky_action`:29175, `_sky_tick`:29192, `_sky_camera`:29232, `_tour_today`:29248, `_tour_stamp`:29251, `_sky_hud`:29274

## 29296-29656  Day and night

`_toggle_weather`:29379, `_refresh_weather_button`:29385, `_game_hour`:29391, `_day_key`:29403, `_night_setup`:29418, `_night_scan_mesh`:29508, `_daynight_tick`:29533, `_daynight_apply`:29540, `_daynight_lights`:29641, `_cycle_day_mode`:29646, `_refresh_time_button`:29653

## 29657-30292  v0.27 smoke test and screenshots

`_smoke_v27`:29658, `_city_shots`:29861

## 30293-30709  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30327, `_ap_plane`:30503, `_ap_truck`:30523, `_ap_baggage_train`:30564, `_ap_loop_pos`:30577, `_ap_loop_len`:30593, `_ap_flight_at`:30599, `_ap_tick`:30623, `_airport_ped_plan`:30646, `_smoke_airport`:30666

## 30710-31223  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30724, `_nav_spot`:30731, `_nav_idx`:30735, `_nav_pos`:30742, `_nav_blocked`:30746, `_nav_nearest_free`:30756, `_nav_bfs`:30784, `_nav_build`:30828, `_stroller`:30899, `_stroll_place`:30915, `_stroll_next`:30936, `_nav_clear_line`:30970, `_stroll_aim`:30981, `_strollers_tick`:31013, `_smoke_strollers`:31108

## 31224-31384  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31259, `_dir_fmt`:31262, `_signpost_spot`:31265, `_build_signposts`:31282

## 31385-31481  the Directions panel and chip

`_build_dir_panel`:31386, `_open_dir`:31428, `_dir_close`:31437, `_dir_pick`:31441, `_dir_stop`:31446, `_dir_stop_and_close`:31451, `_dir_tick`:31455

## 31482-32023  v0.44: Grand Central

`_gc_mesh`:31511, `_gc_mat`:31544, `_gc_glass`:31553, `_gb`:31563, `_gb_solid`:31569, `_gb_flush`:31573, `_gc_tree`:31603, `_gc_text`:31608, `_gc_planter`:31623, `_gc_kiosk`:31629, `_goods_color`:31659, `_goods_mat`:31662, `_kiosk_goods`:31666, `_build_grand_central`:31744, `_build_gc_towers`:31912, `_gc_tick`:32007

## 32024-32315  v0.44: filling the empty land

`_loft`:32041, `_fill_clear`:32083, `_build_fill`:32093, `_hg_in_lake`:32141, `_hg_path`:32145, `_floor_note_rot`:32153, `_build_gardens`:32161, `_build_fan_plaza`:32271

## 32316-32350  v0.45: hover car underglow

`_car_underglow`:32319

## 32351-32515  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32352

## 32516-32547  v0.47: street stalls downtown

`_build_street_stalls`:32520, `_cull_people_in`:32540

## 32548-32646  v0.48: places that open as you level up

`_place_lock_of`:32561, `_place_root`:32567, `_place_unlocked`:32570, `_build_place_signs`:32578, `_places_refresh`:32623, `_places_tick`:32640

## 32647-32691  v0.50: city careers

`_career_rank_name`:32672, `_career_mult`:32675, `_career_block_reason`:32680, `_career_start`:32683, `_career_end`:32688

## 32692-32742  v0.52: careers as clear job loops

`_cid`:32719, `_career_target`:32733, `_career_tick`:32740

## 32743-32750  taxi

`_taxi_meter`:32744

## 32751-32754  paramedic

(no functions)

## 32755-32759  police

`_career_chase_over`:32757

## 32760-32765  firefighter

`_fire_aimed`:32761

## 32766-32775  the step bar

`_career_bar_text`:32769, `_career_hud`:32773

## 32776-32802  cut scenes

`_cs_skip`:32794

## 32803-32807  siren

(no functions)

## 32808-32819  the Careers panel

`_build_career_panel`:32809, `_open_careers`:32812, `_career_close`:32816

## 32820-33243  v0.50: homes

`_home_door_spots`:32860, `_build_homes`:32875, `_home_labels`:32904, `_home_door_near`:32913, `_home_origin`:32922, `_home_slot_near`:32925, `_home_exit_near`:32936, `_home_btn`:32943, `_home_interact`:32956, `_home_buy`:32975, `_home_default_layout`:32989, `_home_enter`:32997, `_home_leave`:33017, `_hm`:33025, `_home_build_room`:33044, `_home_refresh_room`:33153, `_furni_build`:33167

## 33244-33579  decorating

`_build_home_panels`:33245, `_open_homes`:33290, `_home_row_go`:33300, `_home_panel_close`:33320, `_deco_open`:33324, `_deco_pick`:33347, `_smoke_careers_homes`:33370

## 33580-33714  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33584, `_home_slots`:33592, `_home_ring`:33619, `_furni_cat`:33625, `_home_fix_layout`:33631, `_home_build_layout`:33659

## 33715-34148  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33778, `_ch_homes`:33784, `_ch_step_text`:33791, `_ch_step_done`:33802, `_ch_target`:33816, `_ch_finish_chapter`:33825, `_chapters_tick`:33847, `_hud_top_stack`:33887, `_build_chapters_ui`:33917, `_chapters_restart_ask`:33959, `_chapters_restart`:33962, `_chapters_text`:33972, `_open_chapters`:33992, `_chapters_close`:33999, `_smoke_chapters`:34003, `_step_sound`:34124

## 34149-34187  v0.51.1: join and leave messages

`_announce_join`:34156, `_announce_already_here`:34175, `_announce_leave`:34183

## 34188-34452  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34204, `_shot_tick`:34210, `_draw_shot_icon`:34242, `_shot_enter`:34251, `_shot_exit`:34265, `_shot_release_controls`:34277, `_shot_stick_zone`:34284, `_shot_input`:34287, `_smoke_photo`:34359

## 34453-34751  v0.51.3: stream joiners

`_viewer_count`:34473, `_stream_join_check`:34479, `_stream_join_start`:34486, `_sj_streamer`:34503, `_stream_join_tick`:34512, `_stream_join_land`:34536, `_sj_welcome`:34552, `_smoke_stream_join`:34586, `_career_shot`:34669

## 34752-34868  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34756, `_st_restore`:34794, `_smoke_streamer_clean`:34815, `_world_bio_passport`:34866

