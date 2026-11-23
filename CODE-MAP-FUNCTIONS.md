# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-573  Core (unlabelled)

`_symbol_font`:280, `_ready`:292, `_surf_texture`:516, `_surface_material`:538

## 574-646  v0.34.6: futuristic towers for the old city

`_future_tower`:578

## 647-725  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:654, `_skin_common`:689, `_future_wall`:697, `_future_roof`:711, `_future_pave`:719

## 726-786  v0.34.4: futuristic road surface

`_road_textures`:733, `_future_road`:767

## 787-1992  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:806, `_real_tex`:847, `_real_setup`:855, `_real_kind`:876, `_realify`:882, `_real_glass`:919, `_make_window_textures`:939, `_material`:972, `_box`:997, `_sign`:1019, `_build_world`:1031, `_future_kiosk`:1139, `_build_collectibles`:1165, `_auto_collect_tick`:1198, `_find_count`:1219, `_nearest_find`:1226, `_destination`:1240, `_toggle_activity`:1276, `_collect_find`:1305, `_owned_count`:1320, `_ridge_open`:1327, `_ridge_count`:1331, `_nearest_ridge`:1338, `_apply_car`:1352, `_tune_level`:1382, `_tune_cost`:1385, `_car_stats`:1391, `_buy_tune`:1398, `_open_tune`:1419, `_back_to_garage`:1425, `_refresh_tune`:1429, `_bay_open`:1440, `_area_open`:1443, `_bay_count`:1446, `_nearest_bay`:1453, `_build_bay`:1467, `_check_bay`:1520, `_discover_bay`:1533, `_north_count`:1546, `_north_open`:1553, `_nearest_north`:1556, `_check_north`:1570, `_discover_north`:1583, `_prop`:1596, `_collider`:1610, `_first_mesh`:1620, `_scatter`:1629, `_prop_stretch`:1663, `_north_token`:1672, `_nm_roads`:1699, `_prop_big`:1714, `_nm_near_cross`:1730, `_build_north`:1737, `_build_nm_blocks`:1854, `_build_north_landscape`:1939, `_nm_free`:1966, `_build_landscape`:1976

## 1993-2472  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:1994, `_online_toggle`:2008, `_online_autostart`:2034, `_online_connect`:2053, `_online_stop`:2060, `_online_next_ref`:2071, `_online_send`:2075, `_online_join_frame`:2079, `_online_pos_frame`:2082, `_online_tick`:2091, `_online_handle`:2125, `_online_clean_name`:2178, `_online_peer_update`:2187, `_online_make_peer`:2252, `_peer_look`:2293, `_online_tint`:2350, `_paint_mat`:2366, `_online_update_peers`:2378, `_online_clear_peers`:2458, `_online_refresh_button`:2463

## 2473-2645  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2553, `_marina_count`:2556, `_nearest_marina`:2563, `_check_marina`:2577, `_discover_marina`:2590, `_shop_available`:2603, `_nearest_shop`:2606, `_premium_cars`:2614, `_glass`:2621, `_shop_building`:2627, `_shop_pad`:2637

## 2646-3161  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2647, `_bus_last`:2650, `_build_bus`:2653, `_bus_boxes`:2680, `_bus_skin`:2690, `_bus_side`:2703, `_bus_reset`:2706, `_bus_text`:2715, `_bus_tick`:2720, `_bus_near`:2760, `_bus_board`:2771, `_bus_alight`:2786, `_build_marina`:2800, `_set_hat`:2906, `_build_hat`:2909, `_cyl`:2974, `_hat_part`:2983, `_apply_avatar`:2992, `_shop_count`:3004, `_shop_open`:3014, `_shop_step`:3032, `_shop_close`:3038, `_owned_text`:3051, `_refresh_shop`:3054, `_shop_action`:3107, `_journal_flip`:3158

## 3162-3216  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3173, `_xp`:3176, `_level_for`:3183, `_level`:3191, `_level_text`:3194, `_check_level`:3204

## 3217-3319  v0.11.0: online police vs thief

`_orole_ready`:3218, `_orole_start`:3221, `_orole_end`:3248, `_orole_tick`:3257

## 3320-4263  v0.10.0: chase mode (offline)

`_chase_open`:3321, `_chase_clear`:3326, `_chase_make_unit`:3340, `_chase_spawn_point`:3370, `_chase_start`:3379, `_chase_end`:3415, `_chase_steer`:3434, `_chase_roadblock`:3470, `_chase_heli_build`:3515, `_chase_extras`:3541, `_chase_tick`:3568, `_start_trial`:3632, `_cancel_trial`:3659, `_check_trial`:3664, `_finish_trial`:3681, `_trial_count`:3697, `_open_trials`:3704, `_refresh_trials`:3708, `_update_gate`:3720, `_slab`:3738, `_build_ridge`:3756, `_check_ridge`:3819, `_discover`:3832, `_mission_progress`:3846, `_check_missions`:3908, `_open_garage`:3919, `_open_journal`:3924, `_close_sub`:3929, `_bar`:3932, `_refresh_garage`:3936, `_garage_step`:3961, `_garage_action`:3965, `_refresh_journal`:3985, `_visited_shops`:4018, `_build_panels`:4025, `_build_player`:4185, `_build_car`:4223, `_try_model`:4252

