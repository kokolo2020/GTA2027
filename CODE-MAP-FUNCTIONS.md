# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-582  Core (unlabelled)

`_symbol_font`:280, `_ready`:292, `_surf_texture`:525, `_surface_material`:547

## 583-655  v0.34.6: futuristic towers for the old city

`_future_tower`:587

## 656-734  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:663, `_skin_common`:698, `_future_wall`:706, `_future_roof`:720, `_future_pave`:728

## 735-795  v0.34.4: futuristic road surface

`_road_textures`:742, `_future_road`:776

## 796-2001  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:815, `_real_tex`:856, `_real_setup`:864, `_real_kind`:885, `_realify`:891, `_real_glass`:928, `_make_window_textures`:948, `_material`:981, `_box`:1006, `_sign`:1028, `_build_world`:1040, `_future_kiosk`:1148, `_build_collectibles`:1174, `_auto_collect_tick`:1207, `_find_count`:1228, `_nearest_find`:1235, `_destination`:1249, `_toggle_activity`:1285, `_collect_find`:1314, `_owned_count`:1329, `_ridge_open`:1336, `_ridge_count`:1340, `_nearest_ridge`:1347, `_apply_car`:1361, `_tune_level`:1391, `_tune_cost`:1394, `_car_stats`:1400, `_buy_tune`:1407, `_open_tune`:1428, `_back_to_garage`:1434, `_refresh_tune`:1438, `_bay_open`:1449, `_area_open`:1452, `_bay_count`:1455, `_nearest_bay`:1462, `_build_bay`:1476, `_check_bay`:1529, `_discover_bay`:1542, `_north_count`:1555, `_north_open`:1562, `_nearest_north`:1565, `_check_north`:1579, `_discover_north`:1592, `_prop`:1605, `_collider`:1619, `_first_mesh`:1629, `_scatter`:1638, `_prop_stretch`:1672, `_north_token`:1681, `_nm_roads`:1708, `_prop_big`:1723, `_nm_near_cross`:1739, `_build_north`:1746, `_build_nm_blocks`:1863, `_build_north_landscape`:1948, `_nm_free`:1975, `_build_landscape`:1985

## 2002-2481  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2003, `_online_toggle`:2017, `_online_autostart`:2043, `_online_connect`:2062, `_online_stop`:2069, `_online_next_ref`:2080, `_online_send`:2084, `_online_join_frame`:2088, `_online_pos_frame`:2091, `_online_tick`:2100, `_online_handle`:2134, `_online_clean_name`:2187, `_online_peer_update`:2196, `_online_make_peer`:2261, `_peer_look`:2302, `_online_tint`:2359, `_paint_mat`:2375, `_online_update_peers`:2387, `_online_clear_peers`:2467, `_online_refresh_button`:2472

## 2482-2654  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2562, `_marina_count`:2565, `_nearest_marina`:2572, `_check_marina`:2586, `_discover_marina`:2599, `_shop_available`:2612, `_nearest_shop`:2615, `_premium_cars`:2623, `_glass`:2630, `_shop_building`:2636, `_shop_pad`:2646

## 2655-3170  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2656, `_bus_last`:2659, `_build_bus`:2662, `_bus_boxes`:2689, `_bus_skin`:2699, `_bus_side`:2712, `_bus_reset`:2715, `_bus_text`:2724, `_bus_tick`:2729, `_bus_near`:2769, `_bus_board`:2780, `_bus_alight`:2795, `_build_marina`:2809, `_set_hat`:2915, `_build_hat`:2918, `_cyl`:2983, `_hat_part`:2992, `_apply_avatar`:3001, `_shop_count`:3013, `_shop_open`:3023, `_shop_step`:3041, `_shop_close`:3047, `_owned_text`:3060, `_refresh_shop`:3063, `_shop_action`:3116, `_journal_flip`:3167

## 3171-3225  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3182, `_xp`:3185, `_level_for`:3192, `_level`:3200, `_level_text`:3203, `_check_level`:3213

## 3226-3328  v0.11.0: online police vs thief

`_orole_ready`:3227, `_orole_start`:3230, `_orole_end`:3257, `_orole_tick`:3266

## 3329-4272  v0.10.0: chase mode (offline)

`_chase_open`:3330, `_chase_clear`:3335, `_chase_make_unit`:3349, `_chase_spawn_point`:3379, `_chase_start`:3388, `_chase_end`:3424, `_chase_steer`:3443, `_chase_roadblock`:3479, `_chase_heli_build`:3524, `_chase_extras`:3550, `_chase_tick`:3577, `_start_trial`:3641, `_cancel_trial`:3668, `_check_trial`:3673, `_finish_trial`:3690, `_trial_count`:3706, `_open_trials`:3713, `_refresh_trials`:3717, `_update_gate`:3729, `_slab`:3747, `_build_ridge`:3765, `_check_ridge`:3828, `_discover`:3841, `_mission_progress`:3855, `_check_missions`:3917, `_open_garage`:3928, `_open_journal`:3933, `_close_sub`:3938, `_bar`:3941, `_refresh_garage`:3945, `_garage_step`:3970, `_garage_action`:3974, `_refresh_journal`:3994, `_visited_shops`:4027, `_build_panels`:4034, `_build_player`:4194, `_build_car`:4232, `_try_model`:4261

