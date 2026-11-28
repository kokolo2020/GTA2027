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

## 7228-8819  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7399, `_sites_found`:7402, `_sites_total`:7405, `_bits`:7408, `_ach_value`:7415, `_ach_tick`:7470, `_ach_check`:7495, `_ach_by_id`:7531, `_ach_msg`:7537, `_build_ach`:7550, `_ach_show`:7581, `_open_ach`:7601, `_close_ach`:7607, `_refresh_ach`:7611, `_ach_num`:7642, `_minimap_tap`:7645, `_menu_go`:7652, `_menu_stay`:7657, `_menu_call_car`:7661, `_toggle_clean_hud`:7667, `_refresh_menu_buttons`:7673, `_clean_hud_tick`:7683, `_draw_joystick`:7724, `_input`:7729, `_touch_text_focus`:7822, `_stick_zone`:7842, `_notification`:7846, `_physics_process`:7863, `_follow_camera`:8016, `_follow_walk_camera`:8058, `_interact`:8081, `_refresh_hud`:8243, `_open_panel`:8372, `_layout_panels`:8402, `_toggle_menu`:8429, `_rescue`:8475, `_show_toast`:8507, `_save_progress`:8511, `_load_progress`:8608

## 8820-11452  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8821, `_radio_voice`:8824, `_radio_make`:8857, `_radio_set`:8928, `_radio_play`:8950, `_radio_next`:8955, `_radio_talk_line`:8959, `_radio_caption`:8980, `_radio_refresh`:8988, `_process`:9001, `_build_peds`:9052, `_update_peds`:9163, `_update_ped`:9182, `_smoke_test`:9236, `_smoke_chase`:9889, `_smoke_orole`:9922, `_smoke_levels`:9951, `_smoke_bus`:9992, `_smoke_chase_extras`:10077, `_smoke_marina`:10105, `_blocked_at`:10207, `_blocker`:10222, `_on_screen`:10235, `_wait_radio`:10240, `_smoke_radio_peds`:10247, `_smoke_typed_chat`:10317, `_smoke_chat_touch`:10336, `_smoke_cafe`:10357, `_smoke_boutique`:10383, `_smoke_models`:10411, `_smoke_garage_ridge`:10435, `_save_shot`:10811, `_sky_shots`:10821, `_pet_shots`:10850, `_tracker_shots`:10885, `_infected_shots`:10919, `_paris_shots`:10970, `_people_shots`:11200, `_shots`:11241, `_shot_car`:11435, `_capture_preview`:11445

## 11453-12101  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11520, `_downtown_count`:11523, `_nearest_downtown`:11530, `_check_downtown`:11544, `_discover_downtown`:11557, `_box_batch`:11571, `_model_batch`:11591, `_cut_ranges`:11645, `_dt_ranges`:11657, `_dt_has`:11664, `_dt_near_cross`:11670, `_place`:11676, `_signal_pole`:11687, `_cyl_batch`:11706, `_city_signals`:11730, `_ensure_light_mats`:11781, `_city_lamps`:11791, `_build_downtown`:11835, `_dt_block`:12035, `_downtown_token`:12041, `_build_park`:12058, `_build_plaza`:12087

## 12102-12205  old city and Bay details

`_build_city_detail`:12103

## 12206-12615  traffic

`_build_traffic`:12207, `_path_sample`:12302, `_light_look`:12316, `_light_green`:12324, `_traffic_place`:12328, `_traffic_blocked_by`:12340, `_traffic_tick`:12352, `_smoke_downtown`:12458, `_skyline_shot`:12570, `_skyline_shots`:12578

## 12616-12983  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12662, `_web_scale`:12725, `_web_fps_tick`:12735, `_world_to_uv`:12759, `_map_angle`:12762, `_build_minimap`:12770, `_open_map`:12843, `_close_map`:12854, `_mini_point`:12861, `_site_markers`:12865, `_draw_arrow`:12897, `_draw_minimap`:12904, `_draw_full_map`:12951, `_minimap_tick`:12976

## 12984-13264  camera views

