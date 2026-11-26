# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-610  Core (unlabelled)

`_symbol_font`:286, `_ready`:298, `_surf_texture`:553, `_surface_material`:575

## 611-683  v0.34.6: futuristic towers for the old city

`_future_tower`:615

## 684-762  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:691, `_skin_common`:726, `_future_wall`:734, `_future_roof`:748, `_future_pave`:756

## 763-823  v0.34.4: futuristic road surface

`_road_textures`:770, `_future_road`:804

## 824-2032  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:843, `_real_tex`:884, `_real_setup`:892, `_real_kind`:913, `_realify`:919, `_real_glass`:956, `_make_window_textures`:976, `_material`:1009, `_box`:1034, `_sign`:1056, `_build_world`:1068, `_future_kiosk`:1179, `_build_collectibles`:1205, `_auto_collect_tick`:1238, `_find_count`:1259, `_nearest_find`:1266, `_destination`:1280, `_toggle_activity`:1316, `_collect_find`:1345, `_owned_count`:1360, `_ridge_open`:1367, `_ridge_count`:1371, `_nearest_ridge`:1378, `_apply_car`:1392, `_tune_level`:1422, `_tune_cost`:1425, `_car_stats`:1431, `_buy_tune`:1438, `_open_tune`:1459, `_back_to_garage`:1465, `_refresh_tune`:1469, `_bay_open`:1480, `_area_open`:1483, `_bay_count`:1486, `_nearest_bay`:1493, `_build_bay`:1507, `_check_bay`:1560, `_discover_bay`:1573, `_north_count`:1586, `_north_open`:1593, `_nearest_north`:1596, `_check_north`:1610, `_discover_north`:1623, `_prop`:1636, `_collider`:1650, `_first_mesh`:1660, `_scatter`:1669, `_prop_stretch`:1703, `_north_token`:1712, `_nm_roads`:1739, `_prop_big`:1754, `_nm_near_cross`:1770, `_build_north`:1777, `_build_nm_blocks`:1894, `_build_north_landscape`:1979, `_nm_free`:2006, `_build_landscape`:2016

## 2033-2516  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2034, `_online_toggle`:2048, `_online_autostart`:2074, `_online_connect`:2093, `_online_stop`:2100, `_online_next_ref`:2111, `_online_send`:2115, `_online_join_frame`:2119, `_online_pos_frame`:2122, `_online_tick`:2131, `_online_handle`:2165, `_online_clean_name`:2218, `_online_peer_update`:2227, `_online_make_peer`:2296, `_peer_look`:2337, `_online_tint`:2394, `_paint_mat`:2410, `_online_update_peers`:2422, `_online_clear_peers`:2502, `_online_refresh_button`:2507

## 2517-2689  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2597, `_marina_count`:2600, `_nearest_marina`:2607, `_check_marina`:2621, `_discover_marina`:2634, `_shop_available`:2647, `_nearest_shop`:2650, `_premium_cars`:2658, `_glass`:2665, `_shop_building`:2671, `_shop_pad`:2681

## 2690-3205  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2691, `_bus_last`:2694, `_build_bus`:2697, `_bus_boxes`:2724, `_bus_skin`:2734, `_bus_side`:2747, `_bus_reset`:2750, `_bus_text`:2759, `_bus_tick`:2764, `_bus_near`:2804, `_bus_board`:2815, `_bus_alight`:2830, `_build_marina`:2844, `_set_hat`:2950, `_build_hat`:2953, `_cyl`:3018, `_hat_part`:3027, `_apply_avatar`:3036, `_shop_count`:3048, `_shop_open`:3058, `_shop_step`:3076, `_shop_close`:3082, `_owned_text`:3095, `_refresh_shop`:3098, `_shop_action`:3151, `_journal_flip`:3202

## 3206-3260  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3217, `_xp`:3220, `_level_for`:3227, `_level`:3235, `_level_text`:3238, `_check_level`:3248

## 3261-3363  v0.11.0: online police vs thief

`_orole_ready`:3262, `_orole_start`:3265, `_orole_end`:3292, `_orole_tick`:3301

## 3364-4307  v0.10.0: chase mode (offline)

`_chase_open`:3365, `_chase_clear`:3370, `_chase_make_unit`:3384, `_chase_spawn_point`:3414, `_chase_start`:3423, `_chase_end`:3459, `_chase_steer`:3478, `_chase_roadblock`:3514, `_chase_heli_build`:3559, `_chase_extras`:3585, `_chase_tick`:3612, `_start_trial`:3676, `_cancel_trial`:3703, `_check_trial`:3708, `_finish_trial`:3725, `_trial_count`:3741, `_open_trials`:3748, `_refresh_trials`:3752, `_update_gate`:3764, `_slab`:3782, `_build_ridge`:3800, `_check_ridge`:3863, `_discover`:3876, `_mission_progress`:3890, `_check_missions`:3952, `_open_garage`:3963, `_open_journal`:3968, `_close_sub`:3973, `_bar`:3976, `_refresh_garage`:3980, `_garage_step`:4005, `_garage_action`:4009, `_refresh_journal`:4029, `_visited_shops`:4062, `_build_panels`:4069, `_build_player`:4229, `_build_car`:4267, `_try_model`:4296

