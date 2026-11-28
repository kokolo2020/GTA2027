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

## 3388-4336  v0.10.0: chase mode (offline)

`_chase_open`:3389, `_chase_clear`:3394, `_chase_make_unit`:3408, `_chase_spawn_point`:3438, `_chase_start`:3447, `_chase_end`:3483, `_chase_steer`:3502, `_chase_roadblock`:3538, `_chase_heli_build`:3583, `_chase_extras`:3609, `_chase_tick`:3636, `_start_trial`:3700, `_cancel_trial`:3727, `_check_trial`:3732, `_finish_trial`:3749, `_trial_count`:3765, `_open_trials`:3772, `_refresh_trials`:3776, `_update_gate`:3788, `_slab`:3806, `_build_ridge`:3824, `_check_ridge`:3892, `_discover`:3905, `_mission_progress`:3919, `_check_missions`:3981, `_open_garage`:3992, `_open_journal`:3997, `_close_sub`:4002, `_bar`:4005, `_refresh_garage`:4009, `_garage_step`:4034, `_garage_action`:4038, `_refresh_journal`:4058, `_visited_shops`:4091, `_build_panels`:4098, `_build_player`:4258, `_build_car`:4296, `_try_model`:4325

## 4337-5021  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4338, `_kshader`:4412, `_ksync`:4418, `_kskin`:4433, `_make_kperson`:4439, `_hat_y`:4503, `_sit_drop`:4506, `_kplay`:4509, `_kpeople_tick`:4519, `_pose_person`:4548, `_pose_limbs`:4565, `_person_lift`:4627, `_snap_crowd_feet`:4640, `_people_life_tick`:4656, `_life_one`:4693, `_cull_person`:4703, `_recolor_car_model`:4711, `_apply_car_model`:4725, `_landmark`:4745, `_label`:4755, `_button`:4762, `_panel`:4774, `_build_hud`:4784

## 5022-5140  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:5028, `_menu_tab`:5034, `_watch_tick`:5057, `_watch_count`:5099, `_online_pill_tap`:5106, `_online_pill_tick`:5112, `online_config_ok`:5138

## 5141-5178  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5144, `_offroad`:5150, `_ground_near`:5163, `_collectibles_on_road`:5170

## 5179-5318  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5191, `_build_quest_offer`:5195, `_quest_offer_tick`:5225, `_quest_auto_pick`:5275, `_quest_accept`:5290, `_quest_decline`:5304, `_quest_stop`:5310

## 5319-5686  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5343, `_holo_material`:5352, `_build_future`:5360, `_build_neon`:5374, `_model_profile`:5443, `_model_body_box`:5466, `_build_holograms`:5480, `_holo_tick`:5530, `_build_sky_traffic`:5547, `_sky_hover_car`:5565, `_sky_drone`:5612, `_sky_traffic_tick`:5656, `_future_lights`:5675

## 5687-6186  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5746, `_crew_col`:5754, `_peer_crewmate`:5757, `_set_ring_color`:5760, `_level_color`:5787, `_tier_color`:5800, `_my_ach_tier`:5803, `_style_ring`:5810, `_social_peer_extras`:5858, `_social_tag`:5872, `_my_tag_extra`:5884, `_soc_send`:5897, `_social_msg`:5912, `_social_accept`:5951, `_social_go`:5972, `_soc_friend`:5991, `_soc_invite`:5998, `_soc_goto`:6003, `_soc_high_five`:6011, `_soc_gift`:6031, `_soc_crew_invite`:6048, `_gift_day_check`:6055, `_crew_create`:6061, `_crew_cycle_color`:6071, `_crew_leave`:6076, `_crew_mate_near`:6084, `_crew_board`:6092, `_build_social`:6111, `_social_online`:6173, `_open_social`:6177, `_close_social`:6183

## 6187-6437  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6190, `_track_pos`:6199, `_social_row_button`:6210, `_refresh_social`:6217, `_on_dance_floor`:6279, `_toggle_dance`:6282, `_build_dance_floor`:6290, `_social_tick`:6316, `_photo`:6388

## 6438-6933  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6460, `_game_state`:6468, `_build_arcade`:6480, `_c4_empty`:6531, `_c4_drop_row`:6537, `_c4_winner`:6543, `_c4_bot_move`:6564, `_c4_code`:6593, `_c4_ready`:6599, `_c4_tap`:6602, `_c4_check`:6623, `_c4_tick`:6647, `_rx_ready`:6674, `_rx_start`:6677, `_rx_tap`:6691, `_rx_send_time`:6716, `_rx_resolve`:6723, `_rx_tick`:6749, `_mem_start`:6764, `_mem_tap`:6780, `_mem_finish`:6795, `_mem_tick`:6811, `_mem_board_text`:6818, `_build_arcade_panel`:6829, `_refresh_arcade_panel`:6872