`_build_view_controls`:12985, `_sky_grade`:13027, `_cycle_view`:13042, `_apply_view`:13052, `_hide_labels`:13096, `_unfade`:13102, `_bake_map`:13108, `_shot_stats`:13158, `_view_shots`:13161, `_smoke_views`:13202

## 13265-13512  v0.17.0: level-up celebration

`_build_level_fx`:13276, `_draw_level_rays`:13313, `_level_fx_tick`:13323, `_level_sound`:13328, `_fx_material`:13370, `_level_up_fx`:13378, `_smoke_level_fx`:13479, `_levelup_shots`:13488

## 13513-13634  v0.18.0: walk-in stadium

`_collider_yaw`:13518, `_build_stadium_walls`:13529, `_look`:13557, `_smoke_stadium_eye`:13566, `_stadium_shots`:13604

## 13635-13796  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13659, `_arrow_mesh`:13671, `_build_guidance`:13694, `_guide_target`:13719, `_guidance_tick`:13748, `_draw_hud_arrow`:13774

## 13797-13982  checkpoints

`_build_checkpoints`:13798, `_refresh_checkpoints`:13843, `_check_checkpoints`:13849, `_activate_checkpoint`:13859, `_checkpoint_spawn`:13880, `_spawn_at_checkpoint`:13885, `_draw_checkpoint_icon`:13901, `_smoke_guidance_checkpoints`:13907, `_guide_shots`:13957

## 13983-14261  v0.18.0: Harbor Dome social hub

`_hub_seat`:14041, `_build_hub`:14045

## 14262-14312  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14263, `_xm_mesh`:14272, `_xm_tree`:14280

## 14313-14636  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14316, `_gt_surface`:14331, `_xm_grand_tree`:14341, `_lux_mat`:14456, `_lux_part`:14472, `_lux_box`:14475, `_lux_cyl`:14480, `_lux_ball`:14488, `_lux_new`:14496, `_lux_commit`:14501, `_lux_sofa_mesh`:14505, `_lux_chair_mesh`:14535, `_lux_table_mesh`:14555, `_lux_pouf_mesh`:14570, `_lux_batch`:14585, `_hub_christmas`:14601

## 14637-14792  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14638

## 14793-15041  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14796, `_vx_cyl`:14803, `_vx_ball`:14811, `_vx_ring`:14819, `_hub_polish`:14827, `_hub_gate`:14850, `_hub_vip`:14912, `_hub_glass`:15025

## 15042-15256  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:15043, `_build_hub_bots`:15068, `_seat_of`:15099, `_bubble`:15109, `_emote`:15165, `_hub_people_tick`:15179

## 15257-15375  seats

`_seat_taken`:15258, `_nearest_seat`:15266, `_seat_label`:15278, `_sit`:15294, `_stand_up`:15338, `_seated_tick`:15357

## 15376-15532  game panel

`_build_game_panel`:15377, `_open_game_panel`:15432, `_refresh_game_panel`:15451, `_play_robot`:15496, `_peer_at`:15510, `_opponent_name`:15517, `_pay`:15525

## 15533-15653  tic-tac-toe

`_ttt_ready`:15536, `_ttt_winner`:15542, `_ttt_bot_move`:15552, `_ttt_tap`:15578, `_ttt_code`:15598, `_ttt_check`:15604, `_ttt_tick`:15627

## 15654-15705  rock paper scissors

`_rps_ready`:15655, `_rps_pick`:15661, `_rps_resolve`:15679, `_rps_tick`:15703

## 15706-15788  online table messages

`_online_game_send`:15707, `_hub_game_msg`:15713

## 15789-15864  comedy show

`_joke_start`:15790, `_joke_tick`:15802, `_speak`:15828, `_play_rimshot`:15837

## 15865-16764  quick chat and emotes

