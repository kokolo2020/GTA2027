# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-602  Core (unlabelled)

`_symbol_font`:282, `_ready`:294, `_surf_texture`:545, `_surface_material`:567

## 603-675  v0.34.6: futuristic towers for the old city

`_future_tower`:607

## 676-754  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:683, `_skin_common`:718, `_future_wall`:726, `_future_roof`:740, `_future_pave`:748

## 755-815  v0.34.4: futuristic road surface

`_road_textures`:762, `_future_road`:796

## 816-2024  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:835, `_real_tex`:876, `_real_setup`:884, `_real_kind`:905, `_realify`:911, `_real_glass`:948, `_make_window_textures`:968, `_material`:1001, `_box`:1026, `_sign`:1048, `_build_world`:1060, `_future_kiosk`:1171, `_build_collectibles`:1197, `_auto_collect_tick`:1230, `_find_count`:1251, `_nearest_find`:1258, `_destination`:1272, `_toggle_activity`:1308, `_collect_find`:1337, `_owned_count`:1352, `_ridge_open`:1359, `_ridge_count`:1363, `_nearest_ridge`:1370, `_apply_car`:1384, `_tune_level`:1414, `_tune_cost`:1417, `_car_stats`:1423, `_buy_tune`:1430, `_open_tune`:1451, `_back_to_garage`:1457, `_refresh_tune`:1461, `_bay_open`:1472, `_area_open`:1475, `_bay_count`:1478, `_nearest_bay`:1485, `_build_bay`:1499, `_check_bay`:1552, `_discover_bay`:1565, `_north_count`:1578, `_north_open`:1585, `_nearest_north`:1588, `_check_north`:1602, `_discover_north`:1615, `_prop`:1628, `_collider`:1642, `_first_mesh`:1652, `_scatter`:1661, `_prop_stretch`:1695, `_north_token`:1704, `_nm_roads`:1731, `_prop_big`:1746, `_nm_near_cross`:1762, `_build_north`:1769, `_build_nm_blocks`:1886, `_build_north_landscape`:1971, `_nm_free`:1998, `_build_landscape`:2008

## 2025-2508  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2026, `_online_toggle`:2040, `_online_autostart`:2066, `_online_connect`:2085, `_online_stop`:2092, `_online_next_ref`:2103, `_online_send`:2107, `_online_join_frame`:2111, `_online_pos_frame`:2114, `_online_tick`:2123, `_online_handle`:2157, `_online_clean_name`:2210, `_online_peer_update`:2219, `_online_make_peer`:2288, `_peer_look`:2329, `_online_tint`:2386, `_paint_mat`:2402, `_online_update_peers`:2414, `_online_clear_peers`:2494, `_online_refresh_button`:2499

## 2509-2681  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2589, `_marina_count`:2592, `_nearest_marina`:2599, `_check_marina`:2613, `_discover_marina`:2626, `_shop_available`:2639, `_nearest_shop`:2642, `_premium_cars`:2650, `_glass`:2657, `_shop_building`:2663, `_shop_pad`:2673

## 2682-3197  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2683, `_bus_last`:2686, `_build_bus`:2689, `_bus_boxes`:2716, `_bus_skin`:2726, `_bus_side`:2739, `_bus_reset`:2742, `_bus_text`:2751, `_bus_tick`:2756, `_bus_near`:2796, `_bus_board`:2807, `_bus_alight`:2822, `_build_marina`:2836, `_set_hat`:2942, `_build_hat`:2945, `_cyl`:3010, `_hat_part`:3019, `_apply_avatar`:3028, `_shop_count`:3040, `_shop_open`:3050, `_shop_step`:3068, `_shop_close`:3074, `_owned_text`:3087, `_refresh_shop`:3090, `_shop_action`:3143, `_journal_flip`:3194

## 3198-3252  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3209, `_xp`:3212, `_level_for`:3219, `_level`:3227, `_level_text`:3230, `_check_level`:3240

## 3253-3355  v0.11.0: online police vs thief

`_orole_ready`:3254, `_orole_start`:3257, `_orole_end`:3284, `_orole_tick`:3293

## 3356-4299  v0.10.0: chase mode (offline)

`_chase_open`:3357, `_chase_clear`:3362, `_chase_make_unit`:3376, `_chase_spawn_point`:3406, `_chase_start`:3415, `_chase_end`:3451, `_chase_steer`:3470, `_chase_roadblock`:3506, `_chase_heli_build`:3551, `_chase_extras`:3577, `_chase_tick`:3604, `_start_trial`:3668, `_cancel_trial`:3695, `_check_trial`:3700, `_finish_trial`:3717, `_trial_count`:3733, `_open_trials`:3740, `_refresh_trials`:3744, `_update_gate`:3756, `_slab`:3774, `_build_ridge`:3792, `_check_ridge`:3855, `_discover`:3868, `_mission_progress`:3882, `_check_missions`:3944, `_open_garage`:3955, `_open_journal`:3960, `_close_sub`:3965, `_bar`:3968, `_refresh_garage`:3972, `_garage_step`:3997, `_garage_action`:4001, `_refresh_journal`:4021, `_visited_shops`:4054, `_build_panels`:4061, `_build_player`:4221, `_build_car`:4259, `_try_model`:4288

