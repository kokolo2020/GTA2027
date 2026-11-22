# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-566  Core (unlabelled)

`_symbol_font`:280, `_ready`:292, `_surf_texture`:509, `_surface_material`:531

## 567-639  v0.34.6: futuristic towers for the old city

`_future_tower`:571

## 640-718  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:647, `_skin_common`:682, `_future_wall`:690, `_future_roof`:704, `_future_pave`:712

## 719-779  v0.34.4: futuristic road surface

`_road_textures`:726, `_future_road`:760

## 780-1985  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:799, `_real_tex`:840, `_real_setup`:848, `_real_kind`:869, `_realify`:875, `_real_glass`:912, `_make_window_textures`:932, `_material`:965, `_box`:990, `_sign`:1012, `_build_world`:1024, `_future_kiosk`:1132, `_build_collectibles`:1158, `_auto_collect_tick`:1191, `_find_count`:1212, `_nearest_find`:1219, `_destination`:1233, `_toggle_activity`:1269, `_collect_find`:1298, `_owned_count`:1313, `_ridge_open`:1320, `_ridge_count`:1324, `_nearest_ridge`:1331, `_apply_car`:1345, `_tune_level`:1375, `_tune_cost`:1378, `_car_stats`:1384, `_buy_tune`:1391, `_open_tune`:1412, `_back_to_garage`:1418, `_refresh_tune`:1422, `_bay_open`:1433, `_area_open`:1436, `_bay_count`:1439, `_nearest_bay`:1446, `_build_bay`:1460, `_check_bay`:1513, `_discover_bay`:1526, `_north_count`:1539, `_north_open`:1546, `_nearest_north`:1549, `_check_north`:1563, `_discover_north`:1576, `_prop`:1589, `_collider`:1603, `_first_mesh`:1613, `_scatter`:1622, `_prop_stretch`:1656, `_north_token`:1665, `_nm_roads`:1692, `_prop_big`:1707, `_nm_near_cross`:1723, `_build_north`:1730, `_build_nm_blocks`:1847, `_build_north_landscape`:1932, `_nm_free`:1959, `_build_landscape`:1969

## 1986-2465  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:1987, `_online_toggle`:2001, `_online_autostart`:2027, `_online_connect`:2046, `_online_stop`:2053, `_online_next_ref`:2064, `_online_send`:2068, `_online_join_frame`:2072, `_online_pos_frame`:2075, `_online_tick`:2084, `_online_handle`:2118, `_online_clean_name`:2171, `_online_peer_update`:2180, `_online_make_peer`:2245, `_peer_look`:2286, `_online_tint`:2343, `_paint_mat`:2359, `_online_update_peers`:2371, `_online_clear_peers`:2451, `_online_refresh_button`:2456

## 2466-2638  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2546, `_marina_count`:2549, `_nearest_marina`:2556, `_check_marina`:2570, `_discover_marina`:2583, `_shop_available`:2596, `_nearest_shop`:2599, `_premium_cars`:2607, `_glass`:2614, `_shop_building`:2620, `_shop_pad`:2630

## 2639-3154  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2640, `_bus_last`:2643, `_build_bus`:2646, `_bus_boxes`:2673, `_bus_skin`:2683, `_bus_side`:2696, `_bus_reset`:2699, `_bus_text`:2708, `_bus_tick`:2713, `_bus_near`:2753, `_bus_board`:2764, `_bus_alight`:2779, `_build_marina`:2793, `_set_hat`:2899, `_build_hat`:2902, `_cyl`:2967, `_hat_part`:2976, `_apply_avatar`:2985, `_shop_count`:2997, `_shop_open`:3007, `_shop_step`:3025, `_shop_close`:3031, `_owned_text`:3044, `_refresh_shop`:3047, `_shop_action`:3100, `_journal_flip`:3151

## 3155-3209  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3166, `_xp`:3169, `_level_for`:3176, `_level`:3184, `_level_text`:3187, `_check_level`:3197

## 3210-3312  v0.11.0: online police vs thief

`_orole_ready`:3211, `_orole_start`:3214, `_orole_end`:3241, `_orole_tick`:3250

## 3313-4256  v0.10.0: chase mode (offline)

`_chase_open`:3314, `_chase_clear`:3319, `_chase_make_unit`:3333, `_chase_spawn_point`:3363, `_chase_start`:3372, `_chase_end`:3408, `_chase_steer`:3427, `_chase_roadblock`:3463, `_chase_heli_build`:3508, `_chase_extras`:3534, `_chase_tick`:3561, `_start_trial`:3625, `_cancel_trial`:3652, `_check_trial`:3657, `_finish_trial`:3674, `_trial_count`:3690, `_open_trials`:3697, `_refresh_trials`:3701, `_update_gate`:3713, `_slab`:3731, `_build_ridge`:3749, `_check_ridge`:3812, `_discover`:3825, `_mission_progress`:3839, `_check_missions`:3901, `_open_garage`:3912, `_open_journal`:3917, `_close_sub`:3922, `_bar`:3925, `_refresh_garage`:3929, `_garage_step`:3954, `_garage_action`:3958, `_refresh_journal`:3978, `_visited_shops`:4011, `_build_panels`:4018, `_build_player`:4178, `_build_car`:4216, `_try_model`:4245