`_build_chat`:15887, `_chat_toggle_to`:16004, `_chat_log_add`:16012, `_chat_area`:16018, `_chat_near_count`:16036, `_chat_tick`:16045, `_toggle_chat`:16094, `_chat_fit`:16109, `_chat_clean`:16115, `_chat_wrap`:16132, `_chat_send_text`:16154, `_typing`:16177, `_say`:16180, `_do_emote`:16196, `_smoke_hub`:16205, `_chat_shots`:16379, `_cafe_shots`:16404, `_shop_shots`:16452, `_car_shots`:16501, `_outfit_shots`:16532, `_hub_shots`:16580, `_sg_on_terrace`:16715, `_people_only`:16718, `_people_only_keep_cars_out`:16722, `_car_barrier`:16734, `_hub_keep_cars_out`:16748

## 16765-16930  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16774, `_feed_add`:16783, `_feed_render`:16789, `_feed_tick`:16817, `_online_event_send`:16826, `_at_pvp_table`:16833, `_game_name`:16840, `_send_lfp`:16843, `_lfp_msg`:16860, `_accept_invite`:16881

## 16931-17172  v0.18.2: nickname and HUD relayout

`_nick_rude`:16943, `_clean_nick`:16958, `_build_nick_panel`:16970, `_open_nick`:17008, `_random_nick`:17017, `_save_nick`:17023, `_close_nick`:17042, `_refresh_nick_button`:17051, `_relayout_hud`:17055, `_smoke_nick`:17092, `_nick_shots`:17124, `_smoke_sites_reachable`:17142

## 17173-17460  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17199, `_nearest_civic`:17206, `_check_civic`:17220, `_discover_civic`:17233, `_civ_ranges`:17246, `_civ_has`:17260, `_civ_near_cross`:17266, `_build_civic`:17272, `_civic_token`:17398, `_civic_shots`:17415, `_hub_focus`:17437

## 17461-17570  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17532, `_in_rw_lot`:17535, `_box_batch_rot`:17538, `_multi_collider`:17556

## 17571-17898  circuit geometry

`_cr_point`:17572, `_rw_build_path`:17586, `_rw_dir`:17614, `_rw_bend`:17619, `_ribbon`:17625, `_rw_band`:17645, `_rw_keepout`:17663, `_build_raceway`:17672, `_build_rw_parking`:17706, `_build_rw_pits`:17751, `_build_rw_track`:17788, `_build_rw_trackside`:17829

## 17899-17996  race car rental

`_model_key`:17900, `_race_car_start`:17903, `_tint_ghost`:17941, `_race_car_end`:17954, `_race_keep_cars_out`:17979

## 17997-18011  speed effects

`_eff_max`:17998, `_eff_accel`:18009

## 18012-18062  track helpers

`_rw_seg_progress`:18013, `_rw_track_dist`:18033, `_rw_point_dist`:18044, `_rw_player_progress`:18051, `_rw_target`:18057

## 18063-18299  events

`_rec_stop`:18064, `_rw_place`:18080, `_rw_grid_pos`:18087, `_rw_start`:18092, `_rw_spawn_ai`:18124, `_rw_ai_place`:18148, `_rw_tick`:18159, `_rw_ai_tick`:18212, `_rw_lap_done`:18254, `_rw_finish`:18266, `_rw_fmt`:18297

## 18300-18352  boosters and spikes

`_rw_buy`:18301, `_rw_use_boost`:18319, `_rw_use_spike`:18327, `_rw_drop_spike_at`:18338

## 18353-18410  online races

`_race_msg`:18354, `_join_race`:18376

## 18411-18766  raceway panel, HUD, board

`_build_raceway_ui`:18412, `_rw_layout`:18472, `_rw_open`:18479, `_rw_close`:18485, `_rw_refresh_panel`:18489, `_rw_refresh_board`:18502, `_rw_hud`:18514, `_peer_car_model`:18538, `_smoke_raceway`:18548, `_race_shots`:18729

## 18767-18974  v0.22.0: Call Car

`_call_block_reason`:18773, `_call_spot`:18790, `_call_car`:18821, `_play_horn`:18845, `_smoke_follow_call`:18869, `_follow_shots`:18942

