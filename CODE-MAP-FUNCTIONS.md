# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-584  Core (unlabelled)

`_symbol_font`:280, `_ready`:292, `_surf_texture`:527, `_surface_material`:549

## 585-657  v0.34.6: futuristic towers for the old city

`_future_tower`:589

## 658-736  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:665, `_skin_common`:700, `_future_wall`:708, `_future_roof`:722, `_future_pave`:730

## 737-797  v0.34.4: futuristic road surface

`_road_textures`:744, `_future_road`:778

## 798-2003  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:817, `_real_tex`:858, `_real_setup`:866, `_real_kind`:887, `_realify`:893, `_real_glass`:930, `_make_window_textures`:950, `_material`:983, `_box`:1008, `_sign`:1030, `_build_world`:1042, `_future_kiosk`:1150, `_build_collectibles`:1176, `_auto_collect_tick`:1209, `_find_count`:1230, `_nearest_find`:1237, `_destination`:1251, `_toggle_activity`:1287, `_collect_find`:1316, `_owned_count`:1331, `_ridge_open`:1338, `_ridge_count`:1342, `_nearest_ridge`:1349, `_apply_car`:1363, `_tune_level`:1393, `_tune_cost`:1396, `_car_stats`:1402, `_buy_tune`:1409, `_open_tune`:1430, `_back_to_garage`:1436, `_refresh_tune`:1440, `_bay_open`:1451, `_area_open`:1454, `_bay_count`:1457, `_nearest_bay`:1464, `_build_bay`:1478, `_check_bay`:1531, `_discover_bay`:1544, `_north_count`:1557, `_north_open`:1564, `_nearest_north`:1567, `_check_north`:1581, `_discover_north`:1594, `_prop`:1607, `_collider`:1621, `_first_mesh`:1631, `_scatter`:1640, `_prop_stretch`:1674, `_north_token`:1683, `_nm_roads`:1710, `_prop_big`:1725, `_nm_near_cross`:1741, `_build_north`:1748, `_build_nm_blocks`:1865, `_build_north_landscape`:1950, `_nm_free`:1977, `_build_landscape`:1987

## 2004-2487  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2005, `_online_toggle`:2019, `_online_autostart`:2045, `_online_connect`:2064, `_online_stop`:2071, `_online_next_ref`:2082, `_online_send`:2086, `_online_join_frame`:2090, `_online_pos_frame`:2093, `_online_tick`:2102, `_online_handle`:2136, `_online_clean_name`:2189, `_online_peer_update`:2198, `_online_make_peer`:2267, `_peer_look`:2308, `_online_tint`:2365, `_paint_mat`:2381, `_online_update_peers`:2393, `_online_clear_peers`:2473, `_online_refresh_button`:2478

## 2488-2660  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2568, `_marina_count`:2571, `_nearest_marina`:2578, `_check_marina`:2592, `_discover_marina`:2605, `_shop_available`:2618, `_nearest_shop`:2621, `_premium_cars`:2629, `_glass`:2636, `_shop_building`:2642, `_shop_pad`:2652

## 2661-3176  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2662, `_bus_last`:2665, `_build_bus`:2668, `_bus_boxes`:2695, `_bus_skin`:2705, `_bus_side`:2718, `_bus_reset`:2721, `_bus_text`:2730, `_bus_tick`:2735, `_bus_near`:2775, `_bus_board`:2786, `_bus_alight`:2801, `_build_marina`:2815, `_set_hat`:2921, `_build_hat`:2924, `_cyl`:2989, `_hat_part`:2998, `_apply_avatar`:3007, `_shop_count`:3019, `_shop_open`:3029, `_shop_step`:3047, `_shop_close`:3053, `_owned_text`:3066, `_refresh_shop`:3069, `_shop_action`:3122, `_journal_flip`:3173

## 3177-3231  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3188, `_xp`:3191, `_level_for`:3198, `_level`:3206, `_level_text`:3209, `_check_level`:3219

## 3232-3334  v0.11.0: online police vs thief

`_orole_ready`:3233, `_orole_start`:3236, `_orole_end`:3263, `_orole_tick`:3272

## 3335-4278  v0.10.0: chase mode (offline)

`_chase_open`:3336, `_chase_clear`:3341, `_chase_make_unit`:3355, `_chase_spawn_point`:3385, `_chase_start`:3394, `_chase_end`:3430, `_chase_steer`:3449, `_chase_roadblock`:3485, `_chase_heli_build`:3530, `_chase_extras`:3556, `_chase_tick`:3583, `_start_trial`:3647, `_cancel_trial`:3674, `_check_trial`:3679, `_finish_trial`:3696, `_trial_count`:3712, `_open_trials`:3719, `_refresh_trials`:3723, `_update_gate`:3735, `_slab`:3753, `_build_ridge`:3771, `_check_ridge`:3834, `_discover`:3847, `_mission_progress`:3861, `_check_missions`:3923, `_open_garage`:3934, `_open_journal`:3939, `_close_sub`:3944, `_bar`:3947, `_refresh_garage`:3951, `_garage_step`:3976, `_garage_action`:3980, `_refresh_journal`:4000, `_visited_shops`:4033, `_build_panels`:4040, `_build_player`:4200, `_build_car`:4238, `_try_model`:4267

