# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-626  Core (unlabelled)

`_symbol_font`:286, `_ready`:298, `_surf_texture`:569, `_surface_material`:591

## 627-699  v0.34.6: futuristic towers for the old city

`_future_tower`:631

## 700-778  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:707, `_skin_common`:742, `_future_wall`:750, `_future_roof`:764, `_future_pave`:772

## 779-839  v0.34.4: futuristic road surface

`_road_textures`:786, `_future_road`:820

## 840-2048  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:859, `_real_tex`:900, `_real_setup`:908, `_real_kind`:929, `_realify`:935, `_real_glass`:972, `_make_window_textures`:992, `_material`:1025, `_box`:1050, `_sign`:1072, `_build_world`:1084, `_future_kiosk`:1195, `_build_collectibles`:1221, `_auto_collect_tick`:1254, `_find_count`:1275, `_nearest_find`:1282, `_destination`:1296, `_toggle_activity`:1332, `_collect_find`:1361, `_owned_count`:1376, `_ridge_open`:1383, `_ridge_count`:1387, `_nearest_ridge`:1394, `_apply_car`:1408, `_tune_level`:1438, `_tune_cost`:1441, `_car_stats`:1447, `_buy_tune`:1454, `_open_tune`:1475, `_back_to_garage`:1481, `_refresh_tune`:1485, `_bay_open`:1496, `_area_open`:1499, `_bay_count`:1502, `_nearest_bay`:1509, `_build_bay`:1523, `_check_bay`:1576, `_discover_bay`:1589, `_north_count`:1602, `_north_open`:1609, `_nearest_north`:1612, `_check_north`:1626, `_discover_north`:1639, `_prop`:1652, `_collider`:1666, `_first_mesh`:1676, `_scatter`:1685, `_prop_stretch`:1719, `_north_token`:1728, `_nm_roads`:1755, `_prop_big`:1770, `_nm_near_cross`:1786, `_build_north`:1793, `_build_nm_blocks`:1910, `_build_north_landscape`:1995, `_nm_free`:2022, `_build_landscape`:2032

## 2049-2537  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2050, `_online_toggle`:2064, `_online_autostart`:2090, `_online_connect`:2109, `_online_stop`:2116, `_online_next_ref`:2127, `_online_send`:2131, `_online_join_frame`:2135, `_online_pos_frame`:2138, `_online_tick`:2147, `_online_handle`:2181, `_online_clean_name`:2238, `_online_peer_update`:2247, `_online_make_peer`:2317, `_peer_look`:2358, `_online_tint`:2415, `_paint_mat`:2431, `_online_update_peers`:2443, `_online_clear_peers`:2523, `_online_refresh_button`:2528

## 2538-2710  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2618, `_marina_count`:2621, `_nearest_marina`:2628, `_check_marina`:2642, `_discover_marina`:2655, `_shop_available`:2668, `_nearest_shop`:2671, `_premium_cars`:2679, `_glass`:2686, `_shop_building`:2692, `_shop_pad`:2702

## 2711-3229  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2712, `_bus_last`:2715, `_build_bus`:2718, `_bus_boxes`:2745, `_bus_skin`:2755, `_bus_side`:2768, `_bus_reset`:2771, `_bus_text`:2780, `_bus_tick`:2785, `_bus_near`:2825, `_bus_board`:2836, `_bus_alight`:2851, `_build_marina`:2865, `_set_hat`:2974, `_build_hat`:2977, `_cyl`:3042, `_hat_part`:3051, `_apply_avatar`:3060, `_shop_count`:3072, `_shop_open`:3082, `_shop_step`:3100, `_shop_close`:3106, `_owned_text`:3119, `_refresh_shop`:3122, `_shop_action`:3175, `_journal_flip`:3226

## 3230-3284  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3241, `_xp`:3244, `_level_for`:3251, `_level`:3259, `_level_text`:3262, `_check_level`:3272

## 3285-3387  v0.11.0: online police vs thief

`_orole_ready`:3286, `_orole_start`:3289, `_orole_end`:3316, `_orole_tick`:3325

## 3388-4331  v0.10.0: chase mode (offline)

`_chase_open`:3389, `_chase_clear`:3394, `_chase_make_unit`:3408, `_chase_spawn_point`:3438, `_chase_start`:3447, `_chase_end`:3483, `_chase_steer`:3502, `_chase_roadblock`:3538, `_chase_heli_build`:3583, `_chase_extras`:3609, `_chase_tick`:3636, `_start_trial`:3700, `_cancel_trial`:3727, `_check_trial`:3732, `_finish_trial`:3749, `_trial_count`:3765, `_open_trials`:3772, `_refresh_trials`:3776, `_update_gate`:3788, `_slab`:3806, `_build_ridge`:3824, `_check_ridge`:3887, `_discover`:3900, `_mission_progress`:3914, `_check_missions`:3976, `_open_garage`:3987, `_open_journal`:3992, `_close_sub`:3997, `_bar`:4000, `_refresh_garage`:4004, `_garage_step`:4029, `_garage_action`:4033, `_refresh_journal`:4053, `_visited_shops`:4086, `_build_panels`:4093, `_build_player`:4253, `_build_car`:4291, `_try_model`:4320

