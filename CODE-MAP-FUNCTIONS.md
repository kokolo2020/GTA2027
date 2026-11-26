# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-616  Core (unlabelled)

`_symbol_font`:286, `_ready`:298, `_surf_texture`:559, `_surface_material`:581

## 617-689  v0.34.6: futuristic towers for the old city

`_future_tower`:621

## 690-768  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:697, `_skin_common`:732, `_future_wall`:740, `_future_roof`:754, `_future_pave`:762

## 769-829  v0.34.4: futuristic road surface

`_road_textures`:776, `_future_road`:810

## 830-2038  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:849, `_real_tex`:890, `_real_setup`:898, `_real_kind`:919, `_realify`:925, `_real_glass`:962, `_make_window_textures`:982, `_material`:1015, `_box`:1040, `_sign`:1062, `_build_world`:1074, `_future_kiosk`:1185, `_build_collectibles`:1211, `_auto_collect_tick`:1244, `_find_count`:1265, `_nearest_find`:1272, `_destination`:1286, `_toggle_activity`:1322, `_collect_find`:1351, `_owned_count`:1366, `_ridge_open`:1373, `_ridge_count`:1377, `_nearest_ridge`:1384, `_apply_car`:1398, `_tune_level`:1428, `_tune_cost`:1431, `_car_stats`:1437, `_buy_tune`:1444, `_open_tune`:1465, `_back_to_garage`:1471, `_refresh_tune`:1475, `_bay_open`:1486, `_area_open`:1489, `_bay_count`:1492, `_nearest_bay`:1499, `_build_bay`:1513, `_check_bay`:1566, `_discover_bay`:1579, `_north_count`:1592, `_north_open`:1599, `_nearest_north`:1602, `_check_north`:1616, `_discover_north`:1629, `_prop`:1642, `_collider`:1656, `_first_mesh`:1666, `_scatter`:1675, `_prop_stretch`:1709, `_north_token`:1718, `_nm_roads`:1745, `_prop_big`:1760, `_nm_near_cross`:1776, `_build_north`:1783, `_build_nm_blocks`:1900, `_build_north_landscape`:1985, `_nm_free`:2012, `_build_landscape`:2022

## 2039-2522  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2040, `_online_toggle`:2054, `_online_autostart`:2080, `_online_connect`:2099, `_online_stop`:2106, `_online_next_ref`:2117, `_online_send`:2121, `_online_join_frame`:2125, `_online_pos_frame`:2128, `_online_tick`:2137, `_online_handle`:2171, `_online_clean_name`:2224, `_online_peer_update`:2233, `_online_make_peer`:2302, `_peer_look`:2343, `_online_tint`:2400, `_paint_mat`:2416, `_online_update_peers`:2428, `_online_clear_peers`:2508, `_online_refresh_button`:2513

## 2523-2695  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2603, `_marina_count`:2606, `_nearest_marina`:2613, `_check_marina`:2627, `_discover_marina`:2640, `_shop_available`:2653, `_nearest_shop`:2656, `_premium_cars`:2664, `_glass`:2671, `_shop_building`:2677, `_shop_pad`:2687

## 2696-3211  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2697, `_bus_last`:2700, `_build_bus`:2703, `_bus_boxes`:2730, `_bus_skin`:2740, `_bus_side`:2753, `_bus_reset`:2756, `_bus_text`:2765, `_bus_tick`:2770, `_bus_near`:2810, `_bus_board`:2821, `_bus_alight`:2836, `_build_marina`:2850, `_set_hat`:2956, `_build_hat`:2959, `_cyl`:3024, `_hat_part`:3033, `_apply_avatar`:3042, `_shop_count`:3054, `_shop_open`:3064, `_shop_step`:3082, `_shop_close`:3088, `_owned_text`:3101, `_refresh_shop`:3104, `_shop_action`:3157, `_journal_flip`:3208

## 3212-3266  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3223, `_xp`:3226, `_level_for`:3233, `_level`:3241, `_level_text`:3244, `_check_level`:3254

## 3267-3369  v0.11.0: online police vs thief

`_orole_ready`:3268, `_orole_start`:3271, `_orole_end`:3298, `_orole_tick`:3307

## 3370-4313  v0.10.0: chase mode (offline)

`_chase_open`:3371, `_chase_clear`:3376, `_chase_make_unit`:3390, `_chase_spawn_point`:3420, `_chase_start`:3429, `_chase_end`:3465, `_chase_steer`:3484, `_chase_roadblock`:3520, `_chase_heli_build`:3565, `_chase_extras`:3591, `_chase_tick`:3618, `_start_trial`:3682, `_cancel_trial`:3709, `_check_trial`:3714, `_finish_trial`:3731, `_trial_count`:3747, `_open_trials`:3754, `_refresh_trials`:3758, `_update_gate`:3770, `_slab`:3788, `_build_ridge`:3806, `_check_ridge`:3869, `_discover`:3882, `_mission_progress`:3896, `_check_missions`:3958, `_open_garage`:3969, `_open_journal`:3974, `_close_sub`:3979, `_bar`:3982, `_refresh_garage`:3986, `_garage_step`:4011, `_garage_action`:4015, `_refresh_journal`:4035, `_visited_shops`:4068, `_build_panels`:4075, `_build_player`:4235, `_build_car`:4273, `_try_model`:4302