## 4300-4984  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4301, `_kshader`:4375, `_ksync`:4381, `_kskin`:4396, `_make_kperson`:4402, `_hat_y`:4466, `_sit_drop`:4469, `_kplay`:4472, `_kpeople_tick`:4482, `_pose_person`:4511, `_pose_limbs`:4528, `_person_lift`:4590, `_snap_crowd_feet`:4603, `_people_life_tick`:4619, `_life_one`:4656, `_cull_person`:4666, `_recolor_car_model`:4674, `_apply_car_model`:4688, `_landmark`:4708, `_label`:4718, `_button`:4725, `_panel`:4737, `_build_hud`:4747

## 4985-5103  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4991, `_menu_tab`:4997, `_watch_tick`:5020, `_watch_count`:5062, `_online_pill_tap`:5069, `_online_pill_tick`:5075, `online_config_ok`:5101

## 5104-5141  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5107, `_offroad`:5113, `_ground_near`:5126, `_collectibles_on_road`:5133

## 5142-5281  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5154, `_build_quest_offer`:5158, `_quest_offer_tick`:5188, `_quest_auto_pick`:5238, `_quest_accept`:5253, `_quest_decline`:5267, `_quest_stop`:5273

## 5282-5649  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5306, `_holo_material`:5315, `_build_future`:5323, `_build_neon`:5337, `_model_profile`:5406, `_model_body_box`:5429, `_build_holograms`:5443, `_holo_tick`:5493, `_build_sky_traffic`:5510, `_sky_hover_car`:5528, `_sky_drone`:5575, `_sky_traffic_tick`:5619, `_future_lights`:5638

## 5650-6149  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5709, `_crew_col`:5717, `_peer_crewmate`:5720, `_set_ring_color`:5723, `_level_color`:5750, `_tier_color`:5763, `_my_ach_tier`:5766, `_style_ring`:5773, `_social_peer_extras`:5821, `_social_tag`:5835, `_my_tag_extra`:5847, `_soc_send`:5860, `_social_msg`:5875, `_social_accept`:5914, `_social_go`:5935, `_soc_friend`:5954, `_soc_invite`:5961, `_soc_goto`:5966, `_soc_high_five`:5974, `_soc_gift`:5994, `_soc_crew_invite`:6011, `_gift_day_check`:6018, `_crew_create`:6024, `_crew_cycle_color`:6034, `_crew_leave`:6039, `_crew_mate_near`:6047, `_crew_board`:6055, `_build_social`:6074, `_social_online`:6136, `_open_social`:6140, `_close_social`:6146

## 6150-6400  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6153, `_track_pos`:6162, `_social_row_button`:6173, `_refresh_social`:6180, `_on_dance_floor`:6242, `_toggle_dance`:6245, `_build_dance_floor`:6253, `_social_tick`:6279, `_photo`:6351

## 6401-6896  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6423, `_game_state`:6431, `_build_arcade`:6443, `_c4_empty`:6494, `_c4_drop_row`:6500, `_c4_winner`:6506, `_c4_bot_move`:6527, `_c4_code`:6556, `_c4_ready`:6562, `_c4_tap`:6565, `_c4_check`:6586, `_c4_tick`:6610, `_rx_ready`:6637, `_rx_start`:6640, `_rx_tap`:6654, `_rx_send_time`:6679, `_rx_resolve`:6686, `_rx_tick`:6712, `_mem_start`:6727, `_mem_tap`:6743, `_mem_finish`:6758, `_mem_tick`:6774, `_mem_board_text`:6781, `_build_arcade_panel`:6792, `_refresh_arcade_panel`:6835

## 6897-7190  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6960, `_quiz_slot`:6963, `_quiz_question`:6973, `_quiz_bot_score`:7002, `_in_quiz`:7011, `_build_quiz`:7014, `_quiz_answer`:7084, `_quiz_msg`:7097, `_quiz_board`:7105, `_quiz_tick`:7115, `_quiz_refresh`:7157

## 7191-8749  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7362, `_sites_found`:7365, `_sites_total`:7368, `_bits`:7371, `_ach_value`:7378, `_ach_tick`:7433, `_ach_check`:7458, `_ach_by_id`:7494, `_ach_msg`:7500, `_build_ach`:7513, `_ach_show`:7544, `_open_ach`:7564, `_close_ach`:7570, `_refresh_ach`:7574, `_ach_num`:7605, `_minimap_tap`:7608, `_menu_go`:7615, `_menu_stay`:7620, `_menu_call_car`:7624, `_toggle_clean_hud`:7630, `_refresh_menu_buttons`:7636, `_clean_hud_tick`:7646, `_draw_joystick`:7687, `_input`:7692, `_touch_text_focus`:7779, `_stick_zone`:7799, `_notification`:7803, `_physics_process`:7818, `_follow_camera`:7966, `_follow_walk_camera`:8002, `_interact`:8025, `_refresh_hud`:8187, `_open_panel`:8316, `_layout_panels`:8344, `_toggle_menu`:8369, `_rescue`:8413, `_show_toast`:8445, `_save_progress`:8449, `_load_progress`:8542