## 6934-7227  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6997, `_quiz_slot`:7000, `_quiz_question`:7010, `_quiz_bot_score`:7039, `_in_quiz`:7048, `_build_quiz`:7051, `_quiz_answer`:7121, `_quiz_msg`:7134, `_quiz_board`:7142, `_quiz_tick`:7152, `_quiz_refresh`:7194

## 7228-8824  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7399, `_sites_found`:7402, `_sites_total`:7405, `_bits`:7408, `_ach_value`:7415, `_ach_tick`:7470, `_ach_check`:7495, `_ach_by_id`:7531, `_ach_msg`:7537, `_build_ach`:7550, `_ach_show`:7581, `_open_ach`:7601, `_close_ach`:7607, `_refresh_ach`:7611, `_ach_num`:7642, `_minimap_tap`:7645, `_menu_go`:7652, `_menu_stay`:7657, `_menu_call_car`:7661, `_toggle_clean_hud`:7667, `_refresh_menu_buttons`:7673, `_clean_hud_tick`:7683, `_draw_joystick`:7724, `_input`:7729, `_touch_text_focus`:7824, `_stick_zone`:7844, `_notification`:7848, `_physics_process`:7865, `_follow_camera`:8021, `_follow_walk_camera`:8063, `_interact`:8086, `_refresh_hud`:8248, `_open_panel`:8377, `_layout_panels`:8407, `_toggle_menu`:8434, `_rescue`:8480, `_show_toast`:8512, `_save_progress`:8516, `_load_progress`:8613

## 8825-11457  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8826, `_radio_voice`:8829, `_radio_make`:8862, `_radio_set`:8933, `_radio_play`:8955, `_radio_next`:8960, `_radio_talk_line`:8964, `_radio_caption`:8985, `_radio_refresh`:8993, `_process`:9006, `_build_peds`:9057, `_update_peds`:9168, `_update_ped`:9187, `_smoke_test`:9241, `_smoke_chase`:9894, `_smoke_orole`:9927, `_smoke_levels`:9956, `_smoke_bus`:9997, `_smoke_chase_extras`:10082, `_smoke_marina`:10110, `_blocked_at`:10212, `_blocker`:10227, `_on_screen`:10240, `_wait_radio`:10245, `_smoke_radio_peds`:10252, `_smoke_typed_chat`:10322, `_smoke_chat_touch`:10341, `_smoke_cafe`:10362, `_smoke_boutique`:10388, `_smoke_models`:10416, `_smoke_garage_ridge`:10440, `_save_shot`:10816, `_sky_shots`:10826, `_pet_shots`:10855, `_tracker_shots`:10890, `_infected_shots`:10924, `_paris_shots`:10975, `_people_shots`:11205, `_shots`:11246, `_shot_car`:11440, `_capture_preview`:11450

## 11458-12106  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11525, `_downtown_count`:11528, `_nearest_downtown`:11535, `_check_downtown`:11549, `_discover_downtown`:11562, `_box_batch`:11576, `_model_batch`:11596, `_cut_ranges`:11650, `_dt_ranges`:11662, `_dt_has`:11669, `_dt_near_cross`:11675, `_place`:11681, `_signal_pole`:11692, `_cyl_batch`:11711, `_city_signals`:11735, `_ensure_light_mats`:11786, `_city_lamps`:11796, `_build_downtown`:11840, `_dt_block`:12040, `_downtown_token`:12046, `_build_park`:12063, `_build_plaza`:12092

## 12107-12210  old city and Bay details

`_build_city_detail`:12108

## 12211-12620  traffic

`_build_traffic`:12212, `_path_sample`:12307, `_light_look`:12321, `_light_green`:12329, `_traffic_place`:12333, `_traffic_blocked_by`:12345, `_traffic_tick`:12357, `_smoke_downtown`:12463, `_skyline_shot`:12575, `_skyline_shots`:12583

## 12621-12988  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12667, `_web_scale`:12730, `_web_fps_tick`:12740, `_world_to_uv`:12764, `_map_angle`:12767, `_build_minimap`:12775, `_open_map`:12848, `_close_map`:12859, `_mini_point`:12866, `_site_markers`:12870, `_draw_arrow`:12902, `_draw_minimap`:12909, `_draw_full_map`:12956, `_minimap_tick`:12981

## 12989-13269  camera views

`_build_view_controls`:12990, `_sky_grade`:13032, `_cycle_view`:13047, `_apply_view`:13057, `_hide_labels`:13101, `_unfade`:13107, `_bake_map`:13113, `_shot_stats`:13163, `_view_shots`:13166, `_smoke_views`:13207