## 4279-4956  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4280, `_kshader`:4354, `_ksync`:4360, `_kskin`:4375, `_make_kperson`:4381, `_hat_y`:4445, `_sit_drop`:4448, `_kplay`:4451, `_kpeople_tick`:4461, `_pose_person`:4490, `_pose_limbs`:4507, `_person_lift`:4569, `_snap_crowd_feet`:4582, `_people_life_tick`:4598, `_life_one`:4635, `_cull_person`:4645, `_recolor_car_model`:4653, `_apply_car_model`:4667, `_landmark`:4687, `_label`:4697, `_button`:4704, `_panel`:4716, `_build_hud`:4726

## 4957-5075  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4963, `_menu_tab`:4969, `_watch_tick`:4992, `_watch_count`:5034, `_online_pill_tap`:5041, `_online_pill_tick`:5047, `online_config_ok`:5073

## 5076-5113  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5079, `_offroad`:5085, `_ground_near`:5098, `_collectibles_on_road`:5105

## 5114-5253  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5126, `_build_quest_offer`:5130, `_quest_offer_tick`:5160, `_quest_auto_pick`:5210, `_quest_accept`:5225, `_quest_decline`:5239, `_quest_stop`:5245

## 5254-5621  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5278, `_holo_material`:5287, `_build_future`:5295, `_build_neon`:5309, `_model_profile`:5378, `_model_body_box`:5401, `_build_holograms`:5415, `_holo_tick`:5465, `_build_sky_traffic`:5482, `_sky_hover_car`:5500, `_sky_drone`:5547, `_sky_traffic_tick`:5591, `_future_lights`:5610

## 5622-6121  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5681, `_crew_col`:5689, `_peer_crewmate`:5692, `_set_ring_color`:5695, `_level_color`:5722, `_tier_color`:5735, `_my_ach_tier`:5738, `_style_ring`:5745, `_social_peer_extras`:5793, `_social_tag`:5807, `_my_tag_extra`:5819, `_soc_send`:5832, `_social_msg`:5847, `_social_accept`:5886, `_social_go`:5907, `_soc_friend`:5926, `_soc_invite`:5933, `_soc_goto`:5938, `_soc_high_five`:5946, `_soc_gift`:5966, `_soc_crew_invite`:5983, `_gift_day_check`:5990, `_crew_create`:5996, `_crew_cycle_color`:6006, `_crew_leave`:6011, `_crew_mate_near`:6019, `_crew_board`:6027, `_build_social`:6046, `_social_online`:6108, `_open_social`:6112, `_close_social`:6118

## 6122-6372  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6125, `_track_pos`:6134, `_social_row_button`:6145, `_refresh_social`:6152, `_on_dance_floor`:6214, `_toggle_dance`:6217, `_build_dance_floor`:6225, `_social_tick`:6251, `_photo`:6323

## 6373-6868  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6395, `_game_state`:6403, `_build_arcade`:6415, `_c4_empty`:6466, `_c4_drop_row`:6472, `_c4_winner`:6478, `_c4_bot_move`:6499, `_c4_code`:6528, `_c4_ready`:6534, `_c4_tap`:6537, `_c4_check`:6558, `_c4_tick`:6582, `_rx_ready`:6609, `_rx_start`:6612, `_rx_tap`:6626, `_rx_send_time`:6651, `_rx_resolve`:6658, `_rx_tick`:6684, `_mem_start`:6699, `_mem_tap`:6715, `_mem_finish`:6730, `_mem_tick`:6746, `_mem_board_text`:6753, `_build_arcade_panel`:6764, `_refresh_arcade_panel`:6807

## 6869-7162  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6932, `_quiz_slot`:6935, `_quiz_question`:6945, `_quiz_bot_score`:6974, `_in_quiz`:6983, `_build_quiz`:6986, `_quiz_answer`:7056, `_quiz_msg`:7069, `_quiz_board`:7077, `_quiz_tick`:7087, `_quiz_refresh`:7129

## 7163-8674  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7334, `_sites_found`:7337, `_sites_total`:7340, `_bits`:7343, `_ach_value`:7350, `_ach_tick`:7405, `_ach_check`:7430, `_ach_by_id`:7466, `_ach_msg`:7472, `_build_ach`:7485, `_ach_show`:7516, `_open_ach`:7536, `_close_ach`:7542, `_refresh_ach`:7546, `_ach_num`:7577, `_minimap_tap`:7580, `_menu_go`:7587, `_menu_stay`:7592, `_menu_call_car`:7596, `_toggle_clean_hud`:7602, `_refresh_menu_buttons`:7608, `_clean_hud_tick`:7618, `_draw_joystick`:7659, `_input`:7664, `_stick_zone`:7746, `_notification`:7750, `_physics_process`:7765, `_follow_camera`:7913, `_follow_walk_camera`:7949, `_interact`:7972, `_refresh_hud`:8129, `_open_panel`:8254, `_layout_panels`:8280, `_toggle_menu`:8303, `_rescue`:8345, `_show_toast`:8377, `_save_progress`:8381, `_load_progress`:8471