## 4314-4998  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4315, `_kshader`:4389, `_ksync`:4395, `_kskin`:4410, `_make_kperson`:4416, `_hat_y`:4480, `_sit_drop`:4483, `_kplay`:4486, `_kpeople_tick`:4496, `_pose_person`:4525, `_pose_limbs`:4542, `_person_lift`:4604, `_snap_crowd_feet`:4617, `_people_life_tick`:4633, `_life_one`:4670, `_cull_person`:4680, `_recolor_car_model`:4688, `_apply_car_model`:4702, `_landmark`:4722, `_label`:4732, `_button`:4739, `_panel`:4751, `_build_hud`:4761

## 4999-5117  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:5005, `_menu_tab`:5011, `_watch_tick`:5034, `_watch_count`:5076, `_online_pill_tap`:5083, `_online_pill_tick`:5089, `online_config_ok`:5115

## 5118-5155  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5121, `_offroad`:5127, `_ground_near`:5140, `_collectibles_on_road`:5147

## 5156-5295  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5168, `_build_quest_offer`:5172, `_quest_offer_tick`:5202, `_quest_auto_pick`:5252, `_quest_accept`:5267, `_quest_decline`:5281, `_quest_stop`:5287

## 5296-5663  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5320, `_holo_material`:5329, `_build_future`:5337, `_build_neon`:5351, `_model_profile`:5420, `_model_body_box`:5443, `_build_holograms`:5457, `_holo_tick`:5507, `_build_sky_traffic`:5524, `_sky_hover_car`:5542, `_sky_drone`:5589, `_sky_traffic_tick`:5633, `_future_lights`:5652

## 5664-6163  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5723, `_crew_col`:5731, `_peer_crewmate`:5734, `_set_ring_color`:5737, `_level_color`:5764, `_tier_color`:5777, `_my_ach_tier`:5780, `_style_ring`:5787, `_social_peer_extras`:5835, `_social_tag`:5849, `_my_tag_extra`:5861, `_soc_send`:5874, `_social_msg`:5889, `_social_accept`:5928, `_social_go`:5949, `_soc_friend`:5968, `_soc_invite`:5975, `_soc_goto`:5980, `_soc_high_five`:5988, `_soc_gift`:6008, `_soc_crew_invite`:6025, `_gift_day_check`:6032, `_crew_create`:6038, `_crew_cycle_color`:6048, `_crew_leave`:6053, `_crew_mate_near`:6061, `_crew_board`:6069, `_build_social`:6088, `_social_online`:6150, `_open_social`:6154, `_close_social`:6160

## 6164-6414  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6167, `_track_pos`:6176, `_social_row_button`:6187, `_refresh_social`:6194, `_on_dance_floor`:6256, `_toggle_dance`:6259, `_build_dance_floor`:6267, `_social_tick`:6293, `_photo`:6365

## 6415-6910  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6437, `_game_state`:6445, `_build_arcade`:6457, `_c4_empty`:6508, `_c4_drop_row`:6514, `_c4_winner`:6520, `_c4_bot_move`:6541, `_c4_code`:6570, `_c4_ready`:6576, `_c4_tap`:6579, `_c4_check`:6600, `_c4_tick`:6624, `_rx_ready`:6651, `_rx_start`:6654, `_rx_tap`:6668, `_rx_send_time`:6693, `_rx_resolve`:6700, `_rx_tick`:6726, `_mem_start`:6741, `_mem_tap`:6757, `_mem_finish`:6772, `_mem_tick`:6788, `_mem_board_text`:6795, `_build_arcade_panel`:6806, `_refresh_arcade_panel`:6849

## 6911-7204  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6974, `_quiz_slot`:6977, `_quiz_question`:6987, `_quiz_bot_score`:7016, `_in_quiz`:7025, `_build_quiz`:7028, `_quiz_answer`:7098, `_quiz_msg`:7111, `_quiz_board`:7119, `_quiz_tick`:7129, `_quiz_refresh`:7171

## 7205-8782  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7376, `_sites_found`:7379, `_sites_total`:7382, `_bits`:7385, `_ach_value`:7392, `_ach_tick`:7447, `_ach_check`:7472, `_ach_by_id`:7508, `_ach_msg`:7514, `_build_ach`:7527, `_ach_show`:7558, `_open_ach`:7578, `_close_ach`:7584, `_refresh_ach`:7588, `_ach_num`:7619, `_minimap_tap`:7622, `_menu_go`:7629, `_menu_stay`:7634, `_menu_call_car`:7638, `_toggle_clean_hud`:7644, `_refresh_menu_buttons`:7650, `_clean_hud_tick`:7660, `_draw_joystick`:7701, `_input`:7706, `_touch_text_focus`:7797, `_stick_zone`:7817, `_notification`:7821, `_physics_process`:7838, `_follow_camera`:7989, `_follow_walk_camera`:8025, `_interact`:8048, `_refresh_hud`:8210, `_open_panel`:8339, `_layout_panels`:8369, `_toggle_menu`:8396, `_rescue`:8442, `_show_toast`:8474, `_save_progress`:8478, `_load_progress`:8573