## 18975-19432  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:19000, `_place_portal_button`:19006, `_portal_pressed`:19013, `_build_travel`:19021, `_toggle_run`:19126, `_refresh_run`:19130, `_hud_v23_tick`:19138, `_travel_block_reason`:19170, `_travel_open`:19190, `_open_travel`:19196, `_open_worlds`:19202, `_open_case`:19208, `_case_step`:19220, `_case_refresh`:19224, `_case_submit`:19228, `_close_case`:19237, `_sky_go`:19241, `_close_worlds`:19251, `_refresh_worlds`:19255, `_world_go`:19261, `_close_travel`:19268, `_refresh_travel`:19272, `_travel_to`:19280, `_smoke_travel`:19307, `_v23_shots`:19345

## 19433-19506  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19440, `_qr_button`:19455, `_qr_layout`:19494, `_smoke_qr`:19500

## 19507-19943  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19527, `_open_crate`:19543, `_build_crate_ui`:19560, `_crate_pick`:19647, `_crate_reveal`:19670, `_crate_draw_car`:19697, `_crate_confetti`:19716, `_crate_sound`:19741, `_crate_drive`:19767, `_feed_add_system`:19797, `_smoke_crate`:19800, `_crate_shots`:19848

## 19944-20435  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19985, `_quick_today`:19990, `_quick_is_done`:19993, `_quick_left`:19996, `_quick_next`:20003, `_quick_fix_target`:20016, `_quick_daily_check`:20030, `_quick_complete`:20044, `_quick_side`:20078, `_build_quick_props`:20096, `_daily_shots`:20248, `_quick_props_refresh`:20290, `_quick_fx`:20294, `_play_coin`:20310, `_smoke_quick`:20327

## 20436-20586  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20445, `_quest_nearby`:20500, `_open_quests`:20507, `_close_quests`:20514, `_refresh_quests`:20518, `_quest_pick`:20544, `_quest_mode`:20558, `_smoke_quests`:20561

## 20587-20621  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20591, `_my_tag_tick`:20594

## 20622-20936  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20639, `_fc_torus`:20649, `_fc_pearl`:20657, `_fc_chrome`:20667, `_fc_glass`:20676, `_fc_glow`:20686, `_fc_ghost`:20695, `_fc_holo`:20707, `_fc_mesh`:20717, `_fc_sphere`:20737, `_fc_capsule`:20745, `_fc_cone`:20753, `_build_food_court`:20762, `_food_court_tick`:20916

## 20937-21258  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20966, `_cm_bench`:20982, `_build_commons`:20995, `_commons_tick`:21217

## 21259-21573  v0.36: the daily puzzle

`_pz_today`:21282, `_pz_new`:21285, `_pz_neighbours`:21330, `_pz_flip`:21340, `_pz_done`:21345, `_pz_tap`:21353, `_pz_win`:21369, `_pz_reset`:21390, `_puzzle_near`:21394, `_open_puzzle`:21399, `_close_puzzle`:21407, `_pz_refresh_sign`:21411, `_build_puzzle_panel`:21419, `_pz_draw`:21450, `_smoke_chat`:21491, `_smoke_feet`:21529, `_smoke_commons`:21550

## 21574-21762  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21636, `_bio_theta`:21640, `_bio_sec_n`:21645, `_bio_sec_of`:21648, `_bio_pt`:21651, `_bio_lp`:21656, `_bio_la`:21660, `_bio_dir`:21664, `_bio_hex_r`:21667, `_bio_apo`:21672, `_bio_open_angles`:21678, `_bio_si`:21688, `_bm`:21694, `_bsph`:21699, `_blow`:21702, `_bcone`:21713, `_bbox`:21716, `_bp`:21719, `_bq`:21724, `_bio_glass_mat`:21728, `_bio_water_mat`:21741, `_bio_mat`:21753

## 21763-22135  building blocks

`_bio_inst`:21764, `_bio_add`:21770, `_bio_model`:21773, `_bio_nature_mesh`:21779, `_bio_flush`:21813, `_bio_bar`:21848, `_bio_slab`:21861, `_bio_body`:21876, `_bio_cyl_col`:21889, `_bio_hexmesh`:21902, `_bio_hexslab`:21914, `_bio_hexpt`:21920, `_bio_gridshell`:21927, `_bio_rail`:22034, `_bio_rail_arc`:22039, `_bio_disc_deck`:22051, `_bio_ring_deck`:22057, `_bio_helix`:22068, `_bio_pillar`:22088, `_bio_cafe`:22094, `_bio_fence_line`:22108, `_bio_fence_seg`:22113, `_bio_pen`:22123

