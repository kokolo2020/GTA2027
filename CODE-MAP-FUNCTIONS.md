# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-538  Core (unlabelled)

`_symbol_font`:275, `_ready`:287, `_surf_texture`:481, `_surface_material`:503

## 539-611  v0.34.6: futuristic towers for the old city

`_future_tower`:543

## 612-690  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:619, `_skin_common`:654, `_future_wall`:662, `_future_roof`:676, `_future_pave`:684

## 691-751  v0.34.4: futuristic road surface

`_road_textures`:698, `_future_road`:732

## 752-1957  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:771, `_real_tex`:812, `_real_setup`:820, `_real_kind`:841, `_realify`:847, `_real_glass`:884, `_make_window_textures`:904, `_material`:937, `_box`:962, `_sign`:984, `_build_world`:996, `_future_kiosk`:1104, `_build_collectibles`:1130, `_auto_collect_tick`:1163, `_find_count`:1184, `_nearest_find`:1191, `_destination`:1205, `_toggle_activity`:1241, `_collect_find`:1270, `_owned_count`:1285, `_ridge_open`:1292, `_ridge_count`:1296, `_nearest_ridge`:1303, `_apply_car`:1317, `_tune_level`:1347, `_tune_cost`:1350, `_car_stats`:1356, `_buy_tune`:1363, `_open_tune`:1384, `_back_to_garage`:1390, `_refresh_tune`:1394, `_bay_open`:1405, `_area_open`:1408, `_bay_count`:1411, `_nearest_bay`:1418, `_build_bay`:1432, `_check_bay`:1485, `_discover_bay`:1498, `_north_count`:1511, `_north_open`:1518, `_nearest_north`:1521, `_check_north`:1535, `_discover_north`:1548, `_prop`:1561, `_collider`:1575, `_first_mesh`:1585, `_scatter`:1594, `_prop_stretch`:1628, `_north_token`:1637, `_nm_roads`:1664, `_prop_big`:1679, `_nm_near_cross`:1695, `_build_north`:1702, `_build_nm_blocks`:1819, `_build_north_landscape`:1904, `_nm_free`:1931, `_build_landscape`:1941

## 1958-2437  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:1959, `_online_toggle`:1973, `_online_autostart`:1999, `_online_connect`:2018, `_online_stop`:2025, `_online_next_ref`:2036, `_online_send`:2040, `_online_join_frame`:2044, `_online_pos_frame`:2047, `_online_tick`:2056, `_online_handle`:2090, `_online_clean_name`:2143, `_online_peer_update`:2152, `_online_make_peer`:2217, `_peer_look`:2258, `_online_tint`:2315, `_paint_mat`:2331, `_online_update_peers`:2343, `_online_clear_peers`:2423, `_online_refresh_button`:2428

## 2438-2610  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2518, `_marina_count`:2521, `_nearest_marina`:2528, `_check_marina`:2542, `_discover_marina`:2555, `_shop_available`:2568, `_nearest_shop`:2571, `_premium_cars`:2579, `_glass`:2586, `_shop_building`:2592, `_shop_pad`:2602

## 2611-3126  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2612, `_bus_last`:2615, `_build_bus`:2618, `_bus_boxes`:2645, `_bus_skin`:2655, `_bus_side`:2668, `_bus_reset`:2671, `_bus_text`:2680, `_bus_tick`:2685, `_bus_near`:2725, `_bus_board`:2736, `_bus_alight`:2751, `_build_marina`:2765, `_set_hat`:2871, `_build_hat`:2874, `_cyl`:2939, `_hat_part`:2948, `_apply_avatar`:2957, `_shop_count`:2969, `_shop_open`:2979, `_shop_step`:2997, `_shop_close`:3003, `_owned_text`:3016, `_refresh_shop`:3019, `_shop_action`:3072, `_journal_flip`:3123

## 3127-3181  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3138, `_xp`:3141, `_level_for`:3148, `_level`:3156, `_level_text`:3159, `_check_level`:3169

## 3182-3284  v0.11.0: online police vs thief

`_orole_ready`:3183, `_orole_start`:3186, `_orole_end`:3213, `_orole_tick`:3222

## 3285-4228  v0.10.0: chase mode (offline)

`_chase_open`:3286, `_chase_clear`:3291, `_chase_make_unit`:3305, `_chase_spawn_point`:3335, `_chase_start`:3344, `_chase_end`:3380, `_chase_steer`:3399, `_chase_roadblock`:3435, `_chase_heli_build`:3480, `_chase_extras`:3506, `_chase_tick`:3533, `_start_trial`:3597, `_cancel_trial`:3624, `_check_trial`:3629, `_finish_trial`:3646, `_trial_count`:3662, `_open_trials`:3669, `_refresh_trials`:3673, `_update_gate`:3685, `_slab`:3703, `_build_ridge`:3721, `_check_ridge`:3784, `_discover`:3797, `_mission_progress`:3811, `_check_missions`:3873, `_open_garage`:3884, `_open_journal`:3889, `_close_sub`:3894, `_bar`:3897, `_refresh_garage`:3901, `_garage_step`:3926, `_garage_action`:3930, `_refresh_journal`:3950, `_visited_shops`:3983, `_build_panels`:3990, `_build_player`:4150, `_build_car`:4188, `_try_model`:4217