## 8783-11351  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8784, `_radio_voice`:8787, `_radio_make`:8820, `_radio_set`:8891, `_radio_play`:8913, `_radio_next`:8918, `_radio_talk_line`:8922, `_radio_caption`:8943, `_radio_refresh`:8951, `_process`:8964, `_build_peds`:9015, `_update_peds`:9126, `_update_ped`:9145, `_smoke_test`:9199, `_smoke_chase`:9852, `_smoke_orole`:9885, `_smoke_levels`:9914, `_smoke_bus`:9955, `_smoke_chase_extras`:10040, `_smoke_marina`:10068, `_blocked_at`:10170, `_blocker`:10185, `_on_screen`:10198, `_wait_radio`:10203, `_smoke_radio_peds`:10210, `_smoke_typed_chat`:10280, `_smoke_chat_touch`:10299, `_smoke_cafe`:10320, `_smoke_boutique`:10346, `_smoke_models`:10374, `_smoke_garage_ridge`:10398, `_save_shot`:10774, `_tracker_shots`:10784, `_infected_shots`:10818, `_paris_shots`:10869, `_people_shots`:11099, `_shots`:11140, `_shot_car`:11334, `_capture_preview`:11344

## 11352-12000  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11419, `_downtown_count`:11422, `_nearest_downtown`:11429, `_check_downtown`:11443, `_discover_downtown`:11456, `_box_batch`:11470, `_model_batch`:11490, `_cut_ranges`:11544, `_dt_ranges`:11556, `_dt_has`:11563, `_dt_near_cross`:11569, `_place`:11575, `_signal_pole`:11586, `_cyl_batch`:11605, `_city_signals`:11629, `_ensure_light_mats`:11680, `_city_lamps`:11690, `_build_downtown`:11734, `_dt_block`:11934, `_downtown_token`:11940, `_build_park`:11957, `_build_plaza`:11986

## 12001-12104  old city and Bay details

`_build_city_detail`:12002

## 12105-12514  traffic

`_build_traffic`:12106, `_path_sample`:12201, `_light_look`:12215, `_light_green`:12223, `_traffic_place`:12227, `_traffic_blocked_by`:12239, `_traffic_tick`:12251, `_smoke_downtown`:12357, `_skyline_shot`:12469, `_skyline_shots`:12477

## 12515-12875  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12561, `_web_scale`:12624, `_web_fps_tick`:12634, `_world_to_uv`:12651, `_map_angle`:12654, `_build_minimap`:12662, `_open_map`:12735, `_close_map`:12746, `_mini_point`:12753, `_site_markers`:12757, `_draw_arrow`:12789, `_draw_minimap`:12796, `_draw_full_map`:12843, `_minimap_tick`:12868

## 12876-13136  camera views

`_build_view_controls`:12877, `_cycle_view`:12919, `_apply_view`:12929, `_hide_labels`:12970, `_unfade`:12976, `_bake_map`:12982, `_shot_stats`:13032, `_view_shots`:13035, `_smoke_views`:13076

## 13137-13384  v0.17.0: level-up celebration

`_build_level_fx`:13148, `_draw_level_rays`:13185, `_level_fx_tick`:13195, `_level_sound`:13200, `_fx_material`:13242, `_level_up_fx`:13250, `_smoke_level_fx`:13351, `_levelup_shots`:13360

## 13385-13504  v0.18.0: walk-in stadium

`_collider_yaw`:13390, `_build_stadium_walls`:13401, `_look`:13429, `_smoke_stadium_eye`:13438, `_stadium_shots`:13474

## 13505-13666  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13529, `_arrow_mesh`:13541, `_build_guidance`:13564, `_guide_target`:13589, `_guidance_tick`:13618, `_draw_hud_arrow`:13644

## 13667-13852  checkpoints

`_build_checkpoints`:13668, `_refresh_checkpoints`:13713, `_check_checkpoints`:13719, `_activate_checkpoint`:13729, `_checkpoint_spawn`:13750, `_spawn_at_checkpoint`:13755, `_draw_checkpoint_icon`:13771, `_smoke_guidance_checkpoints`:13777, `_guide_shots`:13827

## 13853-14131  v0.18.0: Harbor Dome social hub

`_hub_seat`:13911, `_build_hub`:13915

## 14132-14182  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14133, `_xm_mesh`:14142, `_xm_tree`:14150

## 14183-14506  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14186, `_gt_surface`:14201, `_xm_grand_tree`:14211, `_lux_mat`:14326, `_lux_part`:14342, `_lux_box`:14345, `_lux_cyl`:14350, `_lux_ball`:14358, `_lux_new`:14366, `_lux_commit`:14371, `_lux_sofa_mesh`:14375, `_lux_chair_mesh`:14405, `_lux_table_mesh`:14425, `_lux_pouf_mesh`:14440, `_lux_batch`:14455, `_hub_christmas`:14471

## 14507-14662  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14508

## 14663-14911  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14666, `_vx_cyl`:14673, `_vx_ball`:14681, `_vx_ring`:14689, `_hub_polish`:14697, `_hub_gate`:14720, `_hub_vip`:14782, `_hub_glass`:14895