## 8675-10869  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8676, `_radio_voice`:8679, `_radio_make`:8712, `_radio_set`:8783, `_radio_play`:8805, `_radio_next`:8810, `_radio_talk_line`:8814, `_radio_caption`:8835, `_radio_refresh`:8843, `_process`:8856, `_build_peds`:8907, `_update_peds`:9018, `_update_ped`:9037, `_smoke_test`:9091, `_smoke_chase`:9732, `_smoke_orole`:9765, `_smoke_levels`:9794, `_smoke_bus`:9835, `_smoke_chase_extras`:9920, `_smoke_marina`:9948, `_blocked_at`:10050, `_blocker`:10065, `_on_screen`:10078, `_wait_radio`:10083, `_smoke_radio_peds`:10090, `_smoke_typed_chat`:10160, `_smoke_boutique`:10179, `_smoke_models`:10207, `_smoke_garage_ridge`:10231, `_save_shot`:10607, `_people_shots`:10617, `_shots`:10658, `_shot_car`:10852, `_capture_preview`:10862

## 10870-11518  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10937, `_downtown_count`:10940, `_nearest_downtown`:10947, `_check_downtown`:10961, `_discover_downtown`:10974, `_box_batch`:10988, `_model_batch`:11008, `_cut_ranges`:11062, `_dt_ranges`:11074, `_dt_has`:11081, `_dt_near_cross`:11087, `_place`:11093, `_signal_pole`:11104, `_cyl_batch`:11123, `_city_signals`:11147, `_ensure_light_mats`:11198, `_city_lamps`:11208, `_build_downtown`:11252, `_dt_block`:11452, `_downtown_token`:11458, `_build_park`:11475, `_build_plaza`:11504

## 11519-11622  old city and Bay details

`_build_city_detail`:11520

## 11623-12032  traffic

`_build_traffic`:11624, `_path_sample`:11719, `_light_look`:11733, `_light_green`:11741, `_traffic_place`:11745, `_traffic_blocked_by`:11757, `_traffic_tick`:11769, `_smoke_downtown`:11875, `_skyline_shot`:11987, `_skyline_shots`:11995

## 12033-12385  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12079, `_web_scale`:12134, `_web_fps_tick`:12144, `_world_to_uv`:12161, `_map_angle`:12164, `_build_minimap`:12172, `_open_map`:12245, `_close_map`:12256, `_mini_point`:12263, `_site_markers`:12267, `_draw_arrow`:12299, `_draw_minimap`:12306, `_draw_full_map`:12353, `_minimap_tick`:12378

## 12386-12643  camera views

`_build_view_controls`:12387, `_cycle_view`:12429, `_apply_view`:12439, `_hide_labels`:12477, `_unfade`:12483, `_bake_map`:12489, `_shot_stats`:12539, `_view_shots`:12542, `_smoke_views`:12583

## 12644-12891  v0.17.0: level-up celebration

`_build_level_fx`:12655, `_draw_level_rays`:12692, `_level_fx_tick`:12702, `_level_sound`:12707, `_fx_material`:12749, `_level_up_fx`:12757, `_smoke_level_fx`:12858, `_levelup_shots`:12867

## 12892-13011  v0.18.0: walk-in stadium

`_collider_yaw`:12897, `_build_stadium_walls`:12908, `_look`:12936, `_smoke_stadium_eye`:12945, `_stadium_shots`:12981

## 13012-13173  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13036, `_arrow_mesh`:13048, `_build_guidance`:13071, `_guide_target`:13096, `_guidance_tick`:13125, `_draw_hud_arrow`:13151

## 13174-13359  checkpoints

`_build_checkpoints`:13175, `_refresh_checkpoints`:13220, `_check_checkpoints`:13226, `_activate_checkpoint`:13236, `_checkpoint_spawn`:13257, `_spawn_at_checkpoint`:13262, `_draw_checkpoint_icon`:13278, `_smoke_guidance_checkpoints`:13284, `_guide_shots`:13334

## 13360-13627  v0.18.0: Harbor Dome social hub

`_hub_seat`:13418, `_build_hub`:13422

## 13628-13678  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13629, `_xm_mesh`:13638, `_xm_tree`:13646

## 13679-14002  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13682, `_gt_surface`:13697, `_xm_grand_tree`:13707, `_lux_mat`:13822, `_lux_part`:13838, `_lux_box`:13841, `_lux_cyl`:13846, `_lux_ball`:13854, `_lux_new`:13862, `_lux_commit`:13867, `_lux_sofa_mesh`:13871, `_lux_chair_mesh`:13901, `_lux_table_mesh`:13921, `_lux_pouf_mesh`:13936, `_lux_batch`:13951, `_hub_christmas`:13967

## 14003-14158  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14004

## 14159-14407  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14162, `_vx_cyl`:14169, `_vx_ball`:14177, `_vx_ring`:14185, `_hub_polish`:14193, `_hub_gate`:14216, `_hub_vip`:14278, `_hub_glass`:14391

