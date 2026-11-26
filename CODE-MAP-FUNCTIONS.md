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

## 8767-11222  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8768, `_radio_voice`:8771, `_radio_make`:8804, `_radio_set`:8875, `_radio_play`:8897, `_radio_next`:8902, `_radio_talk_line`:8906, `_radio_caption`:8927, `_radio_refresh`:8935, `_process`:8948, `_build_peds`:8999, `_update_peds`:9110, `_update_ped`:9129, `_smoke_test`:9183, `_smoke_chase`:9831, `_smoke_orole`:9864, `_smoke_levels`:9893, `_smoke_bus`:9934, `_smoke_chase_extras`:10019, `_smoke_marina`:10047, `_blocked_at`:10149, `_blocker`:10164, `_on_screen`:10177, `_wait_radio`:10182, `_smoke_radio_peds`:10189, `_smoke_typed_chat`:10259, `_smoke_chat_touch`:10278, `_smoke_cafe`:10299, `_smoke_boutique`:10325, `_smoke_models`:10353, `_smoke_garage_ridge`:10377, `_save_shot`:10753, `_paris_shots`:10763, `_people_shots`:10970, `_shots`:11011, `_shot_car`:11205, `_capture_preview`:11215

## 11223-11871  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11290, `_downtown_count`:11293, `_nearest_downtown`:11300, `_check_downtown`:11314, `_discover_downtown`:11327, `_box_batch`:11341, `_model_batch`:11361, `_cut_ranges`:11415, `_dt_ranges`:11427, `_dt_has`:11434, `_dt_near_cross`:11440, `_place`:11446, `_signal_pole`:11457, `_cyl_batch`:11476, `_city_signals`:11500, `_ensure_light_mats`:11551, `_city_lamps`:11561, `_build_downtown`:11605, `_dt_block`:11805, `_downtown_token`:11811, `_build_park`:11828, `_build_plaza`:11857

## 11872-11975  old city and Bay details

`_build_city_detail`:11873

## 11976-12385  traffic

`_build_traffic`:11977, `_path_sample`:12072, `_light_look`:12086, `_light_green`:12094, `_traffic_place`:12098, `_traffic_blocked_by`:12110, `_traffic_tick`:12122, `_smoke_downtown`:12228, `_skyline_shot`:12340, `_skyline_shots`:12348

## 12386-12746  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12432, `_web_scale`:12495, `_web_fps_tick`:12505, `_world_to_uv`:12522, `_map_angle`:12525, `_build_minimap`:12533, `_open_map`:12606, `_close_map`:12617, `_mini_point`:12624, `_site_markers`:12628, `_draw_arrow`:12660, `_draw_minimap`:12667, `_draw_full_map`:12714, `_minimap_tick`:12739

## 12747-13004  camera views

`_build_view_controls`:12748, `_cycle_view`:12790, `_apply_view`:12800, `_hide_labels`:12838, `_unfade`:12844, `_bake_map`:12850, `_shot_stats`:12900, `_view_shots`:12903, `_smoke_views`:12944

## 13005-13252  v0.17.0: level-up celebration

`_build_level_fx`:13016, `_draw_level_rays`:13053, `_level_fx_tick`:13063, `_level_sound`:13068, `_fx_material`:13110, `_level_up_fx`:13118, `_smoke_level_fx`:13219, `_levelup_shots`:13228

## 13253-13372  v0.18.0: walk-in stadium

`_collider_yaw`:13258, `_build_stadium_walls`:13269, `_look`:13297, `_smoke_stadium_eye`:13306, `_stadium_shots`:13342

## 13373-13534  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13397, `_arrow_mesh`:13409, `_build_guidance`:13432, `_guide_target`:13457, `_guidance_tick`:13486, `_draw_hud_arrow`:13512

## 13535-13720  checkpoints

