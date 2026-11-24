# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-590  Core (unlabelled)

`_symbol_font`:280, `_ready`:292, `_surf_texture`:533, `_surface_material`:555

## 591-663  v0.34.6: futuristic towers for the old city

`_future_tower`:595

## 664-742  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:671, `_skin_common`:706, `_future_wall`:714, `_future_roof`:728, `_future_pave`:736

## 743-803  v0.34.4: futuristic road surface

`_road_textures`:750, `_future_road`:784

## 804-2009  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:823, `_real_tex`:864, `_real_setup`:872, `_real_kind`:893, `_realify`:899, `_real_glass`:936, `_make_window_textures`:956, `_material`:989, `_box`:1014, `_sign`:1036, `_build_world`:1048, `_future_kiosk`:1156, `_build_collectibles`:1182, `_auto_collect_tick`:1215, `_find_count`:1236, `_nearest_find`:1243, `_destination`:1257, `_toggle_activity`:1293, `_collect_find`:1322, `_owned_count`:1337, `_ridge_open`:1344, `_ridge_count`:1348, `_nearest_ridge`:1355, `_apply_car`:1369, `_tune_level`:1399, `_tune_cost`:1402, `_car_stats`:1408, `_buy_tune`:1415, `_open_tune`:1436, `_back_to_garage`:1442, `_refresh_tune`:1446, `_bay_open`:1457, `_area_open`:1460, `_bay_count`:1463, `_nearest_bay`:1470, `_build_bay`:1484, `_check_bay`:1537, `_discover_bay`:1550, `_north_count`:1563, `_north_open`:1570, `_nearest_north`:1573, `_check_north`:1587, `_discover_north`:1600, `_prop`:1613, `_collider`:1627, `_first_mesh`:1637, `_scatter`:1646, `_prop_stretch`:1680, `_north_token`:1689, `_nm_roads`:1716, `_prop_big`:1731, `_nm_near_cross`:1747, `_build_north`:1754, `_build_nm_blocks`:1871, `_build_north_landscape`:1956, `_nm_free`:1983, `_build_landscape`:1993

## 2010-2493  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2011, `_online_toggle`:2025, `_online_autostart`:2051, `_online_connect`:2070, `_online_stop`:2077, `_online_next_ref`:2088, `_online_send`:2092, `_online_join_frame`:2096, `_online_pos_frame`:2099, `_online_tick`:2108, `_online_handle`:2142, `_online_clean_name`:2195, `_online_peer_update`:2204, `_online_make_peer`:2273, `_peer_look`:2314, `_online_tint`:2371, `_paint_mat`:2387, `_online_update_peers`:2399, `_online_clear_peers`:2479, `_online_refresh_button`:2484

## 2494-2666  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2574, `_marina_count`:2577, `_nearest_marina`:2584, `_check_marina`:2598, `_discover_marina`:2611, `_shop_available`:2624, `_nearest_shop`:2627, `_premium_cars`:2635, `_glass`:2642, `_shop_building`:2648, `_shop_pad`:2658

## 2667-3182  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2668, `_bus_last`:2671, `_build_bus`:2674, `_bus_boxes`:2701, `_bus_skin`:2711, `_bus_side`:2724, `_bus_reset`:2727, `_bus_text`:2736, `_bus_tick`:2741, `_bus_near`:2781, `_bus_board`:2792, `_bus_alight`:2807, `_build_marina`:2821, `_set_hat`:2927, `_build_hat`:2930, `_cyl`:2995, `_hat_part`:3004, `_apply_avatar`:3013, `_shop_count`:3025, `_shop_open`:3035, `_shop_step`:3053, `_shop_close`:3059, `_owned_text`:3072, `_refresh_shop`:3075, `_shop_action`:3128, `_journal_flip`:3179

## 3183-3237  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3194, `_xp`:3197, `_level_for`:3204, `_level`:3212, `_level_text`:3215, `_check_level`:3225

## 3238-3340  v0.11.0: online police vs thief

`_orole_ready`:3239, `_orole_start`:3242, `_orole_end`:3269, `_orole_tick`:3278

## 3341-4284  v0.10.0: chase mode (offline)

`_chase_open`:3342, `_chase_clear`:3347, `_chase_make_unit`:3361, `_chase_spawn_point`:3391, `_chase_start`:3400, `_chase_end`:3436, `_chase_steer`:3455, `_chase_roadblock`:3491, `_chase_heli_build`:3536, `_chase_extras`:3562, `_chase_tick`:3589, `_start_trial`:3653, `_cancel_trial`:3680, `_check_trial`:3685, `_finish_trial`:3702, `_trial_count`:3718, `_open_trials`:3725, `_refresh_trials`:3729, `_update_gate`:3741, `_slab`:3759, `_build_ridge`:3777, `_check_ridge`:3840, `_discover`:3853, `_mission_progress`:3867, `_check_missions`:3929, `_open_garage`:3940, `_open_journal`:3945, `_close_sub`:3950, `_bar`:3953, `_refresh_garage`:3957, `_garage_step`:3982, `_garage_action`:3986, `_refresh_journal`:4006, `_visited_shops`:4039, `_build_panels`:4046, `_build_player`:4206, `_build_car`:4244, `_try_model`:4273