## 4264-4930  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4265, `_kshader`:4339, `_ksync`:4345, `_kskin`:4360, `_make_kperson`:4366, `_hat_y`:4430, `_sit_drop`:4433, `_kplay`:4436, `_kpeople_tick`:4446, `_pose_person`:4475, `_pose_limbs`:4492, `_person_lift`:4554, `_snap_crowd_feet`:4567, `_people_life_tick`:4583, `_life_one`:4620, `_cull_person`:4630, `_recolor_car_model`:4638, `_apply_car_model`:4652, `_landmark`:4672, `_label`:4682, `_button`:4689, `_panel`:4701, `_build_hud`:4711

## 4931-5049  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4937, `_menu_tab`:4943, `_watch_tick`:4966, `_watch_count`:5008, `_online_pill_tap`:5015, `_online_pill_tick`:5021, `online_config_ok`:5047

## 5050-5087  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5053, `_offroad`:5059, `_ground_near`:5072, `_collectibles_on_road`:5079

## 5088-5227  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5100, `_build_quest_offer`:5104, `_quest_offer_tick`:5134, `_quest_auto_pick`:5184, `_quest_accept`:5199, `_quest_decline`:5213, `_quest_stop`:5219

## 5228-5595  v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5252, `_holo_material`:5261, `_build_future`:5269, `_build_neon`:5283, `_model_profile`:5352, `_model_body_box`:5375, `_build_holograms`:5389, `_holo_tick`:5439, `_build_sky_traffic`:5456, `_sky_hover_car`:5474, `_sky_drone`:5521, `_sky_traffic_tick`:5565, `_future_lights`:5584

## 5596-6095  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5655, `_crew_col`:5663, `_peer_crewmate`:5666, `_set_ring_color`:5669, `_level_color`:5696, `_tier_color`:5709, `_my_ach_tier`:5712, `_style_ring`:5719, `_social_peer_extras`:5767, `_social_tag`:5781, `_my_tag_extra`:5793, `_soc_send`:5806, `_social_msg`:5821, `_social_accept`:5860, `_social_go`:5881, `_soc_friend`:5900, `_soc_invite`:5907, `_soc_goto`:5912, `_soc_high_five`:5920, `_soc_gift`:5940, `_soc_crew_invite`:5957, `_gift_day_check`:5964, `_crew_create`:5970, `_crew_cycle_color`:5980, `_crew_leave`:5985, `_crew_mate_near`:5993, `_crew_board`:6001, `_build_social`:6020, `_social_online`:6082, `_open_social`:6086, `_close_social`:6092

## 6096-6346  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6099, `_track_pos`:6108, `_social_row_button`:6119, `_refresh_social`:6126, `_on_dance_floor`:6188, `_toggle_dance`:6191, `_build_dance_floor`:6199, `_social_tick`:6225, `_photo`:6297

## 6347-6842  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6369, `_game_state`:6377, `_build_arcade`:6389, `_c4_empty`:6440, `_c4_drop_row`:6446, `_c4_winner`:6452, `_c4_bot_move`:6473, `_c4_code`:6502, `_c4_ready`:6508, `_c4_tap`:6511, `_c4_check`:6532, `_c4_tick`:6556, `_rx_ready`:6583, `_rx_start`:6586, `_rx_tap`:6600, `_rx_send_time`:6625, `_rx_resolve`:6632, `_rx_tick`:6658, `_mem_start`:6673, `_mem_tap`:6689, `_mem_finish`:6704, `_mem_tick`:6720, `_mem_board_text`:6727, `_build_arcade_panel`:6738, `_refresh_arcade_panel`:6781

## 6843-7136  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6906, `_quiz_slot`:6909, `_quiz_question`:6919, `_quiz_bot_score`:6948, `_in_quiz`:6957, `_build_quiz`:6960, `_quiz_answer`:7030, `_quiz_msg`:7043, `_quiz_board`:7051, `_quiz_tick`:7061, `_quiz_refresh`:7103

## 7137-8615  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7308, `_sites_found`:7311, `_sites_total`:7314, `_bits`:7317, `_ach_value`:7324, `_ach_tick`:7379, `_ach_check`:7404, `_ach_by_id`:7440, `_ach_msg`:7446, `_build_ach`:7459, `_ach_show`:7490, `_open_ach`:7510, `_close_ach`:7516, `_refresh_ach`:7520, `_ach_num`:7551, `_minimap_tap`:7554, `_menu_go`:7561, `_menu_stay`:7566, `_menu_call_car`:7570, `_toggle_clean_hud`:7576, `_refresh_menu_buttons`:7582, `_clean_hud_tick`:7592, `_draw_joystick`:7633, `_input`:7638, `_stick_zone`:7715, `_notification`:7719, `_physics_process`:7734, `_follow_camera`:7882, `_follow_walk_camera`:7918, `_interact`:7941, `_refresh_hud`:8092, `_open_panel`:8213, `_layout_panels`:8239, `_toggle_menu`:8262, `_rescue`:8302, `_show_toast`:8334, `_save_progress`:8338, `_load_progress`:8421