`_build_checkpoints`:13536, `_refresh_checkpoints`:13581, `_check_checkpoints`:13587, `_activate_checkpoint`:13597, `_checkpoint_spawn`:13618, `_spawn_at_checkpoint`:13623, `_draw_checkpoint_icon`:13639, `_smoke_guidance_checkpoints`:13645, `_guide_shots`:13695

## 13721-13999  v0.18.0: Harbor Dome social hub

`_hub_seat`:13779, `_build_hub`:13783

## 14000-14050  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14001, `_xm_mesh`:14010, `_xm_tree`:14018

## 14051-14374  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14054, `_gt_surface`:14069, `_xm_grand_tree`:14079, `_lux_mat`:14194, `_lux_part`:14210, `_lux_box`:14213, `_lux_cyl`:14218, `_lux_ball`:14226, `_lux_new`:14234, `_lux_commit`:14239, `_lux_sofa_mesh`:14243, `_lux_chair_mesh`:14273, `_lux_table_mesh`:14293, `_lux_pouf_mesh`:14308, `_lux_batch`:14323, `_hub_christmas`:14339

## 14375-14530  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14376

## 14531-14779  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14534, `_vx_cyl`:14541, `_vx_ball`:14549, `_vx_ring`:14557, `_hub_polish`:14565, `_hub_gate`:14588, `_hub_vip`:14650, `_hub_glass`:14763

## 14780-14994  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14781, `_build_hub_bots`:14806, `_seat_of`:14837, `_bubble`:14847, `_emote`:14903, `_hub_people_tick`:14917

## 14995-15113  seats

`_seat_taken`:14996, `_nearest_seat`:15004, `_seat_label`:15016, `_sit`:15032, `_stand_up`:15076, `_seated_tick`:15095

## 15114-15270  game panel

`_build_game_panel`:15115, `_open_game_panel`:15170, `_refresh_game_panel`:15189, `_play_robot`:15234, `_peer_at`:15248, `_opponent_name`:15255, `_pay`:15263

## 15271-15391  tic-tac-toe

`_ttt_ready`:15274, `_ttt_winner`:15280, `_ttt_bot_move`:15290, `_ttt_tap`:15316, `_ttt_code`:15336, `_ttt_check`:15342, `_ttt_tick`:15365

## 15392-15443  rock paper scissors

`_rps_ready`:15393, `_rps_pick`:15399, `_rps_resolve`:15417, `_rps_tick`:15441

## 15444-15526  online table messages

`_online_game_send`:15445, `_hub_game_msg`:15451

## 15527-15602  comedy show

`_joke_start`:15528, `_joke_tick`:15540, `_speak`:15566, `_play_rimshot`:15575

## 15603-16502  quick chat and emotes

`_build_chat`:15625, `_chat_toggle_to`:15742, `_chat_log_add`:15750, `_chat_area`:15756, `_chat_near_count`:15774, `_chat_tick`:15783, `_toggle_chat`:15832, `_chat_fit`:15847, `_chat_clean`:15853, `_chat_wrap`:15870, `_chat_send_text`:15892, `_typing`:15915, `_say`:15918, `_do_emote`:15934, `_smoke_hub`:15943, `_chat_shots`:16117, `_cafe_shots`:16142, `_shop_shots`:16190, `_car_shots`:16239, `_outfit_shots`:16270, `_hub_shots`:16318, `_sg_on_terrace`:16453, `_people_only`:16456, `_people_only_keep_cars_out`:16460, `_car_barrier`:16472, `_hub_keep_cars_out`:16486

## 16503-16665  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16512, `_feed_add`:16521, `_feed_render`:16527, `_feed_tick`:16555, `_online_event_send`:16564, `_at_pvp_table`:16571, `_game_name`:16578, `_send_lfp`:16581, `_lfp_msg`:16598, `_accept_invite`:16619

## 16666-16907  v0.18.2: nickname and HUD relayout