## 4332-5016  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4333, `_kshader`:4407, `_ksync`:4413, `_kskin`:4428, `_make_kperson`:4434, `_hat_y`:4498, `_sit_drop`:4501, `_kplay`:4504, `_kpeople_tick`:4514, `_pose_person`:4543, `_pose_limbs`:4560, `_person_lift`:4622, `_snap_crowd_feet`:4635, `_people_life_tick`:4651, `_life_one`:4688, `_cull_person`:4698, `_recolor_car_model`:4706, `_apply_car_model`:4720, `_landmark`:4740, `_label`:4750, `_button`:4757, `_panel`:4769, `_build_hud`:4779

## 5017-5135  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:5023, `_menu_tab`:5029, `_watch_tick`:5052, `_watch_count`:5094, `_online_pill_tap`:5101, `_online_pill_tick`:5107, `online_config_ok`:5133

## 5136-5173  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5139, `_offroad`:5145, `_ground_near`:5158, `_collectibles_on_road`:5165

## 5174-5313  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5186, `_build_quest_offer`:5190, `_quest_offer_tick`:5220, `_quest_auto_pick`:5270, `_quest_accept`:5285, `_quest_decline`:5299, `_quest_stop`:5305

## 5314-5681  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5338, `_holo_material`:5347, `_build_future`:5355, `_build_neon`:5369, `_model_profile`:5438, `_model_body_box`:5461, `_build_holograms`:5475, `_holo_tick`:5525, `_build_sky_traffic`:5542, `_sky_hover_car`:5560, `_sky_drone`:5607, `_sky_traffic_tick`:5651, `_future_lights`:5670

## 5682-6181  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5741, `_crew_col`:5749, `_peer_crewmate`:5752, `_set_ring_color`:5755, `_level_color`:5782, `_tier_color`:5795, `_my_ach_tier`:5798, `_style_ring`:5805, `_social_peer_extras`:5853, `_social_tag`:5867, `_my_tag_extra`:5879, `_soc_send`:5892, `_social_msg`:5907, `_social_accept`:5946, `_social_go`:5967, `_soc_friend`:5986, `_soc_invite`:5993, `_soc_goto`:5998, `_soc_high_five`:6006, `_soc_gift`:6026, `_soc_crew_invite`:6043, `_gift_day_check`:6050, `_crew_create`:6056, `_crew_cycle_color`:6066, `_crew_leave`:6071, `_crew_mate_near`:6079, `_crew_board`:6087, `_build_social`:6106, `_social_online`:6168, `_open_social`:6172, `_close_social`:6178

## 6182-6432  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6185, `_track_pos`:6194, `_social_row_button`:6205, `_refresh_social`:6212, `_on_dance_floor`:6274, `_toggle_dance`:6277, `_build_dance_floor`:6285, `_social_tick`:6311, `_photo`:6383

## 6433-6928  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6455, `_game_state`:6463, `_build_arcade`:6475, `_c4_empty`:6526, `_c4_drop_row`:6532, `_c4_winner`:6538, `_c4_bot_move`:6559, `_c4_code`:6588, `_c4_ready`:6594, `_c4_tap`:6597, `_c4_check`:6618, `_c4_tick`:6642, `_rx_ready`:6669, `_rx_start`:6672, `_rx_tap`:6686, `_rx_send_time`:6711, `_rx_resolve`:6718, `_rx_tick`:6744, `_mem_start`:6759, `_mem_tap`:6775, `_mem_finish`:6790, `_mem_tick`:6806, `_mem_board_text`:6813, `_build_arcade_panel`:6824, `_refresh_arcade_panel`:6867

## 6929-7222  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6992, `_quiz_slot`:6995, `_quiz_question`:7005, `_quiz_bot_score`:7034, `_in_quiz`:7043, `_build_quiz`:7046, `_quiz_answer`:7116, `_quiz_msg`:7129, `_quiz_board`:7137, `_quiz_tick`:7147, `_quiz_refresh`:7189

## 7223-8814  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7394, `_sites_found`:7397, `_sites_total`:7400, `_bits`:7403, `_ach_value`:7410, `_ach_tick`:7465, `_ach_check`:7490, `_ach_by_id`:7526, `_ach_msg`:7532, `_build_ach`:7545, `_ach_show`:7576, `_open_ach`:7596, `_close_ach`:7602, `_refresh_ach`:7606, `_ach_num`:7637, `_minimap_tap`:7640, `_menu_go`:7647, `_menu_stay`:7652, `_menu_call_car`:7656, `_toggle_clean_hud`:7662, `_refresh_menu_buttons`:7668, `_clean_hud_tick`:7678, `_draw_joystick`:7719, `_input`:7724, `_touch_text_focus`:7817, `_stick_zone`:7837, `_notification`:7841, `_physics_process`:7858, `_follow_camera`:8011, `_follow_walk_camera`:8053, `_interact`:8076, `_refresh_hud`:8238, `_open_panel`:8367, `_layout_panels`:8397, `_toggle_menu`:8424, `_rescue`:8470, `_show_toast`:8502, `_save_progress`:8506, `_load_progress`:8603

