# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-613  Core (unlabelled)

`_symbol_font`:286, `_ready`:298, `_surf_texture`:556, `_surface_material`:578

## 614-686  v0.34.6: futuristic towers for the old city

`_future_tower`:618

## 687-765  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:694, `_skin_common`:729, `_future_wall`:737, `_future_roof`:751, `_future_pave`:759

## 766-826  v0.34.4: futuristic road surface

`_road_textures`:773, `_future_road`:807

## 827-2035  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:846, `_real_tex`:887, `_real_setup`:895, `_real_kind`:916, `_realify`:922, `_real_glass`:959, `_make_window_textures`:979, `_material`:1012, `_box`:1037, `_sign`:1059, `_build_world`:1071, `_future_kiosk`:1182, `_build_collectibles`:1208, `_auto_collect_tick`:1241, `_find_count`:1262, `_nearest_find`:1269, `_destination`:1283, `_toggle_activity`:1319, `_collect_find`:1348, `_owned_count`:1363, `_ridge_open`:1370, `_ridge_count`:1374, `_nearest_ridge`:1381, `_apply_car`:1395, `_tune_level`:1425, `_tune_cost`:1428, `_car_stats`:1434, `_buy_tune`:1441, `_open_tune`:1462, `_back_to_garage`:1468, `_refresh_tune`:1472, `_bay_open`:1483, `_area_open`:1486, `_bay_count`:1489, `_nearest_bay`:1496, `_build_bay`:1510, `_check_bay`:1563, `_discover_bay`:1576, `_north_count`:1589, `_north_open`:1596, `_nearest_north`:1599, `_check_north`:1613, `_discover_north`:1626, `_prop`:1639, `_collider`:1653, `_first_mesh`:1663, `_scatter`:1672, `_prop_stretch`:1706, `_north_token`:1715, `_nm_roads`:1742, `_prop_big`:1757, `_nm_near_cross`:1773, `_build_north`:1780, `_build_nm_blocks`:1897, `_build_north_landscape`:1982, `_nm_free`:2009, `_build_landscape`:2019

## 2036-2519  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2037, `_online_toggle`:2051, `_online_autostart`:2077, `_online_connect`:2096, `_online_stop`:2103, `_online_next_ref`:2114, `_online_send`:2118, `_online_join_frame`:2122, `_online_pos_frame`:2125, `_online_tick`:2134, `_online_handle`:2168, `_online_clean_name`:2221, `_online_peer_update`:2230, `_online_make_peer`:2299, `_peer_look`:2340, `_online_tint`:2397, `_paint_mat`:2413, `_online_update_peers`:2425, `_online_clear_peers`:2505, `_online_refresh_button`:2510

## 2520-2692  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2600, `_marina_count`:2603, `_nearest_marina`:2610, `_check_marina`:2624, `_discover_marina`:2637, `_shop_available`:2650, `_nearest_shop`:2653, `_premium_cars`:2661, `_glass`:2668, `_shop_building`:2674, `_shop_pad`:2684

## 2693-3208  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2694, `_bus_last`:2697, `_build_bus`:2700, `_bus_boxes`:2727, `_bus_skin`:2737, `_bus_side`:2750, `_bus_reset`:2753, `_bus_text`:2762, `_bus_tick`:2767, `_bus_near`:2807, `_bus_board`:2818, `_bus_alight`:2833, `_build_marina`:2847, `_set_hat`:2953, `_build_hat`:2956, `_cyl`:3021, `_hat_part`:3030, `_apply_avatar`:3039, `_shop_count`:3051, `_shop_open`:3061, `_shop_step`:3079, `_shop_close`:3085, `_owned_text`:3098, `_refresh_shop`:3101, `_shop_action`:3154, `_journal_flip`:3205

## 3209-3263  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3220, `_xp`:3223, `_level_for`:3230, `_level`:3238, `_level_text`:3241, `_check_level`:3251

## 3264-3366  v0.11.0: online police vs thief

`_orole_ready`:3265, `_orole_start`:3268, `_orole_end`:3295, `_orole_tick`:3304

## 3367-4310  v0.10.0: chase mode (offline)

`_chase_open`:3368, `_chase_clear`:3373, `_chase_make_unit`:3387, `_chase_spawn_point`:3417, `_chase_start`:3426, `_chase_end`:3462, `_chase_steer`:3481, `_chase_roadblock`:3517, `_chase_heli_build`:3562, `_chase_extras`:3588, `_chase_tick`:3615, `_start_trial`:3679, `_cancel_trial`:3706, `_check_trial`:3711, `_finish_trial`:3728, `_trial_count`:3744, `_open_trials`:3751, `_refresh_trials`:3755, `_update_gate`:3767, `_slab`:3785, `_build_ridge`:3803, `_check_ridge`:3866, `_discover`:3879, `_mission_progress`:3893, `_check_missions`:3955, `_open_garage`:3966, `_open_journal`:3971, `_close_sub`:3976, `_bar`:3979, `_refresh_garage`:3983, `_garage_step`:4008, `_garage_action`:4012, `_refresh_journal`:4032, `_visited_shops`:4065, `_build_panels`:4072, `_build_player`:4232, `_build_car`:4270, `_try_model`:4299