## 8750-11069  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8751, `_radio_voice`:8754, `_radio_make`:8787, `_radio_set`:8858, `_radio_play`:8880, `_radio_next`:8885, `_radio_talk_line`:8889, `_radio_caption`:8910, `_radio_refresh`:8918, `_process`:8931, `_build_peds`:8982, `_update_peds`:9093, `_update_ped`:9112, `_smoke_test`:9166, `_smoke_chase`:9809, `_smoke_orole`:9842, `_smoke_levels`:9871, `_smoke_bus`:9912, `_smoke_chase_extras`:9997, `_smoke_marina`:10025, `_blocked_at`:10127, `_blocker`:10142, `_on_screen`:10155, `_wait_radio`:10160, `_smoke_radio_peds`:10167, `_smoke_typed_chat`:10237, `_smoke_chat_touch`:10256, `_smoke_cafe`:10277, `_smoke_boutique`:10303, `_smoke_models`:10331, `_smoke_garage_ridge`:10355, `_save_shot`:10731, `_paris_shots`:10741, `_people_shots`:10817, `_shots`:10858, `_shot_car`:11052, `_capture_preview`:11062

## 11070-11718  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11137, `_downtown_count`:11140, `_nearest_downtown`:11147, `_check_downtown`:11161, `_discover_downtown`:11174, `_box_batch`:11188, `_model_batch`:11208, `_cut_ranges`:11262, `_dt_ranges`:11274, `_dt_has`:11281, `_dt_near_cross`:11287, `_place`:11293, `_signal_pole`:11304, `_cyl_batch`:11323, `_city_signals`:11347, `_ensure_light_mats`:11398, `_city_lamps`:11408, `_build_downtown`:11452, `_dt_block`:11652, `_downtown_token`:11658, `_build_park`:11675, `_build_plaza`:11704

## 11719-11822  old city and Bay details

`_build_city_detail`:11720

## 11823-12232  traffic

`_build_traffic`:11824, `_path_sample`:11919, `_light_look`:11933, `_light_green`:11941, `_traffic_place`:11945, `_traffic_blocked_by`:11957, `_traffic_tick`:11969, `_smoke_downtown`:12075, `_skyline_shot`:12187, `_skyline_shots`:12195

## 12233-12593  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12279, `_web_scale`:12342, `_web_fps_tick`:12352, `_world_to_uv`:12369, `_map_angle`:12372, `_build_minimap`:12380, `_open_map`:12453, `_close_map`:12464, `_mini_point`:12471, `_site_markers`:12475, `_draw_arrow`:12507, `_draw_minimap`:12514, `_draw_full_map`:12561, `_minimap_tick`:12586

## 12594-12851  camera views

`_build_view_controls`:12595, `_cycle_view`:12637, `_apply_view`:12647, `_hide_labels`:12685, `_unfade`:12691, `_bake_map`:12697, `_shot_stats`:12747, `_view_shots`:12750, `_smoke_views`:12791

## 12852-13099  v0.17.0: level-up celebration

`_build_level_fx`:12863, `_draw_level_rays`:12900, `_level_fx_tick`:12910, `_level_sound`:12915, `_fx_material`:12957, `_level_up_fx`:12965, `_smoke_level_fx`:13066, `_levelup_shots`:13075

## 13100-13219  v0.18.0: walk-in stadium

`_collider_yaw`:13105, `_build_stadium_walls`:13116, `_look`:13144, `_smoke_stadium_eye`:13153, `_stadium_shots`:13189

## 13220-13381  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13244, `_arrow_mesh`:13256, `_build_guidance`:13279, `_guide_target`:13304, `_guidance_tick`:13333, `_draw_hud_arrow`:13359

## 13382-13567  checkpoints

`_build_checkpoints`:13383, `_refresh_checkpoints`:13428, `_check_checkpoints`:13434, `_activate_checkpoint`:13444, `_checkpoint_spawn`:13465, `_spawn_at_checkpoint`:13470, `_draw_checkpoint_icon`:13486, `_smoke_guidance_checkpoints`:13492, `_guide_shots`:13542

## 13568-13846  v0.18.0: Harbor Dome social hub

`_hub_seat`:13626, `_build_hub`:13630

## 13847-13897  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13848, `_xm_mesh`:13857, `_xm_tree`:13865

## 13898-14221  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13901, `_gt_surface`:13916, `_xm_grand_tree`:13926, `_lux_mat`:14041, `_lux_part`:14057, `_lux_box`:14060, `_lux_cyl`:14065, `_lux_ball`:14073, `_lux_new`:14081, `_lux_commit`:14086, `_lux_sofa_mesh`:14090, `_lux_chair_mesh`:14120, `_lux_table_mesh`:14140, `_lux_pouf_mesh`:14155, `_lux_batch`:14170, `_hub_christmas`:14186

## 14222-14377  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14223

## 14378-14626  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14381, `_vx_cyl`:14388, `_vx_ball`:14396, `_vx_ring`:14404, `_hub_polish`:14412, `_hub_gate`:14435, `_hub_vip`:14497, `_hub_glass`:14610

