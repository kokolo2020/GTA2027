# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-569  Core (unlabelled)

`_symbol_font`:280, `_ready`:292, `_surf_texture`:512, `_surface_material`:534

## 570-642  v0.34.6: futuristic towers for the old city

`_future_tower`:574

## 643-721  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:650, `_skin_common`:685, `_future_wall`:693, `_future_roof`:707, `_future_pave`:715

## 722-782  v0.34.4: futuristic road surface

`_road_textures`:729, `_future_road`:763

## 783-1988  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:802, `_real_tex`:843, `_real_setup`:851, `_real_kind`:872, `_realify`:878, `_real_glass`:915, `_make_window_textures`:935, `_material`:968, `_box`:993, `_sign`:1015, `_build_world`:1027, `_future_kiosk`:1135, `_build_collectibles`:1161, `_auto_collect_tick`:1194, `_find_count`:1215, `_nearest_find`:1222, `_destination`:1236, `_toggle_activity`:1272, `_collect_find`:1301, `_owned_count`:1316, `_ridge_open`:1323, `_ridge_count`:1327, `_nearest_ridge`:1334, `_apply_car`:1348, `_tune_level`:1378, `_tune_cost`:1381, `_car_stats`:1387, `_buy_tune`:1394, `_open_tune`:1415, `_back_to_garage`:1421, `_refresh_tune`:1425, `_bay_open`:1436, `_area_open`:1439, `_bay_count`:1442, `_nearest_bay`:1449, `_build_bay`:1463, `_check_bay`:1516, `_discover_bay`:1529, `_north_count`:1542, `_north_open`:1549, `_nearest_north`:1552, `_check_north`:1566, `_discover_north`:1579, `_prop`:1592, `_collider`:1606, `_first_mesh`:1616, `_scatter`:1625, `_prop_stretch`:1659, `_north_token`:1668, `_nm_roads`:1695, `_prop_big`:1710, `_nm_near_cross`:1726, `_build_north`:1733, `_build_nm_blocks`:1850, `_build_north_landscape`:1935, `_nm_free`:1962, `_build_landscape`:1972

## 1989-2468  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:1990, `_online_toggle`:2004, `_online_autostart`:2030, `_online_connect`:2049, `_online_stop`:2056, `_online_next_ref`:2067, `_online_send`:2071, `_online_join_frame`:2075, `_online_pos_frame`:2078, `_online_tick`:2087, `_online_handle`:2121, `_online_clean_name`:2174, `_online_peer_update`:2183, `_online_make_peer`:2248, `_peer_look`:2289, `_online_tint`:2346, `_paint_mat`:2362, `_online_update_peers`:2374, `_online_clear_peers`:2454, `_online_refresh_button`:2459

## 2469-2641  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2549, `_marina_count`:2552, `_nearest_marina`:2559, `_check_marina`:2573, `_discover_marina`:2586, `_shop_available`:2599, `_nearest_shop`:2602, `_premium_cars`:2610, `_glass`:2617, `_shop_building`:2623, `_shop_pad`:2633

## 2642-3157  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2643, `_bus_last`:2646, `_build_bus`:2649, `_bus_boxes`:2676, `_bus_skin`:2686, `_bus_side`:2699, `_bus_reset`:2702, `_bus_text`:2711, `_bus_tick`:2716, `_bus_near`:2756, `_bus_board`:2767, `_bus_alight`:2782, `_build_marina`:2796, `_set_hat`:2902, `_build_hat`:2905, `_cyl`:2970, `_hat_part`:2979, `_apply_avatar`:2988, `_shop_count`:3000, `_shop_open`:3010, `_shop_step`:3028, `_shop_close`:3034, `_owned_text`:3047, `_refresh_shop`:3050, `_shop_action`:3103, `_journal_flip`:3154

## 3158-3212  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3169, `_xp`:3172, `_level_for`:3179, `_level`:3187, `_level_text`:3190, `_check_level`:3200

## 3213-3315  v0.11.0: online police vs thief

`_orole_ready`:3214, `_orole_start`:3217, `_orole_end`:3244, `_orole_tick`:3253

## 3316-4259  v0.10.0: chase mode (offline)

`_chase_open`:3317, `_chase_clear`:3322, `_chase_make_unit`:3336, `_chase_spawn_point`:3366, `_chase_start`:3375, `_chase_end`:3411, `_chase_steer`:3430, `_chase_roadblock`:3466, `_chase_heli_build`:3511, `_chase_extras`:3537, `_chase_tick`:3564, `_start_trial`:3628, `_cancel_trial`:3655, `_check_trial`:3660, `_finish_trial`:3677, `_trial_count`:3693, `_open_trials`:3700, `_refresh_trials`:3704, `_update_gate`:3716, `_slab`:3734, `_build_ridge`:3752, `_check_ridge`:3815, `_discover`:3828, `_mission_progress`:3842, `_check_missions`:3904, `_open_garage`:3915, `_open_journal`:3920, `_close_sub`:3925, `_bar`:3928, `_refresh_garage`:3932, `_garage_step`:3957, `_garage_action`:3961, `_refresh_journal`:3981, `_visited_shops`:4014, `_build_panels`:4021, `_build_player`:4181, `_build_car`:4219, `_try_model`:4248