## 14408-14622  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14409, `_build_hub_bots`:14434, `_seat_of`:14465, `_bubble`:14475, `_emote`:14531, `_hub_people_tick`:14545

## 14623-14741  seats

`_seat_taken`:14624, `_nearest_seat`:14632, `_seat_label`:14644, `_sit`:14660, `_stand_up`:14704, `_seated_tick`:14723

## 14742-14898  game panel

`_build_game_panel`:14743, `_open_game_panel`:14798, `_refresh_game_panel`:14817, `_play_robot`:14862, `_peer_at`:14876, `_opponent_name`:14883, `_pay`:14891

## 14899-15019  tic-tac-toe

`_ttt_ready`:14902, `_ttt_winner`:14908, `_ttt_bot_move`:14918, `_ttt_tap`:14944, `_ttt_code`:14964, `_ttt_check`:14970, `_ttt_tick`:14993

## 15020-15071  rock paper scissors

`_rps_ready`:15021, `_rps_pick`:15027, `_rps_resolve`:15045, `_rps_tick`:15069

## 15072-15154  online table messages

`_online_game_send`:15073, `_hub_game_msg`:15079

## 15155-15230  comedy show

`_joke_start`:15156, `_joke_tick`:15168, `_speak`:15194, `_play_rimshot`:15203

## 15231-16082  quick chat and emotes

`_build_chat`:15253, `_chat_toggle_to`:15370, `_chat_log_add`:15378, `_chat_area`:15384, `_chat_near_count`:15402, `_chat_tick`:15411, `_toggle_chat`:15460, `_chat_fit`:15475, `_chat_clean`:15481, `_chat_wrap`:15498, `_chat_send_text`:15520, `_typing`:15543, `_say`:15546, `_do_emote`:15562, `_smoke_hub`:15571, `_chat_shots`:15745, `_shop_shots`:15770, `_car_shots`:15819, `_outfit_shots`:15850, `_hub_shots`:15898, `_sg_on_terrace`:16033, `_people_only`:16036, `_people_only_keep_cars_out`:16040, `_car_barrier`:16052, `_hub_keep_cars_out`:16066

## 16083-16245  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16092, `_feed_add`:16101, `_feed_render`:16107, `_feed_tick`:16135, `_online_event_send`:16144, `_at_pvp_table`:16151, `_game_name`:16158, `_send_lfp`:16161, `_lfp_msg`:16178, `_accept_invite`:16199

## 16246-16486  v0.18.2: nickname and HUD relayout

`_nick_rude`:16258, `_clean_nick`:16273, `_build_nick_panel`:16285, `_open_nick`:16323, `_random_nick`:16332, `_save_nick`:16338, `_close_nick`:16357, `_refresh_nick_button`:16366, `_relayout_hud`:16370, `_smoke_nick`:16406, `_nick_shots`:16438, `_smoke_sites_reachable`:16456

## 16487-16774  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16513, `_nearest_civic`:16520, `_check_civic`:16534, `_discover_civic`:16547, `_civ_ranges`:16560, `_civ_has`:16574, `_civ_near_cross`:16580, `_build_civic`:16586, `_civic_token`:16712, `_civic_shots`:16729, `_hub_focus`:16751

## 16775-16884  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:16846, `_in_rw_lot`:16849, `_box_batch_rot`:16852, `_multi_collider`:16870

## 16885-17212  circuit geometry

`_cr_point`:16886, `_rw_build_path`:16900, `_rw_dir`:16928, `_rw_bend`:16933, `_ribbon`:16939, `_rw_band`:16959, `_rw_keepout`:16977, `_build_raceway`:16986, `_build_rw_parking`:17020, `_build_rw_pits`:17065, `_build_rw_track`:17102, `_build_rw_trackside`:17143

## 17213-17310  race car rental

`_model_key`:17214, `_race_car_start`:17217, `_tint_ghost`:17255, `_race_car_end`:17268, `_race_keep_cars_out`:17293

## 17311-17325  speed effects

`_eff_max`:17312, `_eff_accel`:17323

## 17326-17376  track helpers

`_rw_seg_progress`:17327, `_rw_track_dist`:17347, `_rw_point_dist`:17358, `_rw_player_progress`:17365, `_rw_target`:17371

## 17377-17613  events

`_rec_stop`:17378, `_rw_place`:17394, `_rw_grid_pos`:17401, `_rw_start`:17406, `_rw_spawn_ai`:17438, `_rw_ai_place`:17462, `_rw_tick`:17473, `_rw_ai_tick`:17526, `_rw_lap_done`:17568, `_rw_finish`:17580, `_rw_fmt`:17611

## 17614-17666  boosters and spikes

`_rw_buy`:17615, `_rw_use_boost`:17633, `_rw_use_spike`:17641, `_rw_drop_spike_at`:17652

## 17667-17724  online races

`_race_msg`:17668, `_join_race`:17690

## 17725-18080  raceway panel, HUD, board

`_build_raceway_ui`:17726, `_rw_layout`:17786, `_rw_open`:17793, `_rw_close`:17799, `_rw_refresh_panel`:17803, `_rw_refresh_board`:17816, `_rw_hud`:17828, `_peer_car_model`:17852, `_smoke_raceway`:17862, `_race_shots`:18043