## 8815-11447  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8816, `_radio_voice`:8819, `_radio_make`:8852, `_radio_set`:8923, `_radio_play`:8945, `_radio_next`:8950, `_radio_talk_line`:8954, `_radio_caption`:8975, `_radio_refresh`:8983, `_process`:8996, `_build_peds`:9047, `_update_peds`:9158, `_update_ped`:9177, `_smoke_test`:9231, `_smoke_chase`:9884, `_smoke_orole`:9917, `_smoke_levels`:9946, `_smoke_bus`:9987, `_smoke_chase_extras`:10072, `_smoke_marina`:10100, `_blocked_at`:10202, `_blocker`:10217, `_on_screen`:10230, `_wait_radio`:10235, `_smoke_radio_peds`:10242, `_smoke_typed_chat`:10312, `_smoke_chat_touch`:10331, `_smoke_cafe`:10352, `_smoke_boutique`:10378, `_smoke_models`:10406, `_smoke_garage_ridge`:10430, `_save_shot`:10806, `_sky_shots`:10816, `_pet_shots`:10845, `_tracker_shots`:10880, `_infected_shots`:10914, `_paris_shots`:10965, `_people_shots`:11195, `_shots`:11236, `_shot_car`:11430, `_capture_preview`:11440

## 11448-12096  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11515, `_downtown_count`:11518, `_nearest_downtown`:11525, `_check_downtown`:11539, `_discover_downtown`:11552, `_box_batch`:11566, `_model_batch`:11586, `_cut_ranges`:11640, `_dt_ranges`:11652, `_dt_has`:11659, `_dt_near_cross`:11665, `_place`:11671, `_signal_pole`:11682, `_cyl_batch`:11701, `_city_signals`:11725, `_ensure_light_mats`:11776, `_city_lamps`:11786, `_build_downtown`:11830, `_dt_block`:12030, `_downtown_token`:12036, `_build_park`:12053, `_build_plaza`:12082

## 12097-12200  old city and Bay details

`_build_city_detail`:12098

## 12201-12610  traffic

`_build_traffic`:12202, `_path_sample`:12297, `_light_look`:12311, `_light_green`:12319, `_traffic_place`:12323, `_traffic_blocked_by`:12335, `_traffic_tick`:12347, `_smoke_downtown`:12453, `_skyline_shot`:12565, `_skyline_shots`:12573

## 12611-12978  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12657, `_web_scale`:12720, `_web_fps_tick`:12730, `_world_to_uv`:12754, `_map_angle`:12757, `_build_minimap`:12765, `_open_map`:12838, `_close_map`:12849, `_mini_point`:12856, `_site_markers`:12860, `_draw_arrow`:12892, `_draw_minimap`:12899, `_draw_full_map`:12946, `_minimap_tick`:12971

## 12979-13259  camera views

`_build_view_controls`:12980, `_sky_grade`:13022, `_cycle_view`:13037, `_apply_view`:13047, `_hide_labels`:13091, `_unfade`:13097, `_bake_map`:13103, `_shot_stats`:13153, `_view_shots`:13156, `_smoke_views`:13197

## 13260-13507  v0.17.0: level-up celebration

`_build_level_fx`:13271, `_draw_level_rays`:13308, `_level_fx_tick`:13318, `_level_sound`:13323, `_fx_material`:13365, `_level_up_fx`:13373, `_smoke_level_fx`:13474, `_levelup_shots`:13483

## 13508-13629  v0.18.0: walk-in stadium

`_collider_yaw`:13513, `_build_stadium_walls`:13524, `_look`:13552, `_smoke_stadium_eye`:13561, `_stadium_shots`:13599

## 13630-13791  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13654, `_arrow_mesh`:13666, `_build_guidance`:13689, `_guide_target`:13714, `_guidance_tick`:13743, `_draw_hud_arrow`:13769

## 13792-13977  checkpoints

`_build_checkpoints`:13793, `_refresh_checkpoints`:13838, `_check_checkpoints`:13844, `_activate_checkpoint`:13854, `_checkpoint_spawn`:13875, `_spawn_at_checkpoint`:13880, `_draw_checkpoint_icon`:13896, `_smoke_guidance_checkpoints`:13902, `_guide_shots`:13952

## 13978-14256  v0.18.0: Harbor Dome social hub

`_hub_seat`:14036, `_build_hub`:14040

## 14257-14307  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14258, `_xm_mesh`:14267, `_xm_tree`:14275

## 14308-14631  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14311, `_gt_surface`:14326, `_xm_grand_tree`:14336, `_lux_mat`:14451, `_lux_part`:14467, `_lux_box`:14470, `_lux_cyl`:14475, `_lux_ball`:14483, `_lux_new`:14491, `_lux_commit`:14496, `_lux_sofa_mesh`:14500, `_lux_chair_mesh`:14530, `_lux_table_mesh`:14550, `_lux_pouf_mesh`:14565, `_lux_batch`:14580, `_hub_christmas`:14596

## 14632-14787  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14633

## 14788-15036  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14791, `_vx_cyl`:14798, `_vx_ball`:14806, `_vx_ring`:14814, `_hub_polish`:14822, `_hub_gate`:14845, `_hub_vip`:14907, `_hub_glass`:15020

## 15037-15251  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:15038, `_build_hub_bots`:15063, `_seat_of`:15094, `_bubble`:15104, `_emote`:15160, `_hub_people_tick`:15174