## 8616-10759  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8617, `_radio_voice`:8620, `_radio_make`:8653, `_radio_set`:8724, `_radio_play`:8746, `_radio_next`:8751, `_radio_talk_line`:8755, `_radio_caption`:8776, `_radio_refresh`:8784, `_process`:8797, `_build_peds`:8846, `_update_peds`:8957, `_update_ped`:8976, `_smoke_test`:9030, `_smoke_chase`:9669, `_smoke_orole`:9702, `_smoke_levels`:9731, `_smoke_bus`:9772, `_smoke_chase_extras`:9857, `_smoke_marina`:9885, `_blocked_at`:9987, `_blocker`:10002, `_on_screen`:10015, `_wait_radio`:10020, `_smoke_radio_peds`:10027, `_smoke_models`:10097, `_smoke_garage_ridge`:10121, `_save_shot`:10497, `_people_shots`:10507, `_shots`:10548, `_shot_car`:10742, `_capture_preview`:10752

## 10760-11408  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10827, `_downtown_count`:10830, `_nearest_downtown`:10837, `_check_downtown`:10851, `_discover_downtown`:10864, `_box_batch`:10878, `_model_batch`:10898, `_cut_ranges`:10952, `_dt_ranges`:10964, `_dt_has`:10971, `_dt_near_cross`:10977, `_place`:10983, `_signal_pole`:10994, `_cyl_batch`:11013, `_city_signals`:11037, `_ensure_light_mats`:11088, `_city_lamps`:11098, `_build_downtown`:11142, `_dt_block`:11342, `_downtown_token`:11348, `_build_park`:11365, `_build_plaza`:11394

## 11409-11512  old city and Bay details

`_build_city_detail`:11410

## 11513-11922  traffic

`_build_traffic`:11514, `_path_sample`:11609, `_light_look`:11623, `_light_green`:11631, `_traffic_place`:11635, `_traffic_blocked_by`:11647, `_traffic_tick`:11659, `_smoke_downtown`:11765, `_skyline_shot`:11877, `_skyline_shots`:11885

## 11923-12275  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:11969, `_web_scale`:12024, `_web_fps_tick`:12034, `_world_to_uv`:12051, `_map_angle`:12054, `_build_minimap`:12062, `_open_map`:12135, `_close_map`:12146, `_mini_point`:12153, `_site_markers`:12157, `_draw_arrow`:12189, `_draw_minimap`:12196, `_draw_full_map`:12243, `_minimap_tick`:12268

## 12276-12533  camera views

`_build_view_controls`:12277, `_cycle_view`:12319, `_apply_view`:12329, `_hide_labels`:12367, `_unfade`:12373, `_bake_map`:12379, `_shot_stats`:12429, `_view_shots`:12432, `_smoke_views`:12473

## 12534-12781  v0.17.0: level-up celebration

`_build_level_fx`:12545, `_draw_level_rays`:12582, `_level_fx_tick`:12592, `_level_sound`:12597, `_fx_material`:12639, `_level_up_fx`:12647, `_smoke_level_fx`:12748, `_levelup_shots`:12757

## 12782-12901  v0.18.0: walk-in stadium

`_collider_yaw`:12787, `_build_stadium_walls`:12798, `_look`:12826, `_smoke_stadium_eye`:12835, `_stadium_shots`:12871

## 12902-13063  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:12926, `_arrow_mesh`:12938, `_build_guidance`:12961, `_guide_target`:12986, `_guidance_tick`:13015, `_draw_hud_arrow`:13041

## 13064-13249  checkpoints

`_build_checkpoints`:13065, `_refresh_checkpoints`:13110, `_check_checkpoints`:13116, `_activate_checkpoint`:13126, `_checkpoint_spawn`:13147, `_spawn_at_checkpoint`:13152, `_draw_checkpoint_icon`:13168, `_smoke_guidance_checkpoints`:13174, `_guide_shots`:13224

## 13250-13525  v0.18.0: Harbor Dome social hub

`_hub_seat`:13308, `_build_hub`:13312, `_hub_glass`:13509

## 13526-13733  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:13527, `_build_hub_bots`:13552, `_seat_of`:13583, `_bubble`:13593, `_emote`:13642, `_hub_people_tick`:13656

## 13734-13852  seats

`_seat_taken`:13735, `_nearest_seat`:13743, `_seat_label`:13755, `_sit`:13771, `_stand_up`:13815, `_seated_tick`:13834

## 13853-14009  game panel

`_build_game_panel`:13854, `_open_game_panel`:13909, `_refresh_game_panel`:13928, `_play_robot`:13973, `_peer_at`:13987, `_opponent_name`:13994, `_pay`:14002