## 22136-22637  building

`_build_biosphere`:22137, `_build_biosphere_legacy`:22141, `_bio_text`:22303, `_bio_plaque`:22321, `_bio_ticket_hall`:22335, `_on_foot_collision_guard`:22391, `_bio_inside`:22401, `_bio_pass_ok`:22404, `_ticket_near`:22408, `_bio_buy_pass`:22413, `_bio_gates_update`:22429, `_bio_gate_tick`:22455, `_bio_tunnel`:22467, `_bio_grounds`:22520, `_bio_dome`:22566, `_bio_deck_mats`:22634

## 22638-22793  garden planting

`_bio_free`:22639, `_bio_spot`:22656, `_bio_garden`:22664, `_bio_pine`:22705, `_bio_tree`:22708, `_bio_big_tree`:22718, `_bio_rock`:22723, `_bio_pond`:22726, `_bio_particles`:22730, `_bio_mist`:22758, `_bio_mini_dome`:22787

## 22794-23201  the four layouts

`_bio_winter`:22795, `_bio_spring`:22887, `_bio_summer`:23012, `_bio_autumn`:23096

## 23202-23472  animals

`_bio_spawn`:23203, `_bio_load_animal`:23275, `_bio_make_quad`:23296, `_bio_load_bird`:23373, `_bio_make_penguin`:23393, `_bio_make_bird`:23415, `_bio_make_flamingo`:23439, `_bio_make_butterfly`:23460

## 23473-23606  animation, spotting and rewards

`_bio_stuck_check`:23478, `_biosphere_tick`:23496, `_bio_animate`:23507, `_bio_spot_check`:23587, `_bio_spotted`:23599, `_smoke_biosphere`:23603

## 23607-24124  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23694, `_wear_piece`:23697, `_wear_mat`:23720, `_person_index`:23736, `_dress`:23759, `_smoke_style`:23865, `_style_shots`:24016, `_npc_look`:24088

## 24125-24278  your look: apply, save, share

`_look_clean`:24129, `_look_pack`:24144, `_owns`:24150, `_apply_look`:24155, `_relic_model`:24166, `_fc_mesh_mat`:24231, `_relic_refresh`:24234, `_relic_tick`:24248, `_peer_style`:24259

## 24279-24706  stores and the wardrobe

`_style_today`:24298, `_style_items`:24301, `_style_cat`:24309, `_style_price`:24312, `_style_deal`:24326, `_style_price_base`:24339, `_relic_stock`:24346, `_build_style_panel`:24358, `_open_store`:24398, `_open_wardrobe`:24417, `_style_close`:24420, `_style_finish`:24424, `_sync_old_avatar`:24439, `_style_tabs_for`:24446, `_refresh_style`:24451, `_style_body_rows`:24602, `_style_set_tab`:24619, `_style_step`:24623, `_style_color`:24628, `_style_pick`:24633, `_style_buy`:24668, `_ach_relics_check`:24690, `_style_face_camera`:24695

## 24707-25174  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24743, `_ga_text`:24749, `_ga_box`:24766, `_build_galleria`:24782, `_ga_inner_tick`:24923, `_ga_shell`:24939, `_ga_inside`:24989, `_bio_cyl_col_on`:24992, `_ga_models`:25004, `_ga_lbox`:25019, `_ga_ltext`:25033, `_ga_store`:25040, `_bio_cafe_on`:25142, `_ga_mannequins`:25150

## 25175-25326  featured outfits and the Sky Run

`_ga_featured_look`:25188, `_build_ga_fun`:25209, `_ga_fun_tick`:25254, `_sky_finish`:25281, `_extra_near`:25300, `_extra_open`:25309, `_store_near`:25318

## 25327-25423  v0.41: THE SKY GARDEN

`_sg_now`:25381, `_sg_progress`:25384, `_sg_time`:25390, `_sg_stock`:25397, `_sg_mut_roll`:25412