## 4311-4995  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4312, `_kshader`:4386, `_ksync`:4392, `_kskin`:4407, `_make_kperson`:4413, `_hat_y`:4477, `_sit_drop`:4480, `_kplay`:4483, `_kpeople_tick`:4493, `_pose_person`:4522, `_pose_limbs`:4539, `_person_lift`:4601, `_snap_crowd_feet`:4614, `_people_life_tick`:4630, `_life_one`:4667, `_cull_person`:4677, `_recolor_car_model`:4685, `_apply_car_model`:4699, `_landmark`:4719, `_label`:4729, `_button`:4736, `_panel`:4748, `_build_hud`:4758

## 4996-5114  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:5002, `_menu_tab`:5008, `_watch_tick`:5031, `_watch_count`:5073, `_online_pill_tap`:5080, `_online_pill_tick`:5086, `online_config_ok`:5112

## 5115-5152  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5118, `_offroad`:5124, `_ground_near`:5137, `_collectibles_on_road`:5144

## 5153-5292  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5165, `_build_quest_offer`:5169, `_quest_offer_tick`:5199, `_quest_auto_pick`:5249, `_quest_accept`:5264, `_quest_decline`:5278, `_quest_stop`:5284

## 5293-5660  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5317, `_holo_material`:5326, `_build_future`:5334, `_build_neon`:5348, `_model_profile`:5417, `_model_body_box`:5440, `_build_holograms`:5454, `_holo_tick`:5504, `_build_sky_traffic`:5521, `_sky_hover_car`:5539, `_sky_drone`:5586, `_sky_traffic_tick`:5630, `_future_lights`:5649

## 5661-6160  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5720, `_crew_col`:5728, `_peer_crewmate`:5731, `_set_ring_color`:5734, `_level_color`:5761, `_tier_color`:5774, `_my_ach_tier`:5777, `_style_ring`:5784, `_social_peer_extras`:5832, `_social_tag`:5846, `_my_tag_extra`:5858, `_soc_send`:5871, `_social_msg`:5886, `_social_accept`:5925, `_social_go`:5946, `_soc_friend`:5965, `_soc_invite`:5972, `_soc_goto`:5977, `_soc_high_five`:5985, `_soc_gift`:6005, `_soc_crew_invite`:6022, `_gift_day_check`:6029, `_crew_create`:6035, `_crew_cycle_color`:6045, `_crew_leave`:6050, `_crew_mate_near`:6058, `_crew_board`:6066, `_build_social`:6085, `_social_online`:6147, `_open_social`:6151, `_close_social`:6157

## 6161-6411  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6164, `_track_pos`:6173, `_social_row_button`:6184, `_refresh_social`:6191, `_on_dance_floor`:6253, `_toggle_dance`:6256, `_build_dance_floor`:6264, `_social_tick`:6290, `_photo`:6362

## 6412-6907  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6434, `_game_state`:6442, `_build_arcade`:6454, `_c4_empty`:6505, `_c4_drop_row`:6511, `_c4_winner`:6517, `_c4_bot_move`:6538, `_c4_code`:6567, `_c4_ready`:6573, `_c4_tap`:6576, `_c4_check`:6597, `_c4_tick`:6621, `_rx_ready`:6648, `_rx_start`:6651, `_rx_tap`:6665, `_rx_send_time`:6690, `_rx_resolve`:6697, `_rx_tick`:6723, `_mem_start`:6738, `_mem_tap`:6754, `_mem_finish`:6769, `_mem_tick`:6785, `_mem_board_text`:6792, `_build_arcade_panel`:6803, `_refresh_arcade_panel`:6846

## 6908-7201  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6971, `_quiz_slot`:6974, `_quiz_question`:6984, `_quiz_bot_score`:7013, `_in_quiz`:7022, `_build_quiz`:7025, `_quiz_answer`:7095, `_quiz_msg`:7108, `_quiz_board`:7116, `_quiz_tick`:7126, `_quiz_refresh`:7168

## 7202-8779  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7373, `_sites_found`:7376, `_sites_total`:7379, `_bits`:7382, `_ach_value`:7389, `_ach_tick`:7444, `_ach_check`:7469, `_ach_by_id`:7505, `_ach_msg`:7511, `_build_ach`:7524, `_ach_show`:7555, `_open_ach`:7575, `_close_ach`:7581, `_refresh_ach`:7585, `_ach_num`:7616, `_minimap_tap`:7619, `_menu_go`:7626, `_menu_stay`:7631, `_menu_call_car`:7635, `_toggle_clean_hud`:7641, `_refresh_menu_buttons`:7647, `_clean_hud_tick`:7657, `_draw_joystick`:7698, `_input`:7703, `_touch_text_focus`:7794, `_stick_zone`:7814, `_notification`:7818, `_physics_process`:7835, `_follow_camera`:7986, `_follow_walk_camera`:8022, `_interact`:8045, `_refresh_hud`:8207, `_open_panel`:8336, `_layout_panels`:8366, `_toggle_menu`:8393, `_rescue`:8439, `_show_toast`:8471, `_save_progress`:8475, `_load_progress`:8570

