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

## 7228-8821  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7399, `_sites_found`:7402, `_sites_total`:7405, `_bits`:7408, `_ach_value`:7415, `_ach_tick`:7470, `_ach_check`:7495, `_ach_by_id`:7531, `_ach_msg`:7537, `_build_ach`:7550, `_ach_show`:7581, `_open_ach`:7601, `_close_ach`:7607, `_refresh_ach`:7611, `_ach_num`:7642, `_minimap_tap`:7645, `_menu_go`:7652, `_menu_stay`:7657, `_menu_call_car`:7661, `_toggle_clean_hud`:7667, `_refresh_menu_buttons`:7673, `_clean_hud_tick`:7683, `_draw_joystick`:7724, `_input`:7729, `_touch_text_focus`:7824, `_stick_zone`:7844, `_notification`:7848, `_physics_process`:7865, `_follow_camera`:8018, `_follow_walk_camera`:8060, `_interact`:8083, `_refresh_hud`:8245, `_open_panel`:8374, `_layout_panels`:8404, `_toggle_menu`:8431, `_rescue`:8477, `_show_toast`:8509, `_save_progress`:8513, `_load_progress`:8610

## 8822-11454  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8823, `_radio_voice`:8826, `_radio_make`:8859, `_radio_set`:8930, `_radio_play`:8952, `_radio_next`:8957, `_radio_talk_line`:8961, `_radio_caption`:8982, `_radio_refresh`:8990, `_process`:9003, `_build_peds`:9054, `_update_peds`:9165, `_update_ped`:9184, `_smoke_test`:9238, `_smoke_chase`:9891, `_smoke_orole`:9924, `_smoke_levels`:9953, `_smoke_bus`:9994, `_smoke_chase_extras`:10079, `_smoke_marina`:10107, `_blocked_at`:10209, `_blocker`:10224, `_on_screen`:10237, `_wait_radio`:10242, `_smoke_radio_peds`:10249, `_smoke_typed_chat`:10319, `_smoke_chat_touch`:10338, `_smoke_cafe`:10359, `_smoke_boutique`:10385, `_smoke_models`:10413, `_smoke_garage_ridge`:10437, `_save_shot`:10813, `_sky_shots`:10823, `_pet_shots`:10852, `_tracker_shots`:10887, `_infected_shots`:10921, `_paris_shots`:10972, `_people_shots`:11202, `_shots`:11243, `_shot_car`:11437, `_capture_preview`:11447

## 11455-12103  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11522, `_downtown_count`:11525, `_nearest_downtown`:11532, `_check_downtown`:11546, `_discover_downtown`:11559, `_box_batch`:11573, `_model_batch`:11593, `_cut_ranges`:11647, `_dt_ranges`:11659, `_dt_has`:11666, `_dt_near_cross`:11672, `_place`:11678, `_signal_pole`:11689, `_cyl_batch`:11708, `_city_signals`:11732, `_ensure_light_mats`:11783, `_city_lamps`:11793, `_build_downtown`:11837, `_dt_block`:12037, `_downtown_token`:12043, `_build_park`:12060, `_build_plaza`:12089

## 12104-12207  old city and Bay details

`_build_city_detail`:12105

## 12208-12617  traffic

`_build_traffic`:12209, `_path_sample`:12304, `_light_look`:12318, `_light_green`:12326, `_traffic_place`:12330, `_traffic_blocked_by`:12342, `_traffic_tick`:12354, `_smoke_downtown`:12460, `_skyline_shot`:12572, `_skyline_shots`:12580

## 12618-12985  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12664, `_web_scale`:12727, `_web_fps_tick`:12737, `_world_to_uv`:12761, `_map_angle`:12764, `_build_minimap`:12772, `_open_map`:12845, `_close_map`:12856, `_mini_point`:12863, `_site_markers`:12867, `_draw_arrow`:12899, `_draw_minimap`:12906, `_draw_full_map`:12953, `_minimap_tick`:12978

## 12986-13266  camera views