## 14010-14130  tic-tac-toe

`_ttt_ready`:14013, `_ttt_winner`:14019, `_ttt_bot_move`:14029, `_ttt_tap`:14055, `_ttt_code`:14075, `_ttt_check`:14081, `_ttt_tick`:14104

## 14131-14182  rock paper scissors

`_rps_ready`:14132, `_rps_pick`:14138, `_rps_resolve`:14156, `_rps_tick`:14180

## 14183-14265  online table messages

`_online_game_send`:14184, `_hub_game_msg`:14190

## 14266-14341  comedy show

`_joke_start`:14267, `_joke_tick`:14279, `_speak`:14305, `_play_rimshot`:14314

## 14342-14880  quick chat and emotes

`_build_chat`:14359, `_chat_toggle_to`:14459, `_chat_log_add`:14467, `_chat_area`:14473, `_chat_near_count`:14491, `_chat_tick`:14500, `_toggle_chat`:14547, `_say`:14561, `_do_emote`:14575, `_smoke_hub`:14584, `_hub_shots`:14758, `_sg_on_terrace`:14831, `_people_only`:14834, `_people_only_keep_cars_out`:14838, `_car_barrier`:14850, `_hub_keep_cars_out`:14864

## 14881-15043  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:14890, `_feed_add`:14899, `_feed_render`:14905, `_feed_tick`:14933, `_online_event_send`:14942, `_at_pvp_table`:14949, `_game_name`:14956, `_send_lfp`:14959, `_lfp_msg`:14976, `_accept_invite`:14997

## 15044-15284  v0.18.2: nickname and HUD relayout

`_nick_rude`:15056, `_clean_nick`:15071, `_build_nick_panel`:15083, `_open_nick`:15121, `_random_nick`:15130, `_save_nick`:15136, `_close_nick`:15155, `_refresh_nick_button`:15164, `_relayout_hud`:15168, `_smoke_nick`:15204, `_nick_shots`:15236, `_smoke_sites_reachable`:15254

## 15285-15572  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:15311, `_nearest_civic`:15318, `_check_civic`:15332, `_discover_civic`:15345, `_civ_ranges`:15358, `_civ_has`:15372, `_civ_near_cross`:15378, `_build_civic`:15384, `_civic_token`:15510, `_civic_shots`:15527, `_hub_focus`:15549

## 15573-15682  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:15644, `_in_rw_lot`:15647, `_box_batch_rot`:15650, `_multi_collider`:15668

## 15683-16010  circuit geometry

`_cr_point`:15684, `_rw_build_path`:15698, `_rw_dir`:15726, `_rw_bend`:15731, `_ribbon`:15737, `_rw_band`:15757, `_rw_keepout`:15775, `_build_raceway`:15784, `_build_rw_parking`:15818, `_build_rw_pits`:15863, `_build_rw_track`:15900, `_build_rw_trackside`:15941

## 16011-16108  race car rental

`_model_key`:16012, `_race_car_start`:16015, `_tint_ghost`:16053, `_race_car_end`:16066, `_race_keep_cars_out`:16091

## 16109-16123  speed effects

`_eff_max`:16110, `_eff_accel`:16121

## 16124-16174  track helpers

`_rw_seg_progress`:16125, `_rw_track_dist`:16145, `_rw_point_dist`:16156, `_rw_player_progress`:16163, `_rw_target`:16169

## 16175-16411  events

`_rec_stop`:16176, `_rw_place`:16192, `_rw_grid_pos`:16199, `_rw_start`:16204, `_rw_spawn_ai`:16236, `_rw_ai_place`:16260, `_rw_tick`:16271, `_rw_ai_tick`:16324, `_rw_lap_done`:16366, `_rw_finish`:16378, `_rw_fmt`:16409

## 16412-16464  boosters and spikes

`_rw_buy`:16413, `_rw_use_boost`:16431, `_rw_use_spike`:16439, `_rw_drop_spike_at`:16450

## 16465-16522  online races

`_race_msg`:16466, `_join_race`:16488

## 16523-16878  raceway panel, HUD, board

`_build_raceway_ui`:16524, `_rw_layout`:16584, `_rw_open`:16591, `_rw_close`:16597, `_rw_refresh_panel`:16601, `_rw_refresh_board`:16614, `_rw_hud`:16626, `_peer_car_model`:16650, `_smoke_raceway`:16660, `_race_shots`:16841

## 16879-17086  v0.22.0: Call Car

`_call_block_reason`:16885, `_call_spot`:16902, `_call_car`:16933, `_play_horn`:16957, `_smoke_follow_call`:16981, `_follow_shots`:17054

## 17087-17386  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:17102, `_build_travel`:17107, `_toggle_run`:17149, `_refresh_run`:17153, `_hud_v23_tick`:17161, `_travel_block_reason`:17190, `_travel_open`:17210, `_open_travel`:17216, `_close_travel`:17222, `_refresh_travel`:17226, `_travel_to`:17234, `_smoke_travel`:17261, `_v23_shots`:17299