## 14912-15126  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14913, `_build_hub_bots`:14938, `_seat_of`:14969, `_bubble`:14979, `_emote`:15035, `_hub_people_tick`:15049

## 15127-15245  seats

`_seat_taken`:15128, `_nearest_seat`:15136, `_seat_label`:15148, `_sit`:15164, `_stand_up`:15208, `_seated_tick`:15227

## 15246-15402  game panel

`_build_game_panel`:15247, `_open_game_panel`:15302, `_refresh_game_panel`:15321, `_play_robot`:15366, `_peer_at`:15380, `_opponent_name`:15387, `_pay`:15395

## 15403-15523  tic-tac-toe

`_ttt_ready`:15406, `_ttt_winner`:15412, `_ttt_bot_move`:15422, `_ttt_tap`:15448, `_ttt_code`:15468, `_ttt_check`:15474, `_ttt_tick`:15497

## 15524-15575  rock paper scissors

`_rps_ready`:15525, `_rps_pick`:15531, `_rps_resolve`:15549, `_rps_tick`:15573

## 15576-15658  online table messages

`_online_game_send`:15577, `_hub_game_msg`:15583

## 15659-15734  comedy show

`_joke_start`:15660, `_joke_tick`:15672, `_speak`:15698, `_play_rimshot`:15707

## 15735-16634  quick chat and emotes

`_build_chat`:15757, `_chat_toggle_to`:15874, `_chat_log_add`:15882, `_chat_area`:15888, `_chat_near_count`:15906, `_chat_tick`:15915, `_toggle_chat`:15964, `_chat_fit`:15979, `_chat_clean`:15985, `_chat_wrap`:16002, `_chat_send_text`:16024, `_typing`:16047, `_say`:16050, `_do_emote`:16066, `_smoke_hub`:16075, `_chat_shots`:16249, `_cafe_shots`:16274, `_shop_shots`:16322, `_car_shots`:16371, `_outfit_shots`:16402, `_hub_shots`:16450, `_sg_on_terrace`:16585, `_people_only`:16588, `_people_only_keep_cars_out`:16592, `_car_barrier`:16604, `_hub_keep_cars_out`:16618

## 16635-16797  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16644, `_feed_add`:16653, `_feed_render`:16659, `_feed_tick`:16687, `_online_event_send`:16696, `_at_pvp_table`:16703, `_game_name`:16710, `_send_lfp`:16713, `_lfp_msg`:16730, `_accept_invite`:16751

## 16798-17039  v0.18.2: nickname and HUD relayout

`_nick_rude`:16810, `_clean_nick`:16825, `_build_nick_panel`:16837, `_open_nick`:16875, `_random_nick`:16884, `_save_nick`:16890, `_close_nick`:16909, `_refresh_nick_button`:16918, `_relayout_hud`:16922, `_smoke_nick`:16959, `_nick_shots`:16991, `_smoke_sites_reachable`:17009

## 17040-17327  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17066, `_nearest_civic`:17073, `_check_civic`:17087, `_discover_civic`:17100, `_civ_ranges`:17113, `_civ_has`:17127, `_civ_near_cross`:17133, `_build_civic`:17139, `_civic_token`:17265, `_civic_shots`:17282, `_hub_focus`:17304

## 17328-17437  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17399, `_in_rw_lot`:17402, `_box_batch_rot`:17405, `_multi_collider`:17423

## 17438-17765  circuit geometry

`_cr_point`:17439, `_rw_build_path`:17453, `_rw_dir`:17481, `_rw_bend`:17486, `_ribbon`:17492, `_rw_band`:17512, `_rw_keepout`:17530, `_build_raceway`:17539, `_build_rw_parking`:17573, `_build_rw_pits`:17618, `_build_rw_track`:17655, `_build_rw_trackside`:17696

## 17766-17863  race car rental

`_model_key`:17767, `_race_car_start`:17770, `_tint_ghost`:17808, `_race_car_end`:17821, `_race_keep_cars_out`:17846

## 17864-17878  speed effects

`_eff_max`:17865, `_eff_accel`:17876

## 17879-17929  track helpers

`_rw_seg_progress`:17880, `_rw_track_dist`:17900, `_rw_point_dist`:17911, `_rw_player_progress`:17918, `_rw_target`:17924

## 17930-18166  events

`_rec_stop`:17931, `_rw_place`:17947, `_rw_grid_pos`:17954, `_rw_start`:17959, `_rw_spawn_ai`:17991, `_rw_ai_place`:18015, `_rw_tick`:18026, `_rw_ai_tick`:18079, `_rw_lap_done`:18121, `_rw_finish`:18133, `_rw_fmt`:18164

## 18167-18219  boosters and spikes

`_rw_buy`:18168, `_rw_use_boost`:18186, `_rw_use_spike`:18194, `_rw_drop_spike_at`:18205

## 18220-18277  online races

`_race_msg`:18221, `_join_race`:18243

## 18278-18633  raceway panel, HUD, board

`_build_raceway_ui`:18279, `_rw_layout`:18339, `_rw_open`:18346, `_rw_close`:18352, `_rw_refresh_panel`:18356, `_rw_refresh_board`:18369, `_rw_hud`:18381, `_peer_car_model`:18405, `_smoke_raceway`:18415, `_race_shots`:18596