## 4260-4926  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4261, `_kshader`:4335, `_ksync`:4341, `_kskin`:4356, `_make_kperson`:4362, `_hat_y`:4426, `_sit_drop`:4429, `_kplay`:4432, `_kpeople_tick`:4442, `_pose_person`:4471, `_pose_limbs`:4488, `_person_lift`:4550, `_snap_crowd_feet`:4563, `_people_life_tick`:4579, `_life_one`:4616, `_cull_person`:4626, `_recolor_car_model`:4634, `_apply_car_model`:4648, `_landmark`:4668, `_label`:4678, `_button`:4685, `_panel`:4697, `_build_hud`:4707

## 4927-5045  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4933, `_menu_tab`:4939, `_watch_tick`:4962, `_watch_count`:5004, `_online_pill_tap`:5011, `_online_pill_tick`:5017, `online_config_ok`:5043

## 5046-5083  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5049, `_offroad`:5055, `_ground_near`:5068, `_collectibles_on_road`:5075

## 5084-5223  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5096, `_build_quest_offer`:5100, `_quest_offer_tick`:5130, `_quest_auto_pick`:5180, `_quest_accept`:5195, `_quest_decline`:5209, `_quest_stop`:5215

## 5224-5591  v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5248, `_holo_material`:5257, `_build_future`:5265, `_build_neon`:5279, `_model_profile`:5348, `_model_body_box`:5371, `_build_holograms`:5385, `_holo_tick`:5435, `_build_sky_traffic`:5452, `_sky_hover_car`:5470, `_sky_drone`:5517, `_sky_traffic_tick`:5561, `_future_lights`:5580

## 5592-6091  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5651, `_crew_col`:5659, `_peer_crewmate`:5662, `_set_ring_color`:5665, `_level_color`:5692, `_tier_color`:5705, `_my_ach_tier`:5708, `_style_ring`:5715, `_social_peer_extras`:5763, `_social_tag`:5777, `_my_tag_extra`:5789, `_soc_send`:5802, `_social_msg`:5817, `_social_accept`:5856, `_social_go`:5877, `_soc_friend`:5896, `_soc_invite`:5903, `_soc_goto`:5908, `_soc_high_five`:5916, `_soc_gift`:5936, `_soc_crew_invite`:5953, `_gift_day_check`:5960, `_crew_create`:5966, `_crew_cycle_color`:5976, `_crew_leave`:5981, `_crew_mate_near`:5989, `_crew_board`:5997, `_build_social`:6016, `_social_online`:6078, `_open_social`:6082, `_close_social`:6088

## 6092-6342  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6095, `_track_pos`:6104, `_social_row_button`:6115, `_refresh_social`:6122, `_on_dance_floor`:6184, `_toggle_dance`:6187, `_build_dance_floor`:6195, `_social_tick`:6221, `_photo`:6293

## 6343-6838  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6365, `_game_state`:6373, `_build_arcade`:6385, `_c4_empty`:6436, `_c4_drop_row`:6442, `_c4_winner`:6448, `_c4_bot_move`:6469, `_c4_code`:6498, `_c4_ready`:6504, `_c4_tap`:6507, `_c4_check`:6528, `_c4_tick`:6552, `_rx_ready`:6579, `_rx_start`:6582, `_rx_tap`:6596, `_rx_send_time`:6621, `_rx_resolve`:6628, `_rx_tick`:6654, `_mem_start`:6669, `_mem_tap`:6685, `_mem_finish`:6700, `_mem_tick`:6716, `_mem_board_text`:6723, `_build_arcade_panel`:6734, `_refresh_arcade_panel`:6777

## 6839-7132  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6902, `_quiz_slot`:6905, `_quiz_question`:6915, `_quiz_bot_score`:6944, `_in_quiz`:6953, `_build_quiz`:6956, `_quiz_answer`:7026, `_quiz_msg`:7039, `_quiz_board`:7047, `_quiz_tick`:7057, `_quiz_refresh`:7099

## 7133-8611  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7304, `_sites_found`:7307, `_sites_total`:7310, `_bits`:7313, `_ach_value`:7320, `_ach_tick`:7375, `_ach_check`:7400, `_ach_by_id`:7436, `_ach_msg`:7442, `_build_ach`:7455, `_ach_show`:7486, `_open_ach`:7506, `_close_ach`:7512, `_refresh_ach`:7516, `_ach_num`:7547, `_minimap_tap`:7550, `_menu_go`:7557, `_menu_stay`:7562, `_menu_call_car`:7566, `_toggle_clean_hud`:7572, `_refresh_menu_buttons`:7578, `_clean_hud_tick`:7588, `_draw_joystick`:7629, `_input`:7634, `_stick_zone`:7711, `_notification`:7715, `_physics_process`:7730, `_follow_camera`:7878, `_follow_walk_camera`:7914, `_interact`:7937, `_refresh_hud`:8088, `_open_panel`:8209, `_layout_panels`:8235, `_toggle_menu`:8258, `_rescue`:8298, `_show_toast`:8330, `_save_progress`:8334, `_load_progress`:8417