## 4229-4895  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4230, `_kshader`:4304, `_ksync`:4310, `_kskin`:4325, `_make_kperson`:4331, `_hat_y`:4395, `_sit_drop`:4398, `_kplay`:4401, `_kpeople_tick`:4411, `_pose_person`:4440, `_pose_limbs`:4457, `_person_lift`:4519, `_snap_crowd_feet`:4532, `_people_life_tick`:4548, `_life_one`:4585, `_cull_person`:4595, `_recolor_car_model`:4603, `_apply_car_model`:4617, `_landmark`:4637, `_label`:4647, `_button`:4654, `_panel`:4666, `_build_hud`:4676

## 4896-5014  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4902, `_menu_tab`:4908, `_watch_tick`:4931, `_watch_count`:4973, `_online_pill_tap`:4980, `_online_pill_tick`:4986, `online_config_ok`:5012

## 5015-5052  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5018, `_offroad`:5024, `_ground_near`:5037, `_collectibles_on_road`:5044

## 5053-5192  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5065, `_build_quest_offer`:5069, `_quest_offer_tick`:5099, `_quest_auto_pick`:5149, `_quest_accept`:5164, `_quest_decline`:5178, `_quest_stop`:5184

## 5193-5560  v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5217, `_holo_material`:5226, `_build_future`:5234, `_build_neon`:5248, `_model_profile`:5317, `_model_body_box`:5340, `_build_holograms`:5354, `_holo_tick`:5404, `_build_sky_traffic`:5421, `_sky_hover_car`:5439, `_sky_drone`:5486, `_sky_traffic_tick`:5530, `_future_lights`:5549

## 5561-6060  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5620, `_crew_col`:5628, `_peer_crewmate`:5631, `_set_ring_color`:5634, `_level_color`:5661, `_tier_color`:5674, `_my_ach_tier`:5677, `_style_ring`:5684, `_social_peer_extras`:5732, `_social_tag`:5746, `_my_tag_extra`:5758, `_soc_send`:5771, `_social_msg`:5786, `_social_accept`:5825, `_social_go`:5846, `_soc_friend`:5865, `_soc_invite`:5872, `_soc_goto`:5877, `_soc_high_five`:5885, `_soc_gift`:5905, `_soc_crew_invite`:5922, `_gift_day_check`:5929, `_crew_create`:5935, `_crew_cycle_color`:5945, `_crew_leave`:5950, `_crew_mate_near`:5958, `_crew_board`:5966, `_build_social`:5985, `_social_online`:6047, `_open_social`:6051, `_close_social`:6057

## 6061-6311  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6064, `_track_pos`:6073, `_social_row_button`:6084, `_refresh_social`:6091, `_on_dance_floor`:6153, `_toggle_dance`:6156, `_build_dance_floor`:6164, `_social_tick`:6190, `_photo`:6262

## 6312-6807  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6334, `_game_state`:6342, `_build_arcade`:6354, `_c4_empty`:6405, `_c4_drop_row`:6411, `_c4_winner`:6417, `_c4_bot_move`:6438, `_c4_code`:6467, `_c4_ready`:6473, `_c4_tap`:6476, `_c4_check`:6497, `_c4_tick`:6521, `_rx_ready`:6548, `_rx_start`:6551, `_rx_tap`:6565, `_rx_send_time`:6590, `_rx_resolve`:6597, `_rx_tick`:6623, `_mem_start`:6638, `_mem_tap`:6654, `_mem_finish`:6669, `_mem_tick`:6685, `_mem_board_text`:6692, `_build_arcade_panel`:6703, `_refresh_arcade_panel`:6746

## 6808-7101  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6871, `_quiz_slot`:6874, `_quiz_question`:6884, `_quiz_bot_score`:6913, `_in_quiz`:6922, `_build_quiz`:6925, `_quiz_answer`:6995, `_quiz_msg`:7008, `_quiz_board`:7016, `_quiz_tick`:7026, `_quiz_refresh`:7068

## 7102-8579  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7273, `_sites_found`:7276, `_sites_total`:7279, `_bits`:7282, `_ach_value`:7289, `_ach_tick`:7344, `_ach_check`:7369, `_ach_by_id`:7405, `_ach_msg`:7411, `_build_ach`:7424, `_ach_show`:7455, `_open_ach`:7475, `_close_ach`:7481, `_refresh_ach`:7485, `_ach_num`:7516, `_minimap_tap`:7519, `_menu_go`:7526, `_menu_stay`:7531, `_menu_call_car`:7535, `_toggle_clean_hud`:7541, `_refresh_menu_buttons`:7547, `_clean_hud_tick`:7557, `_draw_joystick`:7598, `_input`:7603, `_stick_zone`:7680, `_notification`:7684, `_physics_process`:7699, `_follow_camera`:7846, `_follow_walk_camera`:7882, `_interact`:7905, `_refresh_hud`:8056, `_open_panel`:8177, `_layout_panels`:8203, `_toggle_menu`:8226, `_rescue`:8266, `_show_toast`:8298, `_save_progress`:8302, `_load_progress`:8385