## 4308-4992  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4309, `_kshader`:4383, `_ksync`:4389, `_kskin`:4404, `_make_kperson`:4410, `_hat_y`:4474, `_sit_drop`:4477, `_kplay`:4480, `_kpeople_tick`:4490, `_pose_person`:4519, `_pose_limbs`:4536, `_person_lift`:4598, `_snap_crowd_feet`:4611, `_people_life_tick`:4627, `_life_one`:4664, `_cull_person`:4674, `_recolor_car_model`:4682, `_apply_car_model`:4696, `_landmark`:4716, `_label`:4726, `_button`:4733, `_panel`:4745, `_build_hud`:4755

## 4993-5111  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4999, `_menu_tab`:5005, `_watch_tick`:5028, `_watch_count`:5070, `_online_pill_tap`:5077, `_online_pill_tick`:5083, `online_config_ok`:5109

## 5112-5149  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5115, `_offroad`:5121, `_ground_near`:5134, `_collectibles_on_road`:5141

## 5150-5289  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5162, `_build_quest_offer`:5166, `_quest_offer_tick`:5196, `_quest_auto_pick`:5246, `_quest_accept`:5261, `_quest_decline`:5275, `_quest_stop`:5281

## 5290-5657  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5314, `_holo_material`:5323, `_build_future`:5331, `_build_neon`:5345, `_model_profile`:5414, `_model_body_box`:5437, `_build_holograms`:5451, `_holo_tick`:5501, `_build_sky_traffic`:5518, `_sky_hover_car`:5536, `_sky_drone`:5583, `_sky_traffic_tick`:5627, `_future_lights`:5646

## 5658-6157  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5717, `_crew_col`:5725, `_peer_crewmate`:5728, `_set_ring_color`:5731, `_level_color`:5758, `_tier_color`:5771, `_my_ach_tier`:5774, `_style_ring`:5781, `_social_peer_extras`:5829, `_social_tag`:5843, `_my_tag_extra`:5855, `_soc_send`:5868, `_social_msg`:5883, `_social_accept`:5922, `_social_go`:5943, `_soc_friend`:5962, `_soc_invite`:5969, `_soc_goto`:5974, `_soc_high_five`:5982, `_soc_gift`:6002, `_soc_crew_invite`:6019, `_gift_day_check`:6026, `_crew_create`:6032, `_crew_cycle_color`:6042, `_crew_leave`:6047, `_crew_mate_near`:6055, `_crew_board`:6063, `_build_social`:6082, `_social_online`:6144, `_open_social`:6148, `_close_social`:6154

## 6158-6408  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6161, `_track_pos`:6170, `_social_row_button`:6181, `_refresh_social`:6188, `_on_dance_floor`:6250, `_toggle_dance`:6253, `_build_dance_floor`:6261, `_social_tick`:6287, `_photo`:6359

## 6409-6904  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6431, `_game_state`:6439, `_build_arcade`:6451, `_c4_empty`:6502, `_c4_drop_row`:6508, `_c4_winner`:6514, `_c4_bot_move`:6535, `_c4_code`:6564, `_c4_ready`:6570, `_c4_tap`:6573, `_c4_check`:6594, `_c4_tick`:6618, `_rx_ready`:6645, `_rx_start`:6648, `_rx_tap`:6662, `_rx_send_time`:6687, `_rx_resolve`:6694, `_rx_tick`:6720, `_mem_start`:6735, `_mem_tap`:6751, `_mem_finish`:6766, `_mem_tick`:6782, `_mem_board_text`:6789, `_build_arcade_panel`:6800, `_refresh_arcade_panel`:6843

## 6905-7198  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6968, `_quiz_slot`:6971, `_quiz_question`:6981, `_quiz_bot_score`:7010, `_in_quiz`:7019, `_build_quiz`:7022, `_quiz_answer`:7092, `_quiz_msg`:7105, `_quiz_board`:7113, `_quiz_tick`:7123, `_quiz_refresh`:7165

## 7199-8776  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7370, `_sites_found`:7373, `_sites_total`:7376, `_bits`:7379, `_ach_value`:7386, `_ach_tick`:7441, `_ach_check`:7466, `_ach_by_id`:7502, `_ach_msg`:7508, `_build_ach`:7521, `_ach_show`:7552, `_open_ach`:7572, `_close_ach`:7578, `_refresh_ach`:7582, `_ach_num`:7613, `_minimap_tap`:7616, `_menu_go`:7623, `_menu_stay`:7628, `_menu_call_car`:7632, `_toggle_clean_hud`:7638, `_refresh_menu_buttons`:7644, `_clean_hud_tick`:7654, `_draw_joystick`:7695, `_input`:7700, `_touch_text_focus`:7791, `_stick_zone`:7811, `_notification`:7815, `_physics_process`:7832, `_follow_camera`:7983, `_follow_walk_camera`:8019, `_interact`:8042, `_refresh_hud`:8204, `_open_panel`:8333, `_layout_panels`:8363, `_toggle_menu`:8390, `_rescue`:8436, `_show_toast`:8468, `_save_progress`:8472, `_load_progress`:8567