## 8612-10755  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8613, `_radio_voice`:8616, `_radio_make`:8649, `_radio_set`:8720, `_radio_play`:8742, `_radio_next`:8747, `_radio_talk_line`:8751, `_radio_caption`:8772, `_radio_refresh`:8780, `_process`:8793, `_build_peds`:8842, `_update_peds`:8953, `_update_ped`:8972, `_smoke_test`:9026, `_smoke_chase`:9665, `_smoke_orole`:9698, `_smoke_levels`:9727, `_smoke_bus`:9768, `_smoke_chase_extras`:9853, `_smoke_marina`:9881, `_blocked_at`:9983, `_blocker`:9998, `_on_screen`:10011, `_wait_radio`:10016, `_smoke_radio_peds`:10023, `_smoke_models`:10093, `_smoke_garage_ridge`:10117, `_save_shot`:10493, `_people_shots`:10503, `_shots`:10544, `_shot_car`:10738, `_capture_preview`:10748

## 10756-11404  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10823, `_downtown_count`:10826, `_nearest_downtown`:10833, `_check_downtown`:10847, `_discover_downtown`:10860, `_box_batch`:10874, `_model_batch`:10894, `_cut_ranges`:10948, `_dt_ranges`:10960, `_dt_has`:10967, `_dt_near_cross`:10973, `_place`:10979, `_signal_pole`:10990, `_cyl_batch`:11009, `_city_signals`:11033, `_ensure_light_mats`:11084, `_city_lamps`:11094, `_build_downtown`:11138, `_dt_block`:11338, `_downtown_token`:11344, `_build_park`:11361, `_build_plaza`:11390

## 11405-11508  old city and Bay details

`_build_city_detail`:11406

## 11509-11918  traffic

`_build_traffic`:11510, `_path_sample`:11605, `_light_look`:11619, `_light_green`:11627, `_traffic_place`:11631, `_traffic_blocked_by`:11643, `_traffic_tick`:11655, `_smoke_downtown`:11761, `_skyline_shot`:11873, `_skyline_shots`:11881

## 11919-12271  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:11965, `_web_scale`:12020, `_web_fps_tick`:12030, `_world_to_uv`:12047, `_map_angle`:12050, `_build_minimap`:12058, `_open_map`:12131, `_close_map`:12142, `_mini_point`:12149, `_site_markers`:12153, `_draw_arrow`:12185, `_draw_minimap`:12192, `_draw_full_map`:12239, `_minimap_tick`:12264

## 12272-12529  camera views

`_build_view_controls`:12273, `_cycle_view`:12315, `_apply_view`:12325, `_hide_labels`:12363, `_unfade`:12369, `_bake_map`:12375, `_shot_stats`:12425, `_view_shots`:12428, `_smoke_views`:12469

## 12530-12777  v0.17.0: level-up celebration

`_build_level_fx`:12541, `_draw_level_rays`:12578, `_level_fx_tick`:12588, `_level_sound`:12593, `_fx_material`:12635, `_level_up_fx`:12643, `_smoke_level_fx`:12744, `_levelup_shots`:12753

## 12778-12897  v0.18.0: walk-in stadium

`_collider_yaw`:12783, `_build_stadium_walls`:12794, `_look`:12822, `_smoke_stadium_eye`:12831, `_stadium_shots`:12867

## 12898-13059  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:12922, `_arrow_mesh`:12934, `_build_guidance`:12957, `_guide_target`:12982, `_guidance_tick`:13011, `_draw_hud_arrow`:13037

## 13060-13245  checkpoints

`_build_checkpoints`:13061, `_refresh_checkpoints`:13106, `_check_checkpoints`:13112, `_activate_checkpoint`:13122, `_checkpoint_spawn`:13143, `_spawn_at_checkpoint`:13148, `_draw_checkpoint_icon`:13164, `_smoke_guidance_checkpoints`:13170, `_guide_shots`:13220

## 13246-13521  v0.18.0: Harbor Dome social hub

`_hub_seat`:13304, `_build_hub`:13308, `_hub_glass`:13505

## 13522-13729  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:13523, `_build_hub_bots`:13548, `_seat_of`:13579, `_bubble`:13589, `_emote`:13638, `_hub_people_tick`:13652

## 13730-13848  seats

`_seat_taken`:13731, `_nearest_seat`:13739, `_seat_label`:13751, `_sit`:13767, `_stand_up`:13811, `_seated_tick`:13830

## 13849-14005  game panel

`_build_game_panel`:13850, `_open_game_panel`:13905, `_refresh_game_panel`:13924, `_play_robot`:13969, `_peer_at`:13983, `_opponent_name`:13990, `_pay`:13998