## 18081-18288  v0.22.0: Call Car

`_call_block_reason`:18087, `_call_spot`:18104, `_call_car`:18135, `_play_horn`:18159, `_smoke_follow_call`:18183, `_follow_shots`:18256

## 18289-18588  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18304, `_build_travel`:18309, `_toggle_run`:18351, `_refresh_run`:18355, `_hud_v23_tick`:18363, `_travel_block_reason`:18392, `_travel_open`:18412, `_open_travel`:18418, `_close_travel`:18424, `_refresh_travel`:18428, `_travel_to`:18436, `_smoke_travel`:18463, `_v23_shots`:18501

## 18589-18662  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:18596, `_qr_button`:18611, `_qr_layout`:18650, `_smoke_qr`:18656

## 18663-19099  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:18683, `_open_crate`:18699, `_build_crate_ui`:18716, `_crate_pick`:18803, `_crate_reveal`:18826, `_crate_draw_car`:18853, `_crate_confetti`:18872, `_crate_sound`:18897, `_crate_drive`:18923, `_feed_add_system`:18953, `_smoke_crate`:18956, `_crate_shots`:19004

## 19100-19591  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19141, `_quick_today`:19146, `_quick_is_done`:19149, `_quick_left`:19152, `_quick_next`:19159, `_quick_fix_target`:19172, `_quick_daily_check`:19186, `_quick_complete`:19200, `_quick_side`:19234, `_build_quick_props`:19252, `_daily_shots`:19404, `_quick_props_refresh`:19446, `_quick_fx`:19450, `_play_coin`:19466, `_smoke_quick`:19483

## 19592-19742  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:19601, `_quest_nearby`:19656, `_open_quests`:19663, `_close_quests`:19670, `_refresh_quests`:19674, `_quest_pick`:19700, `_quest_mode`:19714, `_smoke_quests`:19717

## 19743-19777  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:19747, `_my_tag_tick`:19750

## 19778-20092  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:19795, `_fc_torus`:19805, `_fc_pearl`:19813, `_fc_chrome`:19823, `_fc_glass`:19832, `_fc_glow`:19842, `_fc_ghost`:19851, `_fc_holo`:19863, `_fc_mesh`:19873, `_fc_sphere`:19893, `_fc_capsule`:19901, `_fc_cone`:19909, `_build_food_court`:19918, `_food_court_tick`:20072

## 20093-20413  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20121, `_cm_bench`:20137, `_build_commons`:20150, `_commons_tick`:20372

## 20414-20728  v0.36: the daily puzzle

`_pz_today`:20437, `_pz_new`:20440, `_pz_neighbours`:20485, `_pz_flip`:20495, `_pz_done`:20500, `_pz_tap`:20508, `_pz_win`:20524, `_pz_reset`:20545, `_puzzle_near`:20549, `_open_puzzle`:20554, `_close_puzzle`:20562, `_pz_refresh_sign`:20566, `_build_puzzle_panel`:20574, `_pz_draw`:20605, `_smoke_chat`:20646, `_smoke_feet`:20684, `_smoke_commons`:20705

## 20729-20917  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:20791, `_bio_theta`:20795, `_bio_sec_n`:20800, `_bio_sec_of`:20803, `_bio_pt`:20806, `_bio_lp`:20811, `_bio_la`:20815, `_bio_dir`:20819, `_bio_hex_r`:20822, `_bio_apo`:20827, `_bio_open_angles`:20833, `_bio_si`:20843, `_bm`:20849, `_bsph`:20854, `_blow`:20857, `_bcone`:20868, `_bbox`:20871, `_bp`:20874, `_bq`:20879, `_bio_glass_mat`:20883, `_bio_water_mat`:20896, `_bio_mat`:20908

## 20918-21290  building blocks

`_bio_inst`:20919, `_bio_add`:20925, `_bio_model`:20928, `_bio_nature_mesh`:20934, `_bio_flush`:20968, `_bio_bar`:21003, `_bio_slab`:21016, `_bio_body`:21031, `_bio_cyl_col`:21044, `_bio_hexmesh`:21057, `_bio_hexslab`:21069, `_bio_hexpt`:21075, `_bio_gridshell`:21082, `_bio_rail`:21189, `_bio_rail_arc`:21194, `_bio_disc_deck`:21206, `_bio_ring_deck`:21212, `_bio_helix`:21223, `_bio_pillar`:21243, `_bio_cafe`:21249, `_bio_fence_line`:21263, `_bio_fence_seg`:21268, `_bio_pen`:21278

## 21291-21792  building

`_build_biosphere`:21292, `_build_biosphere_legacy`:21296, `_bio_text`:21458, `_bio_plaque`:21476, `_bio_ticket_hall`:21490, `_on_foot_collision_guard`:21546, `_bio_inside`:21556, `_bio_pass_ok`:21559, `_ticket_near`:21563, `_bio_buy_pass`:21568, `_bio_gates_update`:21584, `_bio_gate_tick`:21610, `_bio_tunnel`:21622, `_bio_grounds`:21675, `_bio_dome`:21721, `_bio_deck_mats`:21789