## 8580-10720  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8581, `_radio_voice`:8584, `_radio_make`:8617, `_radio_set`:8688, `_radio_play`:8710, `_radio_next`:8715, `_radio_talk_line`:8719, `_radio_caption`:8740, `_radio_refresh`:8748, `_process`:8761, `_build_peds`:8810, `_update_peds`:8921, `_update_ped`:8940, `_smoke_test`:8994, `_smoke_chase`:9632, `_smoke_orole`:9665, `_smoke_levels`:9694, `_smoke_bus`:9735, `_smoke_chase_extras`:9820, `_smoke_marina`:9848, `_blocked_at`:9950, `_blocker`:9963, `_on_screen`:9976, `_wait_radio`:9981, `_smoke_radio_peds`:9988, `_smoke_models`:10058, `_smoke_garage_ridge`:10082, `_save_shot`:10458, `_people_shots`:10468, `_shots`:10509, `_shot_car`:10703, `_capture_preview`:10713

## 10721-11369  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10788, `_downtown_count`:10791, `_nearest_downtown`:10798, `_check_downtown`:10812, `_discover_downtown`:10825, `_box_batch`:10839, `_model_batch`:10859, `_cut_ranges`:10913, `_dt_ranges`:10925, `_dt_has`:10932, `_dt_near_cross`:10938, `_place`:10944, `_signal_pole`:10955, `_cyl_batch`:10974, `_city_signals`:10998, `_ensure_light_mats`:11049, `_city_lamps`:11059, `_build_downtown`:11103, `_dt_block`:11303, `_downtown_token`:11309, `_build_park`:11326, `_build_plaza`:11355

## 11370-11473  old city and Bay details

`_build_city_detail`:11371

## 11474-11883  traffic

`_build_traffic`:11475, `_path_sample`:11570, `_light_look`:11584, `_light_green`:11592, `_traffic_place`:11596, `_traffic_blocked_by`:11608, `_traffic_tick`:11620, `_smoke_downtown`:11726, `_skyline_shot`:11838, `_skyline_shots`:11846

## 11884-12236  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:11930, `_web_scale`:11985, `_web_fps_tick`:11995, `_world_to_uv`:12012, `_map_angle`:12015, `_build_minimap`:12023, `_open_map`:12096, `_close_map`:12107, `_mini_point`:12114, `_site_markers`:12118, `_draw_arrow`:12150, `_draw_minimap`:12157, `_draw_full_map`:12204, `_minimap_tick`:12229

## 12237-12494  camera views

`_build_view_controls`:12238, `_cycle_view`:12280, `_apply_view`:12290, `_hide_labels`:12328, `_unfade`:12334, `_bake_map`:12340, `_shot_stats`:12390, `_view_shots`:12393, `_smoke_views`:12434

## 12495-12742  v0.17.0: level-up celebration

`_build_level_fx`:12506, `_draw_level_rays`:12543, `_level_fx_tick`:12553, `_level_sound`:12558, `_fx_material`:12600, `_level_up_fx`:12608, `_smoke_level_fx`:12709, `_levelup_shots`:12718

## 12743-12862  v0.18.0: walk-in stadium

`_collider_yaw`:12748, `_build_stadium_walls`:12759, `_look`:12787, `_smoke_stadium_eye`:12796, `_stadium_shots`:12832

## 12863-13024  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:12887, `_arrow_mesh`:12899, `_build_guidance`:12922, `_guide_target`:12947, `_guidance_tick`:12976, `_draw_hud_arrow`:13002

## 13025-13210  checkpoints

`_build_checkpoints`:13026, `_refresh_checkpoints`:13071, `_check_checkpoints`:13077, `_activate_checkpoint`:13087, `_checkpoint_spawn`:13108, `_spawn_at_checkpoint`:13113, `_draw_checkpoint_icon`:13129, `_smoke_guidance_checkpoints`:13135, `_guide_shots`:13185

## 13211-13486  v0.18.0: Harbor Dome social hub

`_hub_seat`:13269, `_build_hub`:13273, `_hub_glass`:13470

## 13487-13694  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:13488, `_build_hub_bots`:13513, `_seat_of`:13544, `_bubble`:13554, `_emote`:13603, `_hub_people_tick`:13617

## 13695-13813  seats

`_seat_taken`:13696, `_nearest_seat`:13704, `_seat_label`:13716, `_sit`:13732, `_stand_up`:13776, `_seated_tick`:13795

## 13814-13970  game panel

`_build_game_panel`:13815, `_open_game_panel`:13870, `_refresh_game_panel`:13889, `_play_robot`:13934, `_peer_at`:13948, `_opponent_name`:13955, `_pay`:13963

## 13971-14091  tic-tac-toe

`_ttt_ready`:13974, `_ttt_winner`:13980, `_ttt_bot_move`:13990, `_ttt_tap`:14016, `_ttt_code`:14036, `_ttt_check`:14042, `_ttt_tick`:14065

## 14092-14143  rock paper scissors

`_rps_ready`:14093, `_rps_pick`:14099, `_rps_resolve`:14117, `_rps_tick`:14141

## 14144-14226  online table messages