## 4257-4923  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4258, `_kshader`:4332, `_ksync`:4338, `_kskin`:4353, `_make_kperson`:4359, `_hat_y`:4423, `_sit_drop`:4426, `_kplay`:4429, `_kpeople_tick`:4439, `_pose_person`:4468, `_pose_limbs`:4485, `_person_lift`:4547, `_snap_crowd_feet`:4560, `_people_life_tick`:4576, `_life_one`:4613, `_cull_person`:4623, `_recolor_car_model`:4631, `_apply_car_model`:4645, `_landmark`:4665, `_label`:4675, `_button`:4682, `_panel`:4694, `_build_hud`:4704

## 4924-5042  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4930, `_menu_tab`:4936, `_watch_tick`:4959, `_watch_count`:5001, `_online_pill_tap`:5008, `_online_pill_tick`:5014, `online_config_ok`:5040

## 5043-5080  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5046, `_offroad`:5052, `_ground_near`:5065, `_collectibles_on_road`:5072

## 5081-5220  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5093, `_build_quest_offer`:5097, `_quest_offer_tick`:5127, `_quest_auto_pick`:5177, `_quest_accept`:5192, `_quest_decline`:5206, `_quest_stop`:5212

## 5221-5588  v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5245, `_holo_material`:5254, `_build_future`:5262, `_build_neon`:5276, `_model_profile`:5345, `_model_body_box`:5368, `_build_holograms`:5382, `_holo_tick`:5432, `_build_sky_traffic`:5449, `_sky_hover_car`:5467, `_sky_drone`:5514, `_sky_traffic_tick`:5558, `_future_lights`:5577

## 5589-6088  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5648, `_crew_col`:5656, `_peer_crewmate`:5659, `_set_ring_color`:5662, `_level_color`:5689, `_tier_color`:5702, `_my_ach_tier`:5705, `_style_ring`:5712, `_social_peer_extras`:5760, `_social_tag`:5774, `_my_tag_extra`:5786, `_soc_send`:5799, `_social_msg`:5814, `_social_accept`:5853, `_social_go`:5874, `_soc_friend`:5893, `_soc_invite`:5900, `_soc_goto`:5905, `_soc_high_five`:5913, `_soc_gift`:5933, `_soc_crew_invite`:5950, `_gift_day_check`:5957, `_crew_create`:5963, `_crew_cycle_color`:5973, `_crew_leave`:5978, `_crew_mate_near`:5986, `_crew_board`:5994, `_build_social`:6013, `_social_online`:6075, `_open_social`:6079, `_close_social`:6085

## 6089-6339  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6092, `_track_pos`:6101, `_social_row_button`:6112, `_refresh_social`:6119, `_on_dance_floor`:6181, `_toggle_dance`:6184, `_build_dance_floor`:6192, `_social_tick`:6218, `_photo`:6290

## 6340-6835  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6362, `_game_state`:6370, `_build_arcade`:6382, `_c4_empty`:6433, `_c4_drop_row`:6439, `_c4_winner`:6445, `_c4_bot_move`:6466, `_c4_code`:6495, `_c4_ready`:6501, `_c4_tap`:6504, `_c4_check`:6525, `_c4_tick`:6549, `_rx_ready`:6576, `_rx_start`:6579, `_rx_tap`:6593, `_rx_send_time`:6618, `_rx_resolve`:6625, `_rx_tick`:6651, `_mem_start`:6666, `_mem_tap`:6682, `_mem_finish`:6697, `_mem_tick`:6713, `_mem_board_text`:6720, `_build_arcade_panel`:6731, `_refresh_arcade_panel`:6774

## 6836-7129  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6899, `_quiz_slot`:6902, `_quiz_question`:6912, `_quiz_bot_score`:6941, `_in_quiz`:6950, `_build_quiz`:6953, `_quiz_answer`:7023, `_quiz_msg`:7036, `_quiz_board`:7044, `_quiz_tick`:7054, `_quiz_refresh`:7096

## 7130-8608  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7301, `_sites_found`:7304, `_sites_total`:7307, `_bits`:7310, `_ach_value`:7317, `_ach_tick`:7372, `_ach_check`:7397, `_ach_by_id`:7433, `_ach_msg`:7439, `_build_ach`:7452, `_ach_show`:7483, `_open_ach`:7503, `_close_ach`:7509, `_refresh_ach`:7513, `_ach_num`:7544, `_minimap_tap`:7547, `_menu_go`:7554, `_menu_stay`:7559, `_menu_call_car`:7563, `_toggle_clean_hud`:7569, `_refresh_menu_buttons`:7575, `_clean_hud_tick`:7585, `_draw_joystick`:7626, `_input`:7631, `_stick_zone`:7708, `_notification`:7712, `_physics_process`:7727, `_follow_camera`:7875, `_follow_walk_camera`:7911, `_interact`:7934, `_refresh_hud`:8085, `_open_panel`:8206, `_layout_panels`:8232, `_toggle_menu`:8255, `_rescue`:8295, `_show_toast`:8327, `_save_progress`:8331, `_load_progress`:8414