## 21793-21948  garden planting

`_bio_free`:21794, `_bio_spot`:21811, `_bio_garden`:21819, `_bio_pine`:21860, `_bio_tree`:21863, `_bio_big_tree`:21873, `_bio_rock`:21878, `_bio_pond`:21881, `_bio_particles`:21885, `_bio_mist`:21913, `_bio_mini_dome`:21942

## 21949-22356  the four layouts

`_bio_winter`:21950, `_bio_spring`:22042, `_bio_summer`:22167, `_bio_autumn`:22251

## 22357-22627  animals

`_bio_spawn`:22358, `_bio_load_animal`:22430, `_bio_make_quad`:22451, `_bio_load_bird`:22528, `_bio_make_penguin`:22548, `_bio_make_bird`:22570, `_bio_make_flamingo`:22594, `_bio_make_butterfly`:22615

## 22628-22757  animation, spotting and rewards

`_bio_stuck_check`:22633, `_biosphere_tick`:22651, `_bio_animate`:22658, `_bio_spot_check`:22738, `_bio_spotted`:22750, `_smoke_biosphere`:22754

## 22758-23275  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:22845, `_wear_piece`:22848, `_wear_mat`:22871, `_person_index`:22887, `_dress`:22910, `_smoke_style`:23016, `_style_shots`:23167, `_npc_look`:23239

## 23276-23429  your look: apply, save, share

`_look_clean`:23280, `_look_pack`:23295, `_owns`:23301, `_apply_look`:23306, `_relic_model`:23317, `_fc_mesh_mat`:23382, `_relic_refresh`:23385, `_relic_tick`:23399, `_peer_style`:23410

## 23430-23857  stores and the wardrobe

`_style_today`:23449, `_style_items`:23452, `_style_cat`:23460, `_style_price`:23463, `_style_deal`:23477, `_style_price_base`:23490, `_relic_stock`:23497, `_build_style_panel`:23509, `_open_store`:23549, `_open_wardrobe`:23568, `_style_close`:23571, `_style_finish`:23575, `_sync_old_avatar`:23590, `_style_tabs_for`:23597, `_refresh_style`:23602, `_style_body_rows`:23753, `_style_set_tab`:23770, `_style_step`:23774, `_style_color`:23779, `_style_pick`:23784, `_style_buy`:23819, `_ach_relics_check`:23841, `_style_face_camera`:23846

## 23858-24325  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:23894, `_ga_text`:23900, `_ga_box`:23917, `_build_galleria`:23933, `_ga_inner_tick`:24074, `_ga_shell`:24090, `_ga_inside`:24140, `_bio_cyl_col_on`:24143, `_ga_models`:24155, `_ga_lbox`:24170, `_ga_ltext`:24184, `_ga_store`:24191, `_bio_cafe_on`:24293, `_ga_mannequins`:24301

## 24326-24477  featured outfits and the Sky Run

`_ga_featured_look`:24339, `_build_ga_fun`:24360, `_ga_fun_tick`:24405, `_sky_finish`:24432, `_extra_near`:24451, `_extra_open`:24460, `_store_near`:24469

## 24478-24574  v0.41: THE SKY GARDEN

`_sg_now`:24532, `_sg_progress`:24535, `_sg_time`:24541, `_sg_stock`:24548, `_sg_mut_roll`:24563

## 24575-24712  building

`_sg_box`:24576, `_sg_text`:24582, `_build_sky_garden`:24596, `_sg_seed_spot`:24707, `_sg_codex_spot`:24710

## 24713-24893  plants

`_sg_plant_model`:24714, `_sg_refresh_all`:24819, `_sg_refresh`:24823, `_sky_garden_tick`:24859, `_sg_ready_count`:24878, `_sg_boot_note`:24885

## 24894-25013  interacting

`_sg_near`:24895, `_sg_button_text`:24918, `_sg_value`:24931, `_sg_interact`:24935, `_sg_buy`:24951, `_sg_plant`:24973, `_sg_harvest`:24984

## 25014-25257  the garden screen

`_build_sg_panel`:25015, `_sg_open`:25050, `_sg_close`:25059, `_sg_row`:25063, `_sg_refresh_panel`:25078, `_sg_pick_buy`:25123, `_sg_pick_plant`:25127, `_smoke_car_barriers`:25133, `_smoke_sky_garden`:25174

## 25258-25296  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25289, `_pass_day`:25292

## 25297-25328  album

`_album_pages`:25298, `_album_claim`:25313

## 25329-25380  season

`_season_index`:25330, `_season_tick`:25333, `_season_xp`:25342, `_season_tier`:25345, `_season_reward`:25348, `_season_claim`:25362

## 25381-25388  Harbor Night

`_harbor_night`:25382

## 25389-25420  check-in calendar

`_cal_tick`:25390

## 25421-25597  the panel

`_build_hp_panel`:25422, `_open_pass`:25457, `_hp_open`:25460, `_hp_close`:25467, `_hp_row`:25471, `_hp_bar`:25486, `_hp_refresh`:25490, `_smoke_pass`:25535