`_nick_rude`:16678, `_clean_nick`:16693, `_build_nick_panel`:16705, `_open_nick`:16743, `_random_nick`:16752, `_save_nick`:16758, `_close_nick`:16777, `_refresh_nick_button`:16786, `_relayout_hud`:16790, `_smoke_nick`:16827, `_nick_shots`:16859, `_smoke_sites_reachable`:16877

## 16908-17195  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16934, `_nearest_civic`:16941, `_check_civic`:16955, `_discover_civic`:16968, `_civ_ranges`:16981, `_civ_has`:16995, `_civ_near_cross`:17001, `_build_civic`:17007, `_civic_token`:17133, `_civic_shots`:17150, `_hub_focus`:17172

## 17196-17305  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17267, `_in_rw_lot`:17270, `_box_batch_rot`:17273, `_multi_collider`:17291

## 17306-17633  circuit geometry

`_cr_point`:17307, `_rw_build_path`:17321, `_rw_dir`:17349, `_rw_bend`:17354, `_ribbon`:17360, `_rw_band`:17380, `_rw_keepout`:17398, `_build_raceway`:17407, `_build_rw_parking`:17441, `_build_rw_pits`:17486, `_build_rw_track`:17523, `_build_rw_trackside`:17564

## 17634-17731  race car rental

`_model_key`:17635, `_race_car_start`:17638, `_tint_ghost`:17676, `_race_car_end`:17689, `_race_keep_cars_out`:17714

## 17732-17746  speed effects

`_eff_max`:17733, `_eff_accel`:17744

## 17747-17797  track helpers

`_rw_seg_progress`:17748, `_rw_track_dist`:17768, `_rw_point_dist`:17779, `_rw_player_progress`:17786, `_rw_target`:17792

## 17798-18034  events

`_rec_stop`:17799, `_rw_place`:17815, `_rw_grid_pos`:17822, `_rw_start`:17827, `_rw_spawn_ai`:17859, `_rw_ai_place`:17883, `_rw_tick`:17894, `_rw_ai_tick`:17947, `_rw_lap_done`:17989, `_rw_finish`:18001, `_rw_fmt`:18032

## 18035-18087  boosters and spikes

`_rw_buy`:18036, `_rw_use_boost`:18054, `_rw_use_spike`:18062, `_rw_drop_spike_at`:18073

## 18088-18145  online races

`_race_msg`:18089, `_join_race`:18111

## 18146-18501  raceway panel, HUD, board

`_build_raceway_ui`:18147, `_rw_layout`:18207, `_rw_open`:18214, `_rw_close`:18220, `_rw_refresh_panel`:18224, `_rw_refresh_board`:18237, `_rw_hud`:18249, `_peer_car_model`:18273, `_smoke_raceway`:18283, `_race_shots`:18464

## 18502-18709  v0.22.0: Call Car

`_call_block_reason`:18508, `_call_spot`:18525, `_call_car`:18556, `_play_horn`:18580, `_smoke_follow_call`:18604, `_follow_shots`:18677

## 18710-19167  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18735, `_place_portal_button`:18741, `_portal_pressed`:18748, `_build_travel`:18756, `_toggle_run`:18861, `_refresh_run`:18865, `_hud_v23_tick`:18873, `_travel_block_reason`:18905, `_travel_open`:18925, `_open_travel`:18931, `_open_worlds`:18937, `_open_case`:18943, `_case_step`:18955, `_case_refresh`:18959, `_case_submit`:18963, `_close_case`:18972, `_sky_go`:18976, `_close_worlds`:18986, `_refresh_worlds`:18990, `_world_go`:18996, `_close_travel`:19003, `_refresh_travel`:19007, `_travel_to`:19015, `_smoke_travel`:19042, `_v23_shots`:19080

## 19168-19241  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19175, `_qr_button`:19190, `_qr_layout`:19229, `_smoke_qr`:19235