## 8609-10752  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8610, `_radio_voice`:8613, `_radio_make`:8646, `_radio_set`:8717, `_radio_play`:8739, `_radio_next`:8744, `_radio_talk_line`:8748, `_radio_caption`:8769, `_radio_refresh`:8777, `_process`:8790, `_build_peds`:8839, `_update_peds`:8950, `_update_ped`:8969, `_smoke_test`:9023, `_smoke_chase`:9662, `_smoke_orole`:9695, `_smoke_levels`:9724, `_smoke_bus`:9765, `_smoke_chase_extras`:9850, `_smoke_marina`:9878, `_blocked_at`:9980, `_blocker`:9995, `_on_screen`:10008, `_wait_radio`:10013, `_smoke_radio_peds`:10020, `_smoke_models`:10090, `_smoke_garage_ridge`:10114, `_save_shot`:10490, `_people_shots`:10500, `_shots`:10541, `_shot_car`:10735, `_capture_preview`:10745

## 10753-11401  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10820, `_downtown_count`:10823, `_nearest_downtown`:10830, `_check_downtown`:10844, `_discover_downtown`:10857, `_box_batch`:10871, `_model_batch`:10891, `_cut_ranges`:10945, `_dt_ranges`:10957, `_dt_has`:10964, `_dt_near_cross`:10970, `_place`:10976, `_signal_pole`:10987, `_cyl_batch`:11006, `_city_signals`:11030, `_ensure_light_mats`:11081, `_city_lamps`:11091, `_build_downtown`:11135, `_dt_block`:11335, `_downtown_token`:11341, `_build_park`:11358, `_build_plaza`:11387

## 11402-11505  old city and Bay details

`_build_city_detail`:11403

## 11506-11915  traffic

`_build_traffic`:11507, `_path_sample`:11602, `_light_look`:11616, `_light_green`:11624, `_traffic_place`:11628, `_traffic_blocked_by`:11640, `_traffic_tick`:11652, `_smoke_downtown`:11758, `_skyline_shot`:11870, `_skyline_shots`:11878

## 11916-12268  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:11962, `_web_scale`:12017, `_web_fps_tick`:12027, `_world_to_uv`:12044, `_map_angle`:12047, `_build_minimap`:12055, `_open_map`:12128, `_close_map`:12139, `_mini_point`:12146, `_site_markers`:12150, `_draw_arrow`:12182, `_draw_minimap`:12189, `_draw_full_map`:12236, `_minimap_tick`:12261

## 12269-12526  camera views

`_build_view_controls`:12270, `_cycle_view`:12312, `_apply_view`:12322, `_hide_labels`:12360, `_unfade`:12366, `_bake_map`:12372, `_shot_stats`:12422, `_view_shots`:12425, `_smoke_views`:12466

## 12527-12774  v0.17.0: level-up celebration

`_build_level_fx`:12538, `_draw_level_rays`:12575, `_level_fx_tick`:12585, `_level_sound`:12590, `_fx_material`:12632, `_level_up_fx`:12640, `_smoke_level_fx`:12741, `_levelup_shots`:12750

## 12775-12894  v0.18.0: walk-in stadium

`_collider_yaw`:12780, `_build_stadium_walls`:12791, `_look`:12819, `_smoke_stadium_eye`:12828, `_stadium_shots`:12864

## 12895-13056  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:12919, `_arrow_mesh`:12931, `_build_guidance`:12954, `_guide_target`:12979, `_guidance_tick`:13008, `_draw_hud_arrow`:13034

## 13057-13242  checkpoints

`_build_checkpoints`:13058, `_refresh_checkpoints`:13103, `_check_checkpoints`:13109, `_activate_checkpoint`:13119, `_checkpoint_spawn`:13140, `_spawn_at_checkpoint`:13145, `_draw_checkpoint_icon`:13161, `_smoke_guidance_checkpoints`:13167, `_guide_shots`:13217

## 13243-13518  v0.18.0: Harbor Dome social hub

`_hub_seat`:13301, `_build_hub`:13305, `_hub_glass`:13502

## 13519-13726  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:13520, `_build_hub_bots`:13545, `_seat_of`:13576, `_bubble`:13586, `_emote`:13635, `_hub_people_tick`:13649

## 13727-13845  seats

`_seat_taken`:13728, `_nearest_seat`:13736, `_seat_label`:13748, `_sit`:13764, `_stand_up`:13808, `_seated_tick`:13827

## 13846-14002  game panel

`_build_game_panel`:13847, `_open_game_panel`:13902, `_refresh_game_panel`:13921, `_play_robot`:13966, `_peer_at`:13980, `_opponent_name`:13987, `_pay`:13995