## 25598-25812  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:25602, `_cash_pill_tick`:25610, `_build_lb`:25648, `_open_lb`:25691, `_close_lb`:25699, `_lb_pick`:25703, `_lb_headers`:25708, `_lb_url`:25712, `_lb_me`:25715, `_lb_tick`:25718, `_lb_upload`:25726, `_lb_fetch`:25736, `_lb_got`:25744, `_lb_value`:25755, `_lb_refresh_ui`:25766

## 25813-26236  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:25837, `_market_near`:25914, `_build_gear`:25924, `_gear_piece`:25932, `_build_pet`:25977, `_market_apply`:26019, `_market_tick`:26043, `_build_market_panel`:26065, `_open_market`:26091, `_close_market`:26098, `_refresh_market`:26102, `_market_pick`:26155, `_toggle_board`:26193, `_board_tick`:26200

## 26237-26478  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26269, `_ds_label`:26288, `_build_display`:26302, `_ds_got`:26381, `_ds_sorted`:26390, `_ds_render_board`:26404, `_ds_render_news`:26430, `_display_tick`:26449

## 26479-26657  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26496, `_toggle_streamer`:26583, `_streamer_badge_tap`:26599, `_streamer_tick`:26603

## 26658-26694  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:26664, `_car_back`:26671, `_car_park_tick`:26678

## 26695-26791  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:26699, `_bus_eta`:26753, `_bus_displays_tick`:26769

## 26792-27083  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:26810, `_treasure_pick`:26813, `_treasure_spot`:26822, `_treasure_district`:26826, `_treasure_clue`:26838, `_treasure_prop`:26851, `_tp_part`:26854, `_tp_sphere`:26864, `_tp_cyl`:26872, `_treasure_prop_side`:26881, `_build_treasure_props`:26893, `_build_treasure`:26937, `_treasure_dir_char`:27006, `_treasure_tick`:27015, `_treasure_claim`:27069

## 27084-27184  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27085, `_halo_mat`:27117, `_smoke_treasure`:27142

## 27185-27508  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27206, `_fm_send`:27209, `_fm_area`:27215, `_fm_glow_mesh`:27231, `_fm_block_reason`:27249, `_fm_start`:27261, `_fm_announce`:27289, `_fm_finish`:27292, `_fm_msg`:27310, `_fm_check_paid`:27361, `_fm_tick`:27379, `_smoke_findme`:27435

## 27509-27619  v0.24.2: road map (for moving people off the road)

`_floor_note`:27515, `_floor_disc`:27529, `_floor_top`:27538, `_ground_at`:27556, `_note_road`:27574, `_on_road`:27581, `_ped_curb`:27591, `_curb_spot`:27601

## 27620-27915  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27642, `_ex_grid`:27650, `_ex_lamps`:27685, `_ex_umbrella`:27708, `_ex_yards`:27715, `_build_expansion`:27730, `_expand_shots`:27893

## 27916-28110  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:27957, `_v27_near_cross`:28049, `_v27_near_any_road`:28056, `_v27_in_district`:28062, `_sea_tick`:28076, `_sea_tow`:28095

## 28111-28751  Harbor Loop sky train

`_sky_build_path`:28162, `_sky_pos`:28203, `_sky_dir`:28217, `_sky_project`:28222, `_sky_trip_time`:28241, `_sky_trip_dist`:28247, `_sky_now`:28258, `_sky_state`:28261, `_sky_time_at_station`:28276, `_sky_next_arrival`:28283, `_build_skytrain`:28296, `_sky_make_car`:28425, `_sky_skin`:28462, `_sky_place_trains`:28482, `_sky_build_station`:28501, `_sky_near`:28566, `_sky_fmt`:28575, `_sky_enter`:28579, `_sky_leave_platform`:28597, `_sky_board`:28607, `_sky_alight`:28620, `_sky_action`:28633, `_sky_tick`:28650, `_sky_camera`:28688, `_tour_today`:28704, `_tour_stamp`:28707, `_sky_hud`:28730

## 28752-29089  Day and night

`_game_hour`:28833, `_day_key`:28845, `_night_setup`:28860, `_night_scan_mesh`:28950, `_daynight_tick`:28975, `_daynight_apply`:28982, `_daynight_lights`:29074, `_cycle_day_mode`:29079, `_refresh_time_button`:29086

## 29090-29725  v0.27 smoke test and screenshots

`_smoke_v27`:29091, `_city_shots`:29294

## 29726-30142  v0.27: Harbor International Airport (north of the city)

`_build_airport`:29760, `_ap_plane`:29936, `_ap_truck`:29956, `_ap_baggage_train`:29997, `_ap_loop_pos`:30010, `_ap_loop_len`:30026, `_ap_flight_at`:30032, `_ap_tick`:30056, `_airport_ped_plan`:30079, `_smoke_airport`:30099

## 30143-30656  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30157, `_nav_spot`:30164, `_nav_idx`:30168, `_nav_pos`:30175, `_nav_blocked`:30179, `_nav_nearest_free`:30189, `_nav_bfs`:30217, `_nav_build`:30261, `_stroller`:30332, `_stroll_place`:30348, `_stroll_next`:30369, `_nav_clear_line`:30403, `_stroll_aim`:30414, `_strollers_tick`:30446, `_smoke_strollers`:30541