## 4285-4966  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4286, `_kshader`:4360, `_ksync`:4366, `_kskin`:4381, `_make_kperson`:4387, `_hat_y`:4451, `_sit_drop`:4454, `_kplay`:4457, `_kpeople_tick`:4467, `_pose_person`:4496, `_pose_limbs`:4513, `_person_lift`:4575, `_snap_crowd_feet`:4588, `_people_life_tick`:4604, `_life_one`:4641, `_cull_person`:4651, `_recolor_car_model`:4659, `_apply_car_model`:4673, `_landmark`:4693, `_label`:4703, `_button`:4710, `_panel`:4722, `_build_hud`:4732

## 4967-5085  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4973, `_menu_tab`:4979, `_watch_tick`:5002, `_watch_count`:5044, `_online_pill_tap`:5051, `_online_pill_tick`:5057, `online_config_ok`:5083

## 5086-5123  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5089, `_offroad`:5095, `_ground_near`:5108, `_collectibles_on_road`:5115

## 5124-5263  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5136, `_build_quest_offer`:5140, `_quest_offer_tick`:5170, `_quest_auto_pick`:5220, `_quest_accept`:5235, `_quest_decline`:5249, `_quest_stop`:5255

## 5264-5631  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5288, `_holo_material`:5297, `_build_future`:5305, `_build_neon`:5319, `_model_profile`:5388, `_model_body_box`:5411, `_build_holograms`:5425, `_holo_tick`:5475, `_build_sky_traffic`:5492, `_sky_hover_car`:5510, `_sky_drone`:5557, `_sky_traffic_tick`:5601, `_future_lights`:5620

## 5632-6131  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5691, `_crew_col`:5699, `_peer_crewmate`:5702, `_set_ring_color`:5705, `_level_color`:5732, `_tier_color`:5745, `_my_ach_tier`:5748, `_style_ring`:5755, `_social_peer_extras`:5803, `_social_tag`:5817, `_my_tag_extra`:5829, `_soc_send`:5842, `_social_msg`:5857, `_social_accept`:5896, `_social_go`:5917, `_soc_friend`:5936, `_soc_invite`:5943, `_soc_goto`:5948, `_soc_high_five`:5956, `_soc_gift`:5976, `_soc_crew_invite`:5993, `_gift_day_check`:6000, `_crew_create`:6006, `_crew_cycle_color`:6016, `_crew_leave`:6021, `_crew_mate_near`:6029, `_crew_board`:6037, `_build_social`:6056, `_social_online`:6118, `_open_social`:6122, `_close_social`:6128

## 6132-6382  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6135, `_track_pos`:6144, `_social_row_button`:6155, `_refresh_social`:6162, `_on_dance_floor`:6224, `_toggle_dance`:6227, `_build_dance_floor`:6235, `_social_tick`:6261, `_photo`:6333

## 6383-6878  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6405, `_game_state`:6413, `_build_arcade`:6425, `_c4_empty`:6476, `_c4_drop_row`:6482, `_c4_winner`:6488, `_c4_bot_move`:6509, `_c4_code`:6538, `_c4_ready`:6544, `_c4_tap`:6547, `_c4_check`:6568, `_c4_tick`:6592, `_rx_ready`:6619, `_rx_start`:6622, `_rx_tap`:6636, `_rx_send_time`:6661, `_rx_resolve`:6668, `_rx_tick`:6694, `_mem_start`:6709, `_mem_tap`:6725, `_mem_finish`:6740, `_mem_tick`:6756, `_mem_board_text`:6763, `_build_arcade_panel`:6774, `_refresh_arcade_panel`:6817

## 6879-7172  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6942, `_quiz_slot`:6945, `_quiz_question`:6955, `_quiz_bot_score`:6984, `_in_quiz`:6993, `_build_quiz`:6996, `_quiz_answer`:7066, `_quiz_msg`:7079, `_quiz_board`:7087, `_quiz_tick`:7097, `_quiz_refresh`:7139

## 7173-8689  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7344, `_sites_found`:7347, `_sites_total`:7350, `_bits`:7353, `_ach_value`:7360, `_ach_tick`:7415, `_ach_check`:7440, `_ach_by_id`:7476, `_ach_msg`:7482, `_build_ach`:7495, `_ach_show`:7526, `_open_ach`:7546, `_close_ach`:7552, `_refresh_ach`:7556, `_ach_num`:7587, `_minimap_tap`:7590, `_menu_go`:7597, `_menu_stay`:7602, `_menu_call_car`:7606, `_toggle_clean_hud`:7612, `_refresh_menu_buttons`:7618, `_clean_hud_tick`:7628, `_draw_joystick`:7669, `_input`:7674, `_stick_zone`:7756, `_notification`:7760, `_physics_process`:7775, `_follow_camera`:7923, `_follow_walk_camera`:7959, `_interact`:7982, `_refresh_hud`:8142, `_open_panel`:8269, `_layout_panels`:8295, `_toggle_menu`:8318, `_rescue`:8360, `_show_toast`:8392, `_save_progress`:8396, `_load_progress`:8486