## 8780-11314  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8781, `_radio_voice`:8784, `_radio_make`:8817, `_radio_set`:8888, `_radio_play`:8910, `_radio_next`:8915, `_radio_talk_line`:8919, `_radio_caption`:8940, `_radio_refresh`:8948, `_process`:8961, `_build_peds`:9012, `_update_peds`:9123, `_update_ped`:9142, `_smoke_test`:9196, `_smoke_chase`:9849, `_smoke_orole`:9882, `_smoke_levels`:9911, `_smoke_bus`:9952, `_smoke_chase_extras`:10037, `_smoke_marina`:10065, `_blocked_at`:10167, `_blocker`:10182, `_on_screen`:10195, `_wait_radio`:10200, `_smoke_radio_peds`:10207, `_smoke_typed_chat`:10277, `_smoke_chat_touch`:10296, `_smoke_cafe`:10317, `_smoke_boutique`:10343, `_smoke_models`:10371, `_smoke_garage_ridge`:10395, `_save_shot`:10771, `_infected_shots`:10781, `_paris_shots`:10832, `_people_shots`:11062, `_shots`:11103, `_shot_car`:11297, `_capture_preview`:11307

## 11315-11963  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11382, `_downtown_count`:11385, `_nearest_downtown`:11392, `_check_downtown`:11406, `_discover_downtown`:11419, `_box_batch`:11433, `_model_batch`:11453, `_cut_ranges`:11507, `_dt_ranges`:11519, `_dt_has`:11526, `_dt_near_cross`:11532, `_place`:11538, `_signal_pole`:11549, `_cyl_batch`:11568, `_city_signals`:11592, `_ensure_light_mats`:11643, `_city_lamps`:11653, `_build_downtown`:11697, `_dt_block`:11897, `_downtown_token`:11903, `_build_park`:11920, `_build_plaza`:11949

## 11964-12067  old city and Bay details

`_build_city_detail`:11965

## 12068-12477  traffic

`_build_traffic`:12069, `_path_sample`:12164, `_light_look`:12178, `_light_green`:12186, `_traffic_place`:12190, `_traffic_blocked_by`:12202, `_traffic_tick`:12214, `_smoke_downtown`:12320, `_skyline_shot`:12432, `_skyline_shots`:12440

## 12478-12838  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12524, `_web_scale`:12587, `_web_fps_tick`:12597, `_world_to_uv`:12614, `_map_angle`:12617, `_build_minimap`:12625, `_open_map`:12698, `_close_map`:12709, `_mini_point`:12716, `_site_markers`:12720, `_draw_arrow`:12752, `_draw_minimap`:12759, `_draw_full_map`:12806, `_minimap_tick`:12831

## 12839-13099  camera views

`_build_view_controls`:12840, `_cycle_view`:12882, `_apply_view`:12892, `_hide_labels`:12933, `_unfade`:12939, `_bake_map`:12945, `_shot_stats`:12995, `_view_shots`:12998, `_smoke_views`:13039

## 13100-13347  v0.17.0: level-up celebration

`_build_level_fx`:13111, `_draw_level_rays`:13148, `_level_fx_tick`:13158, `_level_sound`:13163, `_fx_material`:13205, `_level_up_fx`:13213, `_smoke_level_fx`:13314, `_levelup_shots`:13323

## 13348-13467  v0.18.0: walk-in stadium

`_collider_yaw`:13353, `_build_stadium_walls`:13364, `_look`:13392, `_smoke_stadium_eye`:13401, `_stadium_shots`:13437

## 13468-13629  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13492, `_arrow_mesh`:13504, `_build_guidance`:13527, `_guide_target`:13552, `_guidance_tick`:13581, `_draw_hud_arrow`:13607

## 13630-13815  checkpoints

`_build_checkpoints`:13631, `_refresh_checkpoints`:13676, `_check_checkpoints`:13682, `_activate_checkpoint`:13692, `_checkpoint_spawn`:13713, `_spawn_at_checkpoint`:13718, `_draw_checkpoint_icon`:13734, `_smoke_guidance_checkpoints`:13740, `_guide_shots`:13790

## 13816-14094  v0.18.0: Harbor Dome social hub

`_hub_seat`:13874, `_build_hub`:13878

## 14095-14145  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14096, `_xm_mesh`:14105, `_xm_tree`:14113

## 14146-14469  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14149, `_gt_surface`:14164, `_xm_grand_tree`:14174, `_lux_mat`:14289, `_lux_part`:14305, `_lux_box`:14308, `_lux_cyl`:14313, `_lux_ball`:14321, `_lux_new`:14329, `_lux_commit`:14334, `_lux_sofa_mesh`:14338, `_lux_chair_mesh`:14368, `_lux_table_mesh`:14388, `_lux_pouf_mesh`:14403, `_lux_batch`:14418, `_hub_christmas`:14434

## 14470-14625  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14471

## 14626-14874  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14629, `_vx_cyl`:14636, `_vx_ball`:14644, `_vx_ring`:14652, `_hub_polish`:14660, `_hub_gate`:14683, `_hub_vip`:14745, `_hub_glass`:14858

## 14875-15089  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14876, `_build_hub_bots`:14901, `_seat_of`:14932, `_bubble`:14942, `_emote`:14998, `_hub_people_tick`:15012