## 30657-30817  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:30692, `_dir_fmt`:30695, `_signpost_spot`:30698, `_build_signposts`:30715

## 30818-30914  the Directions panel and chip

`_build_dir_panel`:30819, `_open_dir`:30861, `_dir_close`:30870, `_dir_pick`:30874, `_dir_stop`:30879, `_dir_stop_and_close`:30884, `_dir_tick`:30888

## 30915-31456  v0.44: Grand Central

`_gc_mesh`:30944, `_gc_mat`:30977, `_gc_glass`:30986, `_gb`:30996, `_gb_solid`:31002, `_gb_flush`:31006, `_gc_tree`:31036, `_gc_text`:31041, `_gc_planter`:31056, `_gc_kiosk`:31062, `_goods_color`:31092, `_goods_mat`:31095, `_kiosk_goods`:31099, `_build_grand_central`:31177, `_build_gc_towers`:31345, `_gc_tick`:31440

## 31457-31748  v0.44: filling the empty land

`_loft`:31474, `_fill_clear`:31516, `_build_fill`:31526, `_hg_in_lake`:31574, `_hg_path`:31578, `_floor_note_rot`:31586, `_build_gardens`:31594, `_build_fan_plaza`:31704

## 31749-31783  v0.45: hover car underglow

`_car_underglow`:31752

## 31784-31948  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:31785

## 31949-31980  v0.47: street stalls downtown

`_build_street_stalls`:31953, `_cull_people_in`:31973

## 31981-32079  v0.48: places that open as you level up

`_place_lock_of`:31994, `_place_root`:32000, `_place_unlocked`:32003, `_build_place_signs`:32011, `_places_refresh`:32056, `_places_tick`:32073

## 32080-32124  v0.50: city careers

`_career_rank_name`:32105, `_career_mult`:32108, `_career_block_reason`:32113, `_career_start`:32116, `_career_end`:32121

## 32125-32175  v0.52: careers as clear job loops

`_cid`:32152, `_career_target`:32166, `_career_tick`:32173

## 32176-32183  taxi

`_taxi_meter`:32177

## 32184-32187  paramedic

(no functions)

## 32188-32192  police

`_career_chase_over`:32190

## 32193-32198  firefighter

`_fire_aimed`:32194

## 32199-32208  the step bar

`_career_bar_text`:32202, `_career_hud`:32206

## 32209-32235  cut scenes

`_cs_skip`:32227

## 32236-32240  siren

(no functions)

## 32241-32252  the Careers panel

`_build_career_panel`:32242, `_open_careers`:32245, `_career_close`:32249

## 32253-32676  v0.50: homes

`_home_door_spots`:32293, `_build_homes`:32308, `_home_labels`:32337, `_home_door_near`:32346, `_home_origin`:32355, `_home_slot_near`:32358, `_home_exit_near`:32369, `_home_btn`:32376, `_home_interact`:32389, `_home_buy`:32408, `_home_default_layout`:32422, `_home_enter`:32430, `_home_leave`:32450, `_hm`:32458, `_home_build_room`:32477, `_home_refresh_room`:32586, `_furni_build`:32600

## 32677-33012  decorating

`_build_home_panels`:32678, `_open_homes`:32723, `_home_row_go`:32733, `_home_panel_close`:32753, `_deco_open`:32757, `_deco_pick`:32780, `_smoke_careers_homes`:32803

## 33013-33147  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33017, `_home_slots`:33025, `_home_ring`:33052, `_furni_cat`:33058, `_home_fix_layout`:33064, `_home_build_layout`:33092

## 33148-33581  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33211, `_ch_homes`:33217, `_ch_step_text`:33224, `_ch_step_done`:33235, `_ch_target`:33249, `_ch_finish_chapter`:33258, `_chapters_tick`:33280, `_hud_top_stack`:33320, `_build_chapters_ui`:33350, `_chapters_restart_ask`:33392, `_chapters_restart`:33395, `_chapters_text`:33405, `_open_chapters`:33425, `_chapters_close`:33432, `_smoke_chapters`:33436, `_step_sound`:33557

## 33582-33620  v0.51.1: join and leave messages

`_announce_join`:33589, `_announce_already_here`:33608, `_announce_leave`:33616

## 33621-33885  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33637, `_shot_tick`:33643, `_draw_shot_icon`:33675, `_shot_enter`:33684, `_shot_exit`:33698, `_shot_release_controls`:33710, `_shot_stick_zone`:33717, `_shot_input`:33720, `_smoke_photo`:33792

## 33886-34184  v0.51.3: stream joiners

`_viewer_count`:33906, `_stream_join_check`:33912, `_stream_join_start`:33919, `_sj_streamer`:33936, `_stream_join_tick`:33945, `_stream_join_land`:33969, `_sj_welcome`:33985, `_smoke_stream_join`:34019, `_career_shot`:34102

## 34185-34301  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34189, `_st_restore`:34227, `_smoke_streamer_clean`:34248, `_world_bio_passport`:34299