## 14006-14126  tic-tac-toe

`_ttt_ready`:14009, `_ttt_winner`:14015, `_ttt_bot_move`:14025, `_ttt_tap`:14051, `_ttt_code`:14071, `_ttt_check`:14077, `_ttt_tick`:14100

## 14127-14178  rock paper scissors

`_rps_ready`:14128, `_rps_pick`:14134, `_rps_resolve`:14152, `_rps_tick`:14176

## 14179-14261  online table messages

`_online_game_send`:14180, `_hub_game_msg`:14186

## 14262-14337  comedy show

`_joke_start`:14263, `_joke_tick`:14275, `_speak`:14301, `_play_rimshot`:14310

## 14338-14876  quick chat and emotes

`_build_chat`:14355, `_chat_toggle_to`:14455, `_chat_log_add`:14463, `_chat_area`:14469, `_chat_near_count`:14487, `_chat_tick`:14496, `_toggle_chat`:14543, `_say`:14557, `_do_emote`:14571, `_smoke_hub`:14580, `_hub_shots`:14754, `_sg_on_terrace`:14827, `_people_only`:14830, `_people_only_keep_cars_out`:14834, `_car_barrier`:14846, `_hub_keep_cars_out`:14860

## 14877-15039  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:14886, `_feed_add`:14895, `_feed_render`:14901, `_feed_tick`:14929, `_online_event_send`:14938, `_at_pvp_table`:14945, `_game_name`:14952, `_send_lfp`:14955, `_lfp_msg`:14972, `_accept_invite`:14993

## 15040-15280  v0.18.2: nickname and HUD relayout

`_nick_rude`:15052, `_clean_nick`:15067, `_build_nick_panel`:15079, `_open_nick`:15117, `_random_nick`:15126, `_save_nick`:15132, `_close_nick`:15151, `_refresh_nick_button`:15160, `_relayout_hud`:15164, `_smoke_nick`:15200, `_nick_shots`:15232, `_smoke_sites_reachable`:15250

## 15281-15568  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:15307, `_nearest_civic`:15314, `_check_civic`:15328, `_discover_civic`:15341, `_civ_ranges`:15354, `_civ_has`:15368, `_civ_near_cross`:15374, `_build_civic`:15380, `_civic_token`:15506, `_civic_shots`:15523, `_hub_focus`:15545

## 15569-15678  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:15640, `_in_rw_lot`:15643, `_box_batch_rot`:15646, `_multi_collider`:15664

## 15679-16006  circuit geometry

`_cr_point`:15680, `_rw_build_path`:15694, `_rw_dir`:15722, `_rw_bend`:15727, `_ribbon`:15733, `_rw_band`:15753, `_rw_keepout`:15771, `_build_raceway`:15780, `_build_rw_parking`:15814, `_build_rw_pits`:15859, `_build_rw_track`:15896, `_build_rw_trackside`:15937

## 16007-16104  race car rental

`_model_key`:16008, `_race_car_start`:16011, `_tint_ghost`:16049, `_race_car_end`:16062, `_race_keep_cars_out`:16087

## 16105-16119  speed effects

`_eff_max`:16106, `_eff_accel`:16117

## 16120-16170  track helpers

`_rw_seg_progress`:16121, `_rw_track_dist`:16141, `_rw_point_dist`:16152, `_rw_player_progress`:16159, `_rw_target`:16165

## 16171-16407  events

`_rec_stop`:16172, `_rw_place`:16188, `_rw_grid_pos`:16195, `_rw_start`:16200, `_rw_spawn_ai`:16232, `_rw_ai_place`:16256, `_rw_tick`:16267, `_rw_ai_tick`:16320, `_rw_lap_done`:16362, `_rw_finish`:16374, `_rw_fmt`:16405

## 16408-16460  boosters and spikes

`_rw_buy`:16409, `_rw_use_boost`:16427, `_rw_use_spike`:16435, `_rw_drop_spike_at`:16446

## 16461-16518  online races

`_race_msg`:16462, `_join_race`:16484

## 16519-16874  raceway panel, HUD, board

`_build_raceway_ui`:16520, `_rw_layout`:16580, `_rw_open`:16587, `_rw_close`:16593, `_rw_refresh_panel`:16597, `_rw_refresh_board`:16610, `_rw_hud`:16622, `_peer_car_model`:16646, `_smoke_raceway`:16656, `_race_shots`:16837

## 16875-17082  v0.22.0: Call Car

`_call_block_reason`:16881, `_call_spot`:16898, `_call_car`:16929, `_play_horn`:16953, `_smoke_follow_call`:16977, `_follow_shots`:17050

## 17083-17382  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:17098, `_build_travel`:17103, `_toggle_run`:17145, `_refresh_run`:17149, `_hud_v23_tick`:17157, `_travel_block_reason`:17186, `_travel_open`:17206, `_open_travel`:17212, `_close_travel`:17218, `_refresh_travel`:17222, `_travel_to`:17230, `_smoke_travel`:17257, `_v23_shots`:17295