## 17387-17460  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:17394, `_qr_button`:17409, `_qr_layout`:17448, `_smoke_qr`:17454

## 17461-17897  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:17481, `_open_crate`:17497, `_build_crate_ui`:17514, `_crate_pick`:17601, `_crate_reveal`:17624, `_crate_draw_car`:17651, `_crate_confetti`:17670, `_crate_sound`:17695, `_crate_drive`:17721, `_feed_add_system`:17751, `_smoke_crate`:17754, `_crate_shots`:17802

## 17898-18389  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:17939, `_quick_today`:17944, `_quick_is_done`:17947, `_quick_left`:17950, `_quick_next`:17957, `_quick_fix_target`:17970, `_quick_daily_check`:17984, `_quick_complete`:17998, `_quick_side`:18032, `_build_quick_props`:18050, `_daily_shots`:18202, `_quick_props_refresh`:18244, `_quick_fx`:18248, `_play_coin`:18264, `_smoke_quick`:18281

## 18390-18540  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:18399, `_quest_nearby`:18454, `_open_quests`:18461, `_close_quests`:18468, `_refresh_quests`:18472, `_quest_pick`:18498, `_quest_mode`:18512, `_smoke_quests`:18515

## 18541-18575  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:18545, `_my_tag_tick`:18548

## 18576-18890  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:18593, `_fc_torus`:18603, `_fc_pearl`:18611, `_fc_chrome`:18621, `_fc_glass`:18630, `_fc_glow`:18640, `_fc_ghost`:18649, `_fc_holo`:18661, `_fc_mesh`:18671, `_fc_sphere`:18691, `_fc_capsule`:18699, `_fc_cone`:18707, `_build_food_court`:18716, `_food_court_tick`:18870

## 18891-19205  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:18913, `_cm_bench`:18929, `_build_commons`:18942, `_commons_tick`:19164

## 19206-19520  v0.36: the daily puzzle

`_pz_today`:19229, `_pz_new`:19232, `_pz_neighbours`:19277, `_pz_flip`:19287, `_pz_done`:19292, `_pz_tap`:19300, `_pz_win`:19316, `_pz_reset`:19337, `_puzzle_near`:19341, `_open_puzzle`:19346, `_close_puzzle`:19354, `_pz_refresh_sign`:19358, `_build_puzzle_panel`:19366, `_pz_draw`:19397, `_smoke_chat`:19438, `_smoke_feet`:19476, `_smoke_commons`:19497

## 19521-19709  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:19583, `_bio_theta`:19587, `_bio_sec_n`:19592, `_bio_sec_of`:19595, `_bio_pt`:19598, `_bio_lp`:19603, `_bio_la`:19607, `_bio_dir`:19611, `_bio_hex_r`:19614, `_bio_apo`:19619, `_bio_open_angles`:19625, `_bio_si`:19635, `_bm`:19641, `_bsph`:19646, `_blow`:19649, `_bcone`:19660, `_bbox`:19663, `_bp`:19666, `_bq`:19671, `_bio_glass_mat`:19675, `_bio_water_mat`:19688, `_bio_mat`:19700

## 19710-20082  building blocks

`_bio_inst`:19711, `_bio_add`:19717, `_bio_model`:19720, `_bio_nature_mesh`:19726, `_bio_flush`:19760, `_bio_bar`:19795, `_bio_slab`:19808, `_bio_body`:19823, `_bio_cyl_col`:19836, `_bio_hexmesh`:19849, `_bio_hexslab`:19861, `_bio_hexpt`:19867, `_bio_gridshell`:19874, `_bio_rail`:19981, `_bio_rail_arc`:19986, `_bio_disc_deck`:19998, `_bio_ring_deck`:20004, `_bio_helix`:20015, `_bio_pillar`:20035, `_bio_cafe`:20041, `_bio_fence_line`:20055, `_bio_fence_seg`:20060, `_bio_pen`:20070

## 20083-20584  building

`_build_biosphere`:20084, `_build_biosphere_legacy`:20088, `_bio_text`:20250, `_bio_plaque`:20268, `_bio_ticket_hall`:20282, `_on_foot_collision_guard`:20338, `_bio_inside`:20348, `_bio_pass_ok`:20351, `_ticket_near`:20355, `_bio_buy_pass`:20360, `_bio_gates_update`:20376, `_bio_gate_tick`:20402, `_bio_tunnel`:20414, `_bio_grounds`:20467, `_bio_dome`:20513, `_bio_deck_mats`:20581

## 20585-20740  garden planting

`_bio_free`:20586, `_bio_spot`:20603, `_bio_garden`:20611, `_bio_pine`:20652, `_bio_tree`:20655, `_bio_big_tree`:20665, `_bio_rock`:20670, `_bio_pond`:20673, `_bio_particles`:20677, `_bio_mist`:20705, `_bio_mini_dome`:20734

## 20741-21148  the four layouts