## 8777-11260  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8778, `_radio_voice`:8781, `_radio_make`:8814, `_radio_set`:8885, `_radio_play`:8907, `_radio_next`:8912, `_radio_talk_line`:8916, `_radio_caption`:8937, `_radio_refresh`:8945, `_process`:8958, `_build_peds`:9009, `_update_peds`:9120, `_update_ped`:9139, `_smoke_test`:9193, `_smoke_chase`:9846, `_smoke_orole`:9879, `_smoke_levels`:9908, `_smoke_bus`:9949, `_smoke_chase_extras`:10034, `_smoke_marina`:10062, `_blocked_at`:10164, `_blocker`:10179, `_on_screen`:10192, `_wait_radio`:10197, `_smoke_radio_peds`:10204, `_smoke_typed_chat`:10274, `_smoke_chat_touch`:10293, `_smoke_cafe`:10314, `_smoke_boutique`:10340, `_smoke_models`:10368, `_smoke_garage_ridge`:10392, `_save_shot`:10768, `_paris_shots`:10778, `_people_shots`:11008, `_shots`:11049, `_shot_car`:11243, `_capture_preview`:11253

## 11261-11909  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11328, `_downtown_count`:11331, `_nearest_downtown`:11338, `_check_downtown`:11352, `_discover_downtown`:11365, `_box_batch`:11379, `_model_batch`:11399, `_cut_ranges`:11453, `_dt_ranges`:11465, `_dt_has`:11472, `_dt_near_cross`:11478, `_place`:11484, `_signal_pole`:11495, `_cyl_batch`:11514, `_city_signals`:11538, `_ensure_light_mats`:11589, `_city_lamps`:11599, `_build_downtown`:11643, `_dt_block`:11843, `_downtown_token`:11849, `_build_park`:11866, `_build_plaza`:11895

## 11910-12013  old city and Bay details

`_build_city_detail`:11911

## 12014-12423  traffic

`_build_traffic`:12015, `_path_sample`:12110, `_light_look`:12124, `_light_green`:12132, `_traffic_place`:12136, `_traffic_blocked_by`:12148, `_traffic_tick`:12160, `_smoke_downtown`:12266, `_skyline_shot`:12378, `_skyline_shots`:12386

## 12424-12784  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12470, `_web_scale`:12533, `_web_fps_tick`:12543, `_world_to_uv`:12560, `_map_angle`:12563, `_build_minimap`:12571, `_open_map`:12644, `_close_map`:12655, `_mini_point`:12662, `_site_markers`:12666, `_draw_arrow`:12698, `_draw_minimap`:12705, `_draw_full_map`:12752, `_minimap_tick`:12777

## 12785-13042  camera views

`_build_view_controls`:12786, `_cycle_view`:12828, `_apply_view`:12838, `_hide_labels`:12876, `_unfade`:12882, `_bake_map`:12888, `_shot_stats`:12938, `_view_shots`:12941, `_smoke_views`:12982

## 13043-13290  v0.17.0: level-up celebration

`_build_level_fx`:13054, `_draw_level_rays`:13091, `_level_fx_tick`:13101, `_level_sound`:13106, `_fx_material`:13148, `_level_up_fx`:13156, `_smoke_level_fx`:13257, `_levelup_shots`:13266

## 13291-13410  v0.18.0: walk-in stadium

`_collider_yaw`:13296, `_build_stadium_walls`:13307, `_look`:13335, `_smoke_stadium_eye`:13344, `_stadium_shots`:13380

## 13411-13572  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13435, `_arrow_mesh`:13447, `_build_guidance`:13470, `_guide_target`:13495, `_guidance_tick`:13524, `_draw_hud_arrow`:13550

## 13573-13758  checkpoints

`_build_checkpoints`:13574, `_refresh_checkpoints`:13619, `_check_checkpoints`:13625, `_activate_checkpoint`:13635, `_checkpoint_spawn`:13656, `_spawn_at_checkpoint`:13661, `_draw_checkpoint_icon`:13677, `_smoke_guidance_checkpoints`:13683, `_guide_shots`:13733

## 13759-14037  v0.18.0: Harbor Dome social hub

`_hub_seat`:13817, `_build_hub`:13821

## 14038-14088  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14039, `_xm_mesh`:14048, `_xm_tree`:14056

## 14089-14412  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14092, `_gt_surface`:14107, `_xm_grand_tree`:14117, `_lux_mat`:14232, `_lux_part`:14248, `_lux_box`:14251, `_lux_cyl`:14256, `_lux_ball`:14264, `_lux_new`:14272, `_lux_commit`:14277, `_lux_sofa_mesh`:14281, `_lux_chair_mesh`:14311, `_lux_table_mesh`:14331, `_lux_pouf_mesh`:14346, `_lux_batch`:14361, `_hub_christmas`:14377

## 14413-14568  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14414

## 14569-14817  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14572, `_vx_cyl`:14579, `_vx_ball`:14587, `_vx_ring`:14595, `_hub_polish`:14603, `_hub_gate`:14626, `_hub_vip`:14688, `_hub_glass`:14801

## 14818-15032  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14819, `_build_hub_bots`:14844, `_seat_of`:14875, `_bubble`:14885, `_emote`:14941, `_hub_people_tick`:14955