## 19242-19678  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19262, `_open_crate`:19278, `_build_crate_ui`:19295, `_crate_pick`:19382, `_crate_reveal`:19405, `_crate_draw_car`:19432, `_crate_confetti`:19451, `_crate_sound`:19476, `_crate_drive`:19502, `_feed_add_system`:19532, `_smoke_crate`:19535, `_crate_shots`:19583

## 19679-20170  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19720, `_quick_today`:19725, `_quick_is_done`:19728, `_quick_left`:19731, `_quick_next`:19738, `_quick_fix_target`:19751, `_quick_daily_check`:19765, `_quick_complete`:19779, `_quick_side`:19813, `_build_quick_props`:19831, `_daily_shots`:19983, `_quick_props_refresh`:20025, `_quick_fx`:20029, `_play_coin`:20045, `_smoke_quick`:20062

## 20171-20321  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20180, `_quest_nearby`:20235, `_open_quests`:20242, `_close_quests`:20249, `_refresh_quests`:20253, `_quest_pick`:20279, `_quest_mode`:20293, `_smoke_quests`:20296

## 20322-20356  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20326, `_my_tag_tick`:20329

## 20357-20671  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20374, `_fc_torus`:20384, `_fc_pearl`:20392, `_fc_chrome`:20402, `_fc_glass`:20411, `_fc_glow`:20421, `_fc_ghost`:20430, `_fc_holo`:20442, `_fc_mesh`:20452, `_fc_sphere`:20472, `_fc_capsule`:20480, `_fc_cone`:20488, `_build_food_court`:20497, `_food_court_tick`:20651

## 20672-20993  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20701, `_cm_bench`:20717, `_build_commons`:20730, `_commons_tick`:20952

## 20994-21308  v0.36: the daily puzzle

`_pz_today`:21017, `_pz_new`:21020, `_pz_neighbours`:21065, `_pz_flip`:21075, `_pz_done`:21080, `_pz_tap`:21088, `_pz_win`:21104, `_pz_reset`:21125, `_puzzle_near`:21129, `_open_puzzle`:21134, `_close_puzzle`:21142, `_pz_refresh_sign`:21146, `_build_puzzle_panel`:21154, `_pz_draw`:21185, `_smoke_chat`:21226, `_smoke_feet`:21264, `_smoke_commons`:21285

## 21309-21497  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21371, `_bio_theta`:21375, `_bio_sec_n`:21380, `_bio_sec_of`:21383, `_bio_pt`:21386, `_bio_lp`:21391, `_bio_la`:21395, `_bio_dir`:21399, `_bio_hex_r`:21402, `_bio_apo`:21407, `_bio_open_angles`:21413, `_bio_si`:21423, `_bm`:21429, `_bsph`:21434, `_blow`:21437, `_bcone`:21448, `_bbox`:21451, `_bp`:21454, `_bq`:21459, `_bio_glass_mat`:21463, `_bio_water_mat`:21476, `_bio_mat`:21488

## 21498-21870  building blocks

`_bio_inst`:21499, `_bio_add`:21505, `_bio_model`:21508, `_bio_nature_mesh`:21514, `_bio_flush`:21548, `_bio_bar`:21583, `_bio_slab`:21596, `_bio_body`:21611, `_bio_cyl_col`:21624, `_bio_hexmesh`:21637, `_bio_hexslab`:21649, `_bio_hexpt`:21655, `_bio_gridshell`:21662, `_bio_rail`:21769, `_bio_rail_arc`:21774, `_bio_disc_deck`:21786, `_bio_ring_deck`:21792, `_bio_helix`:21803, `_bio_pillar`:21823, `_bio_cafe`:21829, `_bio_fence_line`:21843, `_bio_fence_seg`:21848, `_bio_pen`:21858

## 21871-22372  building