## 25424-25561  building

`_sg_box`:25425, `_sg_text`:25431, `_build_sky_garden`:25445, `_sg_seed_spot`:25556, `_sg_codex_spot`:25559

## 25562-25742  plants

`_sg_plant_model`:25563, `_sg_refresh_all`:25668, `_sg_refresh`:25672, `_sky_garden_tick`:25708, `_sg_ready_count`:25727, `_sg_boot_note`:25734

## 25743-25862  interacting

`_sg_near`:25744, `_sg_button_text`:25767, `_sg_value`:25780, `_sg_interact`:25784, `_sg_buy`:25800, `_sg_plant`:25822, `_sg_harvest`:25833

## 25863-26106  the garden screen

`_build_sg_panel`:25864, `_sg_open`:25899, `_sg_close`:25908, `_sg_row`:25912, `_sg_refresh_panel`:25927, `_sg_pick_buy`:25972, `_sg_pick_plant`:25976, `_smoke_car_barriers`:25982, `_smoke_sky_garden`:26023

## 26107-26145  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26138, `_pass_day`:26141

## 26146-26177  album

`_album_pages`:26147, `_album_claim`:26162

## 26178-26229  season

`_season_index`:26179, `_season_tick`:26182, `_season_xp`:26191, `_season_tier`:26194, `_season_reward`:26197, `_season_claim`:26211

## 26230-26237  Harbor Night

`_harbor_night`:26231

## 26238-26269  check-in calendar

`_cal_tick`:26239

## 26270-26446  the panel

`_build_hp_panel`:26271, `_open_pass`:26306, `_hp_open`:26309, `_hp_close`:26316, `_hp_row`:26320, `_hp_bar`:26335, `_hp_refresh`:26339, `_smoke_pass`:26384

## 26447-26678  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26451, `_cash_pill_tick`:26459, `_build_lb`:26497, `_open_lb`:26543, `_close_lb`:26551, `_lb_pick`:26555, `_lb_headers`:26560, `_lb_url`:26564, `_lb_me`:26567, `_lb_level`:26572, `_lb_tick`:26582, `_lb_upload`:26590, `_lb_fetch`:26600, `_lb_got`:26608, `_lb_value`:26621, `_lb_refresh_ui`:26632

## 26679-27237  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26703, `_market_near`:26782, `_build_gear`:26792, `_gear_piece`:26800, `_pet_m`:26845, `_pet_eyes`:26859, `_build_pet`:26866, `_pet_nose`:27004, `_pet_anim`:27007, `_market_apply`:27018, `_market_tick`:27042, `_build_market_panel`:27066, `_open_market`:27092, `_close_market`:27099, `_refresh_market`:27103, `_market_pick`:27156, `_toggle_board`:27194, `_board_tick`:27201

## 27238-27482  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27270, `_ds_label`:27289, `_build_display`:27303, `_ds_got`:27383, `_ds_sorted`:27392, `_ds_render_board`:27406, `_ds_render_news`:27432, `_display_tick`:27453

## 27483-27661  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27500, `_toggle_streamer`:27587, `_streamer_badge_tap`:27603, `_streamer_tick`:27607

## 27662-27698  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27668, `_car_back`:27675, `_car_park_tick`:27682

## 27699-27795  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27703, `_bus_eta`:27757, `_bus_displays_tick`:27773

## 27796-28087  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27814, `_treasure_pick`:27817, `_treasure_spot`:27826, `_treasure_district`:27830, `_treasure_clue`:27842, `_treasure_prop`:27855, `_tp_part`:27858, `_tp_sphere`:27868, `_tp_cyl`:27876, `_treasure_prop_side`:27885, `_build_treasure_props`:27897, `_build_treasure`:27941, `_treasure_dir_char`:28010, `_treasure_tick`:28019, `_treasure_claim`:28073

## 28088-28188  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:28089, `_halo_mat`:28121, `_smoke_treasure`:28146