## 4273-4950  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4274, `_kshader`:4348, `_ksync`:4354, `_kskin`:4369, `_make_kperson`:4375, `_hat_y`:4439, `_sit_drop`:4442, `_kplay`:4445, `_kpeople_tick`:4455, `_pose_person`:4484, `_pose_limbs`:4501, `_person_lift`:4563, `_snap_crowd_feet`:4576, `_people_life_tick`:4592, `_life_one`:4629, `_cull_person`:4639, `_recolor_car_model`:4647, `_apply_car_model`:4661, `_landmark`:4681, `_label`:4691, `_button`:4698, `_panel`:4710, `_build_hud`:4720

## 4951-5069  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4957, `_menu_tab`:4963, `_watch_tick`:4986, `_watch_count`:5028, `_online_pill_tap`:5035, `_online_pill_tick`:5041, `online_config_ok`:5067

## 5070-5107  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5073, `_offroad`:5079, `_ground_near`:5092, `_collectibles_on_road`:5099

## 5108-5247  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5120, `_build_quest_offer`:5124, `_quest_offer_tick`:5154, `_quest_auto_pick`:5204, `_quest_accept`:5219, `_quest_decline`:5233, `_quest_stop`:5239

## 5248-5615  v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5272, `_holo_material`:5281, `_build_future`:5289, `_build_neon`:5303, `_model_profile`:5372, `_model_body_box`:5395, `_build_holograms`:5409, `_holo_tick`:5459, `_build_sky_traffic`:5476, `_sky_hover_car`:5494, `_sky_drone`:5541, `_sky_traffic_tick`:5585, `_future_lights`:5604

## 5616-6115  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5675, `_crew_col`:5683, `_peer_crewmate`:5686, `_set_ring_color`:5689, `_level_color`:5716, `_tier_color`:5729, `_my_ach_tier`:5732, `_style_ring`:5739, `_social_peer_extras`:5787, `_social_tag`:5801, `_my_tag_extra`:5813, `_soc_send`:5826, `_social_msg`:5841, `_social_accept`:5880, `_social_go`:5901, `_soc_friend`:5920, `_soc_invite`:5927, `_soc_goto`:5932, `_soc_high_five`:5940, `_soc_gift`:5960, `_soc_crew_invite`:5977, `_gift_day_check`:5984, `_crew_create`:5990, `_crew_cycle_color`:6000, `_crew_leave`:6005, `_crew_mate_near`:6013, `_crew_board`:6021, `_build_social`:6040, `_social_online`:6102, `_open_social`:6106, `_close_social`:6112

## 6116-6366  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6119, `_track_pos`:6128, `_social_row_button`:6139, `_refresh_social`:6146, `_on_dance_floor`:6208, `_toggle_dance`:6211, `_build_dance_floor`:6219, `_social_tick`:6245, `_photo`:6317

## 6367-6862  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6389, `_game_state`:6397, `_build_arcade`:6409, `_c4_empty`:6460, `_c4_drop_row`:6466, `_c4_winner`:6472, `_c4_bot_move`:6493, `_c4_code`:6522, `_c4_ready`:6528, `_c4_tap`:6531, `_c4_check`:6552, `_c4_tick`:6576, `_rx_ready`:6603, `_rx_start`:6606, `_rx_tap`:6620, `_rx_send_time`:6645, `_rx_resolve`:6652, `_rx_tick`:6678, `_mem_start`:6693, `_mem_tap`:6709, `_mem_finish`:6724, `_mem_tick`:6740, `_mem_board_text`:6747, `_build_arcade_panel`:6758, `_refresh_arcade_panel`:6801

## 6863-7156  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6926, `_quiz_slot`:6929, `_quiz_question`:6939, `_quiz_bot_score`:6968, `_in_quiz`:6977, `_build_quiz`:6980, `_quiz_answer`:7050, `_quiz_msg`:7063, `_quiz_board`:7071, `_quiz_tick`:7081, `_quiz_refresh`:7123

## 7157-8663  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7328, `_sites_found`:7331, `_sites_total`:7334, `_bits`:7337, `_ach_value`:7344, `_ach_tick`:7399, `_ach_check`:7424, `_ach_by_id`:7460, `_ach_msg`:7466, `_build_ach`:7479, `_ach_show`:7510, `_open_ach`:7530, `_close_ach`:7536, `_refresh_ach`:7540, `_ach_num`:7571, `_minimap_tap`:7574, `_menu_go`:7581, `_menu_stay`:7586, `_menu_call_car`:7590, `_toggle_clean_hud`:7596, `_refresh_menu_buttons`:7602, `_clean_hud_tick`:7612, `_draw_joystick`:7653, `_input`:7658, `_stick_zone`:7735, `_notification`:7739, `_physics_process`:7754, `_follow_camera`:7902, `_follow_walk_camera`:7938, `_interact`:7961, `_refresh_hud`:8118, `_open_panel`:8243, `_layout_panels`:8269, `_toggle_menu`:8292, `_rescue`:8334, `_show_toast`:8366, `_save_progress`:8370, `_load_progress`:8460