## 14003-14123  tic-tac-toe

`_ttt_ready`:14006, `_ttt_winner`:14012, `_ttt_bot_move`:14022, `_ttt_tap`:14048, `_ttt_code`:14068, `_ttt_check`:14074, `_ttt_tick`:14097

## 14124-14175  rock paper scissors

`_rps_ready`:14125, `_rps_pick`:14131, `_rps_resolve`:14149, `_rps_tick`:14173

## 14176-14258  online table messages

`_online_game_send`:14177, `_hub_game_msg`:14183

## 14259-14334  comedy show

`_joke_start`:14260, `_joke_tick`:14272, `_speak`:14298, `_play_rimshot`:14307

## 14335-14873  quick chat and emotes

`_build_chat`:14352, `_chat_toggle_to`:14452, `_chat_log_add`:14460, `_chat_area`:14466, `_chat_near_count`:14484, `_chat_tick`:14493, `_toggle_chat`:14540, `_say`:14554, `_do_emote`:14568, `_smoke_hub`:14577, `_hub_shots`:14751, `_sg_on_terrace`:14824, `_people_only`:14827, `_people_only_keep_cars_out`:14831, `_car_barrier`:14843, `_hub_keep_cars_out`:14857

## 14874-15036  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:14883, `_feed_add`:14892, `_feed_render`:14898, `_feed_tick`:14926, `_online_event_send`:14935, `_at_pvp_table`:14942, `_game_name`:14949, `_send_lfp`:14952, `_lfp_msg`:14969, `_accept_invite`:14990

## 15037-15277  v0.18.2: nickname and HUD relayout

`_nick_rude`:15049, `_clean_nick`:15064, `_build_nick_panel`:15076, `_open_nick`:15114, `_random_nick`:15123, `_save_nick`:15129, `_close_nick`:15148, `_refresh_nick_button`:15157, `_relayout_hud`:15161, `_smoke_nick`:15197, `_nick_shots`:15229, `_smoke_sites_reachable`:15247

## 15278-15565  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:15304, `_nearest_civic`:15311, `_check_civic`:15325, `_discover_civic`:15338, `_civ_ranges`:15351, `_civ_has`:15365, `_civ_near_cross`:15371, `_build_civic`:15377, `_civic_token`:15503, `_civic_shots`:15520, `_hub_focus`:15542

## 15566-15675  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:15637, `_in_rw_lot`:15640, `_box_batch_rot`:15643, `_multi_collider`:15661

## 15676-16003  circuit geometry

`_cr_point`:15677, `_rw_build_path`:15691, `_rw_dir`:15719, `_rw_bend`:15724, `_ribbon`:15730, `_rw_band`:15750, `_rw_keepout`:15768, `_build_raceway`:15777, `_build_rw_parking`:15811, `_build_rw_pits`:15856, `_build_rw_track`:15893, `_build_rw_trackside`:15934

## 16004-16101  race car rental

`_model_key`:16005, `_race_car_start`:16008, `_tint_ghost`:16046, `_race_car_end`:16059, `_race_keep_cars_out`:16084

## 16102-16116  speed effects

`_eff_max`:16103, `_eff_accel`:16114

## 16117-16167  track helpers

`_rw_seg_progress`:16118, `_rw_track_dist`:16138, `_rw_point_dist`:16149, `_rw_player_progress`:16156, `_rw_target`:16162

## 16168-16404  events

`_rec_stop`:16169, `_rw_place`:16185, `_rw_grid_pos`:16192, `_rw_start`:16197, `_rw_spawn_ai`:16229, `_rw_ai_place`:16253, `_rw_tick`:16264, `_rw_ai_tick`:16317, `_rw_lap_done`:16359, `_rw_finish`:16371, `_rw_fmt`:16402

## 16405-16457  boosters and spikes

`_rw_buy`:16406, `_rw_use_boost`:16424, `_rw_use_spike`:16432, `_rw_drop_spike_at`:16443

## 16458-16515  online races

`_race_msg`:16459, `_join_race`:16481

## 16516-16871  raceway panel, HUD, board

`_build_raceway_ui`:16517, `_rw_layout`:16577, `_rw_open`:16584, `_rw_close`:16590, `_rw_refresh_panel`:16594, `_rw_refresh_board`:16607, `_rw_hud`:16619, `_peer_car_model`:16643, `_smoke_raceway`:16653, `_race_shots`:16834

## 16872-17079  v0.22.0: Call Car

`_call_block_reason`:16878, `_call_spot`:16895, `_call_car`:16926, `_play_horn`:16950, `_smoke_follow_call`:16974, `_follow_shots`:17047

## 17080-17379  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:17095, `_build_travel`:17100, `_toggle_run`:17142, `_refresh_run`:17146, `_hud_v23_tick`:17154, `_travel_block_reason`:17183, `_travel_open`:17203, `_open_travel`:17209, `_close_travel`:17215, `_refresh_travel`:17219, `_travel_to`:17227, `_smoke_travel`:17254, `_v23_shots`:17292