## 17383-17456  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:17390, `_qr_button`:17405, `_qr_layout`:17444, `_smoke_qr`:17450

## 17457-17893  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:17477, `_open_crate`:17493, `_build_crate_ui`:17510, `_crate_pick`:17597, `_crate_reveal`:17620, `_crate_draw_car`:17647, `_crate_confetti`:17666, `_crate_sound`:17691, `_crate_drive`:17717, `_feed_add_system`:17747, `_smoke_crate`:17750, `_crate_shots`:17798

## 17894-18385  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:17935, `_quick_today`:17940, `_quick_is_done`:17943, `_quick_left`:17946, `_quick_next`:17953, `_quick_fix_target`:17966, `_quick_daily_check`:17980, `_quick_complete`:17994, `_quick_side`:18028, `_build_quick_props`:18046, `_daily_shots`:18198, `_quick_props_refresh`:18240, `_quick_fx`:18244, `_play_coin`:18260, `_smoke_quick`:18277

## 18386-18536  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:18395, `_quest_nearby`:18450, `_open_quests`:18457, `_close_quests`:18464, `_refresh_quests`:18468, `_quest_pick`:18494, `_quest_mode`:18508, `_smoke_quests`:18511

## 18537-18571  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:18541, `_my_tag_tick`:18544

## 18572-18886  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:18589, `_fc_torus`:18599, `_fc_pearl`:18607, `_fc_chrome`:18617, `_fc_glass`:18626, `_fc_glow`:18636, `_fc_ghost`:18645, `_fc_holo`:18657, `_fc_mesh`:18667, `_fc_sphere`:18687, `_fc_capsule`:18695, `_fc_cone`:18703, `_build_food_court`:18712, `_food_court_tick`:18866

## 18887-19201  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:18909, `_cm_bench`:18925, `_build_commons`:18938, `_commons_tick`:19160

## 19202-19516  v0.36: the daily puzzle

`_pz_today`:19225, `_pz_new`:19228, `_pz_neighbours`:19273, `_pz_flip`:19283, `_pz_done`:19288, `_pz_tap`:19296, `_pz_win`:19312, `_pz_reset`:19333, `_puzzle_near`:19337, `_open_puzzle`:19342, `_close_puzzle`:19350, `_pz_refresh_sign`:19354, `_build_puzzle_panel`:19362, `_pz_draw`:19393, `_smoke_chat`:19434, `_smoke_feet`:19472, `_smoke_commons`:19493

## 19517-19705  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:19579, `_bio_theta`:19583, `_bio_sec_n`:19588, `_bio_sec_of`:19591, `_bio_pt`:19594, `_bio_lp`:19599, `_bio_la`:19603, `_bio_dir`:19607, `_bio_hex_r`:19610, `_bio_apo`:19615, `_bio_open_angles`:19621, `_bio_si`:19631, `_bm`:19637, `_bsph`:19642, `_blow`:19645, `_bcone`:19656, `_bbox`:19659, `_bp`:19662, `_bq`:19667, `_bio_glass_mat`:19671, `_bio_water_mat`:19684, `_bio_mat`:19696

## 19706-20078  building blocks

`_bio_inst`:19707, `_bio_add`:19713, `_bio_model`:19716, `_bio_nature_mesh`:19722, `_bio_flush`:19756, `_bio_bar`:19791, `_bio_slab`:19804, `_bio_body`:19819, `_bio_cyl_col`:19832, `_bio_hexmesh`:19845, `_bio_hexslab`:19857, `_bio_hexpt`:19863, `_bio_gridshell`:19870, `_bio_rail`:19977, `_bio_rail_arc`:19982, `_bio_disc_deck`:19994, `_bio_ring_deck`:20000, `_bio_helix`:20011, `_bio_pillar`:20031, `_bio_cafe`:20037, `_bio_fence_line`:20051, `_bio_fence_seg`:20056, `_bio_pen`:20066

## 20079-20580  building

`_build_biosphere`:20080, `_build_biosphere_legacy`:20084, `_bio_text`:20246, `_bio_plaque`:20264, `_bio_ticket_hall`:20278, `_on_foot_collision_guard`:20334, `_bio_inside`:20344, `_bio_pass_ok`:20347, `_ticket_near`:20351, `_bio_buy_pass`:20356, `_bio_gates_update`:20372, `_bio_gate_tick`:20398, `_bio_tunnel`:20410, `_bio_grounds`:20463, `_bio_dome`:20509, `_bio_deck_mats`:20577

## 20581-20736  garden planting

`_bio_free`:20582, `_bio_spot`:20599, `_bio_garden`:20607, `_bio_pine`:20648, `_bio_tree`:20651, `_bio_big_tree`:20661, `_bio_rock`:20666, `_bio_pond`:20669, `_bio_particles`:20673, `_bio_mist`:20701, `_bio_mini_dome`:20730

## 20737-21144  the four layouts