## 15252-15370  seats

`_seat_taken`:15253, `_nearest_seat`:15261, `_seat_label`:15273, `_sit`:15289, `_stand_up`:15333, `_seated_tick`:15352

## 15371-15527  game panel

`_build_game_panel`:15372, `_open_game_panel`:15427, `_refresh_game_panel`:15446, `_play_robot`:15491, `_peer_at`:15505, `_opponent_name`:15512, `_pay`:15520

## 15528-15648  tic-tac-toe

`_ttt_ready`:15531, `_ttt_winner`:15537, `_ttt_bot_move`:15547, `_ttt_tap`:15573, `_ttt_code`:15593, `_ttt_check`:15599, `_ttt_tick`:15622

## 15649-15700  rock paper scissors

`_rps_ready`:15650, `_rps_pick`:15656, `_rps_resolve`:15674, `_rps_tick`:15698

## 15701-15783  online table messages

`_online_game_send`:15702, `_hub_game_msg`:15708

## 15784-15859  comedy show

`_joke_start`:15785, `_joke_tick`:15797, `_speak`:15823, `_play_rimshot`:15832

## 15860-16759  quick chat and emotes

`_build_chat`:15882, `_chat_toggle_to`:15999, `_chat_log_add`:16007, `_chat_area`:16013, `_chat_near_count`:16031, `_chat_tick`:16040, `_toggle_chat`:16089, `_chat_fit`:16104, `_chat_clean`:16110, `_chat_wrap`:16127, `_chat_send_text`:16149, `_typing`:16172, `_say`:16175, `_do_emote`:16191, `_smoke_hub`:16200, `_chat_shots`:16374, `_cafe_shots`:16399, `_shop_shots`:16447, `_car_shots`:16496, `_outfit_shots`:16527, `_hub_shots`:16575, `_sg_on_terrace`:16710, `_people_only`:16713, `_people_only_keep_cars_out`:16717, `_car_barrier`:16729, `_hub_keep_cars_out`:16743

## 16760-16925  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16769, `_feed_add`:16778, `_feed_render`:16784, `_feed_tick`:16812, `_online_event_send`:16821, `_at_pvp_table`:16828, `_game_name`:16835, `_send_lfp`:16838, `_lfp_msg`:16855, `_accept_invite`:16876

## 16926-17167  v0.18.2: nickname and HUD relayout

`_nick_rude`:16938, `_clean_nick`:16953, `_build_nick_panel`:16965, `_open_nick`:17003, `_random_nick`:17012, `_save_nick`:17018, `_close_nick`:17037, `_refresh_nick_button`:17046, `_relayout_hud`:17050, `_smoke_nick`:17087, `_nick_shots`:17119, `_smoke_sites_reachable`:17137

## 17168-17455  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17194, `_nearest_civic`:17201, `_check_civic`:17215, `_discover_civic`:17228, `_civ_ranges`:17241, `_civ_has`:17255, `_civ_near_cross`:17261, `_build_civic`:17267, `_civic_token`:17393, `_civic_shots`:17410, `_hub_focus`:17432

## 17456-17565  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17527, `_in_rw_lot`:17530, `_box_batch_rot`:17533, `_multi_collider`:17551

## 17566-17893  circuit geometry

`_cr_point`:17567, `_rw_build_path`:17581, `_rw_dir`:17609, `_rw_bend`:17614, `_ribbon`:17620, `_rw_band`:17640, `_rw_keepout`:17658, `_build_raceway`:17667, `_build_rw_parking`:17701, `_build_rw_pits`:17746, `_build_rw_track`:17783, `_build_rw_trackside`:17824

## 17894-17991  race car rental

`_model_key`:17895, `_race_car_start`:17898, `_tint_ghost`:17936, `_race_car_end`:17949, `_race_keep_cars_out`:17974

## 17992-18006  speed effects

`_eff_max`:17993, `_eff_accel`:18004

## 18007-18057  track helpers

`_rw_seg_progress`:18008, `_rw_track_dist`:18028, `_rw_point_dist`:18039, `_rw_player_progress`:18046, `_rw_target`:18052

## 18058-18294  events

`_rec_stop`:18059, `_rw_place`:18075, `_rw_grid_pos`:18082, `_rw_start`:18087, `_rw_spawn_ai`:18119, `_rw_ai_place`:18143, `_rw_tick`:18154, `_rw_ai_tick`:18207, `_rw_lap_done`:18249, `_rw_finish`:18261, `_rw_fmt`:18292

## 18295-18347  boosters and spikes

`_rw_buy`:18296, `_rw_use_boost`:18314, `_rw_use_spike`:18322, `_rw_drop_spike_at`:18333

## 18348-18405  online races

`_race_msg`:18349, `_join_race`:18371

## 18406-18761  raceway panel, HUD, board

`_build_raceway_ui`:18407, `_rw_layout`:18467, `_rw_open`:18474, `_rw_close`:18480, `_rw_refresh_panel`:18484, `_rw_refresh_board`:18497, `_rw_hud`:18509, `_peer_car_model`:18533, `_smoke_raceway`:18543, `_race_shots`:18724

## 18762-18969  v0.22.0: Call Car