## 8690-10911  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8691, `_radio_voice`:8694, `_radio_make`:8727, `_radio_set`:8798, `_radio_play`:8820, `_radio_next`:8825, `_radio_talk_line`:8829, `_radio_caption`:8850, `_radio_refresh`:8858, `_process`:8871, `_build_peds`:8922, `_update_peds`:9033, `_update_ped`:9052, `_smoke_test`:9106, `_smoke_chase`:9748, `_smoke_orole`:9781, `_smoke_levels`:9810, `_smoke_bus`:9851, `_smoke_chase_extras`:9936, `_smoke_marina`:9964, `_blocked_at`:10066, `_blocker`:10081, `_on_screen`:10094, `_wait_radio`:10099, `_smoke_radio_peds`:10106, `_smoke_typed_chat`:10176, `_smoke_cafe`:10195, `_smoke_boutique`:10221, `_smoke_models`:10249, `_smoke_garage_ridge`:10273, `_save_shot`:10649, `_people_shots`:10659, `_shots`:10700, `_shot_car`:10894, `_capture_preview`:10904

## 10912-11560  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10979, `_downtown_count`:10982, `_nearest_downtown`:10989, `_check_downtown`:11003, `_discover_downtown`:11016, `_box_batch`:11030, `_model_batch`:11050, `_cut_ranges`:11104, `_dt_ranges`:11116, `_dt_has`:11123, `_dt_near_cross`:11129, `_place`:11135, `_signal_pole`:11146, `_cyl_batch`:11165, `_city_signals`:11189, `_ensure_light_mats`:11240, `_city_lamps`:11250, `_build_downtown`:11294, `_dt_block`:11494, `_downtown_token`:11500, `_build_park`:11517, `_build_plaza`:11546

## 11561-11664  old city and Bay details

`_build_city_detail`:11562

## 11665-12074  traffic

`_build_traffic`:11666, `_path_sample`:11761, `_light_look`:11775, `_light_green`:11783, `_traffic_place`:11787, `_traffic_blocked_by`:11799, `_traffic_tick`:11811, `_smoke_downtown`:11917, `_skyline_shot`:12029, `_skyline_shots`:12037

## 12075-12427  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12121, `_web_scale`:12176, `_web_fps_tick`:12186, `_world_to_uv`:12203, `_map_angle`:12206, `_build_minimap`:12214, `_open_map`:12287, `_close_map`:12298, `_mini_point`:12305, `_site_markers`:12309, `_draw_arrow`:12341, `_draw_minimap`:12348, `_draw_full_map`:12395, `_minimap_tick`:12420

## 12428-12685  camera views

`_build_view_controls`:12429, `_cycle_view`:12471, `_apply_view`:12481, `_hide_labels`:12519, `_unfade`:12525, `_bake_map`:12531, `_shot_stats`:12581, `_view_shots`:12584, `_smoke_views`:12625

## 12686-12933  v0.17.0: level-up celebration

`_build_level_fx`:12697, `_draw_level_rays`:12734, `_level_fx_tick`:12744, `_level_sound`:12749, `_fx_material`:12791, `_level_up_fx`:12799, `_smoke_level_fx`:12900, `_levelup_shots`:12909

## 12934-13053  v0.18.0: walk-in stadium

`_collider_yaw`:12939, `_build_stadium_walls`:12950, `_look`:12978, `_smoke_stadium_eye`:12987, `_stadium_shots`:13023

## 13054-13215  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13078, `_arrow_mesh`:13090, `_build_guidance`:13113, `_guide_target`:13138, `_guidance_tick`:13167, `_draw_hud_arrow`:13193

## 13216-13401  checkpoints

`_build_checkpoints`:13217, `_refresh_checkpoints`:13262, `_check_checkpoints`:13268, `_activate_checkpoint`:13278, `_checkpoint_spawn`:13299, `_spawn_at_checkpoint`:13304, `_draw_checkpoint_icon`:13320, `_smoke_guidance_checkpoints`:13326, `_guide_shots`:13376

## 13402-13669  v0.18.0: Harbor Dome social hub

`_hub_seat`:13460, `_build_hub`:13464

## 13670-13720  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13671, `_xm_mesh`:13680, `_xm_tree`:13688

## 13721-14044  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13724, `_gt_surface`:13739, `_xm_grand_tree`:13749, `_lux_mat`:13864, `_lux_part`:13880, `_lux_box`:13883, `_lux_cyl`:13888, `_lux_ball`:13896, `_lux_new`:13904, `_lux_commit`:13909, `_lux_sofa_mesh`:13913, `_lux_chair_mesh`:13943, `_lux_table_mesh`:13963, `_lux_pouf_mesh`:13978, `_lux_batch`:13993, `_hub_christmas`:14009

## 14045-14200  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14046

## 14201-14449  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14204, `_vx_cyl`:14211, `_vx_ball`:14219, `_vx_ring`:14227, `_hub_polish`:14235, `_hub_gate`:14258, `_hub_vip`:14320, `_hub_glass`:14433