## 18634-18841  v0.22.0: Call Car

`_call_block_reason`:18640, `_call_spot`:18657, `_call_car`:18688, `_play_horn`:18712, `_smoke_follow_call`:18736, `_follow_shots`:18809

## 18842-19299  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18867, `_place_portal_button`:18873, `_portal_pressed`:18880, `_build_travel`:18888, `_toggle_run`:18993, `_refresh_run`:18997, `_hud_v23_tick`:19005, `_travel_block_reason`:19037, `_travel_open`:19057, `_open_travel`:19063, `_open_worlds`:19069, `_open_case`:19075, `_case_step`:19087, `_case_refresh`:19091, `_case_submit`:19095, `_close_case`:19104, `_sky_go`:19108, `_close_worlds`:19118, `_refresh_worlds`:19122, `_world_go`:19128, `_close_travel`:19135, `_refresh_travel`:19139, `_travel_to`:19147, `_smoke_travel`:19174, `_v23_shots`:19212

## 19300-19373  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19307, `_qr_button`:19322, `_qr_layout`:19361, `_smoke_qr`:19367

## 19374-19810  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19394, `_open_crate`:19410, `_build_crate_ui`:19427, `_crate_pick`:19514, `_crate_reveal`:19537, `_crate_draw_car`:19564, `_crate_confetti`:19583, `_crate_sound`:19608, `_crate_drive`:19634, `_feed_add_system`:19664, `_smoke_crate`:19667, `_crate_shots`:19715

## 19811-20302  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19852, `_quick_today`:19857, `_quick_is_done`:19860, `_quick_left`:19863, `_quick_next`:19870, `_quick_fix_target`:19883, `_quick_daily_check`:19897, `_quick_complete`:19911, `_quick_side`:19945, `_build_quick_props`:19963, `_daily_shots`:20115, `_quick_props_refresh`:20157, `_quick_fx`:20161, `_play_coin`:20177, `_smoke_quick`:20194

## 20303-20453  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20312, `_quest_nearby`:20367, `_open_quests`:20374, `_close_quests`:20381, `_refresh_quests`:20385, `_quest_pick`:20411, `_quest_mode`:20425, `_smoke_quests`:20428

## 20454-20488  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20458, `_my_tag_tick`:20461

## 20489-20803  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20506, `_fc_torus`:20516, `_fc_pearl`:20524, `_fc_chrome`:20534, `_fc_glass`:20543, `_fc_glow`:20553, `_fc_ghost`:20562, `_fc_holo`:20574, `_fc_mesh`:20584, `_fc_sphere`:20604, `_fc_capsule`:20612, `_fc_cone`:20620, `_build_food_court`:20629, `_food_court_tick`:20783

## 20804-21125  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20833, `_cm_bench`:20849, `_build_commons`:20862, `_commons_tick`:21084

## 21126-21440  v0.36: the daily puzzle

`_pz_today`:21149, `_pz_new`:21152, `_pz_neighbours`:21197, `_pz_flip`:21207, `_pz_done`:21212, `_pz_tap`:21220, `_pz_win`:21236, `_pz_reset`:21257, `_puzzle_near`:21261, `_open_puzzle`:21266, `_close_puzzle`:21274, `_pz_refresh_sign`:21278, `_build_puzzle_panel`:21286, `_pz_draw`:21317, `_smoke_chat`:21358, `_smoke_feet`:21396, `_smoke_commons`:21417

## 21441-21629  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21503, `_bio_theta`:21507, `_bio_sec_n`:21512, `_bio_sec_of`:21515, `_bio_pt`:21518, `_bio_lp`:21523, `_bio_la`:21527, `_bio_dir`:21531, `_bio_hex_r`:21534, `_bio_apo`:21539, `_bio_open_angles`:21545, `_bio_si`:21555, `_bm`:21561, `_bsph`:21566, `_blow`:21569, `_bcone`:21580, `_bbox`:21583, `_bp`:21586, `_bq`:21591, `_bio_glass_mat`:21595, `_bio_water_mat`:21608, `_bio_mat`:21620

## 21630-22002  building blocks

`_bio_inst`:21631, `_bio_add`:21637, `_bio_model`:21640, `_bio_nature_mesh`:21646, `_bio_flush`:21680, `_bio_bar`:21715, `_bio_slab`:21728, `_bio_body`:21743, `_bio_cyl_col`:21756, `_bio_hexmesh`:21769, `_bio_hexslab`:21781, `_bio_hexpt`:21787, `_bio_gridshell`:21794, `_bio_rail`:21901, `_bio_rail_arc`:21906, `_bio_disc_deck`:21918, `_bio_ring_deck`:21924, `_bio_helix`:21935, `_bio_pillar`:21955, `_bio_cafe`:21961, `_bio_fence_line`:21975, `_bio_fence_seg`:21980, `_bio_pen`:21990

## 22003-22504  building