## 15033-15151  seats

`_seat_taken`:15034, `_nearest_seat`:15042, `_seat_label`:15054, `_sit`:15070, `_stand_up`:15114, `_seated_tick`:15133

## 15152-15308  game panel

`_build_game_panel`:15153, `_open_game_panel`:15208, `_refresh_game_panel`:15227, `_play_robot`:15272, `_peer_at`:15286, `_opponent_name`:15293, `_pay`:15301

## 15309-15429  tic-tac-toe

`_ttt_ready`:15312, `_ttt_winner`:15318, `_ttt_bot_move`:15328, `_ttt_tap`:15354, `_ttt_code`:15374, `_ttt_check`:15380, `_ttt_tick`:15403

## 15430-15481  rock paper scissors

`_rps_ready`:15431, `_rps_pick`:15437, `_rps_resolve`:15455, `_rps_tick`:15479

## 15482-15564  online table messages

`_online_game_send`:15483, `_hub_game_msg`:15489

## 15565-15640  comedy show

`_joke_start`:15566, `_joke_tick`:15578, `_speak`:15604, `_play_rimshot`:15613

## 15641-16540  quick chat and emotes

`_build_chat`:15663, `_chat_toggle_to`:15780, `_chat_log_add`:15788, `_chat_area`:15794, `_chat_near_count`:15812, `_chat_tick`:15821, `_toggle_chat`:15870, `_chat_fit`:15885, `_chat_clean`:15891, `_chat_wrap`:15908, `_chat_send_text`:15930, `_typing`:15953, `_say`:15956, `_do_emote`:15972, `_smoke_hub`:15981, `_chat_shots`:16155, `_cafe_shots`:16180, `_shop_shots`:16228, `_car_shots`:16277, `_outfit_shots`:16308, `_hub_shots`:16356, `_sg_on_terrace`:16491, `_people_only`:16494, `_people_only_keep_cars_out`:16498, `_car_barrier`:16510, `_hub_keep_cars_out`:16524

## 16541-16703  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16550, `_feed_add`:16559, `_feed_render`:16565, `_feed_tick`:16593, `_online_event_send`:16602, `_at_pvp_table`:16609, `_game_name`:16616, `_send_lfp`:16619, `_lfp_msg`:16636, `_accept_invite`:16657

## 16704-16945  v0.18.2: nickname and HUD relayout

`_nick_rude`:16716, `_clean_nick`:16731, `_build_nick_panel`:16743, `_open_nick`:16781, `_random_nick`:16790, `_save_nick`:16796, `_close_nick`:16815, `_refresh_nick_button`:16824, `_relayout_hud`:16828, `_smoke_nick`:16865, `_nick_shots`:16897, `_smoke_sites_reachable`:16915

## 16946-17233  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16972, `_nearest_civic`:16979, `_check_civic`:16993, `_discover_civic`:17006, `_civ_ranges`:17019, `_civ_has`:17033, `_civ_near_cross`:17039, `_build_civic`:17045, `_civic_token`:17171, `_civic_shots`:17188, `_hub_focus`:17210

## 17234-17343  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17305, `_in_rw_lot`:17308, `_box_batch_rot`:17311, `_multi_collider`:17329

## 17344-17671  circuit geometry

`_cr_point`:17345, `_rw_build_path`:17359, `_rw_dir`:17387, `_rw_bend`:17392, `_ribbon`:17398, `_rw_band`:17418, `_rw_keepout`:17436, `_build_raceway`:17445, `_build_rw_parking`:17479, `_build_rw_pits`:17524, `_build_rw_track`:17561, `_build_rw_trackside`:17602

## 17672-17769  race car rental

`_model_key`:17673, `_race_car_start`:17676, `_tint_ghost`:17714, `_race_car_end`:17727, `_race_keep_cars_out`:17752

## 17770-17784  speed effects

`_eff_max`:17771, `_eff_accel`:17782

## 17785-17835  track helpers

`_rw_seg_progress`:17786, `_rw_track_dist`:17806, `_rw_point_dist`:17817, `_rw_player_progress`:17824, `_rw_target`:17830

## 17836-18072  events

`_rec_stop`:17837, `_rw_place`:17853, `_rw_grid_pos`:17860, `_rw_start`:17865, `_rw_spawn_ai`:17897, `_rw_ai_place`:17921, `_rw_tick`:17932, `_rw_ai_tick`:17985, `_rw_lap_done`:18027, `_rw_finish`:18039, `_rw_fmt`:18070

## 18073-18125  boosters and spikes

`_rw_buy`:18074, `_rw_use_boost`:18092, `_rw_use_spike`:18100, `_rw_drop_spike_at`:18111

## 18126-18183  online races

`_race_msg`:18127, `_join_race`:18149

## 18184-18539  raceway panel, HUD, board

`_build_raceway_ui`:18185, `_rw_layout`:18245, `_rw_open`:18252, `_rw_close`:18258, `_rw_refresh_panel`:18262, `_rw_refresh_board`:18275, `_rw_hud`:18287, `_peer_car_model`:18311, `_smoke_raceway`:18321, `_race_shots`:18502