## 14450-14664  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14451, `_build_hub_bots`:14476, `_seat_of`:14507, `_bubble`:14517, `_emote`:14573, `_hub_people_tick`:14587

## 14665-14783  seats

`_seat_taken`:14666, `_nearest_seat`:14674, `_seat_label`:14686, `_sit`:14702, `_stand_up`:14746, `_seated_tick`:14765

## 14784-14940  game panel

`_build_game_panel`:14785, `_open_game_panel`:14840, `_refresh_game_panel`:14859, `_play_robot`:14904, `_peer_at`:14918, `_opponent_name`:14925, `_pay`:14933

## 14941-15061  tic-tac-toe

`_ttt_ready`:14944, `_ttt_winner`:14950, `_ttt_bot_move`:14960, `_ttt_tap`:14986, `_ttt_code`:15006, `_ttt_check`:15012, `_ttt_tick`:15035

## 15062-15113  rock paper scissors

`_rps_ready`:15063, `_rps_pick`:15069, `_rps_resolve`:15087, `_rps_tick`:15111

## 15114-15196  online table messages

`_online_game_send`:15115, `_hub_game_msg`:15121

## 15197-15272  comedy show

`_joke_start`:15198, `_joke_tick`:15210, `_speak`:15236, `_play_rimshot`:15245

## 15273-16172  quick chat and emotes

`_build_chat`:15295, `_chat_toggle_to`:15412, `_chat_log_add`:15420, `_chat_area`:15426, `_chat_near_count`:15444, `_chat_tick`:15453, `_toggle_chat`:15502, `_chat_fit`:15517, `_chat_clean`:15523, `_chat_wrap`:15540, `_chat_send_text`:15562, `_typing`:15585, `_say`:15588, `_do_emote`:15604, `_smoke_hub`:15613, `_chat_shots`:15787, `_cafe_shots`:15812, `_shop_shots`:15860, `_car_shots`:15909, `_outfit_shots`:15940, `_hub_shots`:15988, `_sg_on_terrace`:16123, `_people_only`:16126, `_people_only_keep_cars_out`:16130, `_car_barrier`:16142, `_hub_keep_cars_out`:16156

## 16173-16335  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16182, `_feed_add`:16191, `_feed_render`:16197, `_feed_tick`:16225, `_online_event_send`:16234, `_at_pvp_table`:16241, `_game_name`:16248, `_send_lfp`:16251, `_lfp_msg`:16268, `_accept_invite`:16289

## 16336-16576  v0.18.2: nickname and HUD relayout

`_nick_rude`:16348, `_clean_nick`:16363, `_build_nick_panel`:16375, `_open_nick`:16413, `_random_nick`:16422, `_save_nick`:16428, `_close_nick`:16447, `_refresh_nick_button`:16456, `_relayout_hud`:16460, `_smoke_nick`:16496, `_nick_shots`:16528, `_smoke_sites_reachable`:16546

## 16577-16864  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16603, `_nearest_civic`:16610, `_check_civic`:16624, `_discover_civic`:16637, `_civ_ranges`:16650, `_civ_has`:16664, `_civ_near_cross`:16670, `_build_civic`:16676, `_civic_token`:16802, `_civic_shots`:16819, `_hub_focus`:16841

## 16865-16974  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:16936, `_in_rw_lot`:16939, `_box_batch_rot`:16942, `_multi_collider`:16960

## 16975-17302  circuit geometry

`_cr_point`:16976, `_rw_build_path`:16990, `_rw_dir`:17018, `_rw_bend`:17023, `_ribbon`:17029, `_rw_band`:17049, `_rw_keepout`:17067, `_build_raceway`:17076, `_build_rw_parking`:17110, `_build_rw_pits`:17155, `_build_rw_track`:17192, `_build_rw_trackside`:17233

## 17303-17400  race car rental

`_model_key`:17304, `_race_car_start`:17307, `_tint_ghost`:17345, `_race_car_end`:17358, `_race_keep_cars_out`:17383

## 17401-17415  speed effects

`_eff_max`:17402, `_eff_accel`:17413

## 17416-17466  track helpers

`_rw_seg_progress`:17417, `_rw_track_dist`:17437, `_rw_point_dist`:17448, `_rw_player_progress`:17455, `_rw_target`:17461

## 17467-17703  events

`_rec_stop`:17468, `_rw_place`:17484, `_rw_grid_pos`:17491, `_rw_start`:17496, `_rw_spawn_ai`:17528, `_rw_ai_place`:17552, `_rw_tick`:17563, `_rw_ai_tick`:17616, `_rw_lap_done`:17658, `_rw_finish`:17670, `_rw_fmt`:17701

## 17704-17756  boosters and spikes

`_rw_buy`:17705, `_rw_use_boost`:17723, `_rw_use_spike`:17731, `_rw_drop_spike_at`:17742

## 17757-17814  online races

`_race_msg`:17758, `_join_race`:17780

## 17815-18170  raceway panel, HUD, board

`_build_raceway_ui`:17816, `_rw_layout`:17876, `_rw_open`:17883, `_rw_close`:17889, `_rw_refresh_panel`:17893, `_rw_refresh_board`:17906, `_rw_hud`:17918, `_peer_car_model`:17942, `_smoke_raceway`:17952, `_race_shots`:18133