`_build_biosphere`:22004, `_build_biosphere_legacy`:22008, `_bio_text`:22170, `_bio_plaque`:22188, `_bio_ticket_hall`:22202, `_on_foot_collision_guard`:22258, `_bio_inside`:22268, `_bio_pass_ok`:22271, `_ticket_near`:22275, `_bio_buy_pass`:22280, `_bio_gates_update`:22296, `_bio_gate_tick`:22322, `_bio_tunnel`:22334, `_bio_grounds`:22387, `_bio_dome`:22433, `_bio_deck_mats`:22501

## 22505-22660  garden planting

`_bio_free`:22506, `_bio_spot`:22523, `_bio_garden`:22531, `_bio_pine`:22572, `_bio_tree`:22575, `_bio_big_tree`:22585, `_bio_rock`:22590, `_bio_pond`:22593, `_bio_particles`:22597, `_bio_mist`:22625, `_bio_mini_dome`:22654

## 22661-23068  the four layouts

`_bio_winter`:22662, `_bio_spring`:22754, `_bio_summer`:22879, `_bio_autumn`:22963

## 23069-23339  animals

`_bio_spawn`:23070, `_bio_load_animal`:23142, `_bio_make_quad`:23163, `_bio_load_bird`:23240, `_bio_make_penguin`:23260, `_bio_make_bird`:23282, `_bio_make_flamingo`:23306, `_bio_make_butterfly`:23327

## 23340-23471  animation, spotting and rewards

`_bio_stuck_check`:23345, `_biosphere_tick`:23363, `_bio_animate`:23372, `_bio_spot_check`:23452, `_bio_spotted`:23464, `_smoke_biosphere`:23468

## 23472-23989  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23559, `_wear_piece`:23562, `_wear_mat`:23585, `_person_index`:23601, `_dress`:23624, `_smoke_style`:23730, `_style_shots`:23881, `_npc_look`:23953

## 23990-24143  your look: apply, save, share

`_look_clean`:23994, `_look_pack`:24009, `_owns`:24015, `_apply_look`:24020, `_relic_model`:24031, `_fc_mesh_mat`:24096, `_relic_refresh`:24099, `_relic_tick`:24113, `_peer_style`:24124

## 24144-24571  stores and the wardrobe

`_style_today`:24163, `_style_items`:24166, `_style_cat`:24174, `_style_price`:24177, `_style_deal`:24191, `_style_price_base`:24204, `_relic_stock`:24211, `_build_style_panel`:24223, `_open_store`:24263, `_open_wardrobe`:24282, `_style_close`:24285, `_style_finish`:24289, `_sync_old_avatar`:24304, `_style_tabs_for`:24311, `_refresh_style`:24316, `_style_body_rows`:24467, `_style_set_tab`:24484, `_style_step`:24488, `_style_color`:24493, `_style_pick`:24498, `_style_buy`:24533, `_ach_relics_check`:24555, `_style_face_camera`:24560

## 24572-25039  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24608, `_ga_text`:24614, `_ga_box`:24631, `_build_galleria`:24647, `_ga_inner_tick`:24788, `_ga_shell`:24804, `_ga_inside`:24854, `_bio_cyl_col_on`:24857, `_ga_models`:24869, `_ga_lbox`:24884, `_ga_ltext`:24898, `_ga_store`:24905, `_bio_cafe_on`:25007, `_ga_mannequins`:25015

## 25040-25191  featured outfits and the Sky Run

`_ga_featured_look`:25053, `_build_ga_fun`:25074, `_ga_fun_tick`:25119, `_sky_finish`:25146, `_extra_near`:25165, `_extra_open`:25174, `_store_near`:25183

## 25192-25288  v0.41: THE SKY GARDEN

`_sg_now`:25246, `_sg_progress`:25249, `_sg_time`:25255, `_sg_stock`:25262, `_sg_mut_roll`:25277

## 25289-25426  building

`_sg_box`:25290, `_sg_text`:25296, `_build_sky_garden`:25310, `_sg_seed_spot`:25421, `_sg_codex_spot`:25424

## 25427-25607  plants

`_sg_plant_model`:25428, `_sg_refresh_all`:25533, `_sg_refresh`:25537, `_sky_garden_tick`:25573, `_sg_ready_count`:25592, `_sg_boot_note`:25599

## 25608-25727  interacting

`_sg_near`:25609, `_sg_button_text`:25632, `_sg_value`:25645, `_sg_interact`:25649, `_sg_buy`:25665, `_sg_plant`:25687, `_sg_harvest`:25698

## 25728-25971  the garden screen

`_build_sg_panel`:25729, `_sg_open`:25764, `_sg_close`:25773, `_sg_row`:25777, `_sg_refresh_panel`:25792, `_sg_pick_buy`:25837, `_sg_pick_plant`:25841, `_smoke_car_barriers`:25847, `_smoke_sky_garden`:25888

## 25972-26010  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26003, `_pass_day`:26006

## 26011-26042  album

`_album_pages`:26012, `_album_claim`:26027

## 26043-26094  season

`_season_index`:26044, `_season_tick`:26047, `_season_xp`:26056, `_season_tier`:26059, `_season_reward`:26062, `_season_claim`:26076

## 26095-26102  Harbor Night

`_harbor_night`:26096

## 26103-26134  check-in calendar

`_cal_tick`:26104

## 26135-26311  the panel