## 14627-14841  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14628, `_build_hub_bots`:14653, `_seat_of`:14684, `_bubble`:14694, `_emote`:14750, `_hub_people_tick`:14764

## 14842-14960  seats

`_seat_taken`:14843, `_nearest_seat`:14851, `_seat_label`:14863, `_sit`:14879, `_stand_up`:14923, `_seated_tick`:14942

## 14961-15117  game panel

`_build_game_panel`:14962, `_open_game_panel`:15017, `_refresh_game_panel`:15036, `_play_robot`:15081, `_peer_at`:15095, `_opponent_name`:15102, `_pay`:15110

## 15118-15238  tic-tac-toe

`_ttt_ready`:15121, `_ttt_winner`:15127, `_ttt_bot_move`:15137, `_ttt_tap`:15163, `_ttt_code`:15183, `_ttt_check`:15189, `_ttt_tick`:15212

## 15239-15290  rock paper scissors

`_rps_ready`:15240, `_rps_pick`:15246, `_rps_resolve`:15264, `_rps_tick`:15288

## 15291-15373  online table messages

`_online_game_send`:15292, `_hub_game_msg`:15298

## 15374-15449  comedy show

`_joke_start`:15375, `_joke_tick`:15387, `_speak`:15413, `_play_rimshot`:15422

## 15450-16349  quick chat and emotes

`_build_chat`:15472, `_chat_toggle_to`:15589, `_chat_log_add`:15597, `_chat_area`:15603, `_chat_near_count`:15621, `_chat_tick`:15630, `_toggle_chat`:15679, `_chat_fit`:15694, `_chat_clean`:15700, `_chat_wrap`:15717, `_chat_send_text`:15739, `_typing`:15762, `_say`:15765, `_do_emote`:15781, `_smoke_hub`:15790, `_chat_shots`:15964, `_cafe_shots`:15989, `_shop_shots`:16037, `_car_shots`:16086, `_outfit_shots`:16117, `_hub_shots`:16165, `_sg_on_terrace`:16300, `_people_only`:16303, `_people_only_keep_cars_out`:16307, `_car_barrier`:16319, `_hub_keep_cars_out`:16333

## 16350-16512  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16359, `_feed_add`:16368, `_feed_render`:16374, `_feed_tick`:16402, `_online_event_send`:16411, `_at_pvp_table`:16418, `_game_name`:16425, `_send_lfp`:16428, `_lfp_msg`:16445, `_accept_invite`:16466

## 16513-16754  v0.18.2: nickname and HUD relayout

`_nick_rude`:16525, `_clean_nick`:16540, `_build_nick_panel`:16552, `_open_nick`:16590, `_random_nick`:16599, `_save_nick`:16605, `_close_nick`:16624, `_refresh_nick_button`:16633, `_relayout_hud`:16637, `_smoke_nick`:16674, `_nick_shots`:16706, `_smoke_sites_reachable`:16724

## 16755-17042  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16781, `_nearest_civic`:16788, `_check_civic`:16802, `_discover_civic`:16815, `_civ_ranges`:16828, `_civ_has`:16842, `_civ_near_cross`:16848, `_build_civic`:16854, `_civic_token`:16980, `_civic_shots`:16997, `_hub_focus`:17019

## 17043-17152  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17114, `_in_rw_lot`:17117, `_box_batch_rot`:17120, `_multi_collider`:17138

## 17153-17480  circuit geometry

`_cr_point`:17154, `_rw_build_path`:17168, `_rw_dir`:17196, `_rw_bend`:17201, `_ribbon`:17207, `_rw_band`:17227, `_rw_keepout`:17245, `_build_raceway`:17254, `_build_rw_parking`:17288, `_build_rw_pits`:17333, `_build_rw_track`:17370, `_build_rw_trackside`:17411

## 17481-17578  race car rental

`_model_key`:17482, `_race_car_start`:17485, `_tint_ghost`:17523, `_race_car_end`:17536, `_race_keep_cars_out`:17561

## 17579-17593  speed effects

`_eff_max`:17580, `_eff_accel`:17591

## 17594-17644  track helpers

`_rw_seg_progress`:17595, `_rw_track_dist`:17615, `_rw_point_dist`:17626, `_rw_player_progress`:17633, `_rw_target`:17639

## 17645-17881  events

`_rec_stop`:17646, `_rw_place`:17662, `_rw_grid_pos`:17669, `_rw_start`:17674, `_rw_spawn_ai`:17706, `_rw_ai_place`:17730, `_rw_tick`:17741, `_rw_ai_tick`:17794, `_rw_lap_done`:17836, `_rw_finish`:17848, `_rw_fmt`:17879

## 17882-17934  boosters and spikes

`_rw_buy`:17883, `_rw_use_boost`:17901, `_rw_use_spike`:17909, `_rw_drop_spike_at`:17920

## 17935-17992  online races

`_race_msg`:17936, `_join_race`:17958

## 17993-18348  raceway panel, HUD, board

`_build_raceway_ui`:17994, `_rw_layout`:18054, `_rw_open`:18061, `_rw_close`:18067, `_rw_refresh_panel`:18071, `_rw_refresh_board`:18084, `_rw_hud`:18096, `_peer_car_model`:18120, `_smoke_raceway`:18130, `_race_shots`:18311