## 18171-18378  v0.22.0: Call Car

`_call_block_reason`:18177, `_call_spot`:18194, `_call_car`:18225, `_play_horn`:18249, `_smoke_follow_call`:18273, `_follow_shots`:18346

## 18379-18679  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18394, `_build_travel`:18400, `_toggle_run`:18442, `_refresh_run`:18446, `_hud_v23_tick`:18454, `_travel_block_reason`:18483, `_travel_open`:18503, `_open_travel`:18509, `_close_travel`:18515, `_refresh_travel`:18519, `_travel_to`:18527, `_smoke_travel`:18554, `_v23_shots`:18592

## 18680-18753  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:18687, `_qr_button`:18702, `_qr_layout`:18741, `_smoke_qr`:18747

## 18754-19190  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:18774, `_open_crate`:18790, `_build_crate_ui`:18807, `_crate_pick`:18894, `_crate_reveal`:18917, `_crate_draw_car`:18944, `_crate_confetti`:18963, `_crate_sound`:18988, `_crate_drive`:19014, `_feed_add_system`:19044, `_smoke_crate`:19047, `_crate_shots`:19095

## 19191-19682  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19232, `_quick_today`:19237, `_quick_is_done`:19240, `_quick_left`:19243, `_quick_next`:19250, `_quick_fix_target`:19263, `_quick_daily_check`:19277, `_quick_complete`:19291, `_quick_side`:19325, `_build_quick_props`:19343, `_daily_shots`:19495, `_quick_props_refresh`:19537, `_quick_fx`:19541, `_play_coin`:19557, `_smoke_quick`:19574

## 19683-19833  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:19692, `_quest_nearby`:19747, `_open_quests`:19754, `_close_quests`:19761, `_refresh_quests`:19765, `_quest_pick`:19791, `_quest_mode`:19805, `_smoke_quests`:19808

## 19834-19868  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:19838, `_my_tag_tick`:19841

## 19869-20183  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:19886, `_fc_torus`:19896, `_fc_pearl`:19904, `_fc_chrome`:19914, `_fc_glass`:19923, `_fc_glow`:19933, `_fc_ghost`:19942, `_fc_holo`:19954, `_fc_mesh`:19964, `_fc_sphere`:19984, `_fc_capsule`:19992, `_fc_cone`:20000, `_build_food_court`:20009, `_food_court_tick`:20163

## 20184-20505  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20213, `_cm_bench`:20229, `_build_commons`:20242, `_commons_tick`:20464

## 20506-20820  v0.36: the daily puzzle

`_pz_today`:20529, `_pz_new`:20532, `_pz_neighbours`:20577, `_pz_flip`:20587, `_pz_done`:20592, `_pz_tap`:20600, `_pz_win`:20616, `_pz_reset`:20637, `_puzzle_near`:20641, `_open_puzzle`:20646, `_close_puzzle`:20654, `_pz_refresh_sign`:20658, `_build_puzzle_panel`:20666, `_pz_draw`:20697, `_smoke_chat`:20738, `_smoke_feet`:20776, `_smoke_commons`:20797

## 20821-21009  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:20883, `_bio_theta`:20887, `_bio_sec_n`:20892, `_bio_sec_of`:20895, `_bio_pt`:20898, `_bio_lp`:20903, `_bio_la`:20907, `_bio_dir`:20911, `_bio_hex_r`:20914, `_bio_apo`:20919, `_bio_open_angles`:20925, `_bio_si`:20935, `_bm`:20941, `_bsph`:20946, `_blow`:20949, `_bcone`:20960, `_bbox`:20963, `_bp`:20966, `_bq`:20971, `_bio_glass_mat`:20975, `_bio_water_mat`:20988, `_bio_mat`:21000

## 21010-21382  building blocks

`_bio_inst`:21011, `_bio_add`:21017, `_bio_model`:21020, `_bio_nature_mesh`:21026, `_bio_flush`:21060, `_bio_bar`:21095, `_bio_slab`:21108, `_bio_body`:21123, `_bio_cyl_col`:21136, `_bio_hexmesh`:21149, `_bio_hexslab`:21161, `_bio_hexpt`:21167, `_bio_gridshell`:21174, `_bio_rail`:21281, `_bio_rail_arc`:21286, `_bio_disc_deck`:21298, `_bio_ring_deck`:21304, `_bio_helix`:21315, `_bio_pillar`:21335, `_bio_cafe`:21341, `_bio_fence_line`:21355, `_bio_fence_seg`:21360, `_bio_pen`:21370

## 21383-21884  building

`_build_biosphere`:21384, `_build_biosphere_legacy`:21388, `_bio_text`:21550, `_bio_plaque`:21568, `_bio_ticket_hall`:21582, `_on_foot_collision_guard`:21638, `_bio_inside`:21648, `_bio_pass_ok`:21651, `_ticket_near`:21655, `_bio_buy_pass`:21660, `_bio_gates_update`:21676, `_bio_gate_tick`:21702, `_bio_tunnel`:21714, `_bio_grounds`:21767, `_bio_dome`:21813, `_bio_deck_mats`:21881