`_build_biosphere`:21872, `_build_biosphere_legacy`:21876, `_bio_text`:22038, `_bio_plaque`:22056, `_bio_ticket_hall`:22070, `_on_foot_collision_guard`:22126, `_bio_inside`:22136, `_bio_pass_ok`:22139, `_ticket_near`:22143, `_bio_buy_pass`:22148, `_bio_gates_update`:22164, `_bio_gate_tick`:22190, `_bio_tunnel`:22202, `_bio_grounds`:22255, `_bio_dome`:22301, `_bio_deck_mats`:22369

## 22373-22528  garden planting

`_bio_free`:22374, `_bio_spot`:22391, `_bio_garden`:22399, `_bio_pine`:22440, `_bio_tree`:22443, `_bio_big_tree`:22453, `_bio_rock`:22458, `_bio_pond`:22461, `_bio_particles`:22465, `_bio_mist`:22493, `_bio_mini_dome`:22522

## 22529-22936  the four layouts

`_bio_winter`:22530, `_bio_spring`:22622, `_bio_summer`:22747, `_bio_autumn`:22831

## 22937-23207  animals

`_bio_spawn`:22938, `_bio_load_animal`:23010, `_bio_make_quad`:23031, `_bio_load_bird`:23108, `_bio_make_penguin`:23128, `_bio_make_bird`:23150, `_bio_make_flamingo`:23174, `_bio_make_butterfly`:23195

## 23208-23339  animation, spotting and rewards

`_bio_stuck_check`:23213, `_biosphere_tick`:23231, `_bio_animate`:23240, `_bio_spot_check`:23320, `_bio_spotted`:23332, `_smoke_biosphere`:23336

## 23340-23857  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23427, `_wear_piece`:23430, `_wear_mat`:23453, `_person_index`:23469, `_dress`:23492, `_smoke_style`:23598, `_style_shots`:23749, `_npc_look`:23821

## 23858-24011  your look: apply, save, share

`_look_clean`:23862, `_look_pack`:23877, `_owns`:23883, `_apply_look`:23888, `_relic_model`:23899, `_fc_mesh_mat`:23964, `_relic_refresh`:23967, `_relic_tick`:23981, `_peer_style`:23992

## 24012-24439  stores and the wardrobe

`_style_today`:24031, `_style_items`:24034, `_style_cat`:24042, `_style_price`:24045, `_style_deal`:24059, `_style_price_base`:24072, `_relic_stock`:24079, `_build_style_panel`:24091, `_open_store`:24131, `_open_wardrobe`:24150, `_style_close`:24153, `_style_finish`:24157, `_sync_old_avatar`:24172, `_style_tabs_for`:24179, `_refresh_style`:24184, `_style_body_rows`:24335, `_style_set_tab`:24352, `_style_step`:24356, `_style_color`:24361, `_style_pick`:24366, `_style_buy`:24401, `_ach_relics_check`:24423, `_style_face_camera`:24428

## 24440-24907  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24476, `_ga_text`:24482, `_ga_box`:24499, `_build_galleria`:24515, `_ga_inner_tick`:24656, `_ga_shell`:24672, `_ga_inside`:24722, `_bio_cyl_col_on`:24725, `_ga_models`:24737, `_ga_lbox`:24752, `_ga_ltext`:24766, `_ga_store`:24773, `_bio_cafe_on`:24875, `_ga_mannequins`:24883

## 24908-25059  featured outfits and the Sky Run

`_ga_featured_look`:24921, `_build_ga_fun`:24942, `_ga_fun_tick`:24987, `_sky_finish`:25014, `_extra_near`:25033, `_extra_open`:25042, `_store_near`:25051

## 25060-25156  v0.41: THE SKY GARDEN

`_sg_now`:25114, `_sg_progress`:25117, `_sg_time`:25123, `_sg_stock`:25130, `_sg_mut_roll`:25145

## 25157-25294  building

`_sg_box`:25158, `_sg_text`:25164, `_build_sky_garden`:25178, `_sg_seed_spot`:25289, `_sg_codex_spot`:25292

## 25295-25475  plants