## 28189-28512  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28210, `_fm_send`:28213, `_fm_area`:28219, `_fm_glow_mesh`:28235, `_fm_block_reason`:28253, `_fm_start`:28265, `_fm_announce`:28293, `_fm_finish`:28296, `_fm_msg`:28314, `_fm_check_paid`:28365, `_fm_tick`:28383, `_smoke_findme`:28439

## 28513-28623  v0.24.2: road map (for moving people off the road)

`_floor_note`:28519, `_floor_disc`:28533, `_floor_top`:28542, `_ground_at`:28560, `_note_road`:28578, `_on_road`:28585, `_ped_curb`:28595, `_curb_spot`:28605

## 28624-28919  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28646, `_ex_grid`:28654, `_ex_lamps`:28689, `_ex_umbrella`:28712, `_ex_yards`:28719, `_build_expansion`:28734, `_expand_shots`:28897

## 28920-29114  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28961, `_v27_near_cross`:29053, `_v27_near_any_road`:29060, `_v27_in_district`:29066, `_sea_tick`:29080, `_sea_tow`:29099

## 29115-29782  Harbor Loop sky train

`_sky_build_path`:29166, `_sky_pos`:29207, `_sky_dir`:29221, `_sky_project`:29226, `_sky_trip_time`:29245, `_sky_trip_dist`:29251, `_sky_now`:29262, `_sky_state`:29265, `_sky_time_at_station`:29280, `_sky_next_arrival`:29287, `_build_skytrain`:29300, `_sky_make_car`:29452, `_sky_skin`:29489, `_sky_place_trains`:29509, `_sky_build_station`:29528, `_sky_near`:29593, `_sky_fmt`:29602, `_sky_enter`:29606, `_sky_leave_platform`:29624, `_sky_board`:29634, `_sky_alight`:29648, `_sky_action`:29662, `_sky_tick`:29679, `_sky_camera`:29719, `_tour_today`:29735, `_tour_stamp`:29738, `_sky_hud`:29761

## 29783-30156  Day and night

`_toggle_weather`:29866, `_refresh_weather_button`:29872, `_game_hour`:29878, `_day_key`:29890, `_night_setup`:29905, `_night_scan_mesh`:29995, `_daynight_tick`:30020, `_daynight_apply`:30029, `_daynight_lights`:30141, `_cycle_day_mode`:30146, `_refresh_time_button`:30153

## 30157-30794  v0.27 smoke test and screenshots

`_smoke_v27`:30158, `_city_shots`:30363

## 30795-31211  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30829, `_ap_plane`:31005, `_ap_truck`:31025, `_ap_baggage_train`:31066, `_ap_loop_pos`:31079, `_ap_loop_len`:31095, `_ap_flight_at`:31101, `_ap_tick`:31125, `_airport_ped_plan`:31148, `_smoke_airport`:31168

## 31212-31725  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31226, `_nav_spot`:31233, `_nav_idx`:31237, `_nav_pos`:31244, `_nav_blocked`:31248, `_nav_nearest_free`:31258, `_nav_bfs`:31286, `_nav_build`:31330, `_stroller`:31401, `_stroll_place`:31417, `_stroll_next`:31438, `_nav_clear_line`:31472, `_stroll_aim`:31483, `_strollers_tick`:31515, `_smoke_strollers`:31610

## 31726-31886  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31761, `_dir_fmt`:31764, `_signpost_spot`:31767, `_build_signposts`:31784

## 31887-31983  the Directions panel and chip

`_build_dir_panel`:31888, `_open_dir`:31930, `_dir_close`:31939, `_dir_pick`:31943, `_dir_stop`:31948, `_dir_stop_and_close`:31953, `_dir_tick`:31957

## 31984-32525  v0.44: Grand Central

`_gc_mesh`:32013, `_gc_mat`:32046, `_gc_glass`:32055, `_gb`:32065, `_gb_solid`:32071, `_gb_flush`:32075, `_gc_tree`:32105, `_gc_text`:32110, `_gc_planter`:32125, `_gc_kiosk`:32131, `_goods_color`:32161, `_goods_mat`:32164, `_kiosk_goods`:32168, `_build_grand_central`:32246, `_build_gc_towers`:32414, `_gc_tick`:32509