## 15090-15208  seats

`_seat_taken`:15091, `_nearest_seat`:15099, `_seat_label`:15111, `_sit`:15127, `_stand_up`:15171, `_seated_tick`:15190

## 15209-15365  game panel

`_build_game_panel`:15210, `_open_game_panel`:15265, `_refresh_game_panel`:15284, `_play_robot`:15329, `_peer_at`:15343, `_opponent_name`:15350, `_pay`:15358

## 15366-15486  tic-tac-toe

`_ttt_ready`:15369, `_ttt_winner`:15375, `_ttt_bot_move`:15385, `_ttt_tap`:15411, `_ttt_code`:15431, `_ttt_check`:15437, `_ttt_tick`:15460

## 15487-15538  rock paper scissors

`_rps_ready`:15488, `_rps_pick`:15494, `_rps_resolve`:15512, `_rps_tick`:15536

## 15539-15621  online table messages

`_online_game_send`:15540, `_hub_game_msg`:15546

## 15622-15697  comedy show

`_joke_start`:15623, `_joke_tick`:15635, `_speak`:15661, `_play_rimshot`:15670

## 15698-16597  quick chat and emotes

`_build_chat`:15720, `_chat_toggle_to`:15837, `_chat_log_add`:15845, `_chat_area`:15851, `_chat_near_count`:15869, `_chat_tick`:15878, `_toggle_chat`:15927, `_chat_fit`:15942, `_chat_clean`:15948, `_chat_wrap`:15965, `_chat_send_text`:15987, `_typing`:16010, `_say`:16013, `_do_emote`:16029, `_smoke_hub`:16038, `_chat_shots`:16212, `_cafe_shots`:16237, `_shop_shots`:16285, `_car_shots`:16334, `_outfit_shots`:16365, `_hub_shots`:16413, `_sg_on_terrace`:16548, `_people_only`:16551, `_people_only_keep_cars_out`:16555, `_car_barrier`:16567, `_hub_keep_cars_out`:16581

## 16598-16760  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16607, `_feed_add`:16616, `_feed_render`:16622, `_feed_tick`:16650, `_online_event_send`:16659, `_at_pvp_table`:16666, `_game_name`:16673, `_send_lfp`:16676, `_lfp_msg`:16693, `_accept_invite`:16714

## 16761-17002  v0.18.2: nickname and HUD relayout

`_nick_rude`:16773, `_clean_nick`:16788, `_build_nick_panel`:16800, `_open_nick`:16838, `_random_nick`:16847, `_save_nick`:16853, `_close_nick`:16872, `_refresh_nick_button`:16881, `_relayout_hud`:16885, `_smoke_nick`:16922, `_nick_shots`:16954, `_smoke_sites_reachable`:16972

## 17003-17290  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17029, `_nearest_civic`:17036, `_check_civic`:17050, `_discover_civic`:17063, `_civ_ranges`:17076, `_civ_has`:17090, `_civ_near_cross`:17096, `_build_civic`:17102, `_civic_token`:17228, `_civic_shots`:17245, `_hub_focus`:17267

## 17291-17400  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17362, `_in_rw_lot`:17365, `_box_batch_rot`:17368, `_multi_collider`:17386

## 17401-17728  circuit geometry

`_cr_point`:17402, `_rw_build_path`:17416, `_rw_dir`:17444, `_rw_bend`:17449, `_ribbon`:17455, `_rw_band`:17475, `_rw_keepout`:17493, `_build_raceway`:17502, `_build_rw_parking`:17536, `_build_rw_pits`:17581, `_build_rw_track`:17618, `_build_rw_trackside`:17659

## 17729-17826  race car rental

`_model_key`:17730, `_race_car_start`:17733, `_tint_ghost`:17771, `_race_car_end`:17784, `_race_keep_cars_out`:17809

## 17827-17841  speed effects

`_eff_max`:17828, `_eff_accel`:17839

## 17842-17892  track helpers

`_rw_seg_progress`:17843, `_rw_track_dist`:17863, `_rw_point_dist`:17874, `_rw_player_progress`:17881, `_rw_target`:17887

## 17893-18129  events

`_rec_stop`:17894, `_rw_place`:17910, `_rw_grid_pos`:17917, `_rw_start`:17922, `_rw_spawn_ai`:17954, `_rw_ai_place`:17978, `_rw_tick`:17989, `_rw_ai_tick`:18042, `_rw_lap_done`:18084, `_rw_finish`:18096, `_rw_fmt`:18127

## 18130-18182  boosters and spikes

`_rw_buy`:18131, `_rw_use_boost`:18149, `_rw_use_spike`:18157, `_rw_drop_spike_at`:18168

## 18183-18240  online races

`_race_msg`:18184, `_join_race`:18206

## 18241-18596  raceway panel, HUD, board

`_build_raceway_ui`:18242, `_rw_layout`:18302, `_rw_open`:18309, `_rw_close`:18315, `_rw_refresh_panel`:18319, `_rw_refresh_board`:18332, `_rw_hud`:18344, `_peer_car_model`:18368, `_smoke_raceway`:18378, `_race_shots`:18559