## 18349-18556  v0.22.0: Call Car

`_call_block_reason`:18355, `_call_spot`:18372, `_call_car`:18403, `_play_horn`:18427, `_smoke_follow_call`:18451, `_follow_shots`:18524

## 18557-18926  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18576, `_place_portal_button`:18582, `_portal_pressed`:18589, `_build_travel`:18597, `_toggle_run`:18664, `_refresh_run`:18668, `_hud_v23_tick`:18676, `_travel_block_reason`:18708, `_travel_open`:18728, `_open_travel`:18734, `_open_worlds`:18740, `_close_worlds`:18746, `_refresh_worlds`:18750, `_world_go`:18755, `_close_travel`:18762, `_refresh_travel`:18766, `_travel_to`:18774, `_smoke_travel`:18801, `_v23_shots`:18839

## 18927-19000  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:18934, `_qr_button`:18949, `_qr_layout`:18988, `_smoke_qr`:18994

## 19001-19437  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19021, `_open_crate`:19037, `_build_crate_ui`:19054, `_crate_pick`:19141, `_crate_reveal`:19164, `_crate_draw_car`:19191, `_crate_confetti`:19210, `_crate_sound`:19235, `_crate_drive`:19261, `_feed_add_system`:19291, `_smoke_crate`:19294, `_crate_shots`:19342

## 19438-19929  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19479, `_quick_today`:19484, `_quick_is_done`:19487, `_quick_left`:19490, `_quick_next`:19497, `_quick_fix_target`:19510, `_quick_daily_check`:19524, `_quick_complete`:19538, `_quick_side`:19572, `_build_quick_props`:19590, `_daily_shots`:19742, `_quick_props_refresh`:19784, `_quick_fx`:19788, `_play_coin`:19804, `_smoke_quick`:19821

## 19930-20080  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:19939, `_quest_nearby`:19994, `_open_quests`:20001, `_close_quests`:20008, `_refresh_quests`:20012, `_quest_pick`:20038, `_quest_mode`:20052, `_smoke_quests`:20055

## 20081-20115  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20085, `_my_tag_tick`:20088

## 20116-20430  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20133, `_fc_torus`:20143, `_fc_pearl`:20151, `_fc_chrome`:20161, `_fc_glass`:20170, `_fc_glow`:20180, `_fc_ghost`:20189, `_fc_holo`:20201, `_fc_mesh`:20211, `_fc_sphere`:20231, `_fc_capsule`:20239, `_fc_cone`:20247, `_build_food_court`:20256, `_food_court_tick`:20410

## 20431-20752  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20460, `_cm_bench`:20476, `_build_commons`:20489, `_commons_tick`:20711

## 20753-21067  v0.36: the daily puzzle

`_pz_today`:20776, `_pz_new`:20779, `_pz_neighbours`:20824, `_pz_flip`:20834, `_pz_done`:20839, `_pz_tap`:20847, `_pz_win`:20863, `_pz_reset`:20884, `_puzzle_near`:20888, `_open_puzzle`:20893, `_close_puzzle`:20901, `_pz_refresh_sign`:20905, `_build_puzzle_panel`:20913, `_pz_draw`:20944, `_smoke_chat`:20985, `_smoke_feet`:21023, `_smoke_commons`:21044

## 21068-21256  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21130, `_bio_theta`:21134, `_bio_sec_n`:21139, `_bio_sec_of`:21142, `_bio_pt`:21145, `_bio_lp`:21150, `_bio_la`:21154, `_bio_dir`:21158, `_bio_hex_r`:21161, `_bio_apo`:21166, `_bio_open_angles`:21172, `_bio_si`:21182, `_bm`:21188, `_bsph`:21193, `_blow`:21196, `_bcone`:21207, `_bbox`:21210, `_bp`:21213, `_bq`:21218, `_bio_glass_mat`:21222, `_bio_water_mat`:21235, `_bio_mat`:21247

## 21257-21629  building blocks

`_bio_inst`:21258, `_bio_add`:21264, `_bio_model`:21267, `_bio_nature_mesh`:21273, `_bio_flush`:21307, `_bio_bar`:21342, `_bio_slab`:21355, `_bio_body`:21370, `_bio_cyl_col`:21383, `_bio_hexmesh`:21396, `_bio_hexslab`:21408, `_bio_hexpt`:21414, `_bio_gridshell`:21421, `_bio_rail`:21528, `_bio_rail_arc`:21533, `_bio_disc_deck`:21545, `_bio_ring_deck`:21551, `_bio_helix`:21562, `_bio_pillar`:21582, `_bio_cafe`:21588, `_bio_fence_line`:21602, `_bio_fence_seg`:21607, `_bio_pen`:21617

## 21630-22131  building

`_build_biosphere`:21631, `_build_biosphere_legacy`:21635, `_bio_text`:21797, `_bio_plaque`:21815, `_bio_ticket_hall`:21829, `_on_foot_collision_guard`:21885, `_bio_inside`:21895, `_bio_pass_ok`:21898, `_ticket_near`:21902, `_bio_buy_pass`:21907, `_bio_gates_update`:21923, `_bio_gate_tick`:21949, `_bio_tunnel`:21961, `_bio_grounds`:22014, `_bio_dome`:22060, `_bio_deck_mats`:22128