`_bio_winter`:20738, `_bio_spring`:20830, `_bio_summer`:20955, `_bio_autumn`:21039

## 21145-21415  animals

`_bio_spawn`:21146, `_bio_load_animal`:21218, `_bio_make_quad`:21239, `_bio_load_bird`:21316, `_bio_make_penguin`:21336, `_bio_make_bird`:21358, `_bio_make_flamingo`:21382, `_bio_make_butterfly`:21403

## 21416-21545  animation, spotting and rewards

`_bio_stuck_check`:21421, `_biosphere_tick`:21439, `_bio_animate`:21446, `_bio_spot_check`:21526, `_bio_spotted`:21538, `_smoke_biosphere`:21542

## 21546-22063  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:21633, `_wear_piece`:21636, `_wear_mat`:21659, `_person_index`:21675, `_dress`:21698, `_smoke_style`:21804, `_style_shots`:21955, `_npc_look`:22027

## 22064-22212  your look: apply, save, share

`_look_clean`:22068, `_look_pack`:22083, `_owns`:22089, `_apply_look`:22094, `_relic_model`:22100, `_fc_mesh_mat`:22165, `_relic_refresh`:22168, `_relic_tick`:22182, `_peer_style`:22193

## 22213-22640  stores and the wardrobe

`_style_today`:22232, `_style_items`:22235, `_style_cat`:22243, `_style_price`:22246, `_style_deal`:22260, `_style_price_base`:22273, `_relic_stock`:22280, `_build_style_panel`:22292, `_open_store`:22332, `_open_wardrobe`:22351, `_style_close`:22354, `_style_finish`:22358, `_sync_old_avatar`:22373, `_style_tabs_for`:22380, `_refresh_style`:22385, `_style_body_rows`:22536, `_style_set_tab`:22553, `_style_step`:22557, `_style_color`:22562, `_style_pick`:22567, `_style_buy`:22602, `_ach_relics_check`:22624, `_style_face_camera`:22629

## 22641-23108  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:22677, `_ga_text`:22683, `_ga_box`:22700, `_build_galleria`:22716, `_ga_inner_tick`:22857, `_ga_shell`:22873, `_ga_inside`:22923, `_bio_cyl_col_on`:22926, `_ga_models`:22938, `_ga_lbox`:22953, `_ga_ltext`:22967, `_ga_store`:22974, `_bio_cafe_on`:23076, `_ga_mannequins`:23084

## 23109-23260  featured outfits and the Sky Run

`_ga_featured_look`:23122, `_build_ga_fun`:23143, `_ga_fun_tick`:23188, `_sky_finish`:23215, `_extra_near`:23234, `_extra_open`:23243, `_store_near`:23252

## 23261-23357  v0.41: THE SKY GARDEN

`_sg_now`:23315, `_sg_progress`:23318, `_sg_time`:23324, `_sg_stock`:23331, `_sg_mut_roll`:23346

## 23358-23495  building

`_sg_box`:23359, `_sg_text`:23365, `_build_sky_garden`:23379, `_sg_seed_spot`:23490, `_sg_codex_spot`:23493

## 23496-23676  plants

`_sg_plant_model`:23497, `_sg_refresh_all`:23602, `_sg_refresh`:23606, `_sky_garden_tick`:23642, `_sg_ready_count`:23661, `_sg_boot_note`:23668

## 23677-23796  interacting

`_sg_near`:23678, `_sg_button_text`:23701, `_sg_value`:23714, `_sg_interact`:23718, `_sg_buy`:23734, `_sg_plant`:23756, `_sg_harvest`:23767

## 23797-24040  the garden screen

`_build_sg_panel`:23798, `_sg_open`:23833, `_sg_close`:23842, `_sg_row`:23846, `_sg_refresh_panel`:23861, `_sg_pick_buy`:23906, `_sg_pick_plant`:23910, `_smoke_car_barriers`:23916, `_smoke_sky_garden`:23957

## 24041-24079  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:24072, `_pass_day`:24075

## 24080-24111  album

`_album_pages`:24081, `_album_claim`:24096

## 24112-24163  season

`_season_index`:24113, `_season_tick`:24116, `_season_xp`:24125, `_season_tier`:24128, `_season_reward`:24131, `_season_claim`:24145

## 24164-24171  Harbor Night

`_harbor_night`:24165

## 24172-24203  check-in calendar

`_cal_tick`:24173

## 24204-24380  the panel

`_build_hp_panel`:24205, `_open_pass`:24240, `_hp_open`:24243, `_hp_close`:24250, `_hp_row`:24254, `_hp_bar`:24269, `_hp_refresh`:24273, `_smoke_pass`:24318

## 24381-24595  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:24385, `_cash_pill_tick`:24393, `_build_lb`:24431, `_open_lb`:24474, `_close_lb`:24482, `_lb_pick`:24486, `_lb_headers`:24491, `_lb_url`:24495, `_lb_me`:24498, `_lb_tick`:24501, `_lb_upload`:24509, `_lb_fetch`:24519, `_lb_got`:24527, `_lb_value`:24538, `_lb_refresh_ui`:24549