`_build_view_controls`:12987, `_sky_grade`:13029, `_cycle_view`:13044, `_apply_view`:13054, `_hide_labels`:13098, `_unfade`:13104, `_bake_map`:13110, `_shot_stats`:13160, `_view_shots`:13163, `_smoke_views`:13204

## 13267-13514  v0.17.0: level-up celebration

`_build_level_fx`:13278, `_draw_level_rays`:13315, `_level_fx_tick`:13325, `_level_sound`:13330, `_fx_material`:13372, `_level_up_fx`:13380, `_smoke_level_fx`:13481, `_levelup_shots`:13490

## 13515-13636  v0.18.0: walk-in stadium

`_collider_yaw`:13520, `_build_stadium_walls`:13531, `_look`:13559, `_smoke_stadium_eye`:13568, `_stadium_shots`:13606

## 13637-13798  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13661, `_arrow_mesh`:13673, `_build_guidance`:13696, `_guide_target`:13721, `_guidance_tick`:13750, `_draw_hud_arrow`:13776

## 13799-13984  checkpoints

`_build_checkpoints`:13800, `_refresh_checkpoints`:13845, `_check_checkpoints`:13851, `_activate_checkpoint`:13861, `_checkpoint_spawn`:13882, `_spawn_at_checkpoint`:13887, `_draw_checkpoint_icon`:13903, `_smoke_guidance_checkpoints`:13909, `_guide_shots`:13959

## 13985-14263  v0.18.0: Harbor Dome social hub

`_hub_seat`:14043, `_build_hub`:14047

## 14264-14314  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14265, `_xm_mesh`:14274, `_xm_tree`:14282

## 14315-14638  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14318, `_gt_surface`:14333, `_xm_grand_tree`:14343, `_lux_mat`:14458, `_lux_part`:14474, `_lux_box`:14477, `_lux_cyl`:14482, `_lux_ball`:14490, `_lux_new`:14498, `_lux_commit`:14503, `_lux_sofa_mesh`:14507, `_lux_chair_mesh`:14537, `_lux_table_mesh`:14557, `_lux_pouf_mesh`:14572, `_lux_batch`:14587, `_hub_christmas`:14603

## 14639-14794  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14640

## 14795-15043  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14798, `_vx_cyl`:14805, `_vx_ball`:14813, `_vx_ring`:14821, `_hub_polish`:14829, `_hub_gate`:14852, `_hub_vip`:14914, `_hub_glass`:15027

## 15044-15258  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:15045, `_build_hub_bots`:15070, `_seat_of`:15101, `_bubble`:15111, `_emote`:15167, `_hub_people_tick`:15181

## 15259-15377  seats

`_seat_taken`:15260, `_nearest_seat`:15268, `_seat_label`:15280, `_sit`:15296, `_stand_up`:15340, `_seated_tick`:15359

## 15378-15534  game panel

`_build_game_panel`:15379, `_open_game_panel`:15434, `_refresh_game_panel`:15453, `_play_robot`:15498, `_peer_at`:15512, `_opponent_name`:15519, `_pay`:15527

## 15535-15655  tic-tac-toe

`_ttt_ready`:15538, `_ttt_winner`:15544, `_ttt_bot_move`:15554, `_ttt_tap`:15580, `_ttt_code`:15600, `_ttt_check`:15606, `_ttt_tick`:15629

## 15656-15707  rock paper scissors

`_rps_ready`:15657, `_rps_pick`:15663, `_rps_resolve`:15681, `_rps_tick`:15705

## 15708-15790  online table messages

`_online_game_send`:15709, `_hub_game_msg`:15715

## 15791-15866  comedy show

`_joke_start`:15792, `_joke_tick`:15804, `_speak`:15830, `_play_rimshot`:15839

## 15867-16766  quick chat and emotes

`_build_chat`:15889, `_chat_toggle_to`:16006, `_chat_log_add`:16014, `_chat_area`:16020, `_chat_near_count`:16038, `_chat_tick`:16047, `_toggle_chat`:16096, `_chat_fit`:16111, `_chat_clean`:16117, `_chat_wrap`:16134, `_chat_send_text`:16156, `_typing`:16179, `_say`:16182, `_do_emote`:16198, `_smoke_hub`:16207, `_chat_shots`:16381, `_cafe_shots`:16406, `_shop_shots`:16454, `_car_shots`:16503, `_outfit_shots`:16534, `_hub_shots`:16582, `_sg_on_terrace`:16717, `_people_only`:16720, `_people_only_keep_cars_out`:16724, `_car_barrier`:16736, `_hub_keep_cars_out`:16750