## 18597-18804  v0.22.0: Call Car

`_call_block_reason`:18603, `_call_spot`:18620, `_call_car`:18651, `_play_horn`:18675, `_smoke_follow_call`:18699, `_follow_shots`:18772

## 18805-19262  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18830, `_place_portal_button`:18836, `_portal_pressed`:18843, `_build_travel`:18851, `_toggle_run`:18956, `_refresh_run`:18960, `_hud_v23_tick`:18968, `_travel_block_reason`:19000, `_travel_open`:19020, `_open_travel`:19026, `_open_worlds`:19032, `_open_case`:19038, `_case_step`:19050, `_case_refresh`:19054, `_case_submit`:19058, `_close_case`:19067, `_sky_go`:19071, `_close_worlds`:19081, `_refresh_worlds`:19085, `_world_go`:19091, `_close_travel`:19098, `_refresh_travel`:19102, `_travel_to`:19110, `_smoke_travel`:19137, `_v23_shots`:19175

## 19263-19336  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19270, `_qr_button`:19285, `_qr_layout`:19324, `_smoke_qr`:19330

## 19337-19773  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19357, `_open_crate`:19373, `_build_crate_ui`:19390, `_crate_pick`:19477, `_crate_reveal`:19500, `_crate_draw_car`:19527, `_crate_confetti`:19546, `_crate_sound`:19571, `_crate_drive`:19597, `_feed_add_system`:19627, `_smoke_crate`:19630, `_crate_shots`:19678

## 19774-20265  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19815, `_quick_today`:19820, `_quick_is_done`:19823, `_quick_left`:19826, `_quick_next`:19833, `_quick_fix_target`:19846, `_quick_daily_check`:19860, `_quick_complete`:19874, `_quick_side`:19908, `_build_quick_props`:19926, `_daily_shots`:20078, `_quick_props_refresh`:20120, `_quick_fx`:20124, `_play_coin`:20140, `_smoke_quick`:20157

## 20266-20416  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20275, `_quest_nearby`:20330, `_open_quests`:20337, `_close_quests`:20344, `_refresh_quests`:20348, `_quest_pick`:20374, `_quest_mode`:20388, `_smoke_quests`:20391

## 20417-20451  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20421, `_my_tag_tick`:20424

## 20452-20766  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20469, `_fc_torus`:20479, `_fc_pearl`:20487, `_fc_chrome`:20497, `_fc_glass`:20506, `_fc_glow`:20516, `_fc_ghost`:20525, `_fc_holo`:20537, `_fc_mesh`:20547, `_fc_sphere`:20567, `_fc_capsule`:20575, `_fc_cone`:20583, `_build_food_court`:20592, `_food_court_tick`:20746

## 20767-21088  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20796, `_cm_bench`:20812, `_build_commons`:20825, `_commons_tick`:21047

## 21089-21403  v0.36: the daily puzzle

`_pz_today`:21112, `_pz_new`:21115, `_pz_neighbours`:21160, `_pz_flip`:21170, `_pz_done`:21175, `_pz_tap`:21183, `_pz_win`:21199, `_pz_reset`:21220, `_puzzle_near`:21224, `_open_puzzle`:21229, `_close_puzzle`:21237, `_pz_refresh_sign`:21241, `_build_puzzle_panel`:21249, `_pz_draw`:21280, `_smoke_chat`:21321, `_smoke_feet`:21359, `_smoke_commons`:21380

## 21404-21592  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21466, `_bio_theta`:21470, `_bio_sec_n`:21475, `_bio_sec_of`:21478, `_bio_pt`:21481, `_bio_lp`:21486, `_bio_la`:21490, `_bio_dir`:21494, `_bio_hex_r`:21497, `_bio_apo`:21502, `_bio_open_angles`:21508, `_bio_si`:21518, `_bm`:21524, `_bsph`:21529, `_blow`:21532, `_bcone`:21543, `_bbox`:21546, `_bp`:21549, `_bq`:21554, `_bio_glass_mat`:21558, `_bio_water_mat`:21571, `_bio_mat`:21583

## 21593-21965  building blocks

`_bio_inst`:21594, `_bio_add`:21600, `_bio_model`:21603, `_bio_nature_mesh`:21609, `_bio_flush`:21643, `_bio_bar`:21678, `_bio_slab`:21691, `_bio_body`:21706, `_bio_cyl_col`:21719, `_bio_hexmesh`:21732, `_bio_hexslab`:21744, `_bio_hexpt`:21750, `_bio_gridshell`:21757, `_bio_rail`:21864, `_bio_rail_arc`:21869, `_bio_disc_deck`:21881, `_bio_ring_deck`:21887, `_bio_helix`:21898, `_bio_pillar`:21918, `_bio_cafe`:21924, `_bio_fence_line`:21938, `_bio_fence_seg`:21943, `_bio_pen`:21953

## 21966-22467  building

`_build_biosphere`:21967, `_build_biosphere_legacy`:21971, `_bio_text`:22133, `_bio_plaque`:22151, `_bio_ticket_hall`:22165, `_on_foot_collision_guard`:22221, `_bio_inside`:22231, `_bio_pass_ok`:22234, `_ticket_near`:22238, `_bio_buy_pass`:22243, `_bio_gates_update`:22259, `_bio_gate_tick`:22285, `_bio_tunnel`:22297, `_bio_grounds`:22350, `_bio_dome`:22396, `_bio_deck_mats`:22464