## 24596-25019  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:24620, `_market_near`:24697, `_build_gear`:24707, `_gear_piece`:24715, `_build_pet`:24760, `_market_apply`:24802, `_market_tick`:24826, `_build_market_panel`:24848, `_open_market`:24874, `_close_market`:24881, `_refresh_market`:24885, `_market_pick`:24938, `_toggle_board`:24976, `_board_tick`:24983

## 25020-25261  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:25052, `_ds_label`:25071, `_build_display`:25085, `_ds_got`:25164, `_ds_sorted`:25173, `_ds_render_board`:25187, `_ds_render_news`:25213, `_display_tick`:25232

## 25262-25440  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:25279, `_toggle_streamer`:25366, `_streamer_badge_tap`:25382, `_streamer_tick`:25386

## 25441-25477  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:25447, `_car_back`:25454, `_car_park_tick`:25461

## 25478-25574  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:25482, `_bus_eta`:25536, `_bus_displays_tick`:25552

## 25575-25866  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:25593, `_treasure_pick`:25596, `_treasure_spot`:25605, `_treasure_district`:25609, `_treasure_clue`:25621, `_treasure_prop`:25634, `_tp_part`:25637, `_tp_sphere`:25647, `_tp_cyl`:25655, `_treasure_prop_side`:25664, `_build_treasure_props`:25676, `_build_treasure`:25720, `_treasure_dir_char`:25789, `_treasure_tick`:25798, `_treasure_claim`:25852

## 25867-25967  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:25868, `_halo_mat`:25900, `_smoke_treasure`:25925

## 25968-26291  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:25989, `_fm_send`:25992, `_fm_area`:25998, `_fm_glow_mesh`:26014, `_fm_block_reason`:26032, `_fm_start`:26044, `_fm_announce`:26072, `_fm_finish`:26075, `_fm_msg`:26093, `_fm_check_paid`:26144, `_fm_tick`:26162, `_smoke_findme`:26218

## 26292-26402  v0.24.2: road map (for moving people off the road)

`_floor_note`:26298, `_floor_disc`:26312, `_floor_top`:26321, `_ground_at`:26339, `_note_road`:26357, `_on_road`:26364, `_ped_curb`:26374, `_curb_spot`:26384

## 26403-26698  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:26425, `_ex_grid`:26433, `_ex_lamps`:26468, `_ex_umbrella`:26491, `_ex_yards`:26498, `_build_expansion`:26513, `_expand_shots`:26676

## 26699-26893  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:26740, `_v27_near_cross`:26832, `_v27_near_any_road`:26839, `_v27_in_district`:26845, `_sea_tick`:26859, `_sea_tow`:26878

## 26894-27534  Harbor Loop sky train

`_sky_build_path`:26945, `_sky_pos`:26986, `_sky_dir`:27000, `_sky_project`:27005, `_sky_trip_time`:27024, `_sky_trip_dist`:27030, `_sky_now`:27041, `_sky_state`:27044, `_sky_time_at_station`:27059, `_sky_next_arrival`:27066, `_build_skytrain`:27079, `_sky_make_car`:27208, `_sky_skin`:27245, `_sky_place_trains`:27265, `_sky_build_station`:27284, `_sky_near`:27349, `_sky_fmt`:27358, `_sky_enter`:27362, `_sky_leave_platform`:27380, `_sky_board`:27390, `_sky_alight`:27403, `_sky_action`:27416, `_sky_tick`:27433, `_sky_camera`:27471, `_tour_today`:27487, `_tour_stamp`:27490, `_sky_hud`:27513

## 27535-27872  Day and night

`_game_hour`:27616, `_day_key`:27628, `_night_setup`:27643, `_night_scan_mesh`:27733, `_daynight_tick`:27758, `_daynight_apply`:27765, `_daynight_lights`:27857, `_cycle_day_mode`:27862, `_refresh_time_button`:27869

## 27873-28508  v0.27 smoke test and screenshots

`_smoke_v27`:27874, `_city_shots`:28077

## 28509-28925  v0.27: Harbor International Airport (north of the city)

`_build_airport`:28543, `_ap_plane`:28719, `_ap_truck`:28739, `_ap_baggage_train`:28780, `_ap_loop_pos`:28793, `_ap_loop_len`:28809, `_ap_flight_at`:28815, `_ap_tick`:28839, `_airport_ped_plan`:28862, `_smoke_airport`:28882

## 28926-29439  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:28940, `_nav_spot`:28947, `_nav_idx`:28951, `_nav_pos`:28958, `_nav_blocked`:28962, `_nav_nearest_free`:28972, `_nav_bfs`:29000, `_nav_build`:29044, `_stroller`:29115, `_stroll_place`:29131, `_stroll_next`:29152, `_nav_clear_line`:29186, `_stroll_aim`:29197, `_strollers_tick`:29229, `_smoke_strollers`:29324