## 16767-16932  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16776, `_feed_add`:16785, `_feed_render`:16791, `_feed_tick`:16819, `_online_event_send`:16828, `_at_pvp_table`:16835, `_game_name`:16842, `_send_lfp`:16845, `_lfp_msg`:16862, `_accept_invite`:16883

## 16933-17174  v0.18.2: nickname and HUD relayout

`_nick_rude`:16945, `_clean_nick`:16960, `_build_nick_panel`:16972, `_open_nick`:17010, `_random_nick`:17019, `_save_nick`:17025, `_close_nick`:17044, `_refresh_nick_button`:17053, `_relayout_hud`:17057, `_smoke_nick`:17094, `_nick_shots`:17126, `_smoke_sites_reachable`:17144

## 17175-17462  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17201, `_nearest_civic`:17208, `_check_civic`:17222, `_discover_civic`:17235, `_civ_ranges`:17248, `_civ_has`:17262, `_civ_near_cross`:17268, `_build_civic`:17274, `_civic_token`:17400, `_civic_shots`:17417, `_hub_focus`:17439

## 17463-17572  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17534, `_in_rw_lot`:17537, `_box_batch_rot`:17540, `_multi_collider`:17558

## 17573-17900  circuit geometry

`_cr_point`:17574, `_rw_build_path`:17588, `_rw_dir`:17616, `_rw_bend`:17621, `_ribbon`:17627, `_rw_band`:17647, `_rw_keepout`:17665, `_build_raceway`:17674, `_build_rw_parking`:17708, `_build_rw_pits`:17753, `_build_rw_track`:17790, `_build_rw_trackside`:17831

## 17901-17998  race car rental

`_model_key`:17902, `_race_car_start`:17905, `_tint_ghost`:17943, `_race_car_end`:17956, `_race_keep_cars_out`:17981

## 17999-18013  speed effects

`_eff_max`:18000, `_eff_accel`:18011

## 18014-18064  track helpers

`_rw_seg_progress`:18015, `_rw_track_dist`:18035, `_rw_point_dist`:18046, `_rw_player_progress`:18053, `_rw_target`:18059

## 18065-18301  events

`_rec_stop`:18066, `_rw_place`:18082, `_rw_grid_pos`:18089, `_rw_start`:18094, `_rw_spawn_ai`:18126, `_rw_ai_place`:18150, `_rw_tick`:18161, `_rw_ai_tick`:18214, `_rw_lap_done`:18256, `_rw_finish`:18268, `_rw_fmt`:18299

## 18302-18354  boosters and spikes

`_rw_buy`:18303, `_rw_use_boost`:18321, `_rw_use_spike`:18329, `_rw_drop_spike_at`:18340

## 18355-18412  online races

`_race_msg`:18356, `_join_race`:18378

## 18413-18768  raceway panel, HUD, board

`_build_raceway_ui`:18414, `_rw_layout`:18474, `_rw_open`:18481, `_rw_close`:18487, `_rw_refresh_panel`:18491, `_rw_refresh_board`:18504, `_rw_hud`:18516, `_peer_car_model`:18540, `_smoke_raceway`:18550, `_race_shots`:18731

## 18769-18976  v0.22.0: Call Car

`_call_block_reason`:18775, `_call_spot`:18792, `_call_car`:18823, `_play_horn`:18847, `_smoke_follow_call`:18871, `_follow_shots`:18944