## 22132-22287  garden planting

`_bio_free`:22133, `_bio_spot`:22150, `_bio_garden`:22158, `_bio_pine`:22199, `_bio_tree`:22202, `_bio_big_tree`:22212, `_bio_rock`:22217, `_bio_pond`:22220, `_bio_particles`:22224, `_bio_mist`:22252, `_bio_mini_dome`:22281

## 22288-22695  the four layouts

`_bio_winter`:22289, `_bio_spring`:22381, `_bio_summer`:22506, `_bio_autumn`:22590

## 22696-22966  animals

`_bio_spawn`:22697, `_bio_load_animal`:22769, `_bio_make_quad`:22790, `_bio_load_bird`:22867, `_bio_make_penguin`:22887, `_bio_make_bird`:22909, `_bio_make_flamingo`:22933, `_bio_make_butterfly`:22954

## 22967-23098  animation, spotting and rewards

`_bio_stuck_check`:22972, `_biosphere_tick`:22990, `_bio_animate`:22999, `_bio_spot_check`:23079, `_bio_spotted`:23091, `_smoke_biosphere`:23095

## 23099-23616  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23186, `_wear_piece`:23189, `_wear_mat`:23212, `_person_index`:23228, `_dress`:23251, `_smoke_style`:23357, `_style_shots`:23508, `_npc_look`:23580

## 23617-23770  your look: apply, save, share

`_look_clean`:23621, `_look_pack`:23636, `_owns`:23642, `_apply_look`:23647, `_relic_model`:23658, `_fc_mesh_mat`:23723, `_relic_refresh`:23726, `_relic_tick`:23740, `_peer_style`:23751

## 23771-24198  stores and the wardrobe

`_style_today`:23790, `_style_items`:23793, `_style_cat`:23801, `_style_price`:23804, `_style_deal`:23818, `_style_price_base`:23831, `_relic_stock`:23838, `_build_style_panel`:23850, `_open_store`:23890, `_open_wardrobe`:23909, `_style_close`:23912, `_style_finish`:23916, `_sync_old_avatar`:23931, `_style_tabs_for`:23938, `_refresh_style`:23943, `_style_body_rows`:24094, `_style_set_tab`:24111, `_style_step`:24115, `_style_color`:24120, `_style_pick`:24125, `_style_buy`:24160, `_ach_relics_check`:24182, `_style_face_camera`:24187

## 24199-24666  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24235, `_ga_text`:24241, `_ga_box`:24258, `_build_galleria`:24274, `_ga_inner_tick`:24415, `_ga_shell`:24431, `_ga_inside`:24481, `_bio_cyl_col_on`:24484, `_ga_models`:24496, `_ga_lbox`:24511, `_ga_ltext`:24525, `_ga_store`:24532, `_bio_cafe_on`:24634, `_ga_mannequins`:24642

## 24667-24818  featured outfits and the Sky Run

`_ga_featured_look`:24680, `_build_ga_fun`:24701, `_ga_fun_tick`:24746, `_sky_finish`:24773, `_extra_near`:24792, `_extra_open`:24801, `_store_near`:24810

## 24819-24915  v0.41: THE SKY GARDEN

`_sg_now`:24873, `_sg_progress`:24876, `_sg_time`:24882, `_sg_stock`:24889, `_sg_mut_roll`:24904

## 24916-25053  building

`_sg_box`:24917, `_sg_text`:24923, `_build_sky_garden`:24937, `_sg_seed_spot`:25048, `_sg_codex_spot`:25051

## 25054-25234  plants

`_sg_plant_model`:25055, `_sg_refresh_all`:25160, `_sg_refresh`:25164, `_sky_garden_tick`:25200, `_sg_ready_count`:25219, `_sg_boot_note`:25226

## 25235-25354  interacting

`_sg_near`:25236, `_sg_button_text`:25259, `_sg_value`:25272, `_sg_interact`:25276, `_sg_buy`:25292, `_sg_plant`:25314, `_sg_harvest`:25325

## 25355-25598  the garden screen

`_build_sg_panel`:25356, `_sg_open`:25391, `_sg_close`:25400, `_sg_row`:25404, `_sg_refresh_panel`:25419, `_sg_pick_buy`:25464, `_sg_pick_plant`:25468, `_smoke_car_barriers`:25474, `_smoke_sky_garden`:25515

## 25599-25637  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25630, `_pass_day`:25633

## 25638-25669  album

`_album_pages`:25639, `_album_claim`:25654

## 25670-25721  season

`_season_index`:25671, `_season_tick`:25674, `_season_xp`:25683, `_season_tier`:25686, `_season_reward`:25689, `_season_claim`:25703

## 25722-25729  Harbor Night

`_harbor_night`:25723

## 25730-25761  check-in calendar

`_cal_tick`:25731

## 25762-25938  the panel

`_build_hp_panel`:25763, `_open_pass`:25798, `_hp_open`:25801, `_hp_close`:25808, `_hp_row`:25812, `_hp_bar`:25827, `_hp_refresh`:25831, `_smoke_pass`:25876