## 17380-17453  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:17387, `_qr_button`:17402, `_qr_layout`:17441, `_smoke_qr`:17447

## 17454-17890  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:17474, `_open_crate`:17490, `_build_crate_ui`:17507, `_crate_pick`:17594, `_crate_reveal`:17617, `_crate_draw_car`:17644, `_crate_confetti`:17663, `_crate_sound`:17688, `_crate_drive`:17714, `_feed_add_system`:17744, `_smoke_crate`:17747, `_crate_shots`:17795

## 17891-18382  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:17932, `_quick_today`:17937, `_quick_is_done`:17940, `_quick_left`:17943, `_quick_next`:17950, `_quick_fix_target`:17963, `_quick_daily_check`:17977, `_quick_complete`:17991, `_quick_side`:18025, `_build_quick_props`:18043, `_daily_shots`:18195, `_quick_props_refresh`:18237, `_quick_fx`:18241, `_play_coin`:18257, `_smoke_quick`:18274

## 18383-18533  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:18392, `_quest_nearby`:18447, `_open_quests`:18454, `_close_quests`:18461, `_refresh_quests`:18465, `_quest_pick`:18491, `_quest_mode`:18505, `_smoke_quests`:18508

## 18534-18568  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:18538, `_my_tag_tick`:18541

## 18569-18883  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:18586, `_fc_torus`:18596, `_fc_pearl`:18604, `_fc_chrome`:18614, `_fc_glass`:18623, `_fc_glow`:18633, `_fc_ghost`:18642, `_fc_holo`:18654, `_fc_mesh`:18664, `_fc_sphere`:18684, `_fc_capsule`:18692, `_fc_cone`:18700, `_build_food_court`:18709, `_food_court_tick`:18863

## 18884-19198  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:18906, `_cm_bench`:18922, `_build_commons`:18935, `_commons_tick`:19157

## 19199-19513  v0.36: the daily puzzle

`_pz_today`:19222, `_pz_new`:19225, `_pz_neighbours`:19270, `_pz_flip`:19280, `_pz_done`:19285, `_pz_tap`:19293, `_pz_win`:19309, `_pz_reset`:19330, `_puzzle_near`:19334, `_open_puzzle`:19339, `_close_puzzle`:19347, `_pz_refresh_sign`:19351, `_build_puzzle_panel`:19359, `_pz_draw`:19390, `_smoke_chat`:19431, `_smoke_feet`:19469, `_smoke_commons`:19490

## 19514-19702  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:19576, `_bio_theta`:19580, `_bio_sec_n`:19585, `_bio_sec_of`:19588, `_bio_pt`:19591, `_bio_lp`:19596, `_bio_la`:19600, `_bio_dir`:19604, `_bio_hex_r`:19607, `_bio_apo`:19612, `_bio_open_angles`:19618, `_bio_si`:19628, `_bm`:19634, `_bsph`:19639, `_blow`:19642, `_bcone`:19653, `_bbox`:19656, `_bp`:19659, `_bq`:19664, `_bio_glass_mat`:19668, `_bio_water_mat`:19681, `_bio_mat`:19693

## 19703-20075  building blocks

`_bio_inst`:19704, `_bio_add`:19710, `_bio_model`:19713, `_bio_nature_mesh`:19719, `_bio_flush`:19753, `_bio_bar`:19788, `_bio_slab`:19801, `_bio_body`:19816, `_bio_cyl_col`:19829, `_bio_hexmesh`:19842, `_bio_hexslab`:19854, `_bio_hexpt`:19860, `_bio_gridshell`:19867, `_bio_rail`:19974, `_bio_rail_arc`:19979, `_bio_disc_deck`:19991, `_bio_ring_deck`:19997, `_bio_helix`:20008, `_bio_pillar`:20028, `_bio_cafe`:20034, `_bio_fence_line`:20048, `_bio_fence_seg`:20053, `_bio_pen`:20063

## 20076-20577  building

`_build_biosphere`:20077, `_build_biosphere_legacy`:20081, `_bio_text`:20243, `_bio_plaque`:20261, `_bio_ticket_hall`:20275, `_on_foot_collision_guard`:20331, `_bio_inside`:20341, `_bio_pass_ok`:20344, `_ticket_near`:20348, `_bio_buy_pass`:20353, `_bio_gates_update`:20369, `_bio_gate_tick`:20395, `_bio_tunnel`:20407, `_bio_grounds`:20460, `_bio_dome`:20506, `_bio_deck_mats`:20574

## 20578-20733  garden planting

`_bio_free`:20579, `_bio_spot`:20596, `_bio_garden`:20604, `_bio_pine`:20645, `_bio_tree`:20648, `_bio_big_tree`:20658, `_bio_rock`:20663, `_bio_pond`:20666, `_bio_particles`:20670, `_bio_mist`:20698, `_bio_mini_dome`:20727

## 20734-21141  the four layouts