## 32526-32817  v0.44: filling the empty land

`_loft`:32543, `_fill_clear`:32585, `_build_fill`:32595, `_hg_in_lake`:32643, `_hg_path`:32647, `_floor_note_rot`:32655, `_build_gardens`:32663, `_build_fan_plaza`:32773

## 32818-32852  v0.45: hover car underglow

`_car_underglow`:32821

## 32853-33017  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32854

## 33018-33049  v0.47: street stalls downtown

`_build_street_stalls`:33022, `_cull_people_in`:33042

## 33050-33148  v0.48: places that open as you level up

`_place_lock_of`:33063, `_place_root`:33069, `_place_unlocked`:33072, `_build_place_signs`:33080, `_places_refresh`:33125, `_places_tick`:33142

## 33149-33193  v0.50: city careers

`_career_rank_name`:33174, `_career_mult`:33177, `_career_block_reason`:33182, `_career_start`:33185, `_career_end`:33190

## 33194-33244  v0.52: careers as clear job loops

`_cid`:33221, `_career_target`:33235, `_career_tick`:33242

## 33245-33252  taxi

`_taxi_meter`:33246

## 33253-33256  paramedic

(no functions)

## 33257-33261  police

`_career_chase_over`:33259

## 33262-33267  firefighter

`_fire_aimed`:33263

## 33268-33277  the step bar

`_career_bar_text`:33271, `_career_hud`:33275

## 33278-33304  cut scenes

`_cs_skip`:33296

## 33305-33309  siren

(no functions)

## 33310-33321  the Careers panel

`_build_career_panel`:33311, `_open_careers`:33314, `_career_close`:33318

## 33322-33745  v0.50: homes

`_home_door_spots`:33362, `_build_homes`:33377, `_home_labels`:33406, `_home_door_near`:33415, `_home_origin`:33424, `_home_slot_near`:33427, `_home_exit_near`:33438, `_home_btn`:33445, `_home_interact`:33458, `_home_buy`:33477, `_home_default_layout`:33491, `_home_enter`:33499, `_home_leave`:33519, `_hm`:33527, `_home_build_room`:33546, `_home_refresh_room`:33655, `_furni_build`:33669

## 33746-34081  decorating

`_build_home_panels`:33747, `_open_homes`:33792, `_home_row_go`:33802, `_home_panel_close`:33822, `_deco_open`:33826, `_deco_pick`:33849, `_smoke_careers_homes`:33872

## 34082-34216  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:34086, `_home_slots`:34094, `_home_ring`:34121, `_furni_cat`:34127, `_home_fix_layout`:34133, `_home_build_layout`:34161

## 34217-34650  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34280, `_ch_homes`:34286, `_ch_step_text`:34293, `_ch_step_done`:34304, `_ch_target`:34318, `_ch_finish_chapter`:34327, `_chapters_tick`:34349, `_hud_top_stack`:34389, `_build_chapters_ui`:34419, `_chapters_restart_ask`:34461, `_chapters_restart`:34464, `_chapters_text`:34474, `_open_chapters`:34494, `_chapters_close`:34501, `_smoke_chapters`:34505, `_step_sound`:34626

## 34651-34689  v0.51.1: join and leave messages

`_announce_join`:34658, `_announce_already_here`:34677, `_announce_leave`:34685

## 34690-34954  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34706, `_shot_tick`:34712, `_draw_shot_icon`:34744, `_shot_enter`:34753, `_shot_exit`:34767, `_shot_release_controls`:34779, `_shot_stick_zone`:34786, `_shot_input`:34789, `_smoke_photo`:34861

## 34955-35253  v0.51.3: stream joiners

`_viewer_count`:34975, `_stream_join_check`:34981, `_stream_join_start`:34988, `_sj_streamer`:35005, `_stream_join_tick`:35014, `_stream_join_land`:35038, `_sj_welcome`:35054, `_smoke_stream_join`:35088, `_career_shot`:35171

## 35254-35370  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35258, `_st_restore`:35296, `_smoke_streamer_clean`:35317, `_world_bio_passport`:35368