## 18977-19434  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:19002, `_place_portal_button`:19008, `_portal_pressed`:19015, `_build_travel`:19023, `_toggle_run`:19128, `_refresh_run`:19132, `_hud_v23_tick`:19140, `_travel_block_reason`:19172, `_travel_open`:19192, `_open_travel`:19198, `_open_worlds`:19204, `_open_case`:19210, `_case_step`:19222, `_case_refresh`:19226, `_case_submit`:19230, `_close_case`:19239, `_sky_go`:19243, `_close_worlds`:19253, `_refresh_worlds`:19257, `_world_go`:19263, `_close_travel`:19270, `_refresh_travel`:19274, `_travel_to`:19282, `_smoke_travel`:19309, `_v23_shots`:19347

## 19435-19508  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19442, `_qr_button`:19457, `_qr_layout`:19496, `_smoke_qr`:19502

## 19509-19945  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19529, `_open_crate`:19545, `_build_crate_ui`:19562, `_crate_pick`:19649, `_crate_reveal`:19672, `_crate_draw_car`:19699, `_crate_confetti`:19718, `_crate_sound`:19743, `_crate_drive`:19769, `_feed_add_system`:19799, `_smoke_crate`:19802, `_crate_shots`:19850

## 19946-20437  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19987, `_quick_today`:19992, `_quick_is_done`:19995, `_quick_left`:19998, `_quick_next`:20005, `_quick_fix_target`:20018, `_quick_daily_check`:20032, `_quick_complete`:20046, `_quick_side`:20080, `_build_quick_props`:20098, `_daily_shots`:20250, `_quick_props_refresh`:20292, `_quick_fx`:20296, `_play_coin`:20312, `_smoke_quick`:20329

## 20438-20588  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20447, `_quest_nearby`:20502, `_open_quests`:20509, `_close_quests`:20516, `_refresh_quests`:20520, `_quest_pick`:20546, `_quest_mode`:20560, `_smoke_quests`:20563

## 20589-20623  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20593, `_my_tag_tick`:20596

## 20624-20938  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20641, `_fc_torus`:20651, `_fc_pearl`:20659, `_fc_chrome`:20669, `_fc_glass`:20678, `_fc_glow`:20688, `_fc_ghost`:20697, `_fc_holo`:20709, `_fc_mesh`:20719, `_fc_sphere`:20739, `_fc_capsule`:20747, `_fc_cone`:20755, `_build_food_court`:20764, `_food_court_tick`:20918

## 20939-21260  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20968, `_cm_bench`:20984, `_build_commons`:20997, `_commons_tick`:21219

## 21261-21575  v0.36: the daily puzzle

`_pz_today`:21284, `_pz_new`:21287, `_pz_neighbours`:21332, `_pz_flip`:21342, `_pz_done`:21347, `_pz_tap`:21355, `_pz_win`:21371, `_pz_reset`:21392, `_puzzle_near`:21396, `_open_puzzle`:21401, `_close_puzzle`:21409, `_pz_refresh_sign`:21413, `_build_puzzle_panel`:21421, `_pz_draw`:21452, `_smoke_chat`:21493, `_smoke_feet`:21531, `_smoke_commons`:21552

## 21576-21764  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21638, `_bio_theta`:21642, `_bio_sec_n`:21647, `_bio_sec_of`:21650, `_bio_pt`:21653, `_bio_lp`:21658, `_bio_la`:21662, `_bio_dir`:21666, `_bio_hex_r`:21669, `_bio_apo`:21674, `_bio_open_angles`:21680, `_bio_si`:21690, `_bm`:21696, `_bsph`:21701, `_blow`:21704, `_bcone`:21715, `_bbox`:21718, `_bp`:21721, `_bq`:21726, `_bio_glass_mat`:21730, `_bio_water_mat`:21743, `_bio_mat`:21755

## 21765-22137  building blocks

`_bio_inst`:21766, `_bio_add`:21772, `_bio_model`:21775, `_bio_nature_mesh`:21781, `_bio_flush`:21815, `_bio_bar`:21850, `_bio_slab`:21863, `_bio_body`:21878, `_bio_cyl_col`:21891, `_bio_hexmesh`:21904, `_bio_hexslab`:21916, `_bio_hexpt`:21922, `_bio_gridshell`:21929, `_bio_rail`:22036, `_bio_rail_arc`:22041, `_bio_disc_deck`:22053, `_bio_ring_deck`:22059, `_bio_helix`:22070, `_bio_pillar`:22090, `_bio_cafe`:22096, `_bio_fence_line`:22110, `_bio_fence_seg`:22115, `_bio_pen`:22125