`_online_game_send`:14145, `_hub_game_msg`:14151

## 14227-14302  comedy show

`_joke_start`:14228, `_joke_tick`:14240, `_speak`:14266, `_play_rimshot`:14275

## 14303-14841  quick chat and emotes

`_build_chat`:14320, `_chat_toggle_to`:14420, `_chat_log_add`:14428, `_chat_area`:14434, `_chat_near_count`:14452, `_chat_tick`:14461, `_toggle_chat`:14508, `_say`:14522, `_do_emote`:14536, `_smoke_hub`:14545, `_hub_shots`:14719, `_sg_on_terrace`:14792, `_people_only`:14795, `_people_only_keep_cars_out`:14799, `_car_barrier`:14811, `_hub_keep_cars_out`:14825

## 14842-15004  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:14851, `_feed_add`:14860, `_feed_render`:14866, `_feed_tick`:14894, `_online_event_send`:14903, `_at_pvp_table`:14910, `_game_name`:14917, `_send_lfp`:14920, `_lfp_msg`:14937, `_accept_invite`:14958

## 15005-15245  v0.18.2: nickname and HUD relayout

`_nick_rude`:15017, `_clean_nick`:15032, `_build_nick_panel`:15044, `_open_nick`:15082, `_random_nick`:15091, `_save_nick`:15097, `_close_nick`:15116, `_refresh_nick_button`:15125, `_relayout_hud`:15129, `_smoke_nick`:15165, `_nick_shots`:15197, `_smoke_sites_reachable`:15215

## 15246-15533  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:15272, `_nearest_civic`:15279, `_check_civic`:15293, `_discover_civic`:15306, `_civ_ranges`:15319, `_civ_has`:15333, `_civ_near_cross`:15339, `_build_civic`:15345, `_civic_token`:15471, `_civic_shots`:15488, `_hub_focus`:15510

## 15534-15643  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:15605, `_in_rw_lot`:15608, `_box_batch_rot`:15611, `_multi_collider`:15629

## 15644-15971  circuit geometry

`_cr_point`:15645, `_rw_build_path`:15659, `_rw_dir`:15687, `_rw_bend`:15692, `_ribbon`:15698, `_rw_band`:15718, `_rw_keepout`:15736, `_build_raceway`:15745, `_build_rw_parking`:15779, `_build_rw_pits`:15824, `_build_rw_track`:15861, `_build_rw_trackside`:15902

## 15972-16069  race car rental

`_model_key`:15973, `_race_car_start`:15976, `_tint_ghost`:16014, `_race_car_end`:16027, `_race_keep_cars_out`:16052

## 16070-16084  speed effects

`_eff_max`:16071, `_eff_accel`:16082

## 16085-16135  track helpers

`_rw_seg_progress`:16086, `_rw_track_dist`:16106, `_rw_point_dist`:16117, `_rw_player_progress`:16124, `_rw_target`:16130

## 16136-16372  events

`_rec_stop`:16137, `_rw_place`:16153, `_rw_grid_pos`:16160, `_rw_start`:16165, `_rw_spawn_ai`:16197, `_rw_ai_place`:16221, `_rw_tick`:16232, `_rw_ai_tick`:16285, `_rw_lap_done`:16327, `_rw_finish`:16339, `_rw_fmt`:16370

## 16373-16425  boosters and spikes

`_rw_buy`:16374, `_rw_use_boost`:16392, `_rw_use_spike`:16400, `_rw_drop_spike_at`:16411

## 16426-16483  online races

`_race_msg`:16427, `_join_race`:16449

## 16484-16839  raceway panel, HUD, board

`_build_raceway_ui`:16485, `_rw_layout`:16545, `_rw_open`:16552, `_rw_close`:16558, `_rw_refresh_panel`:16562, `_rw_refresh_board`:16575, `_rw_hud`:16587, `_peer_car_model`:16611, `_smoke_raceway`:16621, `_race_shots`:16802

## 16840-17046  v0.22.0: Call Car

`_call_block_reason`:16846, `_call_spot`:16863, `_call_car`:16894, `_play_horn`:16917, `_smoke_follow_call`:16941, `_follow_shots`:17014

## 17047-17346  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:17062, `_build_travel`:17067, `_toggle_run`:17109, `_refresh_run`:17113, `_hud_v23_tick`:17121, `_travel_block_reason`:17150, `_travel_open`:17170, `_open_travel`:17176, `_close_travel`:17182, `_refresh_travel`:17186, `_travel_to`:17194, `_smoke_travel`:17221, `_v23_shots`:17259

## 17347-17420  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:17354, `_qr_button`:17369, `_qr_layout`:17408, `_smoke_qr`:17414

## 17421-17857  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:17441, `_open_crate`:17457, `_build_crate_ui`:17474, `_crate_pick`:17561, `_crate_reveal`:17584, `_crate_draw_car`:17611, `_crate_confetti`:17630, `_crate_sound`:17655, `_crate_drive`:17681, `_feed_add_system`:17711, `_smoke_crate`:17714, `_crate_shots`:17762