`_call_block_reason`:18768, `_call_spot`:18785, `_call_car`:18816, `_play_horn`:18840, `_smoke_follow_call`:18864, `_follow_shots`:18937

## 18970-19427  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18995, `_place_portal_button`:19001, `_portal_pressed`:19008, `_build_travel`:19016, `_toggle_run`:19121, `_refresh_run`:19125, `_hud_v23_tick`:19133, `_travel_block_reason`:19165, `_travel_open`:19185, `_open_travel`:19191, `_open_worlds`:19197, `_open_case`:19203, `_case_step`:19215, `_case_refresh`:19219, `_case_submit`:19223, `_close_case`:19232, `_sky_go`:19236, `_close_worlds`:19246, `_refresh_worlds`:19250, `_world_go`:19256, `_close_travel`:19263, `_refresh_travel`:19267, `_travel_to`:19275, `_smoke_travel`:19302, `_v23_shots`:19340

## 19428-19501  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19435, `_qr_button`:19450, `_qr_layout`:19489, `_smoke_qr`:19495

## 19502-19938  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19522, `_open_crate`:19538, `_build_crate_ui`:19555, `_crate_pick`:19642, `_crate_reveal`:19665, `_crate_draw_car`:19692, `_crate_confetti`:19711, `_crate_sound`:19736, `_crate_drive`:19762, `_feed_add_system`:19792, `_smoke_crate`:19795, `_crate_shots`:19843

## 19939-20430  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19980, `_quick_today`:19985, `_quick_is_done`:19988, `_quick_left`:19991, `_quick_next`:19998, `_quick_fix_target`:20011, `_quick_daily_check`:20025, `_quick_complete`:20039, `_quick_side`:20073, `_build_quick_props`:20091, `_daily_shots`:20243, `_quick_props_refresh`:20285, `_quick_fx`:20289, `_play_coin`:20305, `_smoke_quick`:20322

## 20431-20581  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20440, `_quest_nearby`:20495, `_open_quests`:20502, `_close_quests`:20509, `_refresh_quests`:20513, `_quest_pick`:20539, `_quest_mode`:20553, `_smoke_quests`:20556

## 20582-20616  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20586, `_my_tag_tick`:20589

## 20617-20931  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20634, `_fc_torus`:20644, `_fc_pearl`:20652, `_fc_chrome`:20662, `_fc_glass`:20671, `_fc_glow`:20681, `_fc_ghost`:20690, `_fc_holo`:20702, `_fc_mesh`:20712, `_fc_sphere`:20732, `_fc_capsule`:20740, `_fc_cone`:20748, `_build_food_court`:20757, `_food_court_tick`:20911

## 20932-21253  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20961, `_cm_bench`:20977, `_build_commons`:20990, `_commons_tick`:21212

## 21254-21568  v0.36: the daily puzzle

`_pz_today`:21277, `_pz_new`:21280, `_pz_neighbours`:21325, `_pz_flip`:21335, `_pz_done`:21340, `_pz_tap`:21348, `_pz_win`:21364, `_pz_reset`:21385, `_puzzle_near`:21389, `_open_puzzle`:21394, `_close_puzzle`:21402, `_pz_refresh_sign`:21406, `_build_puzzle_panel`:21414, `_pz_draw`:21445, `_smoke_chat`:21486, `_smoke_feet`:21524, `_smoke_commons`:21545

## 21569-21757  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21631, `_bio_theta`:21635, `_bio_sec_n`:21640, `_bio_sec_of`:21643, `_bio_pt`:21646, `_bio_lp`:21651, `_bio_la`:21655, `_bio_dir`:21659, `_bio_hex_r`:21662, `_bio_apo`:21667, `_bio_open_angles`:21673, `_bio_si`:21683, `_bm`:21689, `_bsph`:21694, `_blow`:21697, `_bcone`:21708, `_bbox`:21711, `_bp`:21714, `_bq`:21719, `_bio_glass_mat`:21723, `_bio_water_mat`:21736, `_bio_mat`:21748

## 21758-22130  building blocks

`_bio_inst`:21759, `_bio_add`:21765, `_bio_model`:21768, `_bio_nature_mesh`:21774, `_bio_flush`:21808, `_bio_bar`:21843, `_bio_slab`:21856, `_bio_body`:21871, `_bio_cyl_col`:21884, `_bio_hexmesh`:21897, `_bio_hexslab`:21909, `_bio_hexpt`:21915, `_bio_gridshell`:21922, `_bio_rail`:22029, `_bio_rail_arc`:22034, `_bio_disc_deck`:22046, `_bio_ring_deck`:22052, `_bio_helix`:22063, `_bio_pillar`:22083, `_bio_cafe`:22089, `_bio_fence_line`:22103, `_bio_fence_seg`:22108, `_bio_pen`:22118

## 22131-22632  building

`_build_biosphere`:22132, `_build_biosphere_legacy`:22136, `_bio_text`:22298, `_bio_plaque`:22316, `_bio_ticket_hall`:22330, `_on_foot_collision_guard`:22386, `_bio_inside`:22396, `_bio_pass_ok`:22399, `_ticket_near`:22403, `_bio_buy_pass`:22408, `_bio_gates_update`:22424, `_bio_gate_tick`:22450, `_bio_tunnel`:22462, `_bio_grounds`:22515, `_bio_dome`:22561, `_bio_deck_mats`:22629