## 18540-18747  v0.22.0: Call Car

`_call_block_reason`:18546, `_call_spot`:18563, `_call_car`:18594, `_play_horn`:18618, `_smoke_follow_call`:18642, `_follow_shots`:18715

## 18748-19205  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18773, `_place_portal_button`:18779, `_portal_pressed`:18786, `_build_travel`:18794, `_toggle_run`:18899, `_refresh_run`:18903, `_hud_v23_tick`:18911, `_travel_block_reason`:18943, `_travel_open`:18963, `_open_travel`:18969, `_open_worlds`:18975, `_open_case`:18981, `_case_step`:18993, `_case_refresh`:18997, `_case_submit`:19001, `_close_case`:19010, `_sky_go`:19014, `_close_worlds`:19024, `_refresh_worlds`:19028, `_world_go`:19034, `_close_travel`:19041, `_refresh_travel`:19045, `_travel_to`:19053, `_smoke_travel`:19080, `_v23_shots`:19118

## 19206-19279  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19213, `_qr_button`:19228, `_qr_layout`:19267, `_smoke_qr`:19273

## 19280-19716  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19300, `_open_crate`:19316, `_build_crate_ui`:19333, `_crate_pick`:19420, `_crate_reveal`:19443, `_crate_draw_car`:19470, `_crate_confetti`:19489, `_crate_sound`:19514, `_crate_drive`:19540, `_feed_add_system`:19570, `_smoke_crate`:19573, `_crate_shots`:19621

## 19717-20208  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19758, `_quick_today`:19763, `_quick_is_done`:19766, `_quick_left`:19769, `_quick_next`:19776, `_quick_fix_target`:19789, `_quick_daily_check`:19803, `_quick_complete`:19817, `_quick_side`:19851, `_build_quick_props`:19869, `_daily_shots`:20021, `_quick_props_refresh`:20063, `_quick_fx`:20067, `_play_coin`:20083, `_smoke_quick`:20100

## 20209-20359  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20218, `_quest_nearby`:20273, `_open_quests`:20280, `_close_quests`:20287, `_refresh_quests`:20291, `_quest_pick`:20317, `_quest_mode`:20331, `_smoke_quests`:20334

## 20360-20394  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20364, `_my_tag_tick`:20367

## 20395-20709  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20412, `_fc_torus`:20422, `_fc_pearl`:20430, `_fc_chrome`:20440, `_fc_glass`:20449, `_fc_glow`:20459, `_fc_ghost`:20468, `_fc_holo`:20480, `_fc_mesh`:20490, `_fc_sphere`:20510, `_fc_capsule`:20518, `_fc_cone`:20526, `_build_food_court`:20535, `_food_court_tick`:20689

## 20710-21031  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20739, `_cm_bench`:20755, `_build_commons`:20768, `_commons_tick`:20990

## 21032-21346  v0.36: the daily puzzle

`_pz_today`:21055, `_pz_new`:21058, `_pz_neighbours`:21103, `_pz_flip`:21113, `_pz_done`:21118, `_pz_tap`:21126, `_pz_win`:21142, `_pz_reset`:21163, `_puzzle_near`:21167, `_open_puzzle`:21172, `_close_puzzle`:21180, `_pz_refresh_sign`:21184, `_build_puzzle_panel`:21192, `_pz_draw`:21223, `_smoke_chat`:21264, `_smoke_feet`:21302, `_smoke_commons`:21323

## 21347-21535  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21409, `_bio_theta`:21413, `_bio_sec_n`:21418, `_bio_sec_of`:21421, `_bio_pt`:21424, `_bio_lp`:21429, `_bio_la`:21433, `_bio_dir`:21437, `_bio_hex_r`:21440, `_bio_apo`:21445, `_bio_open_angles`:21451, `_bio_si`:21461, `_bm`:21467, `_bsph`:21472, `_blow`:21475, `_bcone`:21486, `_bbox`:21489, `_bp`:21492, `_bq`:21497, `_bio_glass_mat`:21501, `_bio_water_mat`:21514, `_bio_mat`:21526

## 21536-21908  building blocks

`_bio_inst`:21537, `_bio_add`:21543, `_bio_model`:21546, `_bio_nature_mesh`:21552, `_bio_flush`:21586, `_bio_bar`:21621, `_bio_slab`:21634, `_bio_body`:21649, `_bio_cyl_col`:21662, `_bio_hexmesh`:21675, `_bio_hexslab`:21687, `_bio_hexpt`:21693, `_bio_gridshell`:21700, `_bio_rail`:21807, `_bio_rail_arc`:21812, `_bio_disc_deck`:21824, `_bio_ring_deck`:21830, `_bio_helix`:21841, `_bio_pillar`:21861, `_bio_cafe`:21867, `_bio_fence_line`:21881, `_bio_fence_seg`:21886, `_bio_pen`:21896

## 21909-22410  building

`_build_biosphere`:21910, `_build_biosphere_legacy`:21914, `_bio_text`:22076, `_bio_plaque`:22094, `_bio_ticket_hall`:22108, `_on_foot_collision_guard`:22164, `_bio_inside`:22174, `_bio_pass_ok`:22177, `_ticket_near`:22181, `_bio_buy_pass`:22186, `_bio_gates_update`:22202, `_bio_gate_tick`:22228, `_bio_tunnel`:22240, `_bio_grounds`:22293, `_bio_dome`:22339, `_bio_deck_mats`:22407