## 8664-10838  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8665, `_radio_voice`:8668, `_radio_make`:8701, `_radio_set`:8772, `_radio_play`:8794, `_radio_next`:8799, `_radio_talk_line`:8803, `_radio_caption`:8824, `_radio_refresh`:8832, `_process`:8845, `_build_peds`:8896, `_update_peds`:9007, `_update_ped`:9026, `_smoke_test`:9080, `_smoke_chase`:9720, `_smoke_orole`:9753, `_smoke_levels`:9782, `_smoke_bus`:9823, `_smoke_chase_extras`:9908, `_smoke_marina`:9936, `_blocked_at`:10038, `_blocker`:10053, `_on_screen`:10066, `_wait_radio`:10071, `_smoke_radio_peds`:10078, `_smoke_boutique`:10148, `_smoke_models`:10176, `_smoke_garage_ridge`:10200, `_save_shot`:10576, `_people_shots`:10586, `_shots`:10627, `_shot_car`:10821, `_capture_preview`:10831

## 10839-11487  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10906, `_downtown_count`:10909, `_nearest_downtown`:10916, `_check_downtown`:10930, `_discover_downtown`:10943, `_box_batch`:10957, `_model_batch`:10977, `_cut_ranges`:11031, `_dt_ranges`:11043, `_dt_has`:11050, `_dt_near_cross`:11056, `_place`:11062, `_signal_pole`:11073, `_cyl_batch`:11092, `_city_signals`:11116, `_ensure_light_mats`:11167, `_city_lamps`:11177, `_build_downtown`:11221, `_dt_block`:11421, `_downtown_token`:11427, `_build_park`:11444, `_build_plaza`:11473

## 11488-11591  old city and Bay details

`_build_city_detail`:11489

## 11592-12001  traffic

`_build_traffic`:11593, `_path_sample`:11688, `_light_look`:11702, `_light_green`:11710, `_traffic_place`:11714, `_traffic_blocked_by`:11726, `_traffic_tick`:11738, `_smoke_downtown`:11844, `_skyline_shot`:11956, `_skyline_shots`:11964

## 12002-12354  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12048, `_web_scale`:12103, `_web_fps_tick`:12113, `_world_to_uv`:12130, `_map_angle`:12133, `_build_minimap`:12141, `_open_map`:12214, `_close_map`:12225, `_mini_point`:12232, `_site_markers`:12236, `_draw_arrow`:12268, `_draw_minimap`:12275, `_draw_full_map`:12322, `_minimap_tick`:12347

## 12355-12612  camera views

`_build_view_controls`:12356, `_cycle_view`:12398, `_apply_view`:12408, `_hide_labels`:12446, `_unfade`:12452, `_bake_map`:12458, `_shot_stats`:12508, `_view_shots`:12511, `_smoke_views`:12552

## 12613-12860  v0.17.0: level-up celebration

`_build_level_fx`:12624, `_draw_level_rays`:12661, `_level_fx_tick`:12671, `_level_sound`:12676, `_fx_material`:12718, `_level_up_fx`:12726, `_smoke_level_fx`:12827, `_levelup_shots`:12836

## 12861-12980  v0.18.0: walk-in stadium

`_collider_yaw`:12866, `_build_stadium_walls`:12877, `_look`:12905, `_smoke_stadium_eye`:12914, `_stadium_shots`:12950

## 12981-13142  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13005, `_arrow_mesh`:13017, `_build_guidance`:13040, `_guide_target`:13065, `_guidance_tick`:13094, `_draw_hud_arrow`:13120

## 13143-13328  checkpoints

`_build_checkpoints`:13144, `_refresh_checkpoints`:13189, `_check_checkpoints`:13195, `_activate_checkpoint`:13205, `_checkpoint_spawn`:13226, `_spawn_at_checkpoint`:13231, `_draw_checkpoint_icon`:13247, `_smoke_guidance_checkpoints`:13253, `_guide_shots`:13303

## 13329-13596  v0.18.0: Harbor Dome social hub

`_hub_seat`:13387, `_build_hub`:13391

## 13597-13647  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13598, `_xm_mesh`:13607, `_xm_tree`:13615

## 13648-13971  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13651, `_gt_surface`:13666, `_xm_grand_tree`:13676, `_lux_mat`:13791, `_lux_part`:13807, `_lux_box`:13810, `_lux_cyl`:13815, `_lux_ball`:13823, `_lux_new`:13831, `_lux_commit`:13836, `_lux_sofa_mesh`:13840, `_lux_chair_mesh`:13870, `_lux_table_mesh`:13890, `_lux_pouf_mesh`:13905, `_lux_batch`:13920, `_hub_christmas`:13936

## 13972-14127  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:13973

## 14128-14376  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14131, `_vx_cyl`:14138, `_vx_ball`:14146, `_vx_ring`:14154, `_hub_polish`:14162, `_hub_gate`:14185, `_hub_vip`:14247, `_hub_glass`:14360