## 22633-22788  garden planting

`_bio_free`:22634, `_bio_spot`:22651, `_bio_garden`:22659, `_bio_pine`:22700, `_bio_tree`:22703, `_bio_big_tree`:22713, `_bio_rock`:22718, `_bio_pond`:22721, `_bio_particles`:22725, `_bio_mist`:22753, `_bio_mini_dome`:22782

## 22789-23196  the four layouts

`_bio_winter`:22790, `_bio_spring`:22882, `_bio_summer`:23007, `_bio_autumn`:23091

## 23197-23467  animals

`_bio_spawn`:23198, `_bio_load_animal`:23270, `_bio_make_quad`:23291, `_bio_load_bird`:23368, `_bio_make_penguin`:23388, `_bio_make_bird`:23410, `_bio_make_flamingo`:23434, `_bio_make_butterfly`:23455

## 23468-23601  animation, spotting and rewards

`_bio_stuck_check`:23473, `_biosphere_tick`:23491, `_bio_animate`:23502, `_bio_spot_check`:23582, `_bio_spotted`:23594, `_smoke_biosphere`:23598

## 23602-24119  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23689, `_wear_piece`:23692, `_wear_mat`:23715, `_person_index`:23731, `_dress`:23754, `_smoke_style`:23860, `_style_shots`:24011, `_npc_look`:24083

## 24120-24273  your look: apply, save, share

`_look_clean`:24124, `_look_pack`:24139, `_owns`:24145, `_apply_look`:24150, `_relic_model`:24161, `_fc_mesh_mat`:24226, `_relic_refresh`:24229, `_relic_tick`:24243, `_peer_style`:24254

## 24274-24701  stores and the wardrobe

`_style_today`:24293, `_style_items`:24296, `_style_cat`:24304, `_style_price`:24307, `_style_deal`:24321, `_style_price_base`:24334, `_relic_stock`:24341, `_build_style_panel`:24353, `_open_store`:24393, `_open_wardrobe`:24412, `_style_close`:24415, `_style_finish`:24419, `_sync_old_avatar`:24434, `_style_tabs_for`:24441, `_refresh_style`:24446, `_style_body_rows`:24597, `_style_set_tab`:24614, `_style_step`:24618, `_style_color`:24623, `_style_pick`:24628, `_style_buy`:24663, `_ach_relics_check`:24685, `_style_face_camera`:24690

## 24702-25169  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24738, `_ga_text`:24744, `_ga_box`:24761, `_build_galleria`:24777, `_ga_inner_tick`:24918, `_ga_shell`:24934, `_ga_inside`:24984, `_bio_cyl_col_on`:24987, `_ga_models`:24999, `_ga_lbox`:25014, `_ga_ltext`:25028, `_ga_store`:25035, `_bio_cafe_on`:25137, `_ga_mannequins`:25145

## 25170-25321  featured outfits and the Sky Run

`_ga_featured_look`:25183, `_build_ga_fun`:25204, `_ga_fun_tick`:25249, `_sky_finish`:25276, `_extra_near`:25295, `_extra_open`:25304, `_store_near`:25313

## 25322-25418  v0.41: THE SKY GARDEN

`_sg_now`:25376, `_sg_progress`:25379, `_sg_time`:25385, `_sg_stock`:25392, `_sg_mut_roll`:25407

## 25419-25556  building

`_sg_box`:25420, `_sg_text`:25426, `_build_sky_garden`:25440, `_sg_seed_spot`:25551, `_sg_codex_spot`:25554

## 25557-25737  plants

`_sg_plant_model`:25558, `_sg_refresh_all`:25663, `_sg_refresh`:25667, `_sky_garden_tick`:25703, `_sg_ready_count`:25722, `_sg_boot_note`:25729

## 25738-25857  interacting

`_sg_near`:25739, `_sg_button_text`:25762, `_sg_value`:25775, `_sg_interact`:25779, `_sg_buy`:25795, `_sg_plant`:25817, `_sg_harvest`:25828

## 25858-26101  the garden screen

`_build_sg_panel`:25859, `_sg_open`:25894, `_sg_close`:25903, `_sg_row`:25907, `_sg_refresh_panel`:25922, `_sg_pick_buy`:25967, `_sg_pick_plant`:25971, `_smoke_car_barriers`:25977, `_smoke_sky_garden`:26018

## 26102-26140  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26133, `_pass_day`:26136

## 26141-26172  album

`_album_pages`:26142, `_album_claim`:26157

## 26173-26224  season

`_season_index`:26174, `_season_tick`:26177, `_season_xp`:26186, `_season_tier`:26189, `_season_reward`:26192, `_season_claim`:26206

## 26225-26232  Harbor Night

`_harbor_night`:26226

## 26233-26264  check-in calendar

`_cal_tick`:26234

## 26265-26441  the panel

`_build_hp_panel`:26266, `_open_pass`:26301, `_hp_open`:26304, `_hp_close`:26311, `_hp_row`:26315, `_hp_bar`:26330, `_hp_refresh`:26334, `_smoke_pass`:26379