`_sg_plant_model`:25296, `_sg_refresh_all`:25401, `_sg_refresh`:25405, `_sky_garden_tick`:25441, `_sg_ready_count`:25460, `_sg_boot_note`:25467

## 25476-25595  interacting

`_sg_near`:25477, `_sg_button_text`:25500, `_sg_value`:25513, `_sg_interact`:25517, `_sg_buy`:25533, `_sg_plant`:25555, `_sg_harvest`:25566

## 25596-25839  the garden screen

`_build_sg_panel`:25597, `_sg_open`:25632, `_sg_close`:25641, `_sg_row`:25645, `_sg_refresh_panel`:25660, `_sg_pick_buy`:25705, `_sg_pick_plant`:25709, `_smoke_car_barriers`:25715, `_smoke_sky_garden`:25756

## 25840-25878  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25871, `_pass_day`:25874

## 25879-25910  album

`_album_pages`:25880, `_album_claim`:25895

## 25911-25962  season

`_season_index`:25912, `_season_tick`:25915, `_season_xp`:25924, `_season_tier`:25927, `_season_reward`:25930, `_season_claim`:25944

## 25963-25970  Harbor Night

`_harbor_night`:25964

## 25971-26002  check-in calendar

`_cal_tick`:25972

## 26003-26179  the panel

`_build_hp_panel`:26004, `_open_pass`:26039, `_hp_open`:26042, `_hp_close`:26049, `_hp_row`:26053, `_hp_bar`:26068, `_hp_refresh`:26072, `_smoke_pass`:26117

## 26180-26394  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26184, `_cash_pill_tick`:26192, `_build_lb`:26230, `_open_lb`:26273, `_close_lb`:26281, `_lb_pick`:26285, `_lb_headers`:26290, `_lb_url`:26294, `_lb_me`:26297, `_lb_tick`:26300, `_lb_upload`:26308, `_lb_fetch`:26318, `_lb_got`:26326, `_lb_value`:26337, `_lb_refresh_ui`:26348

## 26395-26818  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26419, `_market_near`:26496, `_build_gear`:26506, `_gear_piece`:26514, `_build_pet`:26559, `_market_apply`:26601, `_market_tick`:26625, `_build_market_panel`:26647, `_open_market`:26673, `_close_market`:26680, `_refresh_market`:26684, `_market_pick`:26737, `_toggle_board`:26775, `_board_tick`:26782

## 26819-27060  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26851, `_ds_label`:26870, `_build_display`:26884, `_ds_got`:26963, `_ds_sorted`:26972, `_ds_render_board`:26986, `_ds_render_news`:27012, `_display_tick`:27031

## 27061-27239  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27078, `_toggle_streamer`:27165, `_streamer_badge_tap`:27181, `_streamer_tick`:27185

## 27240-27276  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27246, `_car_back`:27253, `_car_park_tick`:27260

## 27277-27373  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27281, `_bus_eta`:27335, `_bus_displays_tick`:27351

## 27374-27665  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27392, `_treasure_pick`:27395, `_treasure_spot`:27404, `_treasure_district`:27408, `_treasure_clue`:27420, `_treasure_prop`:27433, `_tp_part`:27436, `_tp_sphere`:27446, `_tp_cyl`:27454, `_treasure_prop_side`:27463, `_build_treasure_props`:27475, `_build_treasure`:27519, `_treasure_dir_char`:27588, `_treasure_tick`:27597, `_treasure_claim`:27651

## 27666-27766  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27667, `_halo_mat`:27699, `_smoke_treasure`:27724

## 27767-28090  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27788, `_fm_send`:27791, `_fm_area`:27797, `_fm_glow_mesh`:27813, `_fm_block_reason`:27831, `_fm_start`:27843, `_fm_announce`:27871, `_fm_finish`:27874, `_fm_msg`:27892, `_fm_check_paid`:27943, `_fm_tick`:27961, `_smoke_findme`:28017

## 28091-28201  v0.24.2: road map (for moving people off the road)