## 21885-22040  garden planting

`_bio_free`:21886, `_bio_spot`:21903, `_bio_garden`:21911, `_bio_pine`:21952, `_bio_tree`:21955, `_bio_big_tree`:21965, `_bio_rock`:21970, `_bio_pond`:21973, `_bio_particles`:21977, `_bio_mist`:22005, `_bio_mini_dome`:22034

## 22041-22448  the four layouts

`_bio_winter`:22042, `_bio_spring`:22134, `_bio_summer`:22259, `_bio_autumn`:22343

## 22449-22719  animals

`_bio_spawn`:22450, `_bio_load_animal`:22522, `_bio_make_quad`:22543, `_bio_load_bird`:22620, `_bio_make_penguin`:22640, `_bio_make_bird`:22662, `_bio_make_flamingo`:22686, `_bio_make_butterfly`:22707

## 22720-22849  animation, spotting and rewards

`_bio_stuck_check`:22725, `_biosphere_tick`:22743, `_bio_animate`:22750, `_bio_spot_check`:22830, `_bio_spotted`:22842, `_smoke_biosphere`:22846

## 22850-23367  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:22937, `_wear_piece`:22940, `_wear_mat`:22963, `_person_index`:22979, `_dress`:23002, `_smoke_style`:23108, `_style_shots`:23259, `_npc_look`:23331

## 23368-23521  your look: apply, save, share

`_look_clean`:23372, `_look_pack`:23387, `_owns`:23393, `_apply_look`:23398, `_relic_model`:23409, `_fc_mesh_mat`:23474, `_relic_refresh`:23477, `_relic_tick`:23491, `_peer_style`:23502

## 23522-23949  stores and the wardrobe

`_style_today`:23541, `_style_items`:23544, `_style_cat`:23552, `_style_price`:23555, `_style_deal`:23569, `_style_price_base`:23582, `_relic_stock`:23589, `_build_style_panel`:23601, `_open_store`:23641, `_open_wardrobe`:23660, `_style_close`:23663, `_style_finish`:23667, `_sync_old_avatar`:23682, `_style_tabs_for`:23689, `_refresh_style`:23694, `_style_body_rows`:23845, `_style_set_tab`:23862, `_style_step`:23866, `_style_color`:23871, `_style_pick`:23876, `_style_buy`:23911, `_ach_relics_check`:23933, `_style_face_camera`:23938

## 23950-24417  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:23986, `_ga_text`:23992, `_ga_box`:24009, `_build_galleria`:24025, `_ga_inner_tick`:24166, `_ga_shell`:24182, `_ga_inside`:24232, `_bio_cyl_col_on`:24235, `_ga_models`:24247, `_ga_lbox`:24262, `_ga_ltext`:24276, `_ga_store`:24283, `_bio_cafe_on`:24385, `_ga_mannequins`:24393

## 24418-24569  featured outfits and the Sky Run

`_ga_featured_look`:24431, `_build_ga_fun`:24452, `_ga_fun_tick`:24497, `_sky_finish`:24524, `_extra_near`:24543, `_extra_open`:24552, `_store_near`:24561

## 24570-24666  v0.41: THE SKY GARDEN

`_sg_now`:24624, `_sg_progress`:24627, `_sg_time`:24633, `_sg_stock`:24640, `_sg_mut_roll`:24655

## 24667-24804  building

`_sg_box`:24668, `_sg_text`:24674, `_build_sky_garden`:24688, `_sg_seed_spot`:24799, `_sg_codex_spot`:24802

## 24805-24985  plants

`_sg_plant_model`:24806, `_sg_refresh_all`:24911, `_sg_refresh`:24915, `_sky_garden_tick`:24951, `_sg_ready_count`:24970, `_sg_boot_note`:24977

## 24986-25105  interacting

`_sg_near`:24987, `_sg_button_text`:25010, `_sg_value`:25023, `_sg_interact`:25027, `_sg_buy`:25043, `_sg_plant`:25065, `_sg_harvest`:25076

## 25106-25349  the garden screen

`_build_sg_panel`:25107, `_sg_open`:25142, `_sg_close`:25151, `_sg_row`:25155, `_sg_refresh_panel`:25170, `_sg_pick_buy`:25215, `_sg_pick_plant`:25219, `_smoke_car_barriers`:25225, `_smoke_sky_garden`:25266

## 25350-25388  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25381, `_pass_day`:25384

## 25389-25420  album

`_album_pages`:25390, `_album_claim`:25405

## 25421-25472  season

`_season_index`:25422, `_season_tick`:25425, `_season_xp`:25434, `_season_tier`:25437, `_season_reward`:25440, `_season_claim`:25454

## 25473-25480  Harbor Night

`_harbor_night`:25474

## 25481-25512  check-in calendar

`_cal_tick`:25482

## 25513-25689  the panel

`_build_hp_panel`:25514, `_open_pass`:25549, `_hp_open`:25552, `_hp_close`:25559, `_hp_row`:25563, `_hp_bar`:25578, `_hp_refresh`:25582, `_smoke_pass`:25627