## 13270-13517  v0.17.0: level-up celebration

`_build_level_fx`:13281, `_draw_level_rays`:13318, `_level_fx_tick`:13328, `_level_sound`:13333, `_fx_material`:13375, `_level_up_fx`:13383, `_smoke_level_fx`:13484, `_levelup_shots`:13493

## 13518-13639  v0.18.0: walk-in stadium

`_collider_yaw`:13523, `_build_stadium_walls`:13534, `_look`:13562, `_smoke_stadium_eye`:13571, `_stadium_shots`:13609

## 13640-13801  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13664, `_arrow_mesh`:13676, `_build_guidance`:13699, `_guide_target`:13724, `_guidance_tick`:13753, `_draw_hud_arrow`:13779

## 13802-13987  checkpoints

`_build_checkpoints`:13803, `_refresh_checkpoints`:13848, `_check_checkpoints`:13854, `_activate_checkpoint`:13864, `_checkpoint_spawn`:13885, `_spawn_at_checkpoint`:13890, `_draw_checkpoint_icon`:13906, `_smoke_guidance_checkpoints`:13912, `_guide_shots`:13962

## 13988-14266  v0.18.0: Harbor Dome social hub

`_hub_seat`:14046, `_build_hub`:14050

## 14267-14317  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14268, `_xm_mesh`:14277, `_xm_tree`:14285

## 14318-14641  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14321, `_gt_surface`:14336, `_xm_grand_tree`:14346, `_lux_mat`:14461, `_lux_part`:14477, `_lux_box`:14480, `_lux_cyl`:14485, `_lux_ball`:14493, `_lux_new`:14501, `_lux_commit`:14506, `_lux_sofa_mesh`:14510, `_lux_chair_mesh`:14540, `_lux_table_mesh`:14560, `_lux_pouf_mesh`:14575, `_lux_batch`:14590, `_hub_christmas`:14606

## 14642-14797  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14643

## 14798-15046  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14801, `_vx_cyl`:14808, `_vx_ball`:14816, `_vx_ring`:14824, `_hub_polish`:14832, `_hub_gate`:14855, `_hub_vip`:14917, `_hub_glass`:15030

## 15047-15261  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:15048, `_build_hub_bots`:15073, `_seat_of`:15104, `_bubble`:15114, `_emote`:15170, `_hub_people_tick`:15184

## 15262-15380  seats

`_seat_taken`:15263, `_nearest_seat`:15271, `_seat_label`:15283, `_sit`:15299, `_stand_up`:15343, `_seated_tick`:15362

## 15381-15537  game panel

`_build_game_panel`:15382, `_open_game_panel`:15437, `_refresh_game_panel`:15456, `_play_robot`:15501, `_peer_at`:15515, `_opponent_name`:15522, `_pay`:15530

## 15538-15658  tic-tac-toe

`_ttt_ready`:15541, `_ttt_winner`:15547, `_ttt_bot_move`:15557, `_ttt_tap`:15583, `_ttt_code`:15603, `_ttt_check`:15609, `_ttt_tick`:15632

## 15659-15710  rock paper scissors

`_rps_ready`:15660, `_rps_pick`:15666, `_rps_resolve`:15684, `_rps_tick`:15708

## 15711-15793  online table messages

`_online_game_send`:15712, `_hub_game_msg`:15718

## 15794-15869  comedy show

`_joke_start`:15795, `_joke_tick`:15807, `_speak`:15833, `_play_rimshot`:15842

## 15870-16769  quick chat and emotes

`_build_chat`:15892, `_chat_toggle_to`:16009, `_chat_log_add`:16017, `_chat_area`:16023, `_chat_near_count`:16041, `_chat_tick`:16050, `_toggle_chat`:16099, `_chat_fit`:16114, `_chat_clean`:16120, `_chat_wrap`:16137, `_chat_send_text`:16159, `_typing`:16182, `_say`:16185, `_do_emote`:16201, `_smoke_hub`:16210, `_chat_shots`:16384, `_cafe_shots`:16409, `_shop_shots`:16457, `_car_shots`:16506, `_outfit_shots`:16537, `_hub_shots`:16585, `_sg_on_terrace`:16720, `_people_only`:16723, `_people_only_keep_cars_out`:16727, `_car_barrier`:16739, `_hub_keep_cars_out`:16753

## 16770-16935  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16779, `_feed_add`:16788, `_feed_render`:16794, `_feed_tick`:16822, `_online_event_send`:16831, `_at_pvp_table`:16838, `_game_name`:16845, `_send_lfp`:16848, `_lfp_msg`:16865, `_accept_invite`:16886

## 16936-17177  v0.18.2: nickname and HUD relayout