`_bio_winter`:20742, `_bio_spring`:20834, `_bio_summer`:20959, `_bio_autumn`:21043

## 21149-21419  animals

`_bio_spawn`:21150, `_bio_load_animal`:21222, `_bio_make_quad`:21243, `_bio_load_bird`:21320, `_bio_make_penguin`:21340, `_bio_make_bird`:21362, `_bio_make_flamingo`:21386, `_bio_make_butterfly`:21407

## 21420-21549  animation, spotting and rewards

`_bio_stuck_check`:21425, `_biosphere_tick`:21443, `_bio_animate`:21450, `_bio_spot_check`:21530, `_bio_spotted`:21542, `_smoke_biosphere`:21546

## 21550-22067  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:21637, `_wear_piece`:21640, `_wear_mat`:21663, `_person_index`:21679, `_dress`:21702, `_smoke_style`:21808, `_style_shots`:21959, `_npc_look`:22031

## 22068-22216  your look: apply, save, share

`_look_clean`:22072, `_look_pack`:22087, `_owns`:22093, `_apply_look`:22098, `_relic_model`:22104, `_fc_mesh_mat`:22169, `_relic_refresh`:22172, `_relic_tick`:22186, `_peer_style`:22197

## 22217-22644  stores and the wardrobe

`_style_today`:22236, `_style_items`:22239, `_style_cat`:22247, `_style_price`:22250, `_style_deal`:22264, `_style_price_base`:22277, `_relic_stock`:22284, `_build_style_panel`:22296, `_open_store`:22336, `_open_wardrobe`:22355, `_style_close`:22358, `_style_finish`:22362, `_sync_old_avatar`:22377, `_style_tabs_for`:22384, `_refresh_style`:22389, `_style_body_rows`:22540, `_style_set_tab`:22557, `_style_step`:22561, `_style_color`:22566, `_style_pick`:22571, `_style_buy`:22606, `_ach_relics_check`:22628, `_style_face_camera`:22633

## 22645-23112  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:22681, `_ga_text`:22687, `_ga_box`:22704, `_build_galleria`:22720, `_ga_inner_tick`:22861, `_ga_shell`:22877, `_ga_inside`:22927, `_bio_cyl_col_on`:22930, `_ga_models`:22942, `_ga_lbox`:22957, `_ga_ltext`:22971, `_ga_store`:22978, `_bio_cafe_on`:23080, `_ga_mannequins`:23088

## 23113-23264  featured outfits and the Sky Run

`_ga_featured_look`:23126, `_build_ga_fun`:23147, `_ga_fun_tick`:23192, `_sky_finish`:23219, `_extra_near`:23238, `_extra_open`:23247, `_store_near`:23256

## 23265-23361  v0.41: THE SKY GARDEN

`_sg_now`:23319, `_sg_progress`:23322, `_sg_time`:23328, `_sg_stock`:23335, `_sg_mut_roll`:23350

## 23362-23499  building

`_sg_box`:23363, `_sg_text`:23369, `_build_sky_garden`:23383, `_sg_seed_spot`:23494, `_sg_codex_spot`:23497

## 23500-23680  plants

`_sg_plant_model`:23501, `_sg_refresh_all`:23606, `_sg_refresh`:23610, `_sky_garden_tick`:23646, `_sg_ready_count`:23665, `_sg_boot_note`:23672

## 23681-23800  interacting

`_sg_near`:23682, `_sg_button_text`:23705, `_sg_value`:23718, `_sg_interact`:23722, `_sg_buy`:23738, `_sg_plant`:23760, `_sg_harvest`:23771

## 23801-24044  the garden screen

`_build_sg_panel`:23802, `_sg_open`:23837, `_sg_close`:23846, `_sg_row`:23850, `_sg_refresh_panel`:23865, `_sg_pick_buy`:23910, `_sg_pick_plant`:23914, `_smoke_car_barriers`:23920, `_smoke_sky_garden`:23961

## 24045-24083  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:24076, `_pass_day`:24079

## 24084-24115  album

`_album_pages`:24085, `_album_claim`:24100

## 24116-24167  season

`_season_index`:24117, `_season_tick`:24120, `_season_xp`:24129, `_season_tier`:24132, `_season_reward`:24135, `_season_claim`:24149

## 24168-24175  Harbor Night

`_harbor_night`:24169

## 24176-24207  check-in calendar

`_cal_tick`:24177

## 24208-24384  the panel

`_build_hp_panel`:24209, `_open_pass`:24244, `_hp_open`:24247, `_hp_close`:24254, `_hp_row`:24258, `_hp_bar`:24273, `_hp_refresh`:24277, `_smoke_pass`:24322

## 24385-24599  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:24389, `_cash_pill_tick`:24397, `_build_lb`:24435, `_open_lb`:24478, `_close_lb`:24486, `_lb_pick`:24490, `_lb_headers`:24495, `_lb_url`:24499, `_lb_me`:24502, `_lb_tick`:24505, `_lb_upload`:24513, `_lb_fetch`:24523, `_lb_got`:24531, `_lb_value`:24542, `_lb_refresh_ui`:24553