## 14377-14584  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14378, `_build_hub_bots`:14403, `_seat_of`:14434, `_bubble`:14444, `_emote`:14493, `_hub_people_tick`:14507

## 14585-14703  seats

`_seat_taken`:14586, `_nearest_seat`:14594, `_seat_label`:14606, `_sit`:14622, `_stand_up`:14666, `_seated_tick`:14685

## 14704-14860  game panel

`_build_game_panel`:14705, `_open_game_panel`:14760, `_refresh_game_panel`:14779, `_play_robot`:14824, `_peer_at`:14838, `_opponent_name`:14845, `_pay`:14853

## 14861-14981  tic-tac-toe

`_ttt_ready`:14864, `_ttt_winner`:14870, `_ttt_bot_move`:14880, `_ttt_tap`:14906, `_ttt_code`:14926, `_ttt_check`:14932, `_ttt_tick`:14955

## 14982-15033  rock paper scissors

`_rps_ready`:14983, `_rps_pick`:14989, `_rps_resolve`:15007, `_rps_tick`:15031

## 15034-15116  online table messages

`_online_game_send`:15035, `_hub_game_msg`:15041

## 15117-15192  comedy show

`_joke_start`:15118, `_joke_tick`:15130, `_speak`:15156, `_play_rimshot`:15165

## 15193-15921  quick chat and emotes

`_build_chat`:15210, `_chat_toggle_to`:15310, `_chat_log_add`:15318, `_chat_area`:15324, `_chat_near_count`:15342, `_chat_tick`:15351, `_toggle_chat`:15398, `_say`:15412, `_do_emote`:15426, `_smoke_hub`:15435, `_shop_shots`:15609, `_car_shots`:15658, `_outfit_shots`:15689, `_hub_shots`:15737, `_sg_on_terrace`:15872, `_people_only`:15875, `_people_only_keep_cars_out`:15879, `_car_barrier`:15891, `_hub_keep_cars_out`:15905

## 15922-16084  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:15931, `_feed_add`:15940, `_feed_render`:15946, `_feed_tick`:15974, `_online_event_send`:15983, `_at_pvp_table`:15990, `_game_name`:15997, `_send_lfp`:16000, `_lfp_msg`:16017, `_accept_invite`:16038

## 16085-16325  v0.18.2: nickname and HUD relayout

`_nick_rude`:16097, `_clean_nick`:16112, `_build_nick_panel`:16124, `_open_nick`:16162, `_random_nick`:16171, `_save_nick`:16177, `_close_nick`:16196, `_refresh_nick_button`:16205, `_relayout_hud`:16209, `_smoke_nick`:16245, `_nick_shots`:16277, `_smoke_sites_reachable`:16295

## 16326-16613  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16352, `_nearest_civic`:16359, `_check_civic`:16373, `_discover_civic`:16386, `_civ_ranges`:16399, `_civ_has`:16413, `_civ_near_cross`:16419, `_build_civic`:16425, `_civic_token`:16551, `_civic_shots`:16568, `_hub_focus`:16590

## 16614-16723  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:16685, `_in_rw_lot`:16688, `_box_batch_rot`:16691, `_multi_collider`:16709

## 16724-17051  circuit geometry

`_cr_point`:16725, `_rw_build_path`:16739, `_rw_dir`:16767, `_rw_bend`:16772, `_ribbon`:16778, `_rw_band`:16798, `_rw_keepout`:16816, `_build_raceway`:16825, `_build_rw_parking`:16859, `_build_rw_pits`:16904, `_build_rw_track`:16941, `_build_rw_trackside`:16982

## 17052-17149  race car rental

`_model_key`:17053, `_race_car_start`:17056, `_tint_ghost`:17094, `_race_car_end`:17107, `_race_keep_cars_out`:17132

## 17150-17164  speed effects

`_eff_max`:17151, `_eff_accel`:17162

## 17165-17215  track helpers

`_rw_seg_progress`:17166, `_rw_track_dist`:17186, `_rw_point_dist`:17197, `_rw_player_progress`:17204, `_rw_target`:17210

## 17216-17452  events

`_rec_stop`:17217, `_rw_place`:17233, `_rw_grid_pos`:17240, `_rw_start`:17245, `_rw_spawn_ai`:17277, `_rw_ai_place`:17301, `_rw_tick`:17312, `_rw_ai_tick`:17365, `_rw_lap_done`:17407, `_rw_finish`:17419, `_rw_fmt`:17450

## 17453-17505  boosters and spikes

`_rw_buy`:17454, `_rw_use_boost`:17472, `_rw_use_spike`:17480, `_rw_drop_spike_at`:17491

## 17506-17563  online races

`_race_msg`:17507, `_join_race`:17529

## 17564-17919  raceway panel, HUD, board

`_build_raceway_ui`:17565, `_rw_layout`:17625, `_rw_open`:17632, `_rw_close`:17638, `_rw_refresh_panel`:17642, `_rw_refresh_board`:17655, `_rw_hud`:17667, `_peer_car_model`:17691, `_smoke_raceway`:17701, `_race_shots`:17882

## 17920-18127  v0.22.0: Call Car