## 17858-18349  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:17899, `_quick_today`:17904, `_quick_is_done`:17907, `_quick_left`:17910, `_quick_next`:17917, `_quick_fix_target`:17930, `_quick_daily_check`:17944, `_quick_complete`:17958, `_quick_side`:17992, `_build_quick_props`:18010, `_daily_shots`:18162, `_quick_props_refresh`:18204, `_quick_fx`:18208, `_play_coin`:18224, `_smoke_quick`:18241

## 18350-18500  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:18359, `_quest_nearby`:18414, `_open_quests`:18421, `_close_quests`:18428, `_refresh_quests`:18432, `_quest_pick`:18458, `_quest_mode`:18472, `_smoke_quests`:18475

## 18501-18535  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:18505, `_my_tag_tick`:18508

## 18536-18850  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:18553, `_fc_torus`:18563, `_fc_pearl`:18571, `_fc_chrome`:18581, `_fc_glass`:18590, `_fc_glow`:18600, `_fc_ghost`:18609, `_fc_holo`:18621, `_fc_mesh`:18631, `_fc_sphere`:18651, `_fc_capsule`:18659, `_fc_cone`:18667, `_build_food_court`:18676, `_food_court_tick`:18830

## 18851-19165  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:18873, `_cm_bench`:18889, `_build_commons`:18902, `_commons_tick`:19124

## 19166-19480  v0.36: the daily puzzle

`_pz_today`:19189, `_pz_new`:19192, `_pz_neighbours`:19237, `_pz_flip`:19247, `_pz_done`:19252, `_pz_tap`:19260, `_pz_win`:19276, `_pz_reset`:19297, `_puzzle_near`:19301, `_open_puzzle`:19306, `_close_puzzle`:19314, `_pz_refresh_sign`:19318, `_build_puzzle_panel`:19326, `_pz_draw`:19357, `_smoke_chat`:19398, `_smoke_feet`:19436, `_smoke_commons`:19457

## 19481-19669  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:19543, `_bio_theta`:19547, `_bio_sec_n`:19552, `_bio_sec_of`:19555, `_bio_pt`:19558, `_bio_lp`:19563, `_bio_la`:19567, `_bio_dir`:19571, `_bio_hex_r`:19574, `_bio_apo`:19579, `_bio_open_angles`:19585, `_bio_si`:19595, `_bm`:19601, `_bsph`:19606, `_blow`:19609, `_bcone`:19620, `_bbox`:19623, `_bp`:19626, `_bq`:19631, `_bio_glass_mat`:19635, `_bio_water_mat`:19648, `_bio_mat`:19660

## 19670-20042  building blocks

`_bio_inst`:19671, `_bio_add`:19677, `_bio_model`:19680, `_bio_nature_mesh`:19686, `_bio_flush`:19720, `_bio_bar`:19755, `_bio_slab`:19768, `_bio_body`:19783, `_bio_cyl_col`:19796, `_bio_hexmesh`:19809, `_bio_hexslab`:19821, `_bio_hexpt`:19827, `_bio_gridshell`:19834, `_bio_rail`:19941, `_bio_rail_arc`:19946, `_bio_disc_deck`:19958, `_bio_ring_deck`:19964, `_bio_helix`:19975, `_bio_pillar`:19995, `_bio_cafe`:20001, `_bio_fence_line`:20015, `_bio_fence_seg`:20020, `_bio_pen`:20030

## 20043-20544  building

`_build_biosphere`:20044, `_build_biosphere_legacy`:20048, `_bio_text`:20210, `_bio_plaque`:20228, `_bio_ticket_hall`:20242, `_on_foot_collision_guard`:20298, `_bio_inside`:20308, `_bio_pass_ok`:20311, `_ticket_near`:20315, `_bio_buy_pass`:20320, `_bio_gates_update`:20336, `_bio_gate_tick`:20362, `_bio_tunnel`:20374, `_bio_grounds`:20427, `_bio_dome`:20473, `_bio_deck_mats`:20541

## 20545-20700  garden planting

`_bio_free`:20546, `_bio_spot`:20563, `_bio_garden`:20571, `_bio_pine`:20612, `_bio_tree`:20615, `_bio_big_tree`:20625, `_bio_rock`:20630, `_bio_pond`:20633, `_bio_particles`:20637, `_bio_mist`:20665, `_bio_mini_dome`:20694

## 20701-21108  the four layouts

`_bio_winter`:20702, `_bio_spring`:20794, `_bio_summer`:20919, `_bio_autumn`:21003

## 21109-21379  animals

`_bio_spawn`:21110, `_bio_load_animal`:21182, `_bio_make_quad`:21203, `_bio_load_bird`:21280, `_bio_make_penguin`:21300, `_bio_make_bird`:21322, `_bio_make_flamingo`:21346, `_bio_make_butterfly`:21367

## 21380-21509  animation, spotting and rewards

`_bio_stuck_check`:21385, `_biosphere_tick`:21403, `_bio_animate`:21410, `_bio_spot_check`:21490, `_bio_spotted`:21502, `_smoke_biosphere`:21506

## 21510-22027  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:21597, `_wear_piece`:21600, `_wear_mat`:21623, `_person_index`:21639, `_dress`:21662, `_smoke_style`:21768, `_style_shots`:21919, `_npc_look`:21991