`_nick_rude`:16948, `_clean_nick`:16963, `_build_nick_panel`:16975, `_open_nick`:17013, `_random_nick`:17022, `_save_nick`:17028, `_close_nick`:17047, `_refresh_nick_button`:17056, `_relayout_hud`:17060, `_smoke_nick`:17097, `_nick_shots`:17129, `_smoke_sites_reachable`:17147

## 17178-17465  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17204, `_nearest_civic`:17211, `_check_civic`:17225, `_discover_civic`:17238, `_civ_ranges`:17251, `_civ_has`:17265, `_civ_near_cross`:17271, `_build_civic`:17277, `_civic_token`:17403, `_civic_shots`:17420, `_hub_focus`:17442

## 17466-17575  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17537, `_in_rw_lot`:17540, `_box_batch_rot`:17543, `_multi_collider`:17561

## 17576-17903  circuit geometry

`_cr_point`:17577, `_rw_build_path`:17591, `_rw_dir`:17619, `_rw_bend`:17624, `_ribbon`:17630, `_rw_band`:17650, `_rw_keepout`:17668, `_build_raceway`:17677, `_build_rw_parking`:17711, `_build_rw_pits`:17756, `_build_rw_track`:17793, `_build_rw_trackside`:17834

## 17904-18001  race car rental

`_model_key`:17905, `_race_car_start`:17908, `_tint_ghost`:17946, `_race_car_end`:17959, `_race_keep_cars_out`:17984

## 18002-18016  speed effects

`_eff_max`:18003, `_eff_accel`:18014

## 18017-18067  track helpers

`_rw_seg_progress`:18018, `_rw_track_dist`:18038, `_rw_point_dist`:18049, `_rw_player_progress`:18056, `_rw_target`:18062

## 18068-18304  events

`_rec_stop`:18069, `_rw_place`:18085, `_rw_grid_pos`:18092, `_rw_start`:18097, `_rw_spawn_ai`:18129, `_rw_ai_place`:18153, `_rw_tick`:18164, `_rw_ai_tick`:18217, `_rw_lap_done`:18259, `_rw_finish`:18271, `_rw_fmt`:18302

## 18305-18357  boosters and spikes

`_rw_buy`:18306, `_rw_use_boost`:18324, `_rw_use_spike`:18332, `_rw_drop_spike_at`:18343

## 18358-18415  online races

`_race_msg`:18359, `_join_race`:18381

## 18416-18771  raceway panel, HUD, board

`_build_raceway_ui`:18417, `_rw_layout`:18477, `_rw_open`:18484, `_rw_close`:18490, `_rw_refresh_panel`:18494, `_rw_refresh_board`:18507, `_rw_hud`:18519, `_peer_car_model`:18543, `_smoke_raceway`:18553, `_race_shots`:18734

## 18772-18979  v0.22.0: Call Car

`_call_block_reason`:18778, `_call_spot`:18795, `_call_car`:18826, `_play_horn`:18850, `_smoke_follow_call`:18874, `_follow_shots`:18947

## 18980-19437  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:19005, `_place_portal_button`:19011, `_portal_pressed`:19018, `_build_travel`:19026, `_toggle_run`:19131, `_refresh_run`:19135, `_hud_v23_tick`:19143, `_travel_block_reason`:19175, `_travel_open`:19195, `_open_travel`:19201, `_open_worlds`:19207, `_open_case`:19213, `_case_step`:19225, `_case_refresh`:19229, `_case_submit`:19233, `_close_case`:19242, `_sky_go`:19246, `_close_worlds`:19256, `_refresh_worlds`:19260, `_world_go`:19266, `_close_travel`:19273, `_refresh_travel`:19277, `_travel_to`:19285, `_smoke_travel`:19312, `_v23_shots`:19350

## 19438-19511  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19445, `_qr_button`:19460, `_qr_layout`:19499, `_smoke_qr`:19505

## 19512-19948  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19532, `_open_crate`:19548, `_build_crate_ui`:19565, `_crate_pick`:19652, `_crate_reveal`:19675, `_crate_draw_car`:19702, `_crate_confetti`:19721, `_crate_sound`:19746, `_crate_drive`:19772, `_feed_add_system`:19802, `_smoke_crate`:19805, `_crate_shots`:19853

## 19949-20440  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19990, `_quick_today`:19995, `_quick_is_done`:19998, `_quick_left`:20001, `_quick_next`:20008, `_quick_fix_target`:20021, `_quick_daily_check`:20035, `_quick_complete`:20049, `_quick_side`:20083, `_build_quick_props`:20101, `_daily_shots`:20253, `_quick_props_refresh`:20295, `_quick_fx`:20299, `_play_coin`:20315, `_smoke_quick`:20332