## 22468-22623  garden planting

`_bio_free`:22469, `_bio_spot`:22486, `_bio_garden`:22494, `_bio_pine`:22535, `_bio_tree`:22538, `_bio_big_tree`:22548, `_bio_rock`:22553, `_bio_pond`:22556, `_bio_particles`:22560, `_bio_mist`:22588, `_bio_mini_dome`:22617

## 22624-23031  the four layouts

`_bio_winter`:22625, `_bio_spring`:22717, `_bio_summer`:22842, `_bio_autumn`:22926

## 23032-23302  animals

`_bio_spawn`:23033, `_bio_load_animal`:23105, `_bio_make_quad`:23126, `_bio_load_bird`:23203, `_bio_make_penguin`:23223, `_bio_make_bird`:23245, `_bio_make_flamingo`:23269, `_bio_make_butterfly`:23290

## 23303-23434  animation, spotting and rewards

`_bio_stuck_check`:23308, `_biosphere_tick`:23326, `_bio_animate`:23335, `_bio_spot_check`:23415, `_bio_spotted`:23427, `_smoke_biosphere`:23431

## 23435-23952  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23522, `_wear_piece`:23525, `_wear_mat`:23548, `_person_index`:23564, `_dress`:23587, `_smoke_style`:23693, `_style_shots`:23844, `_npc_look`:23916

## 23953-24106  your look: apply, save, share

`_look_clean`:23957, `_look_pack`:23972, `_owns`:23978, `_apply_look`:23983, `_relic_model`:23994, `_fc_mesh_mat`:24059, `_relic_refresh`:24062, `_relic_tick`:24076, `_peer_style`:24087

## 24107-24534  stores and the wardrobe

`_style_today`:24126, `_style_items`:24129, `_style_cat`:24137, `_style_price`:24140, `_style_deal`:24154, `_style_price_base`:24167, `_relic_stock`:24174, `_build_style_panel`:24186, `_open_store`:24226, `_open_wardrobe`:24245, `_style_close`:24248, `_style_finish`:24252, `_sync_old_avatar`:24267, `_style_tabs_for`:24274, `_refresh_style`:24279, `_style_body_rows`:24430, `_style_set_tab`:24447, `_style_step`:24451, `_style_color`:24456, `_style_pick`:24461, `_style_buy`:24496, `_ach_relics_check`:24518, `_style_face_camera`:24523

## 24535-25002  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24571, `_ga_text`:24577, `_ga_box`:24594, `_build_galleria`:24610, `_ga_inner_tick`:24751, `_ga_shell`:24767, `_ga_inside`:24817, `_bio_cyl_col_on`:24820, `_ga_models`:24832, `_ga_lbox`:24847, `_ga_ltext`:24861, `_ga_store`:24868, `_bio_cafe_on`:24970, `_ga_mannequins`:24978

## 25003-25154  featured outfits and the Sky Run

`_ga_featured_look`:25016, `_build_ga_fun`:25037, `_ga_fun_tick`:25082, `_sky_finish`:25109, `_extra_near`:25128, `_extra_open`:25137, `_store_near`:25146

## 25155-25251  v0.41: THE SKY GARDEN

`_sg_now`:25209, `_sg_progress`:25212, `_sg_time`:25218, `_sg_stock`:25225, `_sg_mut_roll`:25240

## 25252-25389  building

`_sg_box`:25253, `_sg_text`:25259, `_build_sky_garden`:25273, `_sg_seed_spot`:25384, `_sg_codex_spot`:25387

## 25390-25570  plants

`_sg_plant_model`:25391, `_sg_refresh_all`:25496, `_sg_refresh`:25500, `_sky_garden_tick`:25536, `_sg_ready_count`:25555, `_sg_boot_note`:25562

## 25571-25690  interacting

`_sg_near`:25572, `_sg_button_text`:25595, `_sg_value`:25608, `_sg_interact`:25612, `_sg_buy`:25628, `_sg_plant`:25650, `_sg_harvest`:25661

## 25691-25934  the garden screen

`_build_sg_panel`:25692, `_sg_open`:25727, `_sg_close`:25736, `_sg_row`:25740, `_sg_refresh_panel`:25755, `_sg_pick_buy`:25800, `_sg_pick_plant`:25804, `_smoke_car_barriers`:25810, `_smoke_sky_garden`:25851

## 25935-25973  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25966, `_pass_day`:25969

## 25974-26005  album

`_album_pages`:25975, `_album_claim`:25990

## 26006-26057  season

`_season_index`:26007, `_season_tick`:26010, `_season_xp`:26019, `_season_tier`:26022, `_season_reward`:26025, `_season_claim`:26039

## 26058-26065  Harbor Night

`_harbor_night`:26059

## 26066-26097  check-in calendar

`_cal_tick`:26067

## 26098-26274  the panel

`_build_hp_panel`:26099, `_open_pass`:26134, `_hp_open`:26137, `_hp_close`:26144, `_hp_row`:26148, `_hp_bar`:26163, `_hp_refresh`:26167, `_smoke_pass`:26212