## 26442-26668  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26446, `_cash_pill_tick`:26454, `_build_lb`:26492, `_open_lb`:26535, `_close_lb`:26543, `_lb_pick`:26547, `_lb_headers`:26552, `_lb_url`:26556, `_lb_me`:26559, `_lb_level`:26564, `_lb_tick`:26574, `_lb_upload`:26582, `_lb_fetch`:26592, `_lb_got`:26600, `_lb_value`:26611, `_lb_refresh_ui`:26622

## 26669-27227  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26693, `_market_near`:26772, `_build_gear`:26782, `_gear_piece`:26790, `_pet_m`:26835, `_pet_eyes`:26849, `_build_pet`:26856, `_pet_nose`:26994, `_pet_anim`:26997, `_market_apply`:27008, `_market_tick`:27032, `_build_market_panel`:27056, `_open_market`:27082, `_close_market`:27089, `_refresh_market`:27093, `_market_pick`:27146, `_toggle_board`:27184, `_board_tick`:27191

## 27228-27471  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27260, `_ds_label`:27279, `_build_display`:27293, `_ds_got`:27372, `_ds_sorted`:27381, `_ds_render_board`:27395, `_ds_render_news`:27421, `_display_tick`:27442

## 27472-27650  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27489, `_toggle_streamer`:27576, `_streamer_badge_tap`:27592, `_streamer_tick`:27596

## 27651-27687  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27657, `_car_back`:27664, `_car_park_tick`:27671

## 27688-27784  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27692, `_bus_eta`:27746, `_bus_displays_tick`:27762

## 27785-28076  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27803, `_treasure_pick`:27806, `_treasure_spot`:27815, `_treasure_district`:27819, `_treasure_clue`:27831, `_treasure_prop`:27844, `_tp_part`:27847, `_tp_sphere`:27857, `_tp_cyl`:27865, `_treasure_prop_side`:27874, `_build_treasure_props`:27886, `_build_treasure`:27930, `_treasure_dir_char`:27999, `_treasure_tick`:28008, `_treasure_claim`:28062

## 28077-28177  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:28078, `_halo_mat`:28110, `_smoke_treasure`:28135

## 28178-28501  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28199, `_fm_send`:28202, `_fm_area`:28208, `_fm_glow_mesh`:28224, `_fm_block_reason`:28242, `_fm_start`:28254, `_fm_announce`:28282, `_fm_finish`:28285, `_fm_msg`:28303, `_fm_check_paid`:28354, `_fm_tick`:28372, `_smoke_findme`:28428

## 28502-28612  v0.24.2: road map (for moving people off the road)

`_floor_note`:28508, `_floor_disc`:28522, `_floor_top`:28531, `_ground_at`:28549, `_note_road`:28567, `_on_road`:28574, `_ped_curb`:28584, `_curb_spot`:28594

## 28613-28908  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28635, `_ex_grid`:28643, `_ex_lamps`:28678, `_ex_umbrella`:28701, `_ex_yards`:28708, `_build_expansion`:28723, `_expand_shots`:28886

## 28909-29103  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28950, `_v27_near_cross`:29042, `_v27_near_any_road`:29049, `_v27_in_district`:29055, `_sea_tick`:29069, `_sea_tow`:29088

## 29104-29771  Harbor Loop sky train

`_sky_build_path`:29155, `_sky_pos`:29196, `_sky_dir`:29210, `_sky_project`:29215, `_sky_trip_time`:29234, `_sky_trip_dist`:29240, `_sky_now`:29251, `_sky_state`:29254, `_sky_time_at_station`:29269, `_sky_next_arrival`:29276, `_build_skytrain`:29289, `_sky_make_car`:29441, `_sky_skin`:29478, `_sky_place_trains`:29498, `_sky_build_station`:29517, `_sky_near`:29582, `_sky_fmt`:29591, `_sky_enter`:29595, `_sky_leave_platform`:29613, `_sky_board`:29623, `_sky_alight`:29637, `_sky_action`:29651, `_sky_tick`:29668, `_sky_camera`:29708, `_tour_today`:29724, `_tour_stamp`:29727, `_sky_hud`:29750

## 29772-30145  Day and night

`_toggle_weather`:29855, `_refresh_weather_button`:29861, `_game_hour`:29867, `_day_key`:29879, `_night_setup`:29894, `_night_scan_mesh`:29984, `_daynight_tick`:30009, `_daynight_apply`:30018, `_daynight_lights`:30130, `_cycle_day_mode`:30135, `_refresh_time_button`:30142

## 30146-30783  v0.27 smoke test and screenshots

`_smoke_v27`:30147, `_city_shots`:30352

## 30784-31200  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30818, `_ap_plane`:30994, `_ap_truck`:31014, `_ap_baggage_train`:31055, `_ap_loop_pos`:31068, `_ap_loop_len`:31084, `_ap_flight_at`:31090, `_ap_tick`:31114, `_airport_ped_plan`:31137, `_smoke_airport`:31157