## 29440-29600  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:29475, `_dir_fmt`:29478, `_signpost_spot`:29481, `_build_signposts`:29498

## 29601-29697  the Directions panel and chip

`_build_dir_panel`:29602, `_open_dir`:29644, `_dir_close`:29653, `_dir_pick`:29657, `_dir_stop`:29662, `_dir_stop_and_close`:29667, `_dir_tick`:29671

## 29698-30239  v0.44: Grand Central

`_gc_mesh`:29727, `_gc_mat`:29760, `_gc_glass`:29769, `_gb`:29779, `_gb_solid`:29785, `_gb_flush`:29789, `_gc_tree`:29819, `_gc_text`:29824, `_gc_planter`:29839, `_gc_kiosk`:29845, `_goods_color`:29875, `_goods_mat`:29878, `_kiosk_goods`:29882, `_build_grand_central`:29960, `_build_gc_towers`:30128, `_gc_tick`:30223

## 30240-30531  v0.44: filling the empty land

`_loft`:30257, `_fill_clear`:30299, `_build_fill`:30309, `_hg_in_lake`:30357, `_hg_path`:30361, `_floor_note_rot`:30369, `_build_gardens`:30377, `_build_fan_plaza`:30487

## 30532-30566  v0.45: hover car underglow

`_car_underglow`:30535

## 30567-30731  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:30568

## 30732-30763  v0.47: street stalls downtown

`_build_street_stalls`:30736, `_cull_people_in`:30756

## 30764-30862  v0.48: places that open as you level up

`_place_lock_of`:30777, `_place_root`:30783, `_place_unlocked`:30786, `_build_place_signs`:30794, `_places_refresh`:30839, `_places_tick`:30856

## 30863-30907  v0.50: city careers

`_career_rank_name`:30888, `_career_mult`:30891, `_career_block_reason`:30896, `_career_start`:30899, `_career_end`:30904

## 30908-30958  v0.52: careers as clear job loops

`_cid`:30935, `_career_target`:30949, `_career_tick`:30956

## 30959-30966  taxi

`_taxi_meter`:30960

## 30967-30970  paramedic

(no functions)

## 30971-30975  police

`_career_chase_over`:30973

## 30976-30981  firefighter

`_fire_aimed`:30977

## 30982-30991  the step bar

`_career_bar_text`:30985, `_career_hud`:30989

## 30992-31018  cut scenes

`_cs_skip`:31010

## 31019-31023  siren

(no functions)

## 31024-31035  the Careers panel

`_build_career_panel`:31025, `_open_careers`:31028, `_career_close`:31032

## 31036-31459  v0.50: homes

`_home_door_spots`:31076, `_build_homes`:31091, `_home_labels`:31120, `_home_door_near`:31129, `_home_origin`:31138, `_home_slot_near`:31141, `_home_exit_near`:31152, `_home_btn`:31159, `_home_interact`:31172, `_home_buy`:31191, `_home_default_layout`:31205, `_home_enter`:31213, `_home_leave`:31233, `_hm`:31241, `_home_build_room`:31260, `_home_refresh_room`:31369, `_furni_build`:31383

## 31460-31794  decorating

`_build_home_panels`:31461, `_open_homes`:31506, `_home_row_go`:31516, `_home_panel_close`:31536, `_deco_open`:31540, `_deco_pick`:31563, `_smoke_careers_homes`:31586

## 31795-31929  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:31799, `_home_slots`:31807, `_home_ring`:31834, `_furni_cat`:31840, `_home_fix_layout`:31846, `_home_build_layout`:31874

## 31930-32360  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:31991, `_ch_homes`:31997, `_ch_step_text`:32004, `_ch_step_done`:32015, `_ch_target`:32029, `_ch_finish_chapter`:32038, `_chapters_tick`:32060, `_hud_top_stack`:32100, `_build_chapters_ui`:32130, `_chapters_restart_ask`:32172, `_chapters_restart`:32175, `_chapters_text`:32185, `_open_chapters`:32205, `_chapters_close`:32212, `_smoke_chapters`:32216, `_step_sound`:32336

## 32361-32399  v0.51.1: join and leave messages

`_announce_join`:32368, `_announce_already_here`:32387, `_announce_leave`:32395

## 32400-32664  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:32416, `_shot_tick`:32422, `_draw_shot_icon`:32454, `_shot_enter`:32463, `_shot_exit`:32477, `_shot_release_controls`:32489, `_shot_stick_zone`:32496, `_shot_input`:32499, `_smoke_photo`:32571

## 32665-32963  v0.51.3: stream joiners

`_viewer_count`:32685, `_stream_join_check`:32691, `_stream_join_start`:32698, `_sj_streamer`:32715, `_stream_join_tick`:32724, `_stream_join_land`:32748, `_sj_welcome`:32764, `_smoke_stream_join`:32798, `_career_shot`:32881

## 32964-33080  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:32968, `_st_restore`:33006, `_smoke_streamer_clean`:33027, `_world_bio_passport`:33078