## 22028-22176  your look: apply, save, share

`_look_clean`:22032, `_look_pack`:22047, `_owns`:22053, `_apply_look`:22058, `_relic_model`:22064, `_fc_mesh_mat`:22129, `_relic_refresh`:22132, `_relic_tick`:22146, `_peer_style`:22157

## 22177-22604  stores and the wardrobe

`_style_today`:22196, `_style_items`:22199, `_style_cat`:22207, `_style_price`:22210, `_style_deal`:22224, `_style_price_base`:22237, `_relic_stock`:22244, `_build_style_panel`:22256, `_open_store`:22296, `_open_wardrobe`:22315, `_style_close`:22318, `_style_finish`:22322, `_sync_old_avatar`:22337, `_style_tabs_for`:22344, `_refresh_style`:22349, `_style_body_rows`:22500, `_style_set_tab`:22517, `_style_step`:22521, `_style_color`:22526, `_style_pick`:22531, `_style_buy`:22566, `_ach_relics_check`:22588, `_style_face_camera`:22593

## 22605-23072  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:22641, `_ga_text`:22647, `_ga_box`:22664, `_build_galleria`:22680, `_ga_inner_tick`:22821, `_ga_shell`:22837, `_ga_inside`:22887, `_bio_cyl_col_on`:22890, `_ga_models`:22902, `_ga_lbox`:22917, `_ga_ltext`:22931, `_ga_store`:22938, `_bio_cafe_on`:23040, `_ga_mannequins`:23048

## 23073-23224  featured outfits and the Sky Run

`_ga_featured_look`:23086, `_build_ga_fun`:23107, `_ga_fun_tick`:23152, `_sky_finish`:23179, `_extra_near`:23198, `_extra_open`:23207, `_store_near`:23216

## 23225-23321  v0.41: THE SKY GARDEN

`_sg_now`:23279, `_sg_progress`:23282, `_sg_time`:23288, `_sg_stock`:23295, `_sg_mut_roll`:23310

## 23322-23459  building

`_sg_box`:23323, `_sg_text`:23329, `_build_sky_garden`:23343, `_sg_seed_spot`:23454, `_sg_codex_spot`:23457

## 23460-23640  plants

`_sg_plant_model`:23461, `_sg_refresh_all`:23566, `_sg_refresh`:23570, `_sky_garden_tick`:23606, `_sg_ready_count`:23625, `_sg_boot_note`:23632

## 23641-23760  interacting

`_sg_near`:23642, `_sg_button_text`:23665, `_sg_value`:23678, `_sg_interact`:23682, `_sg_buy`:23698, `_sg_plant`:23720, `_sg_harvest`:23731

## 23761-24004  the garden screen

`_build_sg_panel`:23762, `_sg_open`:23797, `_sg_close`:23806, `_sg_row`:23810, `_sg_refresh_panel`:23825, `_sg_pick_buy`:23870, `_sg_pick_plant`:23874, `_smoke_car_barriers`:23880, `_smoke_sky_garden`:23921

## 24005-24043  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:24036, `_pass_day`:24039

## 24044-24075  album

`_album_pages`:24045, `_album_claim`:24060

## 24076-24127  season

`_season_index`:24077, `_season_tick`:24080, `_season_xp`:24089, `_season_tier`:24092, `_season_reward`:24095, `_season_claim`:24109

## 24128-24135  Harbor Night

`_harbor_night`:24129

## 24136-24167  check-in calendar

`_cal_tick`:24137

## 24168-24344  the panel

`_build_hp_panel`:24169, `_open_pass`:24204, `_hp_open`:24207, `_hp_close`:24214, `_hp_row`:24218, `_hp_bar`:24233, `_hp_refresh`:24237, `_smoke_pass`:24282

## 24345-24559  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:24349, `_cash_pill_tick`:24357, `_build_lb`:24395, `_open_lb`:24438, `_close_lb`:24446, `_lb_pick`:24450, `_lb_headers`:24455, `_lb_url`:24459, `_lb_me`:24462, `_lb_tick`:24465, `_lb_upload`:24473, `_lb_fetch`:24483, `_lb_got`:24491, `_lb_value`:24502, `_lb_refresh_ui`:24513

## 24560-24983  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:24584, `_market_near`:24661, `_build_gear`:24671, `_gear_piece`:24679, `_build_pet`:24724, `_market_apply`:24766, `_market_tick`:24790, `_build_market_panel`:24812, `_open_market`:24838, `_close_market`:24845, `_refresh_market`:24849, `_market_pick`:24902, `_toggle_board`:24940, `_board_tick`:24947

## 24984-25225  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:25016, `_ds_label`:25035, `_build_display`:25049, `_ds_got`:25128, `_ds_sorted`:25137, `_ds_render_board`:25151, `_ds_render_news`:25177, `_display_tick`:25196

## 25226-25404  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:25243, `_toggle_streamer`:25330, `_streamer_badge_tap`:25346, `_streamer_tick`:25350

## 25405-25441  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:25411, `_car_back`:25418, `_car_park_tick`:25425

## 25442-25538  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:25446, `_bus_eta`:25500, `_bus_displays_tick`:25516