## 31201-31714  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31215, `_nav_spot`:31222, `_nav_idx`:31226, `_nav_pos`:31233, `_nav_blocked`:31237, `_nav_nearest_free`:31247, `_nav_bfs`:31275, `_nav_build`:31319, `_stroller`:31390, `_stroll_place`:31406, `_stroll_next`:31427, `_nav_clear_line`:31461, `_stroll_aim`:31472, `_strollers_tick`:31504, `_smoke_strollers`:31599

## 31715-31875  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31750, `_dir_fmt`:31753, `_signpost_spot`:31756, `_build_signposts`:31773

## 31876-31972  the Directions panel and chip

`_build_dir_panel`:31877, `_open_dir`:31919, `_dir_close`:31928, `_dir_pick`:31932, `_dir_stop`:31937, `_dir_stop_and_close`:31942, `_dir_tick`:31946

## 31973-32514  v0.44: Grand Central

`_gc_mesh`:32002, `_gc_mat`:32035, `_gc_glass`:32044, `_gb`:32054, `_gb_solid`:32060, `_gb_flush`:32064, `_gc_tree`:32094, `_gc_text`:32099, `_gc_planter`:32114, `_gc_kiosk`:32120, `_goods_color`:32150, `_goods_mat`:32153, `_kiosk_goods`:32157, `_build_grand_central`:32235, `_build_gc_towers`:32403, `_gc_tick`:32498

## 32515-32806  v0.44: filling the empty land

`_loft`:32532, `_fill_clear`:32574, `_build_fill`:32584, `_hg_in_lake`:32632, `_hg_path`:32636, `_floor_note_rot`:32644, `_build_gardens`:32652, `_build_fan_plaza`:32762

## 32807-32841  v0.45: hover car underglow

`_car_underglow`:32810

## 32842-33006  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32843

## 33007-33038  v0.47: street stalls downtown

`_build_street_stalls`:33011, `_cull_people_in`:33031

## 33039-33137  v0.48: places that open as you level up

`_place_lock_of`:33052, `_place_root`:33058, `_place_unlocked`:33061, `_build_place_signs`:33069, `_places_refresh`:33114, `_places_tick`:33131

## 33138-33182  v0.50: city careers

`_career_rank_name`:33163, `_career_mult`:33166, `_career_block_reason`:33171, `_career_start`:33174, `_career_end`:33179

## 33183-33233  v0.52: careers as clear job loops

`_cid`:33210, `_career_target`:33224, `_career_tick`:33231

## 33234-33241  taxi

`_taxi_meter`:33235

## 33242-33245  paramedic

(no functions)

## 33246-33250  police

`_career_chase_over`:33248

## 33251-33256  firefighter

`_fire_aimed`:33252

## 33257-33266  the step bar

`_career_bar_text`:33260, `_career_hud`:33264

## 33267-33293  cut scenes

`_cs_skip`:33285

## 33294-33298  siren

(no functions)

## 33299-33310  the Careers panel

`_build_career_panel`:33300, `_open_careers`:33303, `_career_close`:33307

## 33311-33734  v0.50: homes

`_home_door_spots`:33351, `_build_homes`:33366, `_home_labels`:33395, `_home_door_near`:33404, `_home_origin`:33413, `_home_slot_near`:33416, `_home_exit_near`:33427, `_home_btn`:33434, `_home_interact`:33447, `_home_buy`:33466, `_home_default_layout`:33480, `_home_enter`:33488, `_home_leave`:33508, `_hm`:33516, `_home_build_room`:33535, `_home_refresh_room`:33644, `_furni_build`:33658

## 33735-34070  decorating

`_build_home_panels`:33736, `_open_homes`:33781, `_home_row_go`:33791, `_home_panel_close`:33811, `_deco_open`:33815, `_deco_pick`:33838, `_smoke_careers_homes`:33861

## 34071-34205  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:34075, `_home_slots`:34083, `_home_ring`:34110, `_furni_cat`:34116, `_home_fix_layout`:34122, `_home_build_layout`:34150

## 34206-34639  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34269, `_ch_homes`:34275, `_ch_step_text`:34282, `_ch_step_done`:34293, `_ch_target`:34307, `_ch_finish_chapter`:34316, `_chapters_tick`:34338, `_hud_top_stack`:34378, `_build_chapters_ui`:34408, `_chapters_restart_ask`:34450, `_chapters_restart`:34453, `_chapters_text`:34463, `_open_chapters`:34483, `_chapters_close`:34490, `_smoke_chapters`:34494, `_step_sound`:34615

## 34640-34678  v0.51.1: join and leave messages

`_announce_join`:34647, `_announce_already_here`:34666, `_announce_leave`:34674

## 34679-34943  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34695, `_shot_tick`:34701, `_draw_shot_icon`:34733, `_shot_enter`:34742, `_shot_exit`:34756, `_shot_release_controls`:34768, `_shot_stick_zone`:34775, `_shot_input`:34778, `_smoke_photo`:34850

## 34944-35242  v0.51.3: stream joiners

`_viewer_count`:34964, `_stream_join_check`:34970, `_stream_join_start`:34977, `_sj_streamer`:34994, `_stream_join_tick`:35003, `_stream_join_land`:35027, `_sj_welcome`:35043, `_smoke_stream_join`:35077, `_career_shot`:35160

## 35243-35359  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35247, `_st_restore`:35285, `_smoke_streamer_clean`:35306, `_world_bio_passport`:35357