`_bio_winter`:20735, `_bio_spring`:20827, `_bio_summer`:20952, `_bio_autumn`:21036

## 21142-21412  animals

`_bio_spawn`:21143, `_bio_load_animal`:21215, `_bio_make_quad`:21236, `_bio_load_bird`:21313, `_bio_make_penguin`:21333, `_bio_make_bird`:21355, `_bio_make_flamingo`:21379, `_bio_make_butterfly`:21400

## 21413-21542  animation, spotting and rewards

`_bio_stuck_check`:21418, `_biosphere_tick`:21436, `_bio_animate`:21443, `_bio_spot_check`:21523, `_bio_spotted`:21535, `_smoke_biosphere`:21539

## 21543-22060  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:21630, `_wear_piece`:21633, `_wear_mat`:21656, `_person_index`:21672, `_dress`:21695, `_smoke_style`:21801, `_style_shots`:21952, `_npc_look`:22024

## 22061-22209  your look: apply, save, share

`_look_clean`:22065, `_look_pack`:22080, `_owns`:22086, `_apply_look`:22091, `_relic_model`:22097, `_fc_mesh_mat`:22162, `_relic_refresh`:22165, `_relic_tick`:22179, `_peer_style`:22190

## 22210-22637  stores and the wardrobe

`_style_today`:22229, `_style_items`:22232, `_style_cat`:22240, `_style_price`:22243, `_style_deal`:22257, `_style_price_base`:22270, `_relic_stock`:22277, `_build_style_panel`:22289, `_open_store`:22329, `_open_wardrobe`:22348, `_style_close`:22351, `_style_finish`:22355, `_sync_old_avatar`:22370, `_style_tabs_for`:22377, `_refresh_style`:22382, `_style_body_rows`:22533, `_style_set_tab`:22550, `_style_step`:22554, `_style_color`:22559, `_style_pick`:22564, `_style_buy`:22599, `_ach_relics_check`:22621, `_style_face_camera`:22626

## 22638-23105  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:22674, `_ga_text`:22680, `_ga_box`:22697, `_build_galleria`:22713, `_ga_inner_tick`:22854, `_ga_shell`:22870, `_ga_inside`:22920, `_bio_cyl_col_on`:22923, `_ga_models`:22935, `_ga_lbox`:22950, `_ga_ltext`:22964, `_ga_store`:22971, `_bio_cafe_on`:23073, `_ga_mannequins`:23081

## 23106-23257  featured outfits and the Sky Run

`_ga_featured_look`:23119, `_build_ga_fun`:23140, `_ga_fun_tick`:23185, `_sky_finish`:23212, `_extra_near`:23231, `_extra_open`:23240, `_store_near`:23249

## 23258-23354  v0.41: THE SKY GARDEN

`_sg_now`:23312, `_sg_progress`:23315, `_sg_time`:23321, `_sg_stock`:23328, `_sg_mut_roll`:23343

## 23355-23492  building

`_sg_box`:23356, `_sg_text`:23362, `_build_sky_garden`:23376, `_sg_seed_spot`:23487, `_sg_codex_spot`:23490

## 23493-23673  plants

`_sg_plant_model`:23494, `_sg_refresh_all`:23599, `_sg_refresh`:23603, `_sky_garden_tick`:23639, `_sg_ready_count`:23658, `_sg_boot_note`:23665

## 23674-23793  interacting

`_sg_near`:23675, `_sg_button_text`:23698, `_sg_value`:23711, `_sg_interact`:23715, `_sg_buy`:23731, `_sg_plant`:23753, `_sg_harvest`:23764

## 23794-24037  the garden screen

`_build_sg_panel`:23795, `_sg_open`:23830, `_sg_close`:23839, `_sg_row`:23843, `_sg_refresh_panel`:23858, `_sg_pick_buy`:23903, `_sg_pick_plant`:23907, `_smoke_car_barriers`:23913, `_smoke_sky_garden`:23954

## 24038-24076  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:24069, `_pass_day`:24072

## 24077-24108  album

`_album_pages`:24078, `_album_claim`:24093

## 24109-24160  season

`_season_index`:24110, `_season_tick`:24113, `_season_xp`:24122, `_season_tier`:24125, `_season_reward`:24128, `_season_claim`:24142

## 24161-24168  Harbor Night

`_harbor_night`:24162

## 24169-24200  check-in calendar

`_cal_tick`:24170

## 24201-24377  the panel

`_build_hp_panel`:24202, `_open_pass`:24237, `_hp_open`:24240, `_hp_close`:24247, `_hp_row`:24251, `_hp_bar`:24266, `_hp_refresh`:24270, `_smoke_pass`:24315

## 24378-24592  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:24382, `_cash_pill_tick`:24390, `_build_lb`:24428, `_open_lb`:24471, `_close_lb`:24479, `_lb_pick`:24483, `_lb_headers`:24488, `_lb_url`:24492, `_lb_me`:24495, `_lb_tick`:24498, `_lb_upload`:24506, `_lb_fetch`:24516, `_lb_got`:24524, `_lb_value`:24535, `_lb_refresh_ui`:24546