## 25539-25830  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:25557, `_treasure_pick`:25560, `_treasure_spot`:25569, `_treasure_district`:25573, `_treasure_clue`:25585, `_treasure_prop`:25598, `_tp_part`:25601, `_tp_sphere`:25611, `_tp_cyl`:25619, `_treasure_prop_side`:25628, `_build_treasure_props`:25640, `_build_treasure`:25684, `_treasure_dir_char`:25753, `_treasure_tick`:25762, `_treasure_claim`:25816

## 25831-25931  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:25832, `_halo_mat`:25864, `_smoke_treasure`:25889

## 25932-26255  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:25953, `_fm_send`:25956, `_fm_area`:25962, `_fm_glow_mesh`:25978, `_fm_block_reason`:25996, `_fm_start`:26008, `_fm_announce`:26036, `_fm_finish`:26039, `_fm_msg`:26057, `_fm_check_paid`:26108, `_fm_tick`:26126, `_smoke_findme`:26182

## 26256-26366  v0.24.2: road map (for moving people off the road)

`_floor_note`:26262, `_floor_disc`:26276, `_floor_top`:26285, `_ground_at`:26303, `_note_road`:26321, `_on_road`:26328, `_ped_curb`:26338, `_curb_spot`:26348

## 26367-26662  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:26389, `_ex_grid`:26397, `_ex_lamps`:26432, `_ex_umbrella`:26455, `_ex_yards`:26462, `_build_expansion`:26477, `_expand_shots`:26640

## 26663-26857  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:26704, `_v27_near_cross`:26796, `_v27_near_any_road`:26803, `_v27_in_district`:26809, `_sea_tick`:26823, `_sea_tow`:26842

## 26858-27498  Harbor Loop sky train

`_sky_build_path`:26909, `_sky_pos`:26950, `_sky_dir`:26964, `_sky_project`:26969, `_sky_trip_time`:26988, `_sky_trip_dist`:26994, `_sky_now`:27005, `_sky_state`:27008, `_sky_time_at_station`:27023, `_sky_next_arrival`:27030, `_build_skytrain`:27043, `_sky_make_car`:27172, `_sky_skin`:27209, `_sky_place_trains`:27229, `_sky_build_station`:27248, `_sky_near`:27313, `_sky_fmt`:27322, `_sky_enter`:27326, `_sky_leave_platform`:27344, `_sky_board`:27354, `_sky_alight`:27367, `_sky_action`:27380, `_sky_tick`:27397, `_sky_camera`:27435, `_tour_today`:27451, `_tour_stamp`:27454, `_sky_hud`:27477

## 27499-27836  Day and night

`_game_hour`:27580, `_day_key`:27592, `_night_setup`:27607, `_night_scan_mesh`:27697, `_daynight_tick`:27722, `_daynight_apply`:27729, `_daynight_lights`:27821, `_cycle_day_mode`:27826, `_refresh_time_button`:27833

## 27837-28472  v0.27 smoke test and screenshots

`_smoke_v27`:27838, `_city_shots`:28041

## 28473-28889  v0.27: Harbor International Airport (north of the city)

`_build_airport`:28507, `_ap_plane`:28683, `_ap_truck`:28703, `_ap_baggage_train`:28744, `_ap_loop_pos`:28757, `_ap_loop_len`:28773, `_ap_flight_at`:28779, `_ap_tick`:28803, `_airport_ped_plan`:28826, `_smoke_airport`:28846

## 28890-29403  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:28904, `_nav_spot`:28911, `_nav_idx`:28915, `_nav_pos`:28922, `_nav_blocked`:28926, `_nav_nearest_free`:28936, `_nav_bfs`:28964, `_nav_build`:29008, `_stroller`:29079, `_stroll_place`:29095, `_stroll_next`:29116, `_nav_clear_line`:29150, `_stroll_aim`:29161, `_strollers_tick`:29193, `_smoke_strollers`:29288

## 29404-29564  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:29439, `_dir_fmt`:29442, `_signpost_spot`:29445, `_build_signposts`:29462

## 29565-29661  the Directions panel and chip

`_build_dir_panel`:29566, `_open_dir`:29608, `_dir_close`:29617, `_dir_pick`:29621, `_dir_stop`:29626, `_dir_stop_and_close`:29631, `_dir_tick`:29635

## 29662-30203  v0.44: Grand Central

`_gc_mesh`:29691, `_gc_mat`:29724, `_gc_glass`:29733, `_gb`:29743, `_gb_solid`:29749, `_gb_flush`:29753, `_gc_tree`:29783, `_gc_text`:29788, `_gc_planter`:29803, `_gc_kiosk`:29809, `_goods_color`:29839, `_goods_mat`:29842, `_kiosk_goods`:29846, `_build_grand_central`:29924, `_build_gc_towers`:30092, `_gc_tick`:30187

## 30204-30495  v0.44: filling the empty land

`_loft`:30221, `_fill_clear`:30263, `_build_fill`:30273, `_hg_in_lake`:30321, `_hg_path`:30325, `_floor_note_rot`:30333, `_build_gardens`:30341, `_build_fan_plaza`:30451