`_floor_note`:28097, `_floor_disc`:28111, `_floor_top`:28120, `_ground_at`:28138, `_note_road`:28156, `_on_road`:28163, `_ped_curb`:28173, `_curb_spot`:28183

## 28202-28497  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28224, `_ex_grid`:28232, `_ex_lamps`:28267, `_ex_umbrella`:28290, `_ex_yards`:28297, `_build_expansion`:28312, `_expand_shots`:28475

## 28498-28692  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28539, `_v27_near_cross`:28631, `_v27_near_any_road`:28638, `_v27_in_district`:28644, `_sea_tick`:28658, `_sea_tow`:28677

## 28693-29360  Harbor Loop sky train

`_sky_build_path`:28744, `_sky_pos`:28785, `_sky_dir`:28799, `_sky_project`:28804, `_sky_trip_time`:28823, `_sky_trip_dist`:28829, `_sky_now`:28840, `_sky_state`:28843, `_sky_time_at_station`:28858, `_sky_next_arrival`:28865, `_build_skytrain`:28878, `_sky_make_car`:29030, `_sky_skin`:29067, `_sky_place_trains`:29087, `_sky_build_station`:29106, `_sky_near`:29171, `_sky_fmt`:29180, `_sky_enter`:29184, `_sky_leave_platform`:29202, `_sky_board`:29212, `_sky_alight`:29226, `_sky_action`:29240, `_sky_tick`:29257, `_sky_camera`:29297, `_tour_today`:29313, `_tour_stamp`:29316, `_sky_hud`:29339

## 29361-29721  Day and night

`_toggle_weather`:29444, `_refresh_weather_button`:29450, `_game_hour`:29456, `_day_key`:29468, `_night_setup`:29483, `_night_scan_mesh`:29573, `_daynight_tick`:29598, `_daynight_apply`:29605, `_daynight_lights`:29706, `_cycle_day_mode`:29711, `_refresh_time_button`:29718

## 29722-30357  v0.27 smoke test and screenshots

`_smoke_v27`:29723, `_city_shots`:29926

## 30358-30774  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30392, `_ap_plane`:30568, `_ap_truck`:30588, `_ap_baggage_train`:30629, `_ap_loop_pos`:30642, `_ap_loop_len`:30658, `_ap_flight_at`:30664, `_ap_tick`:30688, `_airport_ped_plan`:30711, `_smoke_airport`:30731

## 30775-31288  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30789, `_nav_spot`:30796, `_nav_idx`:30800, `_nav_pos`:30807, `_nav_blocked`:30811, `_nav_nearest_free`:30821, `_nav_bfs`:30849, `_nav_build`:30893, `_stroller`:30964, `_stroll_place`:30980, `_stroll_next`:31001, `_nav_clear_line`:31035, `_stroll_aim`:31046, `_strollers_tick`:31078, `_smoke_strollers`:31173

## 31289-31449  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31324, `_dir_fmt`:31327, `_signpost_spot`:31330, `_build_signposts`:31347

## 31450-31546  the Directions panel and chip

`_build_dir_panel`:31451, `_open_dir`:31493, `_dir_close`:31502, `_dir_pick`:31506, `_dir_stop`:31511, `_dir_stop_and_close`:31516, `_dir_tick`:31520

## 31547-32088  v0.44: Grand Central

`_gc_mesh`:31576, `_gc_mat`:31609, `_gc_glass`:31618, `_gb`:31628, `_gb_solid`:31634, `_gb_flush`:31638, `_gc_tree`:31668, `_gc_text`:31673, `_gc_planter`:31688, `_gc_kiosk`:31694, `_goods_color`:31724, `_goods_mat`:31727, `_kiosk_goods`:31731, `_build_grand_central`:31809, `_build_gc_towers`:31977, `_gc_tick`:32072

## 32089-32380  v0.44: filling the empty land