## 26275-26489  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26279, `_cash_pill_tick`:26287, `_build_lb`:26325, `_open_lb`:26368, `_close_lb`:26376, `_lb_pick`:26380, `_lb_headers`:26385, `_lb_url`:26389, `_lb_me`:26392, `_lb_tick`:26395, `_lb_upload`:26403, `_lb_fetch`:26413, `_lb_got`:26421, `_lb_value`:26432, `_lb_refresh_ui`:26443

## 26490-26913  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26514, `_market_near`:26591, `_build_gear`:26601, `_gear_piece`:26609, `_build_pet`:26654, `_market_apply`:26696, `_market_tick`:26720, `_build_market_panel`:26742, `_open_market`:26768, `_close_market`:26775, `_refresh_market`:26779, `_market_pick`:26832, `_toggle_board`:26870, `_board_tick`:26877

## 26914-27155  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26946, `_ds_label`:26965, `_build_display`:26979, `_ds_got`:27058, `_ds_sorted`:27067, `_ds_render_board`:27081, `_ds_render_news`:27107, `_display_tick`:27126

## 27156-27334  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27173, `_toggle_streamer`:27260, `_streamer_badge_tap`:27276, `_streamer_tick`:27280

## 27335-27371  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27341, `_car_back`:27348, `_car_park_tick`:27355

## 27372-27468  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27376, `_bus_eta`:27430, `_bus_displays_tick`:27446

## 27469-27760  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27487, `_treasure_pick`:27490, `_treasure_spot`:27499, `_treasure_district`:27503, `_treasure_clue`:27515, `_treasure_prop`:27528, `_tp_part`:27531, `_tp_sphere`:27541, `_tp_cyl`:27549, `_treasure_prop_side`:27558, `_build_treasure_props`:27570, `_build_treasure`:27614, `_treasure_dir_char`:27683, `_treasure_tick`:27692, `_treasure_claim`:27746

## 27761-27861  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27762, `_halo_mat`:27794, `_smoke_treasure`:27819

## 27862-28185  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27883, `_fm_send`:27886, `_fm_area`:27892, `_fm_glow_mesh`:27908, `_fm_block_reason`:27926, `_fm_start`:27938, `_fm_announce`:27966, `_fm_finish`:27969, `_fm_msg`:27987, `_fm_check_paid`:28038, `_fm_tick`:28056, `_smoke_findme`:28112

## 28186-28296  v0.24.2: road map (for moving people off the road)

`_floor_note`:28192, `_floor_disc`:28206, `_floor_top`:28215, `_ground_at`:28233, `_note_road`:28251, `_on_road`:28258, `_ped_curb`:28268, `_curb_spot`:28278

## 28297-28592  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28319, `_ex_grid`:28327, `_ex_lamps`:28362, `_ex_umbrella`:28385, `_ex_yards`:28392, `_build_expansion`:28407, `_expand_shots`:28570

## 28593-28787  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28634, `_v27_near_cross`:28726, `_v27_near_any_road`:28733, `_v27_in_district`:28739, `_sea_tick`:28753, `_sea_tow`:28772

## 28788-29455  Harbor Loop sky train

`_sky_build_path`:28839, `_sky_pos`:28880, `_sky_dir`:28894, `_sky_project`:28899, `_sky_trip_time`:28918, `_sky_trip_dist`:28924, `_sky_now`:28935, `_sky_state`:28938, `_sky_time_at_station`:28953, `_sky_next_arrival`:28960, `_build_skytrain`:28973, `_sky_make_car`:29125, `_sky_skin`:29162, `_sky_place_trains`:29182, `_sky_build_station`:29201, `_sky_near`:29266, `_sky_fmt`:29275, `_sky_enter`:29279, `_sky_leave_platform`:29297, `_sky_board`:29307, `_sky_alight`:29321, `_sky_action`:29335, `_sky_tick`:29352, `_sky_camera`:29392, `_tour_today`:29408, `_tour_stamp`:29411, `_sky_hud`:29434

## 29456-29829  Day and night

`_toggle_weather`:29539, `_refresh_weather_button`:29545, `_game_hour`:29551, `_day_key`:29563, `_night_setup`:29578, `_night_scan_mesh`:29668, `_daynight_tick`:29693, `_daynight_apply`:29702, `_daynight_lights`:29814, `_cycle_day_mode`:29819, `_refresh_time_button`:29826

## 29830-30467  v0.27 smoke test and screenshots

`_smoke_v27`:29831, `_city_shots`:30036

## 30468-30884  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30502, `_ap_plane`:30678, `_ap_truck`:30698, `_ap_baggage_train`:30739, `_ap_loop_pos`:30752, `_ap_loop_len`:30768, `_ap_flight_at`:30774, `_ap_tick`:30798, `_airport_ped_plan`:30821, `_smoke_airport`:30841

## 30885-31398  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30899, `_nav_spot`:30906, `_nav_idx`:30910, `_nav_pos`:30917, `_nav_blocked`:30921, `_nav_nearest_free`:30931, `_nav_bfs`:30959, `_nav_build`:31003, `_stroller`:31074, `_stroll_place`:31090, `_stroll_next`:31111, `_nav_clear_line`:31145, `_stroll_aim`:31156, `_strollers_tick`:31188, `_smoke_strollers`:31283