## 22138-22639  building

`_build_biosphere`:22139, `_build_biosphere_legacy`:22143, `_bio_text`:22305, `_bio_plaque`:22323, `_bio_ticket_hall`:22337, `_on_foot_collision_guard`:22393, `_bio_inside`:22403, `_bio_pass_ok`:22406, `_ticket_near`:22410, `_bio_buy_pass`:22415, `_bio_gates_update`:22431, `_bio_gate_tick`:22457, `_bio_tunnel`:22469, `_bio_grounds`:22522, `_bio_dome`:22568, `_bio_deck_mats`:22636

## 22640-22795  garden planting

`_bio_free`:22641, `_bio_spot`:22658, `_bio_garden`:22666, `_bio_pine`:22707, `_bio_tree`:22710, `_bio_big_tree`:22720, `_bio_rock`:22725, `_bio_pond`:22728, `_bio_particles`:22732, `_bio_mist`:22760, `_bio_mini_dome`:22789

## 22796-23203  the four layouts

`_bio_winter`:22797, `_bio_spring`:22889, `_bio_summer`:23014, `_bio_autumn`:23098

## 23204-23474  animals

`_bio_spawn`:23205, `_bio_load_animal`:23277, `_bio_make_quad`:23298, `_bio_load_bird`:23375, `_bio_make_penguin`:23395, `_bio_make_bird`:23417, `_bio_make_flamingo`:23441, `_bio_make_butterfly`:23462

## 23475-23608  animation, spotting and rewards

`_bio_stuck_check`:23480, `_biosphere_tick`:23498, `_bio_animate`:23509, `_bio_spot_check`:23589, `_bio_spotted`:23601, `_smoke_biosphere`:23605

## 23609-24126  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23696, `_wear_piece`:23699, `_wear_mat`:23722, `_person_index`:23738, `_dress`:23761, `_smoke_style`:23867, `_style_shots`:24018, `_npc_look`:24090

## 24127-24280  your look: apply, save, share

`_look_clean`:24131, `_look_pack`:24146, `_owns`:24152, `_apply_look`:24157, `_relic_model`:24168, `_fc_mesh_mat`:24233, `_relic_refresh`:24236, `_relic_tick`:24250, `_peer_style`:24261

## 24281-24708  stores and the wardrobe

`_style_today`:24300, `_style_items`:24303, `_style_cat`:24311, `_style_price`:24314, `_style_deal`:24328, `_style_price_base`:24341, `_relic_stock`:24348, `_build_style_panel`:24360, `_open_store`:24400, `_open_wardrobe`:24419, `_style_close`:24422, `_style_finish`:24426, `_sync_old_avatar`:24441, `_style_tabs_for`:24448, `_refresh_style`:24453, `_style_body_rows`:24604, `_style_set_tab`:24621, `_style_step`:24625, `_style_color`:24630, `_style_pick`:24635, `_style_buy`:24670, `_ach_relics_check`:24692, `_style_face_camera`:24697

## 24709-25176  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24745, `_ga_text`:24751, `_ga_box`:24768, `_build_galleria`:24784, `_ga_inner_tick`:24925, `_ga_shell`:24941, `_ga_inside`:24991, `_bio_cyl_col_on`:24994, `_ga_models`:25006, `_ga_lbox`:25021, `_ga_ltext`:25035, `_ga_store`:25042, `_bio_cafe_on`:25144, `_ga_mannequins`:25152

## 25177-25328  featured outfits and the Sky Run

`_ga_featured_look`:25190, `_build_ga_fun`:25211, `_ga_fun_tick`:25256, `_sky_finish`:25283, `_extra_near`:25302, `_extra_open`:25311, `_store_near`:25320

## 25329-25425  v0.41: THE SKY GARDEN

`_sg_now`:25383, `_sg_progress`:25386, `_sg_time`:25392, `_sg_stock`:25399, `_sg_mut_roll`:25414