`_call_block_reason`:17926, `_call_spot`:17943, `_call_car`:17974, `_play_horn`:17998, `_smoke_follow_call`:18022, `_follow_shots`:18095

## 18128-18427  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18143, `_build_travel`:18148, `_toggle_run`:18190, `_refresh_run`:18194, `_hud_v23_tick`:18202, `_travel_block_reason`:18231, `_travel_open`:18251, `_open_travel`:18257, `_close_travel`:18263, `_refresh_travel`:18267, `_travel_to`:18275, `_smoke_travel`:18302, `_v23_shots`:18340

## 18428-18501  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:18435, `_qr_button`:18450, `_qr_layout`:18489, `_smoke_qr`:18495

## 18502-18938  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:18522, `_open_crate`:18538, `_build_crate_ui`:18555, `_crate_pick`:18642, `_crate_reveal`:18665, `_crate_draw_car`:18692, `_crate_confetti`:18711, `_crate_sound`:18736, `_crate_drive`:18762, `_feed_add_system`:18792, `_smoke_crate`:18795, `_crate_shots`:18843

## 18939-19430  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:18980, `_quick_today`:18985, `_quick_is_done`:18988, `_quick_left`:18991, `_quick_next`:18998, `_quick_fix_target`:19011, `_quick_daily_check`:19025, `_quick_complete`:19039, `_quick_side`:19073, `_build_quick_props`:19091, `_daily_shots`:19243, `_quick_props_refresh`:19285, `_quick_fx`:19289, `_play_coin`:19305, `_smoke_quick`:19322

## 19431-19581  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:19440, `_quest_nearby`:19495, `_open_quests`:19502, `_close_quests`:19509, `_refresh_quests`:19513, `_quest_pick`:19539, `_quest_mode`:19553, `_smoke_quests`:19556

## 19582-19616  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:19586, `_my_tag_tick`:19589

## 19617-19931  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:19634, `_fc_torus`:19644, `_fc_pearl`:19652, `_fc_chrome`:19662, `_fc_glass`:19671, `_fc_glow`:19681, `_fc_ghost`:19690, `_fc_holo`:19702, `_fc_mesh`:19712, `_fc_sphere`:19732, `_fc_capsule`:19740, `_fc_cone`:19748, `_build_food_court`:19757, `_food_court_tick`:19911

## 19932-20252  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:19960, `_cm_bench`:19976, `_build_commons`:19989, `_commons_tick`:20211

## 20253-20567  v0.36: the daily puzzle

`_pz_today`:20276, `_pz_new`:20279, `_pz_neighbours`:20324, `_pz_flip`:20334, `_pz_done`:20339, `_pz_tap`:20347, `_pz_win`:20363, `_pz_reset`:20384, `_puzzle_near`:20388, `_open_puzzle`:20393, `_close_puzzle`:20401, `_pz_refresh_sign`:20405, `_build_puzzle_panel`:20413, `_pz_draw`:20444, `_smoke_chat`:20485, `_smoke_feet`:20523, `_smoke_commons`:20544

## 20568-20756  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:20630, `_bio_theta`:20634, `_bio_sec_n`:20639, `_bio_sec_of`:20642, `_bio_pt`:20645, `_bio_lp`:20650, `_bio_la`:20654, `_bio_dir`:20658, `_bio_hex_r`:20661, `_bio_apo`:20666, `_bio_open_angles`:20672, `_bio_si`:20682, `_bm`:20688, `_bsph`:20693, `_blow`:20696, `_bcone`:20707, `_bbox`:20710, `_bp`:20713, `_bq`:20718, `_bio_glass_mat`:20722, `_bio_water_mat`:20735, `_bio_mat`:20747

## 20757-21129  building blocks

`_bio_inst`:20758, `_bio_add`:20764, `_bio_model`:20767, `_bio_nature_mesh`:20773, `_bio_flush`:20807, `_bio_bar`:20842, `_bio_slab`:20855, `_bio_body`:20870, `_bio_cyl_col`:20883, `_bio_hexmesh`:20896, `_bio_hexslab`:20908, `_bio_hexpt`:20914, `_bio_gridshell`:20921, `_bio_rail`:21028, `_bio_rail_arc`:21033, `_bio_disc_deck`:21045, `_bio_ring_deck`:21051, `_bio_helix`:21062, `_bio_pillar`:21082, `_bio_cafe`:21088, `_bio_fence_line`:21102, `_bio_fence_seg`:21107, `_bio_pen`:21117

## 21130-21631  building

`_build_biosphere`:21131, `_build_biosphere_legacy`:21135, `_bio_text`:21297, `_bio_plaque`:21315, `_bio_ticket_hall`:21329, `_on_foot_collision_guard`:21385, `_bio_inside`:21395, `_bio_pass_ok`:21398, `_ticket_near`:21402, `_bio_buy_pass`:21407, `_bio_gates_update`:21423, `_bio_gate_tick`:21449, `_bio_tunnel`:21461, `_bio_grounds`:21514, `_bio_dome`:21560, `_bio_deck_mats`:21628

## 21632-21787  garden planting