## 24593-25016  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:24617, `_market_near`:24694, `_build_gear`:24704, `_gear_piece`:24712, `_build_pet`:24757, `_market_apply`:24799, `_market_tick`:24823, `_build_market_panel`:24845, `_open_market`:24871, `_close_market`:24878, `_refresh_market`:24882, `_market_pick`:24935, `_toggle_board`:24973, `_board_tick`:24980

## 25017-25258  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:25049, `_ds_label`:25068, `_build_display`:25082, `_ds_got`:25161, `_ds_sorted`:25170, `_ds_render_board`:25184, `_ds_render_news`:25210, `_display_tick`:25229

## 25259-25437  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:25276, `_toggle_streamer`:25363, `_streamer_badge_tap`:25379, `_streamer_tick`:25383

## 25438-25474  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:25444, `_car_back`:25451, `_car_park_tick`:25458

## 25475-25571  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:25479, `_bus_eta`:25533, `_bus_displays_tick`:25549

## 25572-25863  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:25590, `_treasure_pick`:25593, `_treasure_spot`:25602, `_treasure_district`:25606, `_treasure_clue`:25618, `_treasure_prop`:25631, `_tp_part`:25634, `_tp_sphere`:25644, `_tp_cyl`:25652, `_treasure_prop_side`:25661, `_build_treasure_props`:25673, `_build_treasure`:25717, `_treasure_dir_char`:25786, `_treasure_tick`:25795, `_treasure_claim`:25849

## 25864-25964  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:25865, `_halo_mat`:25897, `_smoke_treasure`:25922

## 25965-26288  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:25986, `_fm_send`:25989, `_fm_area`:25995, `_fm_glow_mesh`:26011, `_fm_block_reason`:26029, `_fm_start`:26041, `_fm_announce`:26069, `_fm_finish`:26072, `_fm_msg`:26090, `_fm_check_paid`:26141, `_fm_tick`:26159, `_smoke_findme`:26215

## 26289-26399  v0.24.2: road map (for moving people off the road)

`_floor_note`:26295, `_floor_disc`:26309, `_floor_top`:26318, `_ground_at`:26336, `_note_road`:26354, `_on_road`:26361, `_ped_curb`:26371, `_curb_spot`:26381

## 26400-26695  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:26422, `_ex_grid`:26430, `_ex_lamps`:26465, `_ex_umbrella`:26488, `_ex_yards`:26495, `_build_expansion`:26510, `_expand_shots`:26673

## 26696-26890  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:26737, `_v27_near_cross`:26829, `_v27_near_any_road`:26836, `_v27_in_district`:26842, `_sea_tick`:26856, `_sea_tow`:26875

## 26891-27531  Harbor Loop sky train

`_sky_build_path`:26942, `_sky_pos`:26983, `_sky_dir`:26997, `_sky_project`:27002, `_sky_trip_time`:27021, `_sky_trip_dist`:27027, `_sky_now`:27038, `_sky_state`:27041, `_sky_time_at_station`:27056, `_sky_next_arrival`:27063, `_build_skytrain`:27076, `_sky_make_car`:27205, `_sky_skin`:27242, `_sky_place_trains`:27262, `_sky_build_station`:27281, `_sky_near`:27346, `_sky_fmt`:27355, `_sky_enter`:27359, `_sky_leave_platform`:27377, `_sky_board`:27387, `_sky_alight`:27400, `_sky_action`:27413, `_sky_tick`:27430, `_sky_camera`:27468, `_tour_today`:27484, `_tour_stamp`:27487, `_sky_hud`:27510

## 27532-27869  Day and night

`_game_hour`:27613, `_day_key`:27625, `_night_setup`:27640, `_night_scan_mesh`:27730, `_daynight_tick`:27755, `_daynight_apply`:27762, `_daynight_lights`:27854, `_cycle_day_mode`:27859, `_refresh_time_button`:27866

## 27870-28505  v0.27 smoke test and screenshots

`_smoke_v27`:27871, `_city_shots`:28074

## 28506-28922  v0.27: Harbor International Airport (north of the city)

`_build_airport`:28540, `_ap_plane`:28716, `_ap_truck`:28736, `_ap_baggage_train`:28777, `_ap_loop_pos`:28790, `_ap_loop_len`:28806, `_ap_flight_at`:28812, `_ap_tick`:28836, `_airport_ped_plan`:28859, `_smoke_airport`:28879

## 28923-29436  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:28937, `_nav_spot`:28944, `_nav_idx`:28948, `_nav_pos`:28955, `_nav_blocked`:28959, `_nav_nearest_free`:28969, `_nav_bfs`:28997, `_nav_build`:29041, `_stroller`:29112, `_stroll_place`:29128, `_stroll_next`:29149, `_nav_clear_line`:29183, `_stroll_aim`:29194, `_strollers_tick`:29226, `_smoke_strollers`:29321