## 22411-22566  garden planting

`_bio_free`:22412, `_bio_spot`:22429, `_bio_garden`:22437, `_bio_pine`:22478, `_bio_tree`:22481, `_bio_big_tree`:22491, `_bio_rock`:22496, `_bio_pond`:22499, `_bio_particles`:22503, `_bio_mist`:22531, `_bio_mini_dome`:22560

## 22567-22974  the four layouts

`_bio_winter`:22568, `_bio_spring`:22660, `_bio_summer`:22785, `_bio_autumn`:22869

## 22975-23245  animals

`_bio_spawn`:22976, `_bio_load_animal`:23048, `_bio_make_quad`:23069, `_bio_load_bird`:23146, `_bio_make_penguin`:23166, `_bio_make_bird`:23188, `_bio_make_flamingo`:23212, `_bio_make_butterfly`:23233

## 23246-23377  animation, spotting and rewards

`_bio_stuck_check`:23251, `_biosphere_tick`:23269, `_bio_animate`:23278, `_bio_spot_check`:23358, `_bio_spotted`:23370, `_smoke_biosphere`:23374

## 23378-23895  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23465, `_wear_piece`:23468, `_wear_mat`:23491, `_person_index`:23507, `_dress`:23530, `_smoke_style`:23636, `_style_shots`:23787, `_npc_look`:23859

## 23896-24049  your look: apply, save, share

`_look_clean`:23900, `_look_pack`:23915, `_owns`:23921, `_apply_look`:23926, `_relic_model`:23937, `_fc_mesh_mat`:24002, `_relic_refresh`:24005, `_relic_tick`:24019, `_peer_style`:24030

## 24050-24477  stores and the wardrobe

`_style_today`:24069, `_style_items`:24072, `_style_cat`:24080, `_style_price`:24083, `_style_deal`:24097, `_style_price_base`:24110, `_relic_stock`:24117, `_build_style_panel`:24129, `_open_store`:24169, `_open_wardrobe`:24188, `_style_close`:24191, `_style_finish`:24195, `_sync_old_avatar`:24210, `_style_tabs_for`:24217, `_refresh_style`:24222, `_style_body_rows`:24373, `_style_set_tab`:24390, `_style_step`:24394, `_style_color`:24399, `_style_pick`:24404, `_style_buy`:24439, `_ach_relics_check`:24461, `_style_face_camera`:24466

## 24478-24945  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24514, `_ga_text`:24520, `_ga_box`:24537, `_build_galleria`:24553, `_ga_inner_tick`:24694, `_ga_shell`:24710, `_ga_inside`:24760, `_bio_cyl_col_on`:24763, `_ga_models`:24775, `_ga_lbox`:24790, `_ga_ltext`:24804, `_ga_store`:24811, `_bio_cafe_on`:24913, `_ga_mannequins`:24921

## 24946-25097  featured outfits and the Sky Run

`_ga_featured_look`:24959, `_build_ga_fun`:24980, `_ga_fun_tick`:25025, `_sky_finish`:25052, `_extra_near`:25071, `_extra_open`:25080, `_store_near`:25089

## 25098-25194  v0.41: THE SKY GARDEN

`_sg_now`:25152, `_sg_progress`:25155, `_sg_time`:25161, `_sg_stock`:25168, `_sg_mut_roll`:25183

## 25195-25332  building

`_sg_box`:25196, `_sg_text`:25202, `_build_sky_garden`:25216, `_sg_seed_spot`:25327, `_sg_codex_spot`:25330

## 25333-25513  plants

`_sg_plant_model`:25334, `_sg_refresh_all`:25439, `_sg_refresh`:25443, `_sky_garden_tick`:25479, `_sg_ready_count`:25498, `_sg_boot_note`:25505

## 25514-25633  interacting

`_sg_near`:25515, `_sg_button_text`:25538, `_sg_value`:25551, `_sg_interact`:25555, `_sg_buy`:25571, `_sg_plant`:25593, `_sg_harvest`:25604

## 25634-25877  the garden screen

`_build_sg_panel`:25635, `_sg_open`:25670, `_sg_close`:25679, `_sg_row`:25683, `_sg_refresh_panel`:25698, `_sg_pick_buy`:25743, `_sg_pick_plant`:25747, `_smoke_car_barriers`:25753, `_smoke_sky_garden`:25794

## 25878-25916  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25909, `_pass_day`:25912

## 25917-25948  album

`_album_pages`:25918, `_album_claim`:25933

## 25949-26000  season

`_season_index`:25950, `_season_tick`:25953, `_season_xp`:25962, `_season_tier`:25965, `_season_reward`:25968, `_season_claim`:25982

## 26001-26008  Harbor Night

`_harbor_night`:26002

## 26009-26040  check-in calendar

`_cal_tick`:26010

## 26041-26217  the panel

`_build_hp_panel`:26042, `_open_pass`:26077, `_hp_open`:26080, `_hp_close`:26087, `_hp_row`:26091, `_hp_bar`:26106, `_hp_refresh`:26110, `_smoke_pass`:26155