## 25690-25904  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:25694, `_cash_pill_tick`:25702, `_build_lb`:25740, `_open_lb`:25783, `_close_lb`:25791, `_lb_pick`:25795, `_lb_headers`:25800, `_lb_url`:25804, `_lb_me`:25807, `_lb_tick`:25810, `_lb_upload`:25818, `_lb_fetch`:25828, `_lb_got`:25836, `_lb_value`:25847, `_lb_refresh_ui`:25858

## 25905-26328  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:25929, `_market_near`:26006, `_build_gear`:26016, `_gear_piece`:26024, `_build_pet`:26069, `_market_apply`:26111, `_market_tick`:26135, `_build_market_panel`:26157, `_open_market`:26183, `_close_market`:26190, `_refresh_market`:26194, `_market_pick`:26247, `_toggle_board`:26285, `_board_tick`:26292

## 26329-26570  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26361, `_ds_label`:26380, `_build_display`:26394, `_ds_got`:26473, `_ds_sorted`:26482, `_ds_render_board`:26496, `_ds_render_news`:26522, `_display_tick`:26541

## 26571-26749  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26588, `_toggle_streamer`:26675, `_streamer_badge_tap`:26691, `_streamer_tick`:26695

## 26750-26786  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:26756, `_car_back`:26763, `_car_park_tick`:26770

## 26787-26883  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:26791, `_bus_eta`:26845, `_bus_displays_tick`:26861

## 26884-27175  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:26902, `_treasure_pick`:26905, `_treasure_spot`:26914, `_treasure_district`:26918, `_treasure_clue`:26930, `_treasure_prop`:26943, `_tp_part`:26946, `_tp_sphere`:26956, `_tp_cyl`:26964, `_treasure_prop_side`:26973, `_build_treasure_props`:26985, `_build_treasure`:27029, `_treasure_dir_char`:27098, `_treasure_tick`:27107, `_treasure_claim`:27161

## 27176-27276  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27177, `_halo_mat`:27209, `_smoke_treasure`:27234

## 27277-27600  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27298, `_fm_send`:27301, `_fm_area`:27307, `_fm_glow_mesh`:27323, `_fm_block_reason`:27341, `_fm_start`:27353, `_fm_announce`:27381, `_fm_finish`:27384, `_fm_msg`:27402, `_fm_check_paid`:27453, `_fm_tick`:27471, `_smoke_findme`:27527

## 27601-27711  v0.24.2: road map (for moving people off the road)

`_floor_note`:27607, `_floor_disc`:27621, `_floor_top`:27630, `_ground_at`:27648, `_note_road`:27666, `_on_road`:27673, `_ped_curb`:27683, `_curb_spot`:27693

## 27712-28007  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27734, `_ex_grid`:27742, `_ex_lamps`:27777, `_ex_umbrella`:27800, `_ex_yards`:27807, `_build_expansion`:27822, `_expand_shots`:27985

## 28008-28202  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28049, `_v27_near_cross`:28141, `_v27_near_any_road`:28148, `_v27_in_district`:28154, `_sea_tick`:28168, `_sea_tow`:28187

## 28203-28843  Harbor Loop sky train

`_sky_build_path`:28254, `_sky_pos`:28295, `_sky_dir`:28309, `_sky_project`:28314, `_sky_trip_time`:28333, `_sky_trip_dist`:28339, `_sky_now`:28350, `_sky_state`:28353, `_sky_time_at_station`:28368, `_sky_next_arrival`:28375, `_build_skytrain`:28388, `_sky_make_car`:28517, `_sky_skin`:28554, `_sky_place_trains`:28574, `_sky_build_station`:28593, `_sky_near`:28658, `_sky_fmt`:28667, `_sky_enter`:28671, `_sky_leave_platform`:28689, `_sky_board`:28699, `_sky_alight`:28712, `_sky_action`:28725, `_sky_tick`:28742, `_sky_camera`:28780, `_tour_today`:28796, `_tour_stamp`:28799, `_sky_hud`:28822

## 28844-29181  Day and night

`_game_hour`:28925, `_day_key`:28937, `_night_setup`:28952, `_night_scan_mesh`:29042, `_daynight_tick`:29067, `_daynight_apply`:29074, `_daynight_lights`:29166, `_cycle_day_mode`:29171, `_refresh_time_button`:29178

## 29182-29817  v0.27 smoke test and screenshots

`_smoke_v27`:29183, `_city_shots`:29386

## 29818-30234  v0.27: Harbor International Airport (north of the city)

`_build_airport`:29852, `_ap_plane`:30028, `_ap_truck`:30048, `_ap_baggage_train`:30089, `_ap_loop_pos`:30102, `_ap_loop_len`:30118, `_ap_flight_at`:30124, `_ap_tick`:30148, `_airport_ped_plan`:30171, `_smoke_airport`:30191

## 30235-30748  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30249, `_nav_spot`:30256, `_nav_idx`:30260, `_nav_pos`:30267, `_nav_blocked`:30271, `_nav_nearest_free`:30281, `_nav_bfs`:30309, `_nav_build`:30353, `_stroller`:30424, `_stroll_place`:30440, `_stroll_next`:30461, `_nav_clear_line`:30495, `_stroll_aim`:30506, `_strollers_tick`:30538, `_smoke_strollers`:30633