`_loft`:32106, `_fill_clear`:32148, `_build_fill`:32158, `_hg_in_lake`:32206, `_hg_path`:32210, `_floor_note_rot`:32218, `_build_gardens`:32226, `_build_fan_plaza`:32336

## 32381-32415  v0.45: hover car underglow

`_car_underglow`:32384

## 32416-32580  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32417

## 32581-32612  v0.47: street stalls downtown

`_build_street_stalls`:32585, `_cull_people_in`:32605

## 32613-32711  v0.48: places that open as you level up

`_place_lock_of`:32626, `_place_root`:32632, `_place_unlocked`:32635, `_build_place_signs`:32643, `_places_refresh`:32688, `_places_tick`:32705

## 32712-32756  v0.50: city careers

`_career_rank_name`:32737, `_career_mult`:32740, `_career_block_reason`:32745, `_career_start`:32748, `_career_end`:32753

## 32757-32807  v0.52: careers as clear job loops

`_cid`:32784, `_career_target`:32798, `_career_tick`:32805

## 32808-32815  taxi

`_taxi_meter`:32809

## 32816-32819  paramedic

(no functions)

## 32820-32824  police

`_career_chase_over`:32822

## 32825-32830  firefighter

`_fire_aimed`:32826

## 32831-32840  the step bar

`_career_bar_text`:32834, `_career_hud`:32838

## 32841-32867  cut scenes

`_cs_skip`:32859

## 32868-32872  siren

(no functions)

## 32873-32884  the Careers panel

`_build_career_panel`:32874, `_open_careers`:32877, `_career_close`:32881

## 32885-33308  v0.50: homes

`_home_door_spots`:32925, `_build_homes`:32940, `_home_labels`:32969, `_home_door_near`:32978, `_home_origin`:32987, `_home_slot_near`:32990, `_home_exit_near`:33001, `_home_btn`:33008, `_home_interact`:33021, `_home_buy`:33040, `_home_default_layout`:33054, `_home_enter`:33062, `_home_leave`:33082, `_hm`:33090, `_home_build_room`:33109, `_home_refresh_room`:33218, `_furni_build`:33232

## 33309-33644  decorating

`_build_home_panels`:33310, `_open_homes`:33355, `_home_row_go`:33365, `_home_panel_close`:33385, `_deco_open`:33389, `_deco_pick`:33412, `_smoke_careers_homes`:33435

## 33645-33779  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33649, `_home_slots`:33657, `_home_ring`:33684, `_furni_cat`:33690, `_home_fix_layout`:33696, `_home_build_layout`:33724

## 33780-34213  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33843, `_ch_homes`:33849, `_ch_step_text`:33856, `_ch_step_done`:33867, `_ch_target`:33881, `_ch_finish_chapter`:33890, `_chapters_tick`:33912, `_hud_top_stack`:33952, `_build_chapters_ui`:33982, `_chapters_restart_ask`:34024, `_chapters_restart`:34027, `_chapters_text`:34037, `_open_chapters`:34057, `_chapters_close`:34064, `_smoke_chapters`:34068, `_step_sound`:34189

## 34214-34252  v0.51.1: join and leave messages

`_announce_join`:34221, `_announce_already_here`:34240, `_announce_leave`:34248

## 34253-34517  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34269, `_shot_tick`:34275, `_draw_shot_icon`:34307, `_shot_enter`:34316, `_shot_exit`:34330, `_shot_release_controls`:34342, `_shot_stick_zone`:34349, `_shot_input`:34352, `_smoke_photo`:34424

## 34518-34816  v0.51.3: stream joiners

`_viewer_count`:34538, `_stream_join_check`:34544, `_stream_join_start`:34551, `_sj_streamer`:34568, `_stream_join_tick`:34577, `_stream_join_land`:34601, `_sj_welcome`:34617, `_smoke_stream_join`:34651, `_career_shot`:34734

## 34817-34933  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34821, `_st_restore`:34859, `_smoke_streamer_clean`:34880, `_world_bio_passport`:34931