## 26218-26432  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26222, `_cash_pill_tick`:26230, `_build_lb`:26268, `_open_lb`:26311, `_close_lb`:26319, `_lb_pick`:26323, `_lb_headers`:26328, `_lb_url`:26332, `_lb_me`:26335, `_lb_tick`:26338, `_lb_upload`:26346, `_lb_fetch`:26356, `_lb_got`:26364, `_lb_value`:26375, `_lb_refresh_ui`:26386

## 26433-26856  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26457, `_market_near`:26534, `_build_gear`:26544, `_gear_piece`:26552, `_build_pet`:26597, `_market_apply`:26639, `_market_tick`:26663, `_build_market_panel`:26685, `_open_market`:26711, `_close_market`:26718, `_refresh_market`:26722, `_market_pick`:26775, `_toggle_board`:26813, `_board_tick`:26820

## 26857-27098  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26889, `_ds_label`:26908, `_build_display`:26922, `_ds_got`:27001, `_ds_sorted`:27010, `_ds_render_board`:27024, `_ds_render_news`:27050, `_display_tick`:27069

## 27099-27277  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27116, `_toggle_streamer`:27203, `_streamer_badge_tap`:27219, `_streamer_tick`:27223

## 27278-27314  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27284, `_car_back`:27291, `_car_park_tick`:27298

## 27315-27411  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27319, `_bus_eta`:27373, `_bus_displays_tick`:27389

## 27412-27703  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27430, `_treasure_pick`:27433, `_treasure_spot`:27442, `_treasure_district`:27446, `_treasure_clue`:27458, `_treasure_prop`:27471, `_tp_part`:27474, `_tp_sphere`:27484, `_tp_cyl`:27492, `_treasure_prop_side`:27501, `_build_treasure_props`:27513, `_build_treasure`:27557, `_treasure_dir_char`:27626, `_treasure_tick`:27635, `_treasure_claim`:27689

## 27704-27804  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27705, `_halo_mat`:27737, `_smoke_treasure`:27762

## 27805-28128  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27826, `_fm_send`:27829, `_fm_area`:27835, `_fm_glow_mesh`:27851, `_fm_block_reason`:27869, `_fm_start`:27881, `_fm_announce`:27909, `_fm_finish`:27912, `_fm_msg`:27930, `_fm_check_paid`:27981, `_fm_tick`:27999, `_smoke_findme`:28055

## 28129-28239  v0.24.2: road map (for moving people off the road)

`_floor_note`:28135, `_floor_disc`:28149, `_floor_top`:28158, `_ground_at`:28176, `_note_road`:28194, `_on_road`:28201, `_ped_curb`:28211, `_curb_spot`:28221

## 28240-28535  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28262, `_ex_grid`:28270, `_ex_lamps`:28305, `_ex_umbrella`:28328, `_ex_yards`:28335, `_build_expansion`:28350, `_expand_shots`:28513

## 28536-28730  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28577, `_v27_near_cross`:28669, `_v27_near_any_road`:28676, `_v27_in_district`:28682, `_sea_tick`:28696, `_sea_tow`:28715

## 28731-29398  Harbor Loop sky train

`_sky_build_path`:28782, `_sky_pos`:28823, `_sky_dir`:28837, `_sky_project`:28842, `_sky_trip_time`:28861, `_sky_trip_dist`:28867, `_sky_now`:28878, `_sky_state`:28881, `_sky_time_at_station`:28896, `_sky_next_arrival`:28903, `_build_skytrain`:28916, `_sky_make_car`:29068, `_sky_skin`:29105, `_sky_place_trains`:29125, `_sky_build_station`:29144, `_sky_near`:29209, `_sky_fmt`:29218, `_sky_enter`:29222, `_sky_leave_platform`:29240, `_sky_board`:29250, `_sky_alight`:29264, `_sky_action`:29278, `_sky_tick`:29295, `_sky_camera`:29335, `_tour_today`:29351, `_tour_stamp`:29354, `_sky_hud`:29377

## 29399-29759  Day and night

`_toggle_weather`:29482, `_refresh_weather_button`:29488, `_game_hour`:29494, `_day_key`:29506, `_night_setup`:29521, `_night_scan_mesh`:29611, `_daynight_tick`:29636, `_daynight_apply`:29643, `_daynight_lights`:29744, `_cycle_day_mode`:29749, `_refresh_time_button`:29756

## 29760-30395  v0.27 smoke test and screenshots

`_smoke_v27`:29761, `_city_shots`:29964

## 30396-30812  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30430, `_ap_plane`:30606, `_ap_truck`:30626, `_ap_baggage_train`:30667, `_ap_loop_pos`:30680, `_ap_loop_len`:30696, `_ap_flight_at`:30702, `_ap_tick`:30726, `_airport_ped_plan`:30749, `_smoke_airport`:30769

## 30813-31326  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30827, `_nav_spot`:30834, `_nav_idx`:30838, `_nav_pos`:30845, `_nav_blocked`:30849, `_nav_nearest_free`:30859, `_nav_bfs`:30887, `_nav_build`:30931, `_stroller`:31002, `_stroll_place`:31018, `_stroll_next`:31039, `_nav_clear_line`:31073, `_stroll_aim`:31084, `_strollers_tick`:31116, `_smoke_strollers`:31211