## 24600-25023  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:24624, `_market_near`:24701, `_build_gear`:24711, `_gear_piece`:24719, `_build_pet`:24764, `_market_apply`:24806, `_market_tick`:24830, `_build_market_panel`:24852, `_open_market`:24878, `_close_market`:24885, `_refresh_market`:24889, `_market_pick`:24942, `_toggle_board`:24980, `_board_tick`:24987

## 25024-25265  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:25056, `_ds_label`:25075, `_build_display`:25089, `_ds_got`:25168, `_ds_sorted`:25177, `_ds_render_board`:25191, `_ds_render_news`:25217, `_display_tick`:25236

## 25266-25444  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:25283, `_toggle_streamer`:25370, `_streamer_badge_tap`:25386, `_streamer_tick`:25390

## 25445-25481  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:25451, `_car_back`:25458, `_car_park_tick`:25465

## 25482-25578  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:25486, `_bus_eta`:25540, `_bus_displays_tick`:25556

## 25579-25870  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:25597, `_treasure_pick`:25600, `_treasure_spot`:25609, `_treasure_district`:25613, `_treasure_clue`:25625, `_treasure_prop`:25638, `_tp_part`:25641, `_tp_sphere`:25651, `_tp_cyl`:25659, `_treasure_prop_side`:25668, `_build_treasure_props`:25680, `_build_treasure`:25724, `_treasure_dir_char`:25793, `_treasure_tick`:25802, `_treasure_claim`:25856

## 25871-25971  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:25872, `_halo_mat`:25904, `_smoke_treasure`:25929

## 25972-26295  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:25993, `_fm_send`:25996, `_fm_area`:26002, `_fm_glow_mesh`:26018, `_fm_block_reason`:26036, `_fm_start`:26048, `_fm_announce`:26076, `_fm_finish`:26079, `_fm_msg`:26097, `_fm_check_paid`:26148, `_fm_tick`:26166, `_smoke_findme`:26222

## 26296-26406  v0.24.2: road map (for moving people off the road)

`_floor_note`:26302, `_floor_disc`:26316, `_floor_top`:26325, `_ground_at`:26343, `_note_road`:26361, `_on_road`:26368, `_ped_curb`:26378, `_curb_spot`:26388

## 26407-26702  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:26429, `_ex_grid`:26437, `_ex_lamps`:26472, `_ex_umbrella`:26495, `_ex_yards`:26502, `_build_expansion`:26517, `_expand_shots`:26680

## 26703-26897  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:26744, `_v27_near_cross`:26836, `_v27_near_any_road`:26843, `_v27_in_district`:26849, `_sea_tick`:26863, `_sea_tow`:26882

## 26898-27538  Harbor Loop sky train

`_sky_build_path`:26949, `_sky_pos`:26990, `_sky_dir`:27004, `_sky_project`:27009, `_sky_trip_time`:27028, `_sky_trip_dist`:27034, `_sky_now`:27045, `_sky_state`:27048, `_sky_time_at_station`:27063, `_sky_next_arrival`:27070, `_build_skytrain`:27083, `_sky_make_car`:27212, `_sky_skin`:27249, `_sky_place_trains`:27269, `_sky_build_station`:27288, `_sky_near`:27353, `_sky_fmt`:27362, `_sky_enter`:27366, `_sky_leave_platform`:27384, `_sky_board`:27394, `_sky_alight`:27407, `_sky_action`:27420, `_sky_tick`:27437, `_sky_camera`:27475, `_tour_today`:27491, `_tour_stamp`:27494, `_sky_hud`:27517

## 27539-27876  Day and night

`_game_hour`:27620, `_day_key`:27632, `_night_setup`:27647, `_night_scan_mesh`:27737, `_daynight_tick`:27762, `_daynight_apply`:27769, `_daynight_lights`:27861, `_cycle_day_mode`:27866, `_refresh_time_button`:27873

## 27877-28512  v0.27 smoke test and screenshots

`_smoke_v27`:27878, `_city_shots`:28081

## 28513-28929  v0.27: Harbor International Airport (north of the city)

`_build_airport`:28547, `_ap_plane`:28723, `_ap_truck`:28743, `_ap_baggage_train`:28784, `_ap_loop_pos`:28797, `_ap_loop_len`:28813, `_ap_flight_at`:28819, `_ap_tick`:28843, `_airport_ped_plan`:28866, `_smoke_airport`:28886

## 28930-29443  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:28944, `_nav_spot`:28951, `_nav_idx`:28955, `_nav_pos`:28962, `_nav_blocked`:28966, `_nav_nearest_free`:28976, `_nav_bfs`:29004, `_nav_build`:29048, `_stroller`:29119, `_stroll_place`:29135, `_stroll_next`:29156, `_nav_clear_line`:29190, `_stroll_aim`:29201, `_strollers_tick`:29233, `_smoke_strollers`:29328