`_build_hp_panel`:26136, `_open_pass`:26171, `_hp_open`:26174, `_hp_close`:26181, `_hp_row`:26185, `_hp_bar`:26200, `_hp_refresh`:26204, `_smoke_pass`:26249

## 26312-26526  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26316, `_cash_pill_tick`:26324, `_build_lb`:26362, `_open_lb`:26405, `_close_lb`:26413, `_lb_pick`:26417, `_lb_headers`:26422, `_lb_url`:26426, `_lb_me`:26429, `_lb_tick`:26432, `_lb_upload`:26440, `_lb_fetch`:26450, `_lb_got`:26458, `_lb_value`:26469, `_lb_refresh_ui`:26480

## 26527-26950  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26551, `_market_near`:26628, `_build_gear`:26638, `_gear_piece`:26646, `_build_pet`:26691, `_market_apply`:26733, `_market_tick`:26757, `_build_market_panel`:26779, `_open_market`:26805, `_close_market`:26812, `_refresh_market`:26816, `_market_pick`:26869, `_toggle_board`:26907, `_board_tick`:26914

## 26951-27192  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26983, `_ds_label`:27002, `_build_display`:27016, `_ds_got`:27095, `_ds_sorted`:27104, `_ds_render_board`:27118, `_ds_render_news`:27144, `_display_tick`:27163

## 27193-27371  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27210, `_toggle_streamer`:27297, `_streamer_badge_tap`:27313, `_streamer_tick`:27317

## 27372-27408  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27378, `_car_back`:27385, `_car_park_tick`:27392

## 27409-27505  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27413, `_bus_eta`:27467, `_bus_displays_tick`:27483

## 27506-27797  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27524, `_treasure_pick`:27527, `_treasure_spot`:27536, `_treasure_district`:27540, `_treasure_clue`:27552, `_treasure_prop`:27565, `_tp_part`:27568, `_tp_sphere`:27578, `_tp_cyl`:27586, `_treasure_prop_side`:27595, `_build_treasure_props`:27607, `_build_treasure`:27651, `_treasure_dir_char`:27720, `_treasure_tick`:27729, `_treasure_claim`:27783

## 27798-27898  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27799, `_halo_mat`:27831, `_smoke_treasure`:27856

## 27899-28222  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27920, `_fm_send`:27923, `_fm_area`:27929, `_fm_glow_mesh`:27945, `_fm_block_reason`:27963, `_fm_start`:27975, `_fm_announce`:28003, `_fm_finish`:28006, `_fm_msg`:28024, `_fm_check_paid`:28075, `_fm_tick`:28093, `_smoke_findme`:28149

## 28223-28333  v0.24.2: road map (for moving people off the road)

`_floor_note`:28229, `_floor_disc`:28243, `_floor_top`:28252, `_ground_at`:28270, `_note_road`:28288, `_on_road`:28295, `_ped_curb`:28305, `_curb_spot`:28315

## 28334-28629  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28356, `_ex_grid`:28364, `_ex_lamps`:28399, `_ex_umbrella`:28422, `_ex_yards`:28429, `_build_expansion`:28444, `_expand_shots`:28607

## 28630-28824  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28671, `_v27_near_cross`:28763, `_v27_near_any_road`:28770, `_v27_in_district`:28776, `_sea_tick`:28790, `_sea_tow`:28809

## 28825-29492  Harbor Loop sky train

`_sky_build_path`:28876, `_sky_pos`:28917, `_sky_dir`:28931, `_sky_project`:28936, `_sky_trip_time`:28955, `_sky_trip_dist`:28961, `_sky_now`:28972, `_sky_state`:28975, `_sky_time_at_station`:28990, `_sky_next_arrival`:28997, `_build_skytrain`:29010, `_sky_make_car`:29162, `_sky_skin`:29199, `_sky_place_trains`:29219, `_sky_build_station`:29238, `_sky_near`:29303, `_sky_fmt`:29312, `_sky_enter`:29316, `_sky_leave_platform`:29334, `_sky_board`:29344, `_sky_alight`:29358, `_sky_action`:29372, `_sky_tick`:29389, `_sky_camera`:29429, `_tour_today`:29445, `_tour_stamp`:29448, `_sky_hud`:29471

## 29493-29866  Day and night

`_toggle_weather`:29576, `_refresh_weather_button`:29582, `_game_hour`:29588, `_day_key`:29600, `_night_setup`:29615, `_night_scan_mesh`:29705, `_daynight_tick`:29730, `_daynight_apply`:29739, `_daynight_lights`:29851, `_cycle_day_mode`:29856, `_refresh_time_button`:29863

## 29867-30504  v0.27 smoke test and screenshots

`_smoke_v27`:29868, `_city_shots`:30073

## 30505-30921  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30539, `_ap_plane`:30715, `_ap_truck`:30735, `_ap_baggage_train`:30776, `_ap_loop_pos`:30789, `_ap_loop_len`:30805, `_ap_flight_at`:30811, `_ap_tick`:30835, `_airport_ped_plan`:30858, `_smoke_airport`:30878

## 30922-31435  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30936, `_nav_spot`:30943, `_nav_idx`:30947, `_nav_pos`:30954, `_nav_blocked`:30958, `_nav_nearest_free`:30968, `_nav_bfs`:30996, `_nav_build`:31040, `_stroller`:31111, `_stroll_place`:31127, `_stroll_next`:31148, `_nav_clear_line`:31182, `_stroll_aim`:31193, `_strollers_tick`:31225, `_smoke_strollers`:31320