## 25426-25563  building

`_sg_box`:25427, `_sg_text`:25433, `_build_sky_garden`:25447, `_sg_seed_spot`:25558, `_sg_codex_spot`:25561

## 25564-25744  plants

`_sg_plant_model`:25565, `_sg_refresh_all`:25670, `_sg_refresh`:25674, `_sky_garden_tick`:25710, `_sg_ready_count`:25729, `_sg_boot_note`:25736

## 25745-25864  interacting

`_sg_near`:25746, `_sg_button_text`:25769, `_sg_value`:25782, `_sg_interact`:25786, `_sg_buy`:25802, `_sg_plant`:25824, `_sg_harvest`:25835

## 25865-26108  the garden screen

`_build_sg_panel`:25866, `_sg_open`:25901, `_sg_close`:25910, `_sg_row`:25914, `_sg_refresh_panel`:25929, `_sg_pick_buy`:25974, `_sg_pick_plant`:25978, `_smoke_car_barriers`:25984, `_smoke_sky_garden`:26025

## 26109-26147  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26140, `_pass_day`:26143

## 26148-26179  album

`_album_pages`:26149, `_album_claim`:26164

## 26180-26231  season

`_season_index`:26181, `_season_tick`:26184, `_season_xp`:26193, `_season_tier`:26196, `_season_reward`:26199, `_season_claim`:26213

## 26232-26239  Harbor Night

`_harbor_night`:26233

## 26240-26271  check-in calendar

`_cal_tick`:26241

## 26272-26448  the panel

`_build_hp_panel`:26273, `_open_pass`:26308, `_hp_open`:26311, `_hp_close`:26318, `_hp_row`:26322, `_hp_bar`:26337, `_hp_refresh`:26341, `_smoke_pass`:26386

## 26449-26680  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26453, `_cash_pill_tick`:26461, `_build_lb`:26499, `_open_lb`:26545, `_close_lb`:26553, `_lb_pick`:26557, `_lb_headers`:26562, `_lb_url`:26566, `_lb_me`:26569, `_lb_level`:26574, `_lb_tick`:26584, `_lb_upload`:26592, `_lb_fetch`:26602, `_lb_got`:26610, `_lb_value`:26623, `_lb_refresh_ui`:26634

## 26681-27239  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26705, `_market_near`:26784, `_build_gear`:26794, `_gear_piece`:26802, `_pet_m`:26847, `_pet_eyes`:26861, `_build_pet`:26868, `_pet_nose`:27006, `_pet_anim`:27009, `_market_apply`:27020, `_market_tick`:27044, `_build_market_panel`:27068, `_open_market`:27094, `_close_market`:27101, `_refresh_market`:27105, `_market_pick`:27158, `_toggle_board`:27196, `_board_tick`:27203

## 27240-27484  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27272, `_ds_label`:27291, `_build_display`:27305, `_ds_got`:27385, `_ds_sorted`:27394, `_ds_render_board`:27408, `_ds_render_news`:27434, `_display_tick`:27455

## 27485-27663  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27502, `_toggle_streamer`:27589, `_streamer_badge_tap`:27605, `_streamer_tick`:27609

## 27664-27700  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27670, `_car_back`:27677, `_car_park_tick`:27684

## 27701-27797  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27705, `_bus_eta`:27759, `_bus_displays_tick`:27775

## 27798-28089  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27816, `_treasure_pick`:27819, `_treasure_spot`:27828, `_treasure_district`:27832, `_treasure_clue`:27844, `_treasure_prop`:27857, `_tp_part`:27860, `_tp_sphere`:27870, `_tp_cyl`:27878, `_treasure_prop_side`:27887, `_build_treasure_props`:27899, `_build_treasure`:27943, `_treasure_dir_char`:28012, `_treasure_tick`:28021, `_treasure_claim`:28075

## 28090-28190  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:28091, `_halo_mat`:28123, `_smoke_treasure`:28148