## 25939-26153  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:25943, `_cash_pill_tick`:25951, `_build_lb`:25989, `_open_lb`:26032, `_close_lb`:26040, `_lb_pick`:26044, `_lb_headers`:26049, `_lb_url`:26053, `_lb_me`:26056, `_lb_tick`:26059, `_lb_upload`:26067, `_lb_fetch`:26077, `_lb_got`:26085, `_lb_value`:26096, `_lb_refresh_ui`:26107

## 26154-26577  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26178, `_market_near`:26255, `_build_gear`:26265, `_gear_piece`:26273, `_build_pet`:26318, `_market_apply`:26360, `_market_tick`:26384, `_build_market_panel`:26406, `_open_market`:26432, `_close_market`:26439, `_refresh_market`:26443, `_market_pick`:26496, `_toggle_board`:26534, `_board_tick`:26541

## 26578-26819  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26610, `_ds_label`:26629, `_build_display`:26643, `_ds_got`:26722, `_ds_sorted`:26731, `_ds_render_board`:26745, `_ds_render_news`:26771, `_display_tick`:26790

## 26820-26998  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26837, `_toggle_streamer`:26924, `_streamer_badge_tap`:26940, `_streamer_tick`:26944

## 26999-27035  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27005, `_car_back`:27012, `_car_park_tick`:27019

## 27036-27132  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27040, `_bus_eta`:27094, `_bus_displays_tick`:27110

## 27133-27424  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27151, `_treasure_pick`:27154, `_treasure_spot`:27163, `_treasure_district`:27167, `_treasure_clue`:27179, `_treasure_prop`:27192, `_tp_part`:27195, `_tp_sphere`:27205, `_tp_cyl`:27213, `_treasure_prop_side`:27222, `_build_treasure_props`:27234, `_build_treasure`:27278, `_treasure_dir_char`:27347, `_treasure_tick`:27356, `_treasure_claim`:27410

## 27425-27525  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27426, `_halo_mat`:27458, `_smoke_treasure`:27483

## 27526-27849  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27547, `_fm_send`:27550, `_fm_area`:27556, `_fm_glow_mesh`:27572, `_fm_block_reason`:27590, `_fm_start`:27602, `_fm_announce`:27630, `_fm_finish`:27633, `_fm_msg`:27651, `_fm_check_paid`:27702, `_fm_tick`:27720, `_smoke_findme`:27776

## 27850-27960  v0.24.2: road map (for moving people off the road)

`_floor_note`:27856, `_floor_disc`:27870, `_floor_top`:27879, `_ground_at`:27897, `_note_road`:27915, `_on_road`:27922, `_ped_curb`:27932, `_curb_spot`:27942

## 27961-28256  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27983, `_ex_grid`:27991, `_ex_lamps`:28026, `_ex_umbrella`:28049, `_ex_yards`:28056, `_build_expansion`:28071, `_expand_shots`:28234

## 28257-28451  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28298, `_v27_near_cross`:28390, `_v27_near_any_road`:28397, `_v27_in_district`:28403, `_sea_tick`:28417, `_sea_tow`:28436

## 28452-29119  Harbor Loop sky train

`_sky_build_path`:28503, `_sky_pos`:28544, `_sky_dir`:28558, `_sky_project`:28563, `_sky_trip_time`:28582, `_sky_trip_dist`:28588, `_sky_now`:28599, `_sky_state`:28602, `_sky_time_at_station`:28617, `_sky_next_arrival`:28624, `_build_skytrain`:28637, `_sky_make_car`:28789, `_sky_skin`:28826, `_sky_place_trains`:28846, `_sky_build_station`:28865, `_sky_near`:28930, `_sky_fmt`:28939, `_sky_enter`:28943, `_sky_leave_platform`:28961, `_sky_board`:28971, `_sky_alight`:28985, `_sky_action`:28999, `_sky_tick`:29016, `_sky_camera`:29056, `_tour_today`:29072, `_tour_stamp`:29075, `_sky_hud`:29098

## 29120-29480  Day and night

`_toggle_weather`:29203, `_refresh_weather_button`:29209, `_game_hour`:29215, `_day_key`:29227, `_night_setup`:29242, `_night_scan_mesh`:29332, `_daynight_tick`:29357, `_daynight_apply`:29364, `_daynight_lights`:29465, `_cycle_day_mode`:29470, `_refresh_time_button`:29477

## 29481-30116  v0.27 smoke test and screenshots

`_smoke_v27`:29482, `_city_shots`:29685

## 30117-30533  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30151, `_ap_plane`:30327, `_ap_truck`:30347, `_ap_baggage_train`:30388, `_ap_loop_pos`:30401, `_ap_loop_len`:30417, `_ap_flight_at`:30423, `_ap_tick`:30447, `_airport_ped_plan`:30470, `_smoke_airport`:30490

## 30534-31047  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30548, `_nav_spot`:30555, `_nav_idx`:30559, `_nav_pos`:30566, `_nav_blocked`:30570, `_nav_nearest_free`:30580, `_nav_bfs`:30608, `_nav_build`:30652, `_stroller`:30723, `_stroll_place`:30739, `_stroll_next`:30760, `_nav_clear_line`:30794, `_stroll_aim`:30805, `_strollers_tick`:30837, `_smoke_strollers`:30932