## 31436-31596  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31471, `_dir_fmt`:31474, `_signpost_spot`:31477, `_build_signposts`:31494

## 31597-31693  the Directions panel and chip

`_build_dir_panel`:31598, `_open_dir`:31640, `_dir_close`:31649, `_dir_pick`:31653, `_dir_stop`:31658, `_dir_stop_and_close`:31663, `_dir_tick`:31667

## 31694-32235  v0.44: Grand Central

`_gc_mesh`:31723, `_gc_mat`:31756, `_gc_glass`:31765, `_gb`:31775, `_gb_solid`:31781, `_gb_flush`:31785, `_gc_tree`:31815, `_gc_text`:31820, `_gc_planter`:31835, `_gc_kiosk`:31841, `_goods_color`:31871, `_goods_mat`:31874, `_kiosk_goods`:31878, `_build_grand_central`:31956, `_build_gc_towers`:32124, `_gc_tick`:32219

## 32236-32527  v0.44: filling the empty land

`_loft`:32253, `_fill_clear`:32295, `_build_fill`:32305, `_hg_in_lake`:32353, `_hg_path`:32357, `_floor_note_rot`:32365, `_build_gardens`:32373, `_build_fan_plaza`:32483

## 32528-32562  v0.45: hover car underglow

`_car_underglow`:32531

## 32563-32727  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32564

## 32728-32759  v0.47: street stalls downtown

`_build_street_stalls`:32732, `_cull_people_in`:32752

## 32760-32858  v0.48: places that open as you level up

`_place_lock_of`:32773, `_place_root`:32779, `_place_unlocked`:32782, `_build_place_signs`:32790, `_places_refresh`:32835, `_places_tick`:32852

## 32859-32903  v0.50: city careers

`_career_rank_name`:32884, `_career_mult`:32887, `_career_block_reason`:32892, `_career_start`:32895, `_career_end`:32900

## 32904-32954  v0.52: careers as clear job loops

`_cid`:32931, `_career_target`:32945, `_career_tick`:32952

## 32955-32962  taxi

`_taxi_meter`:32956

## 32963-32966  paramedic

(no functions)

## 32967-32971  police

`_career_chase_over`:32969

## 32972-32977  firefighter

`_fire_aimed`:32973

## 32978-32987  the step bar

`_career_bar_text`:32981, `_career_hud`:32985

## 32988-33014  cut scenes

`_cs_skip`:33006

## 33015-33019  siren

(no functions)

## 33020-33031  the Careers panel

`_build_career_panel`:33021, `_open_careers`:33024, `_career_close`:33028

## 33032-33455  v0.50: homes

`_home_door_spots`:33072, `_build_homes`:33087, `_home_labels`:33116, `_home_door_near`:33125, `_home_origin`:33134, `_home_slot_near`:33137, `_home_exit_near`:33148, `_home_btn`:33155, `_home_interact`:33168, `_home_buy`:33187, `_home_default_layout`:33201, `_home_enter`:33209, `_home_leave`:33229, `_hm`:33237, `_home_build_room`:33256, `_home_refresh_room`:33365, `_furni_build`:33379

## 33456-33791  decorating

`_build_home_panels`:33457, `_open_homes`:33502, `_home_row_go`:33512, `_home_panel_close`:33532, `_deco_open`:33536, `_deco_pick`:33559, `_smoke_careers_homes`:33582

## 33792-33926  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33796, `_home_slots`:33804, `_home_ring`:33831, `_furni_cat`:33837, `_home_fix_layout`:33843, `_home_build_layout`:33871

## 33927-34360  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33990, `_ch_homes`:33996, `_ch_step_text`:34003, `_ch_step_done`:34014, `_ch_target`:34028, `_ch_finish_chapter`:34037, `_chapters_tick`:34059, `_hud_top_stack`:34099, `_build_chapters_ui`:34129, `_chapters_restart_ask`:34171, `_chapters_restart`:34174, `_chapters_text`:34184, `_open_chapters`:34204, `_chapters_close`:34211, `_smoke_chapters`:34215, `_step_sound`:34336

## 34361-34399  v0.51.1: join and leave messages

`_announce_join`:34368, `_announce_already_here`:34387, `_announce_leave`:34395

## 34400-34664  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34416, `_shot_tick`:34422, `_draw_shot_icon`:34454, `_shot_enter`:34463, `_shot_exit`:34477, `_shot_release_controls`:34489, `_shot_stick_zone`:34496, `_shot_input`:34499, `_smoke_photo`:34571

## 34665-34963  v0.51.3: stream joiners

`_viewer_count`:34685, `_stream_join_check`:34691, `_stream_join_start`:34698, `_sj_streamer`:34715, `_stream_join_tick`:34724, `_stream_join_land`:34748, `_sj_welcome`:34764, `_smoke_stream_join`:34798, `_career_shot`:34881

## 34964-35080  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34968, `_st_restore`:35006, `_smoke_streamer_clean`:35027, `_world_bio_passport`:35078