## 28191-28514  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28212, `_fm_send`:28215, `_fm_area`:28221, `_fm_glow_mesh`:28237, `_fm_block_reason`:28255, `_fm_start`:28267, `_fm_announce`:28295, `_fm_finish`:28298, `_fm_msg`:28316, `_fm_check_paid`:28367, `_fm_tick`:28385, `_smoke_findme`:28441

## 28515-28625  v0.24.2: road map (for moving people off the road)

`_floor_note`:28521, `_floor_disc`:28535, `_floor_top`:28544, `_ground_at`:28562, `_note_road`:28580, `_on_road`:28587, `_ped_curb`:28597, `_curb_spot`:28607

## 28626-28921  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28648, `_ex_grid`:28656, `_ex_lamps`:28691, `_ex_umbrella`:28714, `_ex_yards`:28721, `_build_expansion`:28736, `_expand_shots`:28899

## 28922-29116  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28963, `_v27_near_cross`:29055, `_v27_near_any_road`:29062, `_v27_in_district`:29068, `_sea_tick`:29082, `_sea_tow`:29101

## 29117-29784  Harbor Loop sky train

`_sky_build_path`:29168, `_sky_pos`:29209, `_sky_dir`:29223, `_sky_project`:29228, `_sky_trip_time`:29247, `_sky_trip_dist`:29253, `_sky_now`:29264, `_sky_state`:29267, `_sky_time_at_station`:29282, `_sky_next_arrival`:29289, `_build_skytrain`:29302, `_sky_make_car`:29454, `_sky_skin`:29491, `_sky_place_trains`:29511, `_sky_build_station`:29530, `_sky_near`:29595, `_sky_fmt`:29604, `_sky_enter`:29608, `_sky_leave_platform`:29626, `_sky_board`:29636, `_sky_alight`:29650, `_sky_action`:29664, `_sky_tick`:29681, `_sky_camera`:29721, `_tour_today`:29737, `_tour_stamp`:29740, `_sky_hud`:29763

## 29785-30158  Day and night

`_toggle_weather`:29868, `_refresh_weather_button`:29874, `_game_hour`:29880, `_day_key`:29892, `_night_setup`:29907, `_night_scan_mesh`:29997, `_daynight_tick`:30022, `_daynight_apply`:30031, `_daynight_lights`:30143, `_cycle_day_mode`:30148, `_refresh_time_button`:30155

## 30159-30796  v0.27 smoke test and screenshots

`_smoke_v27`:30160, `_city_shots`:30365

## 30797-31213  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30831, `_ap_plane`:31007, `_ap_truck`:31027, `_ap_baggage_train`:31068, `_ap_loop_pos`:31081, `_ap_loop_len`:31097, `_ap_flight_at`:31103, `_ap_tick`:31127, `_airport_ped_plan`:31150, `_smoke_airport`:31170

## 31214-31727  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31228, `_nav_spot`:31235, `_nav_idx`:31239, `_nav_pos`:31246, `_nav_blocked`:31250, `_nav_nearest_free`:31260, `_nav_bfs`:31288, `_nav_build`:31332, `_stroller`:31403, `_stroll_place`:31419, `_stroll_next`:31440, `_nav_clear_line`:31474, `_stroll_aim`:31485, `_strollers_tick`:31517, `_smoke_strollers`:31612

## 31728-31888  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31763, `_dir_fmt`:31766, `_signpost_spot`:31769, `_build_signposts`:31786

## 31889-31985  the Directions panel and chip

`_build_dir_panel`:31890, `_open_dir`:31932, `_dir_close`:31941, `_dir_pick`:31945, `_dir_stop`:31950, `_dir_stop_and_close`:31955, `_dir_tick`:31959

## 31986-32527  v0.44: Grand Central

`_gc_mesh`:32015, `_gc_mat`:32048, `_gc_glass`:32057, `_gb`:32067, `_gb_solid`:32073, `_gb_flush`:32077, `_gc_tree`:32107, `_gc_text`:32112, `_gc_planter`:32127, `_gc_kiosk`:32133, `_goods_color`:32163, `_goods_mat`:32166, `_kiosk_goods`:32170, `_build_grand_central`:32248, `_build_gc_towers`:32416, `_gc_tick`:32511