## 29444-29604  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:29479, `_dir_fmt`:29482, `_signpost_spot`:29485, `_build_signposts`:29502

## 29605-29701  the Directions panel and chip

`_build_dir_panel`:29606, `_open_dir`:29648, `_dir_close`:29657, `_dir_pick`:29661, `_dir_stop`:29666, `_dir_stop_and_close`:29671, `_dir_tick`:29675

## 29702-30243  v0.44: Grand Central

`_gc_mesh`:29731, `_gc_mat`:29764, `_gc_glass`:29773, `_gb`:29783, `_gb_solid`:29789, `_gb_flush`:29793, `_gc_tree`:29823, `_gc_text`:29828, `_gc_planter`:29843, `_gc_kiosk`:29849, `_goods_color`:29879, `_goods_mat`:29882, `_kiosk_goods`:29886, `_build_grand_central`:29964, `_build_gc_towers`:30132, `_gc_tick`:30227

## 30244-30535  v0.44: filling the empty land

`_loft`:30261, `_fill_clear`:30303, `_build_fill`:30313, `_hg_in_lake`:30361, `_hg_path`:30365, `_floor_note_rot`:30373, `_build_gardens`:30381, `_build_fan_plaza`:30491

## 30536-30570  v0.45: hover car underglow

`_car_underglow`:30539

## 30571-30735  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:30572

## 30736-30767  v0.47: street stalls downtown

`_build_street_stalls`:30740, `_cull_people_in`:30760

## 30768-30866  v0.48: places that open as you level up

`_place_lock_of`:30781, `_place_root`:30787, `_place_unlocked`:30790, `_build_place_signs`:30798, `_places_refresh`:30843, `_places_tick`:30860

## 30867-30911  v0.50: city careers

`_career_rank_name`:30892, `_career_mult`:30895, `_career_block_reason`:30900, `_career_start`:30903, `_career_end`:30908

## 30912-30962  v0.52: careers as clear job loops

`_cid`:30939, `_career_target`:30953, `_career_tick`:30960

## 30963-30970  taxi

`_taxi_meter`:30964

## 30971-30974  paramedic

(no functions)

## 30975-30979  police

`_career_chase_over`:30977

## 30980-30985  firefighter

`_fire_aimed`:30981

## 30986-30995  the step bar

`_career_bar_text`:30989, `_career_hud`:30993

## 30996-31022  cut scenes

`_cs_skip`:31014

## 31023-31027  siren

(no functions)

## 31028-31039  the Careers panel

`_build_career_panel`:31029, `_open_careers`:31032, `_career_close`:31036

## 31040-31463  v0.50: homes

`_home_door_spots`:31080, `_build_homes`:31095, `_home_labels`:31124, `_home_door_near`:31133, `_home_origin`:31142, `_home_slot_near`:31145, `_home_exit_near`:31156, `_home_btn`:31163, `_home_interact`:31176, `_home_buy`:31195, `_home_default_layout`:31209, `_home_enter`:31217, `_home_leave`:31237, `_hm`:31245, `_home_build_room`:31264, `_home_refresh_room`:31373, `_furni_build`:31387

## 31464-31798  decorating

`_build_home_panels`:31465, `_open_homes`:31510, `_home_row_go`:31520, `_home_panel_close`:31540, `_deco_open`:31544, `_deco_pick`:31567, `_smoke_careers_homes`:31590

## 31799-31933  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:31803, `_home_slots`:31811, `_home_ring`:31838, `_furni_cat`:31844, `_home_fix_layout`:31850, `_home_build_layout`:31878

## 31934-32364  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:31995, `_ch_homes`:32001, `_ch_step_text`:32008, `_ch_step_done`:32019, `_ch_target`:32033, `_ch_finish_chapter`:32042, `_chapters_tick`:32064, `_hud_top_stack`:32104, `_build_chapters_ui`:32134, `_chapters_restart_ask`:32176, `_chapters_restart`:32179, `_chapters_text`:32189, `_open_chapters`:32209, `_chapters_close`:32216, `_smoke_chapters`:32220, `_step_sound`:32340

## 32365-32403  v0.51.1: join and leave messages

`_announce_join`:32372, `_announce_already_here`:32391, `_announce_leave`:32399

## 32404-32668  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:32420, `_shot_tick`:32426, `_draw_shot_icon`:32458, `_shot_enter`:32467, `_shot_exit`:32481, `_shot_release_controls`:32493, `_shot_stick_zone`:32500, `_shot_input`:32503, `_smoke_photo`:32575

## 32669-32967  v0.51.3: stream joiners

`_viewer_count`:32689, `_stream_join_check`:32695, `_stream_join_start`:32702, `_sj_streamer`:32719, `_stream_join_tick`:32728, `_stream_join_land`:32752, `_sj_welcome`:32768, `_smoke_stream_join`:32802, `_career_shot`:32885

## 32968-33084  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:32972, `_st_restore`:33010, `_smoke_streamer_clean`:33031, `_world_bio_passport`:33082