## 31399-31559  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31434, `_dir_fmt`:31437, `_signpost_spot`:31440, `_build_signposts`:31457

## 31560-31656  the Directions panel and chip

`_build_dir_panel`:31561, `_open_dir`:31603, `_dir_close`:31612, `_dir_pick`:31616, `_dir_stop`:31621, `_dir_stop_and_close`:31626, `_dir_tick`:31630

## 31657-32198  v0.44: Grand Central

`_gc_mesh`:31686, `_gc_mat`:31719, `_gc_glass`:31728, `_gb`:31738, `_gb_solid`:31744, `_gb_flush`:31748, `_gc_tree`:31778, `_gc_text`:31783, `_gc_planter`:31798, `_gc_kiosk`:31804, `_goods_color`:31834, `_goods_mat`:31837, `_kiosk_goods`:31841, `_build_grand_central`:31919, `_build_gc_towers`:32087, `_gc_tick`:32182

## 32199-32490  v0.44: filling the empty land

`_loft`:32216, `_fill_clear`:32258, `_build_fill`:32268, `_hg_in_lake`:32316, `_hg_path`:32320, `_floor_note_rot`:32328, `_build_gardens`:32336, `_build_fan_plaza`:32446

## 32491-32525  v0.45: hover car underglow

`_car_underglow`:32494

## 32526-32690  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32527

## 32691-32722  v0.47: street stalls downtown

`_build_street_stalls`:32695, `_cull_people_in`:32715

## 32723-32821  v0.48: places that open as you level up

`_place_lock_of`:32736, `_place_root`:32742, `_place_unlocked`:32745, `_build_place_signs`:32753, `_places_refresh`:32798, `_places_tick`:32815

## 32822-32866  v0.50: city careers

`_career_rank_name`:32847, `_career_mult`:32850, `_career_block_reason`:32855, `_career_start`:32858, `_career_end`:32863

## 32867-32917  v0.52: careers as clear job loops

`_cid`:32894, `_career_target`:32908, `_career_tick`:32915

## 32918-32925  taxi

`_taxi_meter`:32919

## 32926-32929  paramedic

(no functions)

## 32930-32934  police

`_career_chase_over`:32932

## 32935-32940  firefighter

`_fire_aimed`:32936

## 32941-32950  the step bar

`_career_bar_text`:32944, `_career_hud`:32948

## 32951-32977  cut scenes

`_cs_skip`:32969

## 32978-32982  siren

(no functions)

## 32983-32994  the Careers panel

`_build_career_panel`:32984, `_open_careers`:32987, `_career_close`:32991

## 32995-33418  v0.50: homes

`_home_door_spots`:33035, `_build_homes`:33050, `_home_labels`:33079, `_home_door_near`:33088, `_home_origin`:33097, `_home_slot_near`:33100, `_home_exit_near`:33111, `_home_btn`:33118, `_home_interact`:33131, `_home_buy`:33150, `_home_default_layout`:33164, `_home_enter`:33172, `_home_leave`:33192, `_hm`:33200, `_home_build_room`:33219, `_home_refresh_room`:33328, `_furni_build`:33342

## 33419-33754  decorating

`_build_home_panels`:33420, `_open_homes`:33465, `_home_row_go`:33475, `_home_panel_close`:33495, `_deco_open`:33499, `_deco_pick`:33522, `_smoke_careers_homes`:33545

## 33755-33889  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33759, `_home_slots`:33767, `_home_ring`:33794, `_furni_cat`:33800, `_home_fix_layout`:33806, `_home_build_layout`:33834

## 33890-34323  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33953, `_ch_homes`:33959, `_ch_step_text`:33966, `_ch_step_done`:33977, `_ch_target`:33991, `_ch_finish_chapter`:34000, `_chapters_tick`:34022, `_hud_top_stack`:34062, `_build_chapters_ui`:34092, `_chapters_restart_ask`:34134, `_chapters_restart`:34137, `_chapters_text`:34147, `_open_chapters`:34167, `_chapters_close`:34174, `_smoke_chapters`:34178, `_step_sound`:34299

## 34324-34362  v0.51.1: join and leave messages

`_announce_join`:34331, `_announce_already_here`:34350, `_announce_leave`:34358

## 34363-34627  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34379, `_shot_tick`:34385, `_draw_shot_icon`:34417, `_shot_enter`:34426, `_shot_exit`:34440, `_shot_release_controls`:34452, `_shot_stick_zone`:34459, `_shot_input`:34462, `_smoke_photo`:34534

## 34628-34926  v0.51.3: stream joiners

`_viewer_count`:34648, `_stream_join_check`:34654, `_stream_join_start`:34661, `_sj_streamer`:34678, `_stream_join_tick`:34687, `_stream_join_land`:34711, `_sj_welcome`:34727, `_smoke_stream_join`:34761, `_career_shot`:34844

## 34927-35043  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34931, `_st_restore`:34969, `_smoke_streamer_clean`:34990, `_world_bio_passport`:35041