## 20441-20591  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20450, `_quest_nearby`:20505, `_open_quests`:20512, `_close_quests`:20519, `_refresh_quests`:20523, `_quest_pick`:20549, `_quest_mode`:20563, `_smoke_quests`:20566

## 20592-20626  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20596, `_my_tag_tick`:20599

## 20627-20941  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20644, `_fc_torus`:20654, `_fc_pearl`:20662, `_fc_chrome`:20672, `_fc_glass`:20681, `_fc_glow`:20691, `_fc_ghost`:20700, `_fc_holo`:20712, `_fc_mesh`:20722, `_fc_sphere`:20742, `_fc_capsule`:20750, `_fc_cone`:20758, `_build_food_court`:20767, `_food_court_tick`:20921

## 20942-21263  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20971, `_cm_bench`:20987, `_build_commons`:21000, `_commons_tick`:21222

## 21264-21578  v0.36: the daily puzzle

`_pz_today`:21287, `_pz_new`:21290, `_pz_neighbours`:21335, `_pz_flip`:21345, `_pz_done`:21350, `_pz_tap`:21358, `_pz_win`:21374, `_pz_reset`:21395, `_puzzle_near`:21399, `_open_puzzle`:21404, `_close_puzzle`:21412, `_pz_refresh_sign`:21416, `_build_puzzle_panel`:21424, `_pz_draw`:21455, `_smoke_chat`:21496, `_smoke_feet`:21534, `_smoke_commons`:21555

## 21579-21767  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21641, `_bio_theta`:21645, `_bio_sec_n`:21650, `_bio_sec_of`:21653, `_bio_pt`:21656, `_bio_lp`:21661, `_bio_la`:21665, `_bio_dir`:21669, `_bio_hex_r`:21672, `_bio_apo`:21677, `_bio_open_angles`:21683, `_bio_si`:21693, `_bm`:21699, `_bsph`:21704, `_blow`:21707, `_bcone`:21718, `_bbox`:21721, `_bp`:21724, `_bq`:21729, `_bio_glass_mat`:21733, `_bio_water_mat`:21746, `_bio_mat`:21758

## 21768-22140  building blocks

`_bio_inst`:21769, `_bio_add`:21775, `_bio_model`:21778, `_bio_nature_mesh`:21784, `_bio_flush`:21818, `_bio_bar`:21853, `_bio_slab`:21866, `_bio_body`:21881, `_bio_cyl_col`:21894, `_bio_hexmesh`:21907, `_bio_hexslab`:21919, `_bio_hexpt`:21925, `_bio_gridshell`:21932, `_bio_rail`:22039, `_bio_rail_arc`:22044, `_bio_disc_deck`:22056, `_bio_ring_deck`:22062, `_bio_helix`:22073, `_bio_pillar`:22093, `_bio_cafe`:22099, `_bio_fence_line`:22113, `_bio_fence_seg`:22118, `_bio_pen`:22128

## 22141-22642  building

`_build_biosphere`:22142, `_build_biosphere_legacy`:22146, `_bio_text`:22308, `_bio_plaque`:22326, `_bio_ticket_hall`:22340, `_on_foot_collision_guard`:22396, `_bio_inside`:22406, `_bio_pass_ok`:22409, `_ticket_near`:22413, `_bio_buy_pass`:22418, `_bio_gates_update`:22434, `_bio_gate_tick`:22460, `_bio_tunnel`:22472, `_bio_grounds`:22525, `_bio_dome`:22571, `_bio_deck_mats`:22639

## 22643-22798  garden planting

`_bio_free`:22644, `_bio_spot`:22661, `_bio_garden`:22669, `_bio_pine`:22710, `_bio_tree`:22713, `_bio_big_tree`:22723, `_bio_rock`:22728, `_bio_pond`:22731, `_bio_particles`:22735, `_bio_mist`:22763, `_bio_mini_dome`:22792

## 22799-23206  the four layouts

`_bio_winter`:22800, `_bio_spring`:22892, `_bio_summer`:23017, `_bio_autumn`:23101

## 23207-23477  animals

`_bio_spawn`:23208, `_bio_load_animal`:23280, `_bio_make_quad`:23301, `_bio_load_bird`:23378, `_bio_make_penguin`:23398, `_bio_make_bird`:23420, `_bio_make_flamingo`:23444, `_bio_make_butterfly`:23465

## 23478-23611  animation, spotting and rewards

`_bio_stuck_check`:23483, `_biosphere_tick`:23501, `_bio_animate`:23512, `_bio_spot_check`:23592, `_bio_spotted`:23604, `_smoke_biosphere`:23608

## 23612-24129  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23699, `_wear_piece`:23702, `_wear_mat`:23725, `_person_index`:23741, `_dress`:23764, `_smoke_style`:23870, `_style_shots`:24021, `_npc_look`:24093