## 32528-32819  v0.44: filling the empty land

`_loft`:32545, `_fill_clear`:32587, `_build_fill`:32597, `_hg_in_lake`:32645, `_hg_path`:32649, `_floor_note_rot`:32657, `_build_gardens`:32665, `_build_fan_plaza`:32775

## 32820-32854  v0.45: hover car underglow

`_car_underglow`:32823

## 32855-33019  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32856

## 33020-33051  v0.47: street stalls downtown

`_build_street_stalls`:33024, `_cull_people_in`:33044

## 33052-33150  v0.48: places that open as you level up

`_place_lock_of`:33065, `_place_root`:33071, `_place_unlocked`:33074, `_build_place_signs`:33082, `_places_refresh`:33127, `_places_tick`:33144

## 33151-33195  v0.50: city careers

`_career_rank_name`:33176, `_career_mult`:33179, `_career_block_reason`:33184, `_career_start`:33187, `_career_end`:33192

## 33196-33246  v0.52: careers as clear job loops

`_cid`:33223, `_career_target`:33237, `_career_tick`:33244

## 33247-33254  taxi

`_taxi_meter`:33248

## 33255-33258  paramedic

(no functions)

## 33259-33263  police

`_career_chase_over`:33261

## 33264-33269  firefighter

`_fire_aimed`:33265

## 33270-33279  the step bar

`_career_bar_text`:33273, `_career_hud`:33277

## 33280-33306  cut scenes

`_cs_skip`:33298

## 33307-33311  siren

(no functions)

## 33312-33323  the Careers panel

`_build_career_panel`:33313, `_open_careers`:33316, `_career_close`:33320

## 33324-33747  v0.50: homes

`_home_door_spots`:33364, `_build_homes`:33379, `_home_labels`:33408, `_home_door_near`:33417, `_home_origin`:33426, `_home_slot_near`:33429, `_home_exit_near`:33440, `_home_btn`:33447, `_home_interact`:33460, `_home_buy`:33479, `_home_default_layout`:33493, `_home_enter`:33501, `_home_leave`:33521, `_hm`:33529, `_home_build_room`:33548, `_home_refresh_room`:33657, `_furni_build`:33671

## 33748-34083  decorating

`_build_home_panels`:33749, `_open_homes`:33794, `_home_row_go`:33804, `_home_panel_close`:33824, `_deco_open`:33828, `_deco_pick`:33851, `_smoke_careers_homes`:33874

## 34084-34218  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:34088, `_home_slots`:34096, `_home_ring`:34123, `_furni_cat`:34129, `_home_fix_layout`:34135, `_home_build_layout`:34163

## 34219-34652  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34282, `_ch_homes`:34288, `_ch_step_text`:34295, `_ch_step_done`:34306, `_ch_target`:34320, `_ch_finish_chapter`:34329, `_chapters_tick`:34351, `_hud_top_stack`:34391, `_build_chapters_ui`:34421, `_chapters_restart_ask`:34463, `_chapters_restart`:34466, `_chapters_text`:34476, `_open_chapters`:34496, `_chapters_close`:34503, `_smoke_chapters`:34507, `_step_sound`:34628

## 34653-34691  v0.51.1: join and leave messages

`_announce_join`:34660, `_announce_already_here`:34679, `_announce_leave`:34687

## 34692-34956  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34708, `_shot_tick`:34714, `_draw_shot_icon`:34746, `_shot_enter`:34755, `_shot_exit`:34769, `_shot_release_controls`:34781, `_shot_stick_zone`:34788, `_shot_input`:34791, `_smoke_photo`:34863

## 34957-35255  v0.51.3: stream joiners

`_viewer_count`:34977, `_stream_join_check`:34983, `_stream_join_start`:34990, `_sj_streamer`:35007, `_stream_join_tick`:35016, `_stream_join_land`:35040, `_sj_welcome`:35056, `_smoke_stream_join`:35090, `_career_shot`:35173

## 35256-35372  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35260, `_st_restore`:35298, `_smoke_streamer_clean`:35319, `_world_bio_passport`:35370