## 30749-30909  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:30784, `_dir_fmt`:30787, `_signpost_spot`:30790, `_build_signposts`:30807

## 30910-31006  the Directions panel and chip

`_build_dir_panel`:30911, `_open_dir`:30953, `_dir_close`:30962, `_dir_pick`:30966, `_dir_stop`:30971, `_dir_stop_and_close`:30976, `_dir_tick`:30980

## 31007-31548  v0.44: Grand Central

`_gc_mesh`:31036, `_gc_mat`:31069, `_gc_glass`:31078, `_gb`:31088, `_gb_solid`:31094, `_gb_flush`:31098, `_gc_tree`:31128, `_gc_text`:31133, `_gc_planter`:31148, `_gc_kiosk`:31154, `_goods_color`:31184, `_goods_mat`:31187, `_kiosk_goods`:31191, `_build_grand_central`:31269, `_build_gc_towers`:31437, `_gc_tick`:31532

## 31549-31840  v0.44: filling the empty land

`_loft`:31566, `_fill_clear`:31608, `_build_fill`:31618, `_hg_in_lake`:31666, `_hg_path`:31670, `_floor_note_rot`:31678, `_build_gardens`:31686, `_build_fan_plaza`:31796

## 31841-31875  v0.45: hover car underglow

`_car_underglow`:31844

## 31876-32040  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:31877

## 32041-32072  v0.47: street stalls downtown

`_build_street_stalls`:32045, `_cull_people_in`:32065

## 32073-32171  v0.48: places that open as you level up

`_place_lock_of`:32086, `_place_root`:32092, `_place_unlocked`:32095, `_build_place_signs`:32103, `_places_refresh`:32148, `_places_tick`:32165

## 32172-32216  v0.50: city careers

`_career_rank_name`:32197, `_career_mult`:32200, `_career_block_reason`:32205, `_career_start`:32208, `_career_end`:32213

## 32217-32267  v0.52: careers as clear job loops

`_cid`:32244, `_career_target`:32258, `_career_tick`:32265

## 32268-32275  taxi

`_taxi_meter`:32269

## 32276-32279  paramedic

(no functions)

## 32280-32284  police

`_career_chase_over`:32282

## 32285-32290  firefighter

`_fire_aimed`:32286

## 32291-32300  the step bar

`_career_bar_text`:32294, `_career_hud`:32298

## 32301-32327  cut scenes

`_cs_skip`:32319

## 32328-32332  siren

(no functions)

## 32333-32344  the Careers panel

`_build_career_panel`:32334, `_open_careers`:32337, `_career_close`:32341

## 32345-32768  v0.50: homes

`_home_door_spots`:32385, `_build_homes`:32400, `_home_labels`:32429, `_home_door_near`:32438, `_home_origin`:32447, `_home_slot_near`:32450, `_home_exit_near`:32461, `_home_btn`:32468, `_home_interact`:32481, `_home_buy`:32500, `_home_default_layout`:32514, `_home_enter`:32522, `_home_leave`:32542, `_hm`:32550, `_home_build_room`:32569, `_home_refresh_room`:32678, `_furni_build`:32692

## 32769-33104  decorating

`_build_home_panels`:32770, `_open_homes`:32815, `_home_row_go`:32825, `_home_panel_close`:32845, `_deco_open`:32849, `_deco_pick`:32872, `_smoke_careers_homes`:32895

## 33105-33239  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33109, `_home_slots`:33117, `_home_ring`:33144, `_furni_cat`:33150, `_home_fix_layout`:33156, `_home_build_layout`:33184

## 33240-33673  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33303, `_ch_homes`:33309, `_ch_step_text`:33316, `_ch_step_done`:33327, `_ch_target`:33341, `_ch_finish_chapter`:33350, `_chapters_tick`:33372, `_hud_top_stack`:33412, `_build_chapters_ui`:33442, `_chapters_restart_ask`:33484, `_chapters_restart`:33487, `_chapters_text`:33497, `_open_chapters`:33517, `_chapters_close`:33524, `_smoke_chapters`:33528, `_step_sound`:33649

## 33674-33712  v0.51.1: join and leave messages

`_announce_join`:33681, `_announce_already_here`:33700, `_announce_leave`:33708

## 33713-33977  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33729, `_shot_tick`:33735, `_draw_shot_icon`:33767, `_shot_enter`:33776, `_shot_exit`:33790, `_shot_release_controls`:33802, `_shot_stick_zone`:33809, `_shot_input`:33812, `_smoke_photo`:33884

## 33978-34276  v0.51.3: stream joiners

`_viewer_count`:33998, `_stream_join_check`:34004, `_stream_join_start`:34011, `_sj_streamer`:34028, `_stream_join_tick`:34037, `_stream_join_land`:34061, `_sj_welcome`:34077, `_smoke_stream_join`:34111, `_career_shot`:34194

## 34277-34393  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34281, `_st_restore`:34319, `_smoke_streamer_clean`:34340, `_world_bio_passport`:34391