## 24130-24283  your look: apply, save, share

`_look_clean`:24134, `_look_pack`:24149, `_owns`:24155, `_apply_look`:24160, `_relic_model`:24171, `_fc_mesh_mat`:24236, `_relic_refresh`:24239, `_relic_tick`:24253, `_peer_style`:24264

## 24284-24711  stores and the wardrobe

`_style_today`:24303, `_style_items`:24306, `_style_cat`:24314, `_style_price`:24317, `_style_deal`:24331, `_style_price_base`:24344, `_relic_stock`:24351, `_build_style_panel`:24363, `_open_store`:24403, `_open_wardrobe`:24422, `_style_close`:24425, `_style_finish`:24429, `_sync_old_avatar`:24444, `_style_tabs_for`:24451, `_refresh_style`:24456, `_style_body_rows`:24607, `_style_set_tab`:24624, `_style_step`:24628, `_style_color`:24633, `_style_pick`:24638, `_style_buy`:24673, `_ach_relics_check`:24695, `_style_face_camera`:24700

## 24712-25179  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24748, `_ga_text`:24754, `_ga_box`:24771, `_build_galleria`:24787, `_ga_inner_tick`:24928, `_ga_shell`:24944, `_ga_inside`:24994, `_bio_cyl_col_on`:24997, `_ga_models`:25009, `_ga_lbox`:25024, `_ga_ltext`:25038, `_ga_store`:25045, `_bio_cafe_on`:25147, `_ga_mannequins`:25155

## 25180-25331  featured outfits and the Sky Run

`_ga_featured_look`:25193, `_build_ga_fun`:25214, `_ga_fun_tick`:25259, `_sky_finish`:25286, `_extra_near`:25305, `_extra_open`:25314, `_store_near`:25323

## 25332-25428  v0.41: THE SKY GARDEN

`_sg_now`:25386, `_sg_progress`:25389, `_sg_time`:25395, `_sg_stock`:25402, `_sg_mut_roll`:25417

## 25429-25566  building

`_sg_box`:25430, `_sg_text`:25436, `_build_sky_garden`:25450, `_sg_seed_spot`:25561, `_sg_codex_spot`:25564

## 25567-25747  plants

`_sg_plant_model`:25568, `_sg_refresh_all`:25673, `_sg_refresh`:25677, `_sky_garden_tick`:25713, `_sg_ready_count`:25732, `_sg_boot_note`:25739

## 25748-25867  interacting

`_sg_near`:25749, `_sg_button_text`:25772, `_sg_value`:25785, `_sg_interact`:25789, `_sg_buy`:25805, `_sg_plant`:25827, `_sg_harvest`:25838

## 25868-26111  the garden screen

`_build_sg_panel`:25869, `_sg_open`:25904, `_sg_close`:25913, `_sg_row`:25917, `_sg_refresh_panel`:25932, `_sg_pick_buy`:25977, `_sg_pick_plant`:25981, `_smoke_car_barriers`:25987, `_smoke_sky_garden`:26028

## 26112-26150  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26143, `_pass_day`:26146

## 26151-26182  album

`_album_pages`:26152, `_album_claim`:26167

## 26183-26234  season

`_season_index`:26184, `_season_tick`:26187, `_season_xp`:26196, `_season_tier`:26199, `_season_reward`:26202, `_season_claim`:26216

## 26235-26242  Harbor Night

`_harbor_night`:26236

## 26243-26274  check-in calendar

`_cal_tick`:26244

## 26275-26451  the panel

`_build_hp_panel`:26276, `_open_pass`:26311, `_hp_open`:26314, `_hp_close`:26321, `_hp_row`:26325, `_hp_bar`:26340, `_hp_refresh`:26344, `_smoke_pass`:26389

## 26452-26683  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26456, `_cash_pill_tick`:26464, `_build_lb`:26502, `_open_lb`:26548, `_close_lb`:26556, `_lb_pick`:26560, `_lb_headers`:26565, `_lb_url`:26569, `_lb_me`:26572, `_lb_level`:26577, `_lb_tick`:26587, `_lb_upload`:26595, `_lb_fetch`:26605, `_lb_got`:26613, `_lb_value`:26626, `_lb_refresh_ui`:26637

## 26684-27242  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26708, `_market_near`:26787, `_build_gear`:26797, `_gear_piece`:26805, `_pet_m`:26850, `_pet_eyes`:26864, `_build_pet`:26871, `_pet_nose`:27009, `_pet_anim`:27012, `_market_apply`:27023, `_market_tick`:27047, `_build_market_panel`:27071, `_open_market`:27097, `_close_market`:27104, `_refresh_market`:27108, `_market_pick`:27161, `_toggle_board`:27199, `_board_tick`:27206