## 31048-31208  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31083, `_dir_fmt`:31086, `_signpost_spot`:31089, `_build_signposts`:31106

## 31209-31305  the Directions panel and chip

`_build_dir_panel`:31210, `_open_dir`:31252, `_dir_close`:31261, `_dir_pick`:31265, `_dir_stop`:31270, `_dir_stop_and_close`:31275, `_dir_tick`:31279

## 31306-31847  v0.44: Grand Central

`_gc_mesh`:31335, `_gc_mat`:31368, `_gc_glass`:31377, `_gb`:31387, `_gb_solid`:31393, `_gb_flush`:31397, `_gc_tree`:31427, `_gc_text`:31432, `_gc_planter`:31447, `_gc_kiosk`:31453, `_goods_color`:31483, `_goods_mat`:31486, `_kiosk_goods`:31490, `_build_grand_central`:31568, `_build_gc_towers`:31736, `_gc_tick`:31831

## 31848-32139  v0.44: filling the empty land

`_loft`:31865, `_fill_clear`:31907, `_build_fill`:31917, `_hg_in_lake`:31965, `_hg_path`:31969, `_floor_note_rot`:31977, `_build_gardens`:31985, `_build_fan_plaza`:32095

## 32140-32174  v0.45: hover car underglow

`_car_underglow`:32143

## 32175-32339  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32176

## 32340-32371  v0.47: street stalls downtown

`_build_street_stalls`:32344, `_cull_people_in`:32364

## 32372-32470  v0.48: places that open as you level up

`_place_lock_of`:32385, `_place_root`:32391, `_place_unlocked`:32394, `_build_place_signs`:32402, `_places_refresh`:32447, `_places_tick`:32464

## 32471-32515  v0.50: city careers

`_career_rank_name`:32496, `_career_mult`:32499, `_career_block_reason`:32504, `_career_start`:32507, `_career_end`:32512

## 32516-32566  v0.52: careers as clear job loops

`_cid`:32543, `_career_target`:32557, `_career_tick`:32564

## 32567-32574  taxi

`_taxi_meter`:32568

## 32575-32578  paramedic

(no functions)

## 32579-32583  police

`_career_chase_over`:32581

## 32584-32589  firefighter

`_fire_aimed`:32585

## 32590-32599  the step bar

`_career_bar_text`:32593, `_career_hud`:32597

## 32600-32626  cut scenes

`_cs_skip`:32618

## 32627-32631  siren

(no functions)

## 32632-32643  the Careers panel

`_build_career_panel`:32633, `_open_careers`:32636, `_career_close`:32640

## 32644-33067  v0.50: homes

`_home_door_spots`:32684, `_build_homes`:32699, `_home_labels`:32728, `_home_door_near`:32737, `_home_origin`:32746, `_home_slot_near`:32749, `_home_exit_near`:32760, `_home_btn`:32767, `_home_interact`:32780, `_home_buy`:32799, `_home_default_layout`:32813, `_home_enter`:32821, `_home_leave`:32841, `_hm`:32849, `_home_build_room`:32868, `_home_refresh_room`:32977, `_furni_build`:32991

## 33068-33403  decorating

`_build_home_panels`:33069, `_open_homes`:33114, `_home_row_go`:33124, `_home_panel_close`:33144, `_deco_open`:33148, `_deco_pick`:33171, `_smoke_careers_homes`:33194

## 33404-33538  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33408, `_home_slots`:33416, `_home_ring`:33443, `_furni_cat`:33449, `_home_fix_layout`:33455, `_home_build_layout`:33483

## 33539-33972  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33602, `_ch_homes`:33608, `_ch_step_text`:33615, `_ch_step_done`:33626, `_ch_target`:33640, `_ch_finish_chapter`:33649, `_chapters_tick`:33671, `_hud_top_stack`:33711, `_build_chapters_ui`:33741, `_chapters_restart_ask`:33783, `_chapters_restart`:33786, `_chapters_text`:33796, `_open_chapters`:33816, `_chapters_close`:33823, `_smoke_chapters`:33827, `_step_sound`:33948

## 33973-34011  v0.51.1: join and leave messages

`_announce_join`:33980, `_announce_already_here`:33999, `_announce_leave`:34007

## 34012-34276  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34028, `_shot_tick`:34034, `_draw_shot_icon`:34066, `_shot_enter`:34075, `_shot_exit`:34089, `_shot_release_controls`:34101, `_shot_stick_zone`:34108, `_shot_input`:34111, `_smoke_photo`:34183

## 34277-34575  v0.51.3: stream joiners

`_viewer_count`:34297, `_stream_join_check`:34303, `_stream_join_start`:34310, `_sj_streamer`:34327, `_stream_join_tick`:34336, `_stream_join_land`:34360, `_sj_welcome`:34376, `_smoke_stream_join`:34410, `_career_shot`:34493

## 34576-34692  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34580, `_st_restore`:34618, `_smoke_streamer_clean`:34639, `_world_bio_passport`:34690