## 29437-29597  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:29472, `_dir_fmt`:29475, `_signpost_spot`:29478, `_build_signposts`:29495

## 29598-29694  the Directions panel and chip

`_build_dir_panel`:29599, `_open_dir`:29641, `_dir_close`:29650, `_dir_pick`:29654, `_dir_stop`:29659, `_dir_stop_and_close`:29664, `_dir_tick`:29668

## 29695-30236  v0.44: Grand Central

`_gc_mesh`:29724, `_gc_mat`:29757, `_gc_glass`:29766, `_gb`:29776, `_gb_solid`:29782, `_gb_flush`:29786, `_gc_tree`:29816, `_gc_text`:29821, `_gc_planter`:29836, `_gc_kiosk`:29842, `_goods_color`:29872, `_goods_mat`:29875, `_kiosk_goods`:29879, `_build_grand_central`:29957, `_build_gc_towers`:30125, `_gc_tick`:30220

## 30237-30528  v0.44: filling the empty land

`_loft`:30254, `_fill_clear`:30296, `_build_fill`:30306, `_hg_in_lake`:30354, `_hg_path`:30358, `_floor_note_rot`:30366, `_build_gardens`:30374, `_build_fan_plaza`:30484

## 30529-30563  v0.45: hover car underglow

`_car_underglow`:30532

## 30564-30728  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:30565

## 30729-30760  v0.47: street stalls downtown

`_build_street_stalls`:30733, `_cull_people_in`:30753

## 30761-30859  v0.48: places that open as you level up

`_place_lock_of`:30774, `_place_root`:30780, `_place_unlocked`:30783, `_build_place_signs`:30791, `_places_refresh`:30836, `_places_tick`:30853

## 30860-30904  v0.50: city careers

`_career_rank_name`:30885, `_career_mult`:30888, `_career_block_reason`:30893, `_career_start`:30896, `_career_end`:30901

## 30905-30955  v0.52: careers as clear job loops

`_cid`:30932, `_career_target`:30946, `_career_tick`:30953

## 30956-30963  taxi

`_taxi_meter`:30957

## 30964-30967  paramedic

(no functions)

## 30968-30972  police

`_career_chase_over`:30970

## 30973-30978  firefighter

`_fire_aimed`:30974

## 30979-30988  the step bar

`_career_bar_text`:30982, `_career_hud`:30986

## 30989-31015  cut scenes

`_cs_skip`:31007

## 31016-31020  siren

(no functions)

## 31021-31032  the Careers panel

`_build_career_panel`:31022, `_open_careers`:31025, `_career_close`:31029

## 31033-31456  v0.50: homes

`_home_door_spots`:31073, `_build_homes`:31088, `_home_labels`:31117, `_home_door_near`:31126, `_home_origin`:31135, `_home_slot_near`:31138, `_home_exit_near`:31149, `_home_btn`:31156, `_home_interact`:31169, `_home_buy`:31188, `_home_default_layout`:31202, `_home_enter`:31210, `_home_leave`:31230, `_hm`:31238, `_home_build_room`:31257, `_home_refresh_room`:31366, `_furni_build`:31380

## 31457-31791  decorating

`_build_home_panels`:31458, `_open_homes`:31503, `_home_row_go`:31513, `_home_panel_close`:31533, `_deco_open`:31537, `_deco_pick`:31560, `_smoke_careers_homes`:31583

## 31792-31926  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:31796, `_home_slots`:31804, `_home_ring`:31831, `_furni_cat`:31837, `_home_fix_layout`:31843, `_home_build_layout`:31871

## 31927-32357  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:31988, `_ch_homes`:31994, `_ch_step_text`:32001, `_ch_step_done`:32012, `_ch_target`:32026, `_ch_finish_chapter`:32035, `_chapters_tick`:32057, `_hud_top_stack`:32097, `_build_chapters_ui`:32127, `_chapters_restart_ask`:32169, `_chapters_restart`:32172, `_chapters_text`:32182, `_open_chapters`:32202, `_chapters_close`:32209, `_smoke_chapters`:32213, `_step_sound`:32333

## 32358-32396  v0.51.1: join and leave messages

`_announce_join`:32365, `_announce_already_here`:32384, `_announce_leave`:32392

## 32397-32661  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:32413, `_shot_tick`:32419, `_draw_shot_icon`:32451, `_shot_enter`:32460, `_shot_exit`:32474, `_shot_release_controls`:32486, `_shot_stick_zone`:32493, `_shot_input`:32496, `_smoke_photo`:32568

## 32662-32960  v0.51.3: stream joiners

`_viewer_count`:32682, `_stream_join_check`:32688, `_stream_join_start`:32695, `_sj_streamer`:32712, `_stream_join_tick`:32721, `_stream_join_land`:32745, `_sj_welcome`:32761, `_smoke_stream_join`:32795, `_career_shot`:32878

## 32961-33077  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:32965, `_st_restore`:33003, `_smoke_streamer_clean`:33024, `_world_bio_passport`:33075