## 31327-31487  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31362, `_dir_fmt`:31365, `_signpost_spot`:31368, `_build_signposts`:31385

## 31488-31584  the Directions panel and chip

`_build_dir_panel`:31489, `_open_dir`:31531, `_dir_close`:31540, `_dir_pick`:31544, `_dir_stop`:31549, `_dir_stop_and_close`:31554, `_dir_tick`:31558

## 31585-32126  v0.44: Grand Central

`_gc_mesh`:31614, `_gc_mat`:31647, `_gc_glass`:31656, `_gb`:31666, `_gb_solid`:31672, `_gb_flush`:31676, `_gc_tree`:31706, `_gc_text`:31711, `_gc_planter`:31726, `_gc_kiosk`:31732, `_goods_color`:31762, `_goods_mat`:31765, `_kiosk_goods`:31769, `_build_grand_central`:31847, `_build_gc_towers`:32015, `_gc_tick`:32110

## 32127-32418  v0.44: filling the empty land

`_loft`:32144, `_fill_clear`:32186, `_build_fill`:32196, `_hg_in_lake`:32244, `_hg_path`:32248, `_floor_note_rot`:32256, `_build_gardens`:32264, `_build_fan_plaza`:32374

## 32419-32453  v0.45: hover car underglow

`_car_underglow`:32422

## 32454-32618  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32455

## 32619-32650  v0.47: street stalls downtown

`_build_street_stalls`:32623, `_cull_people_in`:32643

## 32651-32749  v0.48: places that open as you level up

`_place_lock_of`:32664, `_place_root`:32670, `_place_unlocked`:32673, `_build_place_signs`:32681, `_places_refresh`:32726, `_places_tick`:32743

## 32750-32794  v0.50: city careers

`_career_rank_name`:32775, `_career_mult`:32778, `_career_block_reason`:32783, `_career_start`:32786, `_career_end`:32791

## 32795-32845  v0.52: careers as clear job loops

`_cid`:32822, `_career_target`:32836, `_career_tick`:32843

## 32846-32853  taxi

`_taxi_meter`:32847

## 32854-32857  paramedic

(no functions)

## 32858-32862  police

`_career_chase_over`:32860

## 32863-32868  firefighter

`_fire_aimed`:32864

## 32869-32878  the step bar

`_career_bar_text`:32872, `_career_hud`:32876

## 32879-32905  cut scenes

`_cs_skip`:32897

## 32906-32910  siren

(no functions)

## 32911-32922  the Careers panel

`_build_career_panel`:32912, `_open_careers`:32915, `_career_close`:32919

## 32923-33346  v0.50: homes

`_home_door_spots`:32963, `_build_homes`:32978, `_home_labels`:33007, `_home_door_near`:33016, `_home_origin`:33025, `_home_slot_near`:33028, `_home_exit_near`:33039, `_home_btn`:33046, `_home_interact`:33059, `_home_buy`:33078, `_home_default_layout`:33092, `_home_enter`:33100, `_home_leave`:33120, `_hm`:33128, `_home_build_room`:33147, `_home_refresh_room`:33256, `_furni_build`:33270

## 33347-33682  decorating

`_build_home_panels`:33348, `_open_homes`:33393, `_home_row_go`:33403, `_home_panel_close`:33423, `_deco_open`:33427, `_deco_pick`:33450, `_smoke_careers_homes`:33473

## 33683-33817  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33687, `_home_slots`:33695, `_home_ring`:33722, `_furni_cat`:33728, `_home_fix_layout`:33734, `_home_build_layout`:33762

## 33818-34251  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33881, `_ch_homes`:33887, `_ch_step_text`:33894, `_ch_step_done`:33905, `_ch_target`:33919, `_ch_finish_chapter`:33928, `_chapters_tick`:33950, `_hud_top_stack`:33990, `_build_chapters_ui`:34020, `_chapters_restart_ask`:34062, `_chapters_restart`:34065, `_chapters_text`:34075, `_open_chapters`:34095, `_chapters_close`:34102, `_smoke_chapters`:34106, `_step_sound`:34227

## 34252-34290  v0.51.1: join and leave messages

`_announce_join`:34259, `_announce_already_here`:34278, `_announce_leave`:34286

## 34291-34555  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34307, `_shot_tick`:34313, `_draw_shot_icon`:34345, `_shot_enter`:34354, `_shot_exit`:34368, `_shot_release_controls`:34380, `_shot_stick_zone`:34387, `_shot_input`:34390, `_smoke_photo`:34462

## 34556-34854  v0.51.3: stream joiners

`_viewer_count`:34576, `_stream_join_check`:34582, `_stream_join_start`:34589, `_sj_streamer`:34606, `_stream_join_tick`:34615, `_stream_join_land`:34639, `_sj_welcome`:34655, `_smoke_stream_join`:34689, `_career_shot`:34772

## 34855-34971  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34859, `_st_restore`:34897, `_smoke_streamer_clean`:34918, `_world_bio_passport`:34969