`_bio_free`:21633, `_bio_spot`:21650, `_bio_garden`:21658, `_bio_pine`:21699, `_bio_tree`:21702, `_bio_big_tree`:21712, `_bio_rock`:21717, `_bio_pond`:21720, `_bio_particles`:21724, `_bio_mist`:21752, `_bio_mini_dome`:21781

## 21788-22195  the four layouts

`_bio_winter`:21789, `_bio_spring`:21881, `_bio_summer`:22006, `_bio_autumn`:22090

## 22196-22466  animals

`_bio_spawn`:22197, `_bio_load_animal`:22269, `_bio_make_quad`:22290, `_bio_load_bird`:22367, `_bio_make_penguin`:22387, `_bio_make_bird`:22409, `_bio_make_flamingo`:22433, `_bio_make_butterfly`:22454

## 22467-22596  animation, spotting and rewards

`_bio_stuck_check`:22472, `_biosphere_tick`:22490, `_bio_animate`:22497, `_bio_spot_check`:22577, `_bio_spotted`:22589, `_smoke_biosphere`:22593

## 22597-23114  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:22684, `_wear_piece`:22687, `_wear_mat`:22710, `_person_index`:22726, `_dress`:22749, `_smoke_style`:22855, `_style_shots`:23006, `_npc_look`:23078

## 23115-23268  your look: apply, save, share

`_look_clean`:23119, `_look_pack`:23134, `_owns`:23140, `_apply_look`:23145, `_relic_model`:23156, `_fc_mesh_mat`:23221, `_relic_refresh`:23224, `_relic_tick`:23238, `_peer_style`:23249

## 23269-23696  stores and the wardrobe

`_style_today`:23288, `_style_items`:23291, `_style_cat`:23299, `_style_price`:23302, `_style_deal`:23316, `_style_price_base`:23329, `_relic_stock`:23336, `_build_style_panel`:23348, `_open_store`:23388, `_open_wardrobe`:23407, `_style_close`:23410, `_style_finish`:23414, `_sync_old_avatar`:23429, `_style_tabs_for`:23436, `_refresh_style`:23441, `_style_body_rows`:23592, `_style_set_tab`:23609, `_style_step`:23613, `_style_color`:23618, `_style_pick`:23623, `_style_buy`:23658, `_ach_relics_check`:23680, `_style_face_camera`:23685

## 23697-24164  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:23733, `_ga_text`:23739, `_ga_box`:23756, `_build_galleria`:23772, `_ga_inner_tick`:23913, `_ga_shell`:23929, `_ga_inside`:23979, `_bio_cyl_col_on`:23982, `_ga_models`:23994, `_ga_lbox`:24009, `_ga_ltext`:24023, `_ga_store`:24030, `_bio_cafe_on`:24132, `_ga_mannequins`:24140

## 24165-24316  featured outfits and the Sky Run

`_ga_featured_look`:24178, `_build_ga_fun`:24199, `_ga_fun_tick`:24244, `_sky_finish`:24271, `_extra_near`:24290, `_extra_open`:24299, `_store_near`:24308

## 24317-24413  v0.41: THE SKY GARDEN

`_sg_now`:24371, `_sg_progress`:24374, `_sg_time`:24380, `_sg_stock`:24387, `_sg_mut_roll`:24402

## 24414-24551  building

`_sg_box`:24415, `_sg_text`:24421, `_build_sky_garden`:24435, `_sg_seed_spot`:24546, `_sg_codex_spot`:24549

## 24552-24732  plants

`_sg_plant_model`:24553, `_sg_refresh_all`:24658, `_sg_refresh`:24662, `_sky_garden_tick`:24698, `_sg_ready_count`:24717, `_sg_boot_note`:24724

## 24733-24852  interacting

`_sg_near`:24734, `_sg_button_text`:24757, `_sg_value`:24770, `_sg_interact`:24774, `_sg_buy`:24790, `_sg_plant`:24812, `_sg_harvest`:24823

## 24853-25096  the garden screen

`_build_sg_panel`:24854, `_sg_open`:24889, `_sg_close`:24898, `_sg_row`:24902, `_sg_refresh_panel`:24917, `_sg_pick_buy`:24962, `_sg_pick_plant`:24966, `_smoke_car_barriers`:24972, `_smoke_sky_garden`:25013

## 25097-25135  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25128, `_pass_day`:25131

## 25136-25167  album

`_album_pages`:25137, `_album_claim`:25152

## 25168-25219  season

`_season_index`:25169, `_season_tick`:25172, `_season_xp`:25181, `_season_tier`:25184, `_season_reward`:25187, `_season_claim`:25201

## 25220-25227  Harbor Night

`_harbor_night`:25221

## 25228-25259  check-in calendar

`_cal_tick`:25229

## 25260-25436  the panel

`_build_hp_panel`:25261, `_open_pass`:25296, `_hp_open`:25299, `_hp_close`:25306, `_hp_row`:25310, `_hp_bar`:25325, `_hp_refresh`:25329, `_smoke_pass`:25374