## 27243-27487  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27275, `_ds_label`:27294, `_build_display`:27308, `_ds_got`:27388, `_ds_sorted`:27397, `_ds_render_board`:27411, `_ds_render_news`:27437, `_display_tick`:27458

## 27488-27666  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27505, `_toggle_streamer`:27592, `_streamer_badge_tap`:27608, `_streamer_tick`:27612

## 27667-27703  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27673, `_car_back`:27680, `_car_park_tick`:27687

## 27704-27800  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27708, `_bus_eta`:27762, `_bus_displays_tick`:27778

## 27801-28092  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27819, `_treasure_pick`:27822, `_treasure_spot`:27831, `_treasure_district`:27835, `_treasure_clue`:27847, `_treasure_prop`:27860, `_tp_part`:27863, `_tp_sphere`:27873, `_tp_cyl`:27881, `_treasure_prop_side`:27890, `_build_treasure_props`:27902, `_build_treasure`:27946, `_treasure_dir_char`:28015, `_treasure_tick`:28024, `_treasure_claim`:28078

## 28093-28193  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:28094, `_halo_mat`:28126, `_smoke_treasure`:28151

## 28194-28517  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28215, `_fm_send`:28218, `_fm_area`:28224, `_fm_glow_mesh`:28240, `_fm_block_reason`:28258, `_fm_start`:28270, `_fm_announce`:28298, `_fm_finish`:28301, `_fm_msg`:28319, `_fm_check_paid`:28370, `_fm_tick`:28388, `_smoke_findme`:28444

## 28518-28628  v0.24.2: road map (for moving people off the road)

`_floor_note`:28524, `_floor_disc`:28538, `_floor_top`:28547, `_ground_at`:28565, `_note_road`:28583, `_on_road`:28590, `_ped_curb`:28600, `_curb_spot`:28610

## 28629-28924  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28651, `_ex_grid`:28659, `_ex_lamps`:28694, `_ex_umbrella`:28717, `_ex_yards`:28724, `_build_expansion`:28739, `_expand_shots`:28902

## 28925-29119  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28966, `_v27_near_cross`:29058, `_v27_near_any_road`:29065, `_v27_in_district`:29071, `_sea_tick`:29085, `_sea_tow`:29104

## 29120-29787  Harbor Loop sky train

`_sky_build_path`:29171, `_sky_pos`:29212, `_sky_dir`:29226, `_sky_project`:29231, `_sky_trip_time`:29250, `_sky_trip_dist`:29256, `_sky_now`:29267, `_sky_state`:29270, `_sky_time_at_station`:29285, `_sky_next_arrival`:29292, `_build_skytrain`:29305, `_sky_make_car`:29457, `_sky_skin`:29494, `_sky_place_trains`:29514, `_sky_build_station`:29533, `_sky_near`:29598, `_sky_fmt`:29607, `_sky_enter`:29611, `_sky_leave_platform`:29629, `_sky_board`:29639, `_sky_alight`:29653, `_sky_action`:29667, `_sky_tick`:29684, `_sky_camera`:29724, `_tour_today`:29740, `_tour_stamp`:29743, `_sky_hud`:29766

## 29788-30161  Day and night

`_toggle_weather`:29871, `_refresh_weather_button`:29877, `_game_hour`:29883, `_day_key`:29895, `_night_setup`:29910, `_night_scan_mesh`:30000, `_daynight_tick`:30025, `_daynight_apply`:30034, `_daynight_lights`:30146, `_cycle_day_mode`:30151, `_refresh_time_button`:30158

## 30162-30799  v0.27 smoke test and screenshots

`_smoke_v27`:30163, `_city_shots`:30368

## 30800-31216  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30834, `_ap_plane`:31010, `_ap_truck`:31030, `_ap_baggage_train`:31071, `_ap_loop_pos`:31084, `_ap_loop_len`:31100, `_ap_flight_at`:31106, `_ap_tick`:31130, `_airport_ped_plan`:31153, `_smoke_airport`:31173

## 31217-31730  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31231, `_nav_spot`:31238, `_nav_idx`:31242, `_nav_pos`:31249, `_nav_blocked`:31253, `_nav_nearest_free`:31263, `_nav_bfs`:31291, `_nav_build`:31335, `_stroller`:31406, `_stroll_place`:31422, `_stroll_next`:31443, `_nav_clear_line`:31477, `_stroll_aim`:31488, `_strollers_tick`:31520, `_smoke_strollers`:31615

## 31731-31891  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31766, `_dir_fmt`:31769, `_signpost_spot`:31772, `_build_signposts`:31789

## 31892-31988  the Directions panel and chip