## 30496-30530  v0.45: hover car underglow

`_car_underglow`:30499

## 30531-30695  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:30532

## 30696-30727  v0.47: street stalls downtown

`_build_street_stalls`:30700, `_cull_people_in`:30720

## 30728-30826  v0.48: places that open as you level up

`_place_lock_of`:30741, `_place_root`:30747, `_place_unlocked`:30750, `_build_place_signs`:30758, `_places_refresh`:30803, `_places_tick`:30820

## 30827-30986  v0.50: city careers

`_career_rank`:30851, `_career_rank_name`:30858, `_career_mult`:30861, `_career_spots`:30864, `_career_pick`:30891, `_career_block_reason`:30902, `_career_start`:30915, `_career_lights`:30934, `_career_lights_off`:30949, `_career_end`:30958, `_career_clear_job`:30974

## 30987-31335  v0.52: careers as clear job loops

`_cid`:31014, `_career_place_name`:31017, `_career_tag`:31029, `_career_person`:31046, `_cj_pp`:31073, `_cj_anim`:31076, `_cj_pose`:31082, `_cj_pose_tick`:31107, `_cj_hands_up`:31112, `_cj_face`:31115, `_career_fire`:31121, `_career_next`:31185, `_career_target`:31223, `_career_pay`:31233, `_career_rank_line`:31241, `_career_job_done`:31247, `_career_job_failed`:31266, `_career_tick`:31274

## 31336-31451  taxi

`_taxi_meter`:31337, `_taxi_tip`:31357, `_cs_taxi_pickup`:31363, `_taxi_seat`:31396, `_cs_taxi_dropoff`:31408

## 31452-31534  paramedic

`_stretcher`:31453, `_cs_medic_load`:31465, `_cs_medic_unload`:31504

## 31535-31591  police

`_cs_police_radio`:31536, `_career_chase_over`:31549

## 31592-31688  firefighter

`_fire_aimed`:31593, `_fire_hose_tick`:31603, `_cs_fire_out`:31660

## 31689-31786  the step bar

`_career_bar_build`:31690, `_career_steps_bbcode`:31720, `_career_bar_text`:31734, `_career_bar_tick`:31763, `_career_hud`:31780

## 31787-32005  cut scenes

`_cs_play`:31803, `_cs_tick`:31817, `_cs_skip`:31834, `_cs_finish`:31840, `_cs_side_cam`:31856, `_cs_cam`:31875, `_cs_ui`:31889, `_cs_caption`:31940, `_cs_mirror`:31959

## 32006-32043  siren

`_siren_sound`:32007, `_siren`:32029

## 32044-32124  the Careers panel

`_build_career_panel`:32045, `_open_careers`:32084, `_career_ach_line`:32102, `_career_close`:32117, `_career_end_close`:32121

## 32125-32548  v0.50: homes

`_home_door_spots`:32165, `_build_homes`:32180, `_home_labels`:32209, `_home_door_near`:32218, `_home_origin`:32227, `_home_slot_near`:32230, `_home_exit_near`:32241, `_home_btn`:32248, `_home_interact`:32261, `_home_buy`:32280, `_home_default_layout`:32294, `_home_enter`:32302, `_home_leave`:32322, `_hm`:32330, `_home_build_room`:32349, `_home_refresh_room`:32458, `_furni_build`:32472

## 32549-32883  decorating

`_build_home_panels`:32550, `_open_homes`:32595, `_home_row_go`:32605, `_home_panel_close`:32625, `_deco_open`:32629, `_deco_pick`:32652, `_smoke_careers_homes`:32675

## 32884-33018  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:32888, `_home_slots`:32896, `_home_ring`:32923, `_furni_cat`:32929, `_home_fix_layout`:32935, `_home_build_layout`:32963

## 33019-33449  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33080, `_ch_homes`:33086, `_ch_step_text`:33093, `_ch_step_done`:33104, `_ch_target`:33118, `_ch_finish_chapter`:33127, `_chapters_tick`:33149, `_hud_top_stack`:33189, `_build_chapters_ui`:33219, `_chapters_restart_ask`:33261, `_chapters_restart`:33264, `_chapters_text`:33274, `_open_chapters`:33294, `_chapters_close`:33301, `_smoke_chapters`:33305, `_step_sound`:33425

## 33450-33488  v0.51.1: join and leave messages

`_announce_join`:33457, `_announce_already_here`:33476, `_announce_leave`:33484

## 33489-33753  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33505, `_shot_tick`:33511, `_draw_shot_icon`:33543, `_shot_enter`:33552, `_shot_exit`:33566, `_shot_release_controls`:33578, `_shot_stick_zone`:33585, `_shot_input`:33588, `_smoke_photo`:33660

## 33754-34052  v0.51.3: stream joiners

`_viewer_count`:33774, `_stream_join_check`:33780, `_stream_join_start`:33787, `_sj_streamer`:33804, `_stream_join_tick`:33813, `_stream_join_land`:33837, `_sj_welcome`:33853, `_smoke_stream_join`:33887, `_career_shot`:33970

## 34053-34169  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34057, `_st_restore`:34095, `_smoke_streamer_clean`:34116, `_world_bio_passport`:34167