## 25437-25651  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:25441, `_cash_pill_tick`:25449, `_build_lb`:25487, `_open_lb`:25530, `_close_lb`:25538, `_lb_pick`:25542, `_lb_headers`:25547, `_lb_url`:25551, `_lb_me`:25554, `_lb_tick`:25557, `_lb_upload`:25565, `_lb_fetch`:25575, `_lb_got`:25583, `_lb_value`:25594, `_lb_refresh_ui`:25605

## 25652-26075  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:25676, `_market_near`:25753, `_build_gear`:25763, `_gear_piece`:25771, `_build_pet`:25816, `_market_apply`:25858, `_market_tick`:25882, `_build_market_panel`:25904, `_open_market`:25930, `_close_market`:25937, `_refresh_market`:25941, `_market_pick`:25994, `_toggle_board`:26032, `_board_tick`:26039

## 26076-26317  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26108, `_ds_label`:26127, `_build_display`:26141, `_ds_got`:26220, `_ds_sorted`:26229, `_ds_render_board`:26243, `_ds_render_news`:26269, `_display_tick`:26288

## 26318-26496  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26335, `_toggle_streamer`:26422, `_streamer_badge_tap`:26438, `_streamer_tick`:26442

## 26497-26533  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:26503, `_car_back`:26510, `_car_park_tick`:26517

## 26534-26630  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:26538, `_bus_eta`:26592, `_bus_displays_tick`:26608

## 26631-26922  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:26649, `_treasure_pick`:26652, `_treasure_spot`:26661, `_treasure_district`:26665, `_treasure_clue`:26677, `_treasure_prop`:26690, `_tp_part`:26693, `_tp_sphere`:26703, `_tp_cyl`:26711, `_treasure_prop_side`:26720, `_build_treasure_props`:26732, `_build_treasure`:26776, `_treasure_dir_char`:26845, `_treasure_tick`:26854, `_treasure_claim`:26908

## 26923-27023  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:26924, `_halo_mat`:26956, `_smoke_treasure`:26981

## 27024-27347  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27045, `_fm_send`:27048, `_fm_area`:27054, `_fm_glow_mesh`:27070, `_fm_block_reason`:27088, `_fm_start`:27100, `_fm_announce`:27128, `_fm_finish`:27131, `_fm_msg`:27149, `_fm_check_paid`:27200, `_fm_tick`:27218, `_smoke_findme`:27274

## 27348-27458  v0.24.2: road map (for moving people off the road)

`_floor_note`:27354, `_floor_disc`:27368, `_floor_top`:27377, `_ground_at`:27395, `_note_road`:27413, `_on_road`:27420, `_ped_curb`:27430, `_curb_spot`:27440

## 27459-27754  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27481, `_ex_grid`:27489, `_ex_lamps`:27524, `_ex_umbrella`:27547, `_ex_yards`:27554, `_build_expansion`:27569, `_expand_shots`:27732

## 27755-27949  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:27796, `_v27_near_cross`:27888, `_v27_near_any_road`:27895, `_v27_in_district`:27901, `_sea_tick`:27915, `_sea_tow`:27934

## 27950-28590  Harbor Loop sky train

`_sky_build_path`:28001, `_sky_pos`:28042, `_sky_dir`:28056, `_sky_project`:28061, `_sky_trip_time`:28080, `_sky_trip_dist`:28086, `_sky_now`:28097, `_sky_state`:28100, `_sky_time_at_station`:28115, `_sky_next_arrival`:28122, `_build_skytrain`:28135, `_sky_make_car`:28264, `_sky_skin`:28301, `_sky_place_trains`:28321, `_sky_build_station`:28340, `_sky_near`:28405, `_sky_fmt`:28414, `_sky_enter`:28418, `_sky_leave_platform`:28436, `_sky_board`:28446, `_sky_alight`:28459, `_sky_action`:28472, `_sky_tick`:28489, `_sky_camera`:28527, `_tour_today`:28543, `_tour_stamp`:28546, `_sky_hud`:28569

## 28591-28928  Day and night

`_game_hour`:28672, `_day_key`:28684, `_night_setup`:28699, `_night_scan_mesh`:28789, `_daynight_tick`:28814, `_daynight_apply`:28821, `_daynight_lights`:28913, `_cycle_day_mode`:28918, `_refresh_time_button`:28925

## 28929-29564  v0.27 smoke test and screenshots

`_smoke_v27`:28930, `_city_shots`:29133

## 29565-29981  v0.27: Harbor International Airport (north of the city)

`_build_airport`:29599, `_ap_plane`:29775, `_ap_truck`:29795, `_ap_baggage_train`:29836, `_ap_loop_pos`:29849, `_ap_loop_len`:29865, `_ap_flight_at`:29871, `_ap_tick`:29895, `_airport_ped_plan`:29918, `_smoke_airport`:29938

## 29982-30495  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:29996, `_nav_spot`:30003, `_nav_idx`:30007, `_nav_pos`:30014, `_nav_blocked`:30018, `_nav_nearest_free`:30028, `_nav_bfs`:30056, `_nav_build`:30100, `_stroller`:30171, `_stroll_place`:30187, `_stroll_next`:30208, `_nav_clear_line`:30242, `_stroll_aim`:30253, `_strollers_tick`:30285, `_smoke_strollers`:30380