`_build_dir_panel`:31893, `_open_dir`:31935, `_dir_close`:31944, `_dir_pick`:31948, `_dir_stop`:31953, `_dir_stop_and_close`:31958, `_dir_tick`:31962

## 31989-32530  v0.44: Grand Central

`_gc_mesh`:32018, `_gc_mat`:32051, `_gc_glass`:32060, `_gb`:32070, `_gb_solid`:32076, `_gb_flush`:32080, `_gc_tree`:32110, `_gc_text`:32115, `_gc_planter`:32130, `_gc_kiosk`:32136, `_goods_color`:32166, `_goods_mat`:32169, `_kiosk_goods`:32173, `_build_grand_central`:32251, `_build_gc_towers`:32419, `_gc_tick`:32514

## 32531-32822  v0.44: filling the empty land

`_loft`:32548, `_fill_clear`:32590, `_build_fill`:32600, `_hg_in_lake`:32648, `_hg_path`:32652, `_floor_note_rot`:32660, `_build_gardens`:32668, `_build_fan_plaza`:32778

## 32823-32857  v0.45: hover car underglow

`_car_underglow`:32826

## 32858-33022  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32859

## 33023-33054  v0.47: street stalls downtown

`_build_street_stalls`:33027, `_cull_people_in`:33047

## 33055-33153  v0.48: places that open as you level up

`_place_lock_of`:33068, `_place_root`:33074, `_place_unlocked`:33077, `_build_place_signs`:33085, `_places_refresh`:33130, `_places_tick`:33147

## 33154-33198  v0.50: city careers

`_career_rank_name`:33179, `_career_mult`:33182, `_career_block_reason`:33187, `_career_start`:33190, `_career_end`:33195

## 33199-33249  v0.52: careers as clear job loops

`_cid`:33226, `_career_target`:33240, `_career_tick`:33247

## 33250-33257  taxi

`_taxi_meter`:33251

## 33258-33261  paramedic

(no functions)

## 33262-33266  police

`_career_chase_over`:33264

## 33267-33272  firefighter

`_fire_aimed`:33268

## 33273-33282  the step bar

`_career_bar_text`:33276, `_career_hud`:33280

## 33283-33309  cut scenes

`_cs_skip`:33301

## 33310-33314  siren

(no functions)

## 33315-33326  the Careers panel

`_build_career_panel`:33316, `_open_careers`:33319, `_career_close`:33323

## 33327-33750  v0.50: homes

`_home_door_spots`:33367, `_build_homes`:33382, `_home_labels`:33411, `_home_door_near`:33420, `_home_origin`:33429, `_home_slot_near`:33432, `_home_exit_near`:33443, `_home_btn`:33450, `_home_interact`:33463, `_home_buy`:33482, `_home_default_layout`:33496, `_home_enter`:33504, `_home_leave`:33524, `_hm`:33532, `_home_build_room`:33551, `_home_refresh_room`:33660, `_furni_build`:33674

## 33751-34086  decorating

`_build_home_panels`:33752, `_open_homes`:33797, `_home_row_go`:33807, `_home_panel_close`:33827, `_deco_open`:33831, `_deco_pick`:33854, `_smoke_careers_homes`:33877

## 34087-34221  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:34091, `_home_slots`:34099, `_home_ring`:34126, `_furni_cat`:34132, `_home_fix_layout`:34138, `_home_build_layout`:34166

## 34222-34655  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34285, `_ch_homes`:34291, `_ch_step_text`:34298, `_ch_step_done`:34309, `_ch_target`:34323, `_ch_finish_chapter`:34332, `_chapters_tick`:34354, `_hud_top_stack`:34394, `_build_chapters_ui`:34424, `_chapters_restart_ask`:34466, `_chapters_restart`:34469, `_chapters_text`:34479, `_open_chapters`:34499, `_chapters_close`:34506, `_smoke_chapters`:34510, `_step_sound`:34631

## 34656-34694  v0.51.1: join and leave messages

`_announce_join`:34663, `_announce_already_here`:34682, `_announce_leave`:34690

## 34695-34959  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34711, `_shot_tick`:34717, `_draw_shot_icon`:34749, `_shot_enter`:34758, `_shot_exit`:34772, `_shot_release_controls`:34784, `_shot_stick_zone`:34791, `_shot_input`:34794, `_smoke_photo`:34866

## 34960-35258  v0.51.3: stream joiners

`_viewer_count`:34980, `_stream_join_check`:34986, `_stream_join_start`:34993, `_sj_streamer`:35010, `_stream_join_tick`:35019, `_stream_join_land`:35043, `_sj_welcome`:35059, `_smoke_stream_join`:35093, `_career_shot`:35176

## 35259-35375  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35263, `_st_restore`:35301, `_smoke_streamer_clean`:35322, `_world_bio_passport`:35373