## 30496-30656  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:30531, `_dir_fmt`:30534, `_signpost_spot`:30537, `_build_signposts`:30554

## 30657-30753  the Directions panel and chip

`_build_dir_panel`:30658, `_open_dir`:30700, `_dir_close`:30709, `_dir_pick`:30713, `_dir_stop`:30718, `_dir_stop_and_close`:30723, `_dir_tick`:30727

## 30754-31295  v0.44: Grand Central

`_gc_mesh`:30783, `_gc_mat`:30816, `_gc_glass`:30825, `_gb`:30835, `_gb_solid`:30841, `_gb_flush`:30845, `_gc_tree`:30875, `_gc_text`:30880, `_gc_planter`:30895, `_gc_kiosk`:30901, `_goods_color`:30931, `_goods_mat`:30934, `_kiosk_goods`:30938, `_build_grand_central`:31016, `_build_gc_towers`:31184, `_gc_tick`:31279

## 31296-31587  v0.44: filling the empty land

`_loft`:31313, `_fill_clear`:31355, `_build_fill`:31365, `_hg_in_lake`:31413, `_hg_path`:31417, `_floor_note_rot`:31425, `_build_gardens`:31433, `_build_fan_plaza`:31543

## 31588-31622  v0.45: hover car underglow

`_car_underglow`:31591

## 31623-31787  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:31624

## 31788-31819  v0.47: street stalls downtown

`_build_street_stalls`:31792, `_cull_people_in`:31812

## 31820-31918  v0.48: places that open as you level up

`_place_lock_of`:31833, `_place_root`:31839, `_place_unlocked`:31842, `_build_place_signs`:31850, `_places_refresh`:31895, `_places_tick`:31912

## 31919-31963  v0.50: city careers

`_career_rank_name`:31944, `_career_mult`:31947, `_career_block_reason`:31952, `_career_start`:31955, `_career_end`:31960

## 31964-32014  v0.52: careers as clear job loops

`_cid`:31991, `_career_target`:32005, `_career_tick`:32012

## 32015-32022  taxi

`_taxi_meter`:32016

## 32023-32026  paramedic

(no functions)

## 32027-32031  police

`_career_chase_over`:32029

## 32032-32037  firefighter

`_fire_aimed`:32033

## 32038-32047  the step bar

`_career_bar_text`:32041, `_career_hud`:32045

## 32048-32074  cut scenes

`_cs_skip`:32066

## 32075-32079  siren

(no functions)

## 32080-32091  the Careers panel

`_build_career_panel`:32081, `_open_careers`:32084, `_career_close`:32088

## 32092-32515  v0.50: homes

`_home_door_spots`:32132, `_build_homes`:32147, `_home_labels`:32176, `_home_door_near`:32185, `_home_origin`:32194, `_home_slot_near`:32197, `_home_exit_near`:32208, `_home_btn`:32215, `_home_interact`:32228, `_home_buy`:32247, `_home_default_layout`:32261, `_home_enter`:32269, `_home_leave`:32289, `_hm`:32297, `_home_build_room`:32316, `_home_refresh_room`:32425, `_furni_build`:32439

## 32516-32851  decorating

`_build_home_panels`:32517, `_open_homes`:32562, `_home_row_go`:32572, `_home_panel_close`:32592, `_deco_open`:32596, `_deco_pick`:32619, `_smoke_careers_homes`:32642

## 32852-32986  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:32856, `_home_slots`:32864, `_home_ring`:32891, `_furni_cat`:32897, `_home_fix_layout`:32903, `_home_build_layout`:32931

## 32987-33420  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33050, `_ch_homes`:33056, `_ch_step_text`:33063, `_ch_step_done`:33074, `_ch_target`:33088, `_ch_finish_chapter`:33097, `_chapters_tick`:33119, `_hud_top_stack`:33159, `_build_chapters_ui`:33189, `_chapters_restart_ask`:33231, `_chapters_restart`:33234, `_chapters_text`:33244, `_open_chapters`:33264, `_chapters_close`:33271, `_smoke_chapters`:33275, `_step_sound`:33396

## 33421-33459  v0.51.1: join and leave messages

`_announce_join`:33428, `_announce_already_here`:33447, `_announce_leave`:33455

## 33460-33724  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33476, `_shot_tick`:33482, `_draw_shot_icon`:33514, `_shot_enter`:33523, `_shot_exit`:33537, `_shot_release_controls`:33549, `_shot_stick_zone`:33556, `_shot_input`:33559, `_smoke_photo`:33631

## 33725-34023  v0.51.3: stream joiners

`_viewer_count`:33745, `_stream_join_check`:33751, `_stream_join_start`:33758, `_sj_streamer`:33775, `_stream_join_tick`:33784, `_stream_join_land`:33808, `_sj_welcome`:33824, `_smoke_stream_join`:33858, `_career_shot`:33941

## 34024-34140  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34028, `_st_restore`:34066, `_smoke_streamer_clean`:34087, `_world_bio_passport`:34138

