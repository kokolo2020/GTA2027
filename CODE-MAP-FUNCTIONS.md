# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-619  Core (unlabelled)

`_symbol_font`:286, `_ready`:298, `_surf_texture`:562, `_surface_material`:584

## 620-692  v0.34.6: futuristic towers for the old city

`_future_tower`:624

## 693-771  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:700, `_skin_common`:735, `_future_wall`:743, `_future_roof`:757, `_future_pave`:765

## 772-832  v0.34.4: futuristic road surface

`_road_textures`:779, `_future_road`:813

## 833-2041  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:852, `_real_tex`:893, `_real_setup`:901, `_real_kind`:922, `_realify`:928, `_real_glass`:965, `_make_window_textures`:985, `_material`:1018, `_box`:1043, `_sign`:1065, `_build_world`:1077, `_future_kiosk`:1188, `_build_collectibles`:1214, `_auto_collect_tick`:1247, `_find_count`:1268, `_nearest_find`:1275, `_destination`:1289, `_toggle_activity`:1325, `_collect_find`:1354, `_owned_count`:1369, `_ridge_open`:1376, `_ridge_count`:1380, `_nearest_ridge`:1387, `_apply_car`:1401, `_tune_level`:1431, `_tune_cost`:1434, `_car_stats`:1440, `_buy_tune`:1447, `_open_tune`:1468, `_back_to_garage`:1474, `_refresh_tune`:1478, `_bay_open`:1489, `_area_open`:1492, `_bay_count`:1495, `_nearest_bay`:1502, `_build_bay`:1516, `_check_bay`:1569, `_discover_bay`:1582, `_north_count`:1595, `_north_open`:1602, `_nearest_north`:1605, `_check_north`:1619, `_discover_north`:1632, `_prop`:1645, `_collider`:1659, `_first_mesh`:1669, `_scatter`:1678, `_prop_stretch`:1712, `_north_token`:1721, `_nm_roads`:1748, `_prop_big`:1763, `_nm_near_cross`:1779, `_build_north`:1786, `_build_nm_blocks`:1903, `_build_north_landscape`:1988, `_nm_free`:2015, `_build_landscape`:2025

## 2042-2525  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2043, `_online_toggle`:2057, `_online_autostart`:2083, `_online_connect`:2102, `_online_stop`:2109, `_online_next_ref`:2120, `_online_send`:2124, `_online_join_frame`:2128, `_online_pos_frame`:2131, `_online_tick`:2140, `_online_handle`:2174, `_online_clean_name`:2227, `_online_peer_update`:2236, `_online_make_peer`:2305, `_peer_look`:2346, `_online_tint`:2403, `_paint_mat`:2419, `_online_update_peers`:2431, `_online_clear_peers`:2511, `_online_refresh_button`:2516

## 2526-2698  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2606, `_marina_count`:2609, `_nearest_marina`:2616, `_check_marina`:2630, `_discover_marina`:2643, `_shop_available`:2656, `_nearest_shop`:2659, `_premium_cars`:2667, `_glass`:2674, `_shop_building`:2680, `_shop_pad`:2690

## 2699-3214  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2700, `_bus_last`:2703, `_build_bus`:2706, `_bus_boxes`:2733, `_bus_skin`:2743, `_bus_side`:2756, `_bus_reset`:2759, `_bus_text`:2768, `_bus_tick`:2773, `_bus_near`:2813, `_bus_board`:2824, `_bus_alight`:2839, `_build_marina`:2853, `_set_hat`:2959, `_build_hat`:2962, `_cyl`:3027, `_hat_part`:3036, `_apply_avatar`:3045, `_shop_count`:3057, `_shop_open`:3067, `_shop_step`:3085, `_shop_close`:3091, `_owned_text`:3104, `_refresh_shop`:3107, `_shop_action`:3160, `_journal_flip`:3211

## 3215-3269  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3226, `_xp`:3229, `_level_for`:3236, `_level`:3244, `_level_text`:3247, `_check_level`:3257

## 3270-3372  v0.11.0: online police vs thief

`_orole_ready`:3271, `_orole_start`:3274, `_orole_end`:3301, `_orole_tick`:3310

## 3373-4316  v0.10.0: chase mode (offline)

`_chase_open`:3374, `_chase_clear`:3379, `_chase_make_unit`:3393, `_chase_spawn_point`:3423, `_chase_start`:3432, `_chase_end`:3468, `_chase_steer`:3487, `_chase_roadblock`:3523, `_chase_heli_build`:3568, `_chase_extras`:3594, `_chase_tick`:3621, `_start_trial`:3685, `_cancel_trial`:3712, `_check_trial`:3717, `_finish_trial`:3734, `_trial_count`:3750, `_open_trials`:3757, `_refresh_trials`:3761, `_update_gate`:3773, `_slab`:3791, `_build_ridge`:3809, `_check_ridge`:3872, `_discover`:3885, `_mission_progress`:3899, `_check_missions`:3961, `_open_garage`:3972, `_open_journal`:3977, `_close_sub`:3982, `_bar`:3985, `_refresh_garage`:3989, `_garage_step`:4014, `_garage_action`:4018, `_refresh_journal`:4038, `_visited_shops`:4071, `_build_panels`:4078, `_build_player`:4238, `_build_car`:4276, `_try_model`:4305

## 4317-5001  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4318, `_kshader`:4392, `_ksync`:4398, `_kskin`:4413, `_make_kperson`:4419, `_hat_y`:4483, `_sit_drop`:4486, `_kplay`:4489, `_kpeople_tick`:4499, `_pose_person`:4528, `_pose_limbs`:4545, `_person_lift`:4607, `_snap_crowd_feet`:4620, `_people_life_tick`:4636, `_life_one`:4673, `_cull_person`:4683, `_recolor_car_model`:4691, `_apply_car_model`:4705, `_landmark`:4725, `_label`:4735, `_button`:4742, `_panel`:4754, `_build_hud`:4764

## 5002-5120  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:5008, `_menu_tab`:5014, `_watch_tick`:5037, `_watch_count`:5079, `_online_pill_tap`:5086, `_online_pill_tick`:5092, `online_config_ok`:5118

## 5121-5158  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5124, `_offroad`:5130, `_ground_near`:5143, `_collectibles_on_road`:5150

## 5159-5298  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5171, `_build_quest_offer`:5175, `_quest_offer_tick`:5205, `_quest_auto_pick`:5255, `_quest_accept`:5270, `_quest_decline`:5284, `_quest_stop`:5290

## 5299-5666  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5323, `_holo_material`:5332, `_build_future`:5340, `_build_neon`:5354, `_model_profile`:5423, `_model_body_box`:5446, `_build_holograms`:5460, `_holo_tick`:5510, `_build_sky_traffic`:5527, `_sky_hover_car`:5545, `_sky_drone`:5592, `_sky_traffic_tick`:5636, `_future_lights`:5655

## 5667-6166  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5726, `_crew_col`:5734, `_peer_crewmate`:5737, `_set_ring_color`:5740, `_level_color`:5767, `_tier_color`:5780, `_my_ach_tier`:5783, `_style_ring`:5790, `_social_peer_extras`:5838, `_social_tag`:5852, `_my_tag_extra`:5864, `_soc_send`:5877, `_social_msg`:5892, `_social_accept`:5931, `_social_go`:5952, `_soc_friend`:5971, `_soc_invite`:5978, `_soc_goto`:5983, `_soc_high_five`:5991, `_soc_gift`:6011, `_soc_crew_invite`:6028, `_gift_day_check`:6035, `_crew_create`:6041, `_crew_cycle_color`:6051, `_crew_leave`:6056, `_crew_mate_near`:6064, `_crew_board`:6072, `_build_social`:6091, `_social_online`:6153, `_open_social`:6157, `_close_social`:6163

## 6167-6417  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6170, `_track_pos`:6179, `_social_row_button`:6190, `_refresh_social`:6197, `_on_dance_floor`:6259, `_toggle_dance`:6262, `_build_dance_floor`:6270, `_social_tick`:6296, `_photo`:6368

## 6418-6913  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6440, `_game_state`:6448, `_build_arcade`:6460, `_c4_empty`:6511, `_c4_drop_row`:6517, `_c4_winner`:6523, `_c4_bot_move`:6544, `_c4_code`:6573, `_c4_ready`:6579, `_c4_tap`:6582, `_c4_check`:6603, `_c4_tick`:6627, `_rx_ready`:6654, `_rx_start`:6657, `_rx_tap`:6671, `_rx_send_time`:6696, `_rx_resolve`:6703, `_rx_tick`:6729, `_mem_start`:6744, `_mem_tap`:6760, `_mem_finish`:6775, `_mem_tick`:6791, `_mem_board_text`:6798, `_build_arcade_panel`:6809, `_refresh_arcade_panel`:6852

## 6914-7207  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6977, `_quiz_slot`:6980, `_quiz_question`:6990, `_quiz_bot_score`:7019, `_in_quiz`:7028, `_build_quiz`:7031, `_quiz_answer`:7101, `_quiz_msg`:7114, `_quiz_board`:7122, `_quiz_tick`:7132, `_quiz_refresh`:7174

## 7208-8785  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7379, `_sites_found`:7382, `_sites_total`:7385, `_bits`:7388, `_ach_value`:7395, `_ach_tick`:7450, `_ach_check`:7475, `_ach_by_id`:7511, `_ach_msg`:7517, `_build_ach`:7530, `_ach_show`:7561, `_open_ach`:7581, `_close_ach`:7587, `_refresh_ach`:7591, `_ach_num`:7622, `_minimap_tap`:7625, `_menu_go`:7632, `_menu_stay`:7637, `_menu_call_car`:7641, `_toggle_clean_hud`:7647, `_refresh_menu_buttons`:7653, `_clean_hud_tick`:7663, `_draw_joystick`:7704, `_input`:7709, `_touch_text_focus`:7800, `_stick_zone`:7820, `_notification`:7824, `_physics_process`:7841, `_follow_camera`:7992, `_follow_walk_camera`:8028, `_interact`:8051, `_refresh_hud`:8213, `_open_panel`:8342, `_layout_panels`:8372, `_toggle_menu`:8399, `_rescue`:8445, `_show_toast`:8477, `_save_progress`:8481, `_load_progress`:8576

## 8786-11389  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8787, `_radio_voice`:8790, `_radio_make`:8823, `_radio_set`:8894, `_radio_play`:8916, `_radio_next`:8921, `_radio_talk_line`:8925, `_radio_caption`:8946, `_radio_refresh`:8954, `_process`:8967, `_build_peds`:9018, `_update_peds`:9129, `_update_ped`:9148, `_smoke_test`:9202, `_smoke_chase`:9855, `_smoke_orole`:9888, `_smoke_levels`:9917, `_smoke_bus`:9958, `_smoke_chase_extras`:10043, `_smoke_marina`:10071, `_blocked_at`:10173, `_blocker`:10188, `_on_screen`:10201, `_wait_radio`:10206, `_smoke_radio_peds`:10213, `_smoke_typed_chat`:10283, `_smoke_chat_touch`:10302, `_smoke_cafe`:10323, `_smoke_boutique`:10349, `_smoke_models`:10377, `_smoke_garage_ridge`:10401, `_save_shot`:10777, `_pet_shots`:10787, `_tracker_shots`:10822, `_infected_shots`:10856, `_paris_shots`:10907, `_people_shots`:11137, `_shots`:11178, `_shot_car`:11372, `_capture_preview`:11382

## 11390-12038  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11457, `_downtown_count`:11460, `_nearest_downtown`:11467, `_check_downtown`:11481, `_discover_downtown`:11494, `_box_batch`:11508, `_model_batch`:11528, `_cut_ranges`:11582, `_dt_ranges`:11594, `_dt_has`:11601, `_dt_near_cross`:11607, `_place`:11613, `_signal_pole`:11624, `_cyl_batch`:11643, `_city_signals`:11667, `_ensure_light_mats`:11718, `_city_lamps`:11728, `_build_downtown`:11772, `_dt_block`:11972, `_downtown_token`:11978, `_build_park`:11995, `_build_plaza`:12024

## 12039-12142  old city and Bay details

`_build_city_detail`:12040

## 12143-12552  traffic

`_build_traffic`:12144, `_path_sample`:12239, `_light_look`:12253, `_light_green`:12261, `_traffic_place`:12265, `_traffic_blocked_by`:12277, `_traffic_tick`:12289, `_smoke_downtown`:12395, `_skyline_shot`:12507, `_skyline_shots`:12515

## 12553-12913  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12599, `_web_scale`:12662, `_web_fps_tick`:12672, `_world_to_uv`:12689, `_map_angle`:12692, `_build_minimap`:12700, `_open_map`:12773, `_close_map`:12784, `_mini_point`:12791, `_site_markers`:12795, `_draw_arrow`:12827, `_draw_minimap`:12834, `_draw_full_map`:12881, `_minimap_tick`:12906

## 12914-13174  camera views

`_build_view_controls`:12915, `_cycle_view`:12957, `_apply_view`:12967, `_hide_labels`:13008, `_unfade`:13014, `_bake_map`:13020, `_shot_stats`:13070, `_view_shots`:13073, `_smoke_views`:13114

## 13175-13422  v0.17.0: level-up celebration

`_build_level_fx`:13186, `_draw_level_rays`:13223, `_level_fx_tick`:13233, `_level_sound`:13238, `_fx_material`:13280, `_level_up_fx`:13288, `_smoke_level_fx`:13389, `_levelup_shots`:13398

## 13423-13542  v0.18.0: walk-in stadium

`_collider_yaw`:13428, `_build_stadium_walls`:13439, `_look`:13467, `_smoke_stadium_eye`:13476, `_stadium_shots`:13512

## 13543-13704  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13567, `_arrow_mesh`:13579, `_build_guidance`:13602, `_guide_target`:13627, `_guidance_tick`:13656, `_draw_hud_arrow`:13682

## 13705-13890  checkpoints

`_build_checkpoints`:13706, `_refresh_checkpoints`:13751, `_check_checkpoints`:13757, `_activate_checkpoint`:13767, `_checkpoint_spawn`:13788, `_spawn_at_checkpoint`:13793, `_draw_checkpoint_icon`:13809, `_smoke_guidance_checkpoints`:13815, `_guide_shots`:13865

## 13891-14169  v0.18.0: Harbor Dome social hub

`_hub_seat`:13949, `_build_hub`:13953

## 14170-14220  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14171, `_xm_mesh`:14180, `_xm_tree`:14188

## 14221-14544  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14224, `_gt_surface`:14239, `_xm_grand_tree`:14249, `_lux_mat`:14364, `_lux_part`:14380, `_lux_box`:14383, `_lux_cyl`:14388, `_lux_ball`:14396, `_lux_new`:14404, `_lux_commit`:14409, `_lux_sofa_mesh`:14413, `_lux_chair_mesh`:14443, `_lux_table_mesh`:14463, `_lux_pouf_mesh`:14478, `_lux_batch`:14493, `_hub_christmas`:14509

## 14545-14700  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14546

## 14701-14949  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14704, `_vx_cyl`:14711, `_vx_ball`:14719, `_vx_ring`:14727, `_hub_polish`:14735, `_hub_gate`:14758, `_hub_vip`:14820, `_hub_glass`:14933

## 14950-15164  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14951, `_build_hub_bots`:14976, `_seat_of`:15007, `_bubble`:15017, `_emote`:15073, `_hub_people_tick`:15087

## 15165-15283  seats

`_seat_taken`:15166, `_nearest_seat`:15174, `_seat_label`:15186, `_sit`:15202, `_stand_up`:15246, `_seated_tick`:15265

## 15284-15440  game panel

`_build_game_panel`:15285, `_open_game_panel`:15340, `_refresh_game_panel`:15359, `_play_robot`:15404, `_peer_at`:15418, `_opponent_name`:15425, `_pay`:15433

## 15441-15561  tic-tac-toe

`_ttt_ready`:15444, `_ttt_winner`:15450, `_ttt_bot_move`:15460, `_ttt_tap`:15486, `_ttt_code`:15506, `_ttt_check`:15512, `_ttt_tick`:15535

## 15562-15613  rock paper scissors

`_rps_ready`:15563, `_rps_pick`:15569, `_rps_resolve`:15587, `_rps_tick`:15611

## 15614-15696  online table messages

`_online_game_send`:15615, `_hub_game_msg`:15621

## 15697-15772  comedy show

`_joke_start`:15698, `_joke_tick`:15710, `_speak`:15736, `_play_rimshot`:15745

## 15773-16672  quick chat and emotes

`_build_chat`:15795, `_chat_toggle_to`:15912, `_chat_log_add`:15920, `_chat_area`:15926, `_chat_near_count`:15944, `_chat_tick`:15953, `_toggle_chat`:16002, `_chat_fit`:16017, `_chat_clean`:16023, `_chat_wrap`:16040, `_chat_send_text`:16062, `_typing`:16085, `_say`:16088, `_do_emote`:16104, `_smoke_hub`:16113, `_chat_shots`:16287, `_cafe_shots`:16312, `_shop_shots`:16360, `_car_shots`:16409, `_outfit_shots`:16440, `_hub_shots`:16488, `_sg_on_terrace`:16623, `_people_only`:16626, `_people_only_keep_cars_out`:16630, `_car_barrier`:16642, `_hub_keep_cars_out`:16656

## 16673-16835  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16682, `_feed_add`:16691, `_feed_render`:16697, `_feed_tick`:16725, `_online_event_send`:16734, `_at_pvp_table`:16741, `_game_name`:16748, `_send_lfp`:16751, `_lfp_msg`:16768, `_accept_invite`:16789

## 16836-17077  v0.18.2: nickname and HUD relayout

`_nick_rude`:16848, `_clean_nick`:16863, `_build_nick_panel`:16875, `_open_nick`:16913, `_random_nick`:16922, `_save_nick`:16928, `_close_nick`:16947, `_refresh_nick_button`:16956, `_relayout_hud`:16960, `_smoke_nick`:16997, `_nick_shots`:17029, `_smoke_sites_reachable`:17047

## 17078-17365  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17104, `_nearest_civic`:17111, `_check_civic`:17125, `_discover_civic`:17138, `_civ_ranges`:17151, `_civ_has`:17165, `_civ_near_cross`:17171, `_build_civic`:17177, `_civic_token`:17303, `_civic_shots`:17320, `_hub_focus`:17342

## 17366-17475  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17437, `_in_rw_lot`:17440, `_box_batch_rot`:17443, `_multi_collider`:17461

## 17476-17803  circuit geometry

`_cr_point`:17477, `_rw_build_path`:17491, `_rw_dir`:17519, `_rw_bend`:17524, `_ribbon`:17530, `_rw_band`:17550, `_rw_keepout`:17568, `_build_raceway`:17577, `_build_rw_parking`:17611, `_build_rw_pits`:17656, `_build_rw_track`:17693, `_build_rw_trackside`:17734

## 17804-17901  race car rental

`_model_key`:17805, `_race_car_start`:17808, `_tint_ghost`:17846, `_race_car_end`:17859, `_race_keep_cars_out`:17884

## 17902-17916  speed effects

`_eff_max`:17903, `_eff_accel`:17914

## 17917-17967  track helpers

`_rw_seg_progress`:17918, `_rw_track_dist`:17938, `_rw_point_dist`:17949, `_rw_player_progress`:17956, `_rw_target`:17962

## 17968-18204  events

`_rec_stop`:17969, `_rw_place`:17985, `_rw_grid_pos`:17992, `_rw_start`:17997, `_rw_spawn_ai`:18029, `_rw_ai_place`:18053, `_rw_tick`:18064, `_rw_ai_tick`:18117, `_rw_lap_done`:18159, `_rw_finish`:18171, `_rw_fmt`:18202

## 18205-18257  boosters and spikes

`_rw_buy`:18206, `_rw_use_boost`:18224, `_rw_use_spike`:18232, `_rw_drop_spike_at`:18243

## 18258-18315  online races

`_race_msg`:18259, `_join_race`:18281

## 18316-18671  raceway panel, HUD, board

`_build_raceway_ui`:18317, `_rw_layout`:18377, `_rw_open`:18384, `_rw_close`:18390, `_rw_refresh_panel`:18394, `_rw_refresh_board`:18407, `_rw_hud`:18419, `_peer_car_model`:18443, `_smoke_raceway`:18453, `_race_shots`:18634

## 18672-18879  v0.22.0: Call Car

`_call_block_reason`:18678, `_call_spot`:18695, `_call_car`:18726, `_play_horn`:18750, `_smoke_follow_call`:18774, `_follow_shots`:18847

## 18880-19337  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18905, `_place_portal_button`:18911, `_portal_pressed`:18918, `_build_travel`:18926, `_toggle_run`:19031, `_refresh_run`:19035, `_hud_v23_tick`:19043, `_travel_block_reason`:19075, `_travel_open`:19095, `_open_travel`:19101, `_open_worlds`:19107, `_open_case`:19113, `_case_step`:19125, `_case_refresh`:19129, `_case_submit`:19133, `_close_case`:19142, `_sky_go`:19146, `_close_worlds`:19156, `_refresh_worlds`:19160, `_world_go`:19166, `_close_travel`:19173, `_refresh_travel`:19177, `_travel_to`:19185, `_smoke_travel`:19212, `_v23_shots`:19250

## 19338-19411  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19345, `_qr_button`:19360, `_qr_layout`:19399, `_smoke_qr`:19405

## 19412-19848  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19432, `_open_crate`:19448, `_build_crate_ui`:19465, `_crate_pick`:19552, `_crate_reveal`:19575, `_crate_draw_car`:19602, `_crate_confetti`:19621, `_crate_sound`:19646, `_crate_drive`:19672, `_feed_add_system`:19702, `_smoke_crate`:19705, `_crate_shots`:19753

## 19849-20340  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19890, `_quick_today`:19895, `_quick_is_done`:19898, `_quick_left`:19901, `_quick_next`:19908, `_quick_fix_target`:19921, `_quick_daily_check`:19935, `_quick_complete`:19949, `_quick_side`:19983, `_build_quick_props`:20001, `_daily_shots`:20153, `_quick_props_refresh`:20195, `_quick_fx`:20199, `_play_coin`:20215, `_smoke_quick`:20232

## 20341-20491  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20350, `_quest_nearby`:20405, `_open_quests`:20412, `_close_quests`:20419, `_refresh_quests`:20423, `_quest_pick`:20449, `_quest_mode`:20463, `_smoke_quests`:20466

## 20492-20526  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20496, `_my_tag_tick`:20499

## 20527-20841  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20544, `_fc_torus`:20554, `_fc_pearl`:20562, `_fc_chrome`:20572, `_fc_glass`:20581, `_fc_glow`:20591, `_fc_ghost`:20600, `_fc_holo`:20612, `_fc_mesh`:20622, `_fc_sphere`:20642, `_fc_capsule`:20650, `_fc_cone`:20658, `_build_food_court`:20667, `_food_court_tick`:20821

## 20842-21163  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20871, `_cm_bench`:20887, `_build_commons`:20900, `_commons_tick`:21122

## 21164-21478  v0.36: the daily puzzle

`_pz_today`:21187, `_pz_new`:21190, `_pz_neighbours`:21235, `_pz_flip`:21245, `_pz_done`:21250, `_pz_tap`:21258, `_pz_win`:21274, `_pz_reset`:21295, `_puzzle_near`:21299, `_open_puzzle`:21304, `_close_puzzle`:21312, `_pz_refresh_sign`:21316, `_build_puzzle_panel`:21324, `_pz_draw`:21355, `_smoke_chat`:21396, `_smoke_feet`:21434, `_smoke_commons`:21455

## 21479-21667  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21541, `_bio_theta`:21545, `_bio_sec_n`:21550, `_bio_sec_of`:21553, `_bio_pt`:21556, `_bio_lp`:21561, `_bio_la`:21565, `_bio_dir`:21569, `_bio_hex_r`:21572, `_bio_apo`:21577, `_bio_open_angles`:21583, `_bio_si`:21593, `_bm`:21599, `_bsph`:21604, `_blow`:21607, `_bcone`:21618, `_bbox`:21621, `_bp`:21624, `_bq`:21629, `_bio_glass_mat`:21633, `_bio_water_mat`:21646, `_bio_mat`:21658

## 21668-22040  building blocks

`_bio_inst`:21669, `_bio_add`:21675, `_bio_model`:21678, `_bio_nature_mesh`:21684, `_bio_flush`:21718, `_bio_bar`:21753, `_bio_slab`:21766, `_bio_body`:21781, `_bio_cyl_col`:21794, `_bio_hexmesh`:21807, `_bio_hexslab`:21819, `_bio_hexpt`:21825, `_bio_gridshell`:21832, `_bio_rail`:21939, `_bio_rail_arc`:21944, `_bio_disc_deck`:21956, `_bio_ring_deck`:21962, `_bio_helix`:21973, `_bio_pillar`:21993, `_bio_cafe`:21999, `_bio_fence_line`:22013, `_bio_fence_seg`:22018, `_bio_pen`:22028

## 22041-22542  building

`_build_biosphere`:22042, `_build_biosphere_legacy`:22046, `_bio_text`:22208, `_bio_plaque`:22226, `_bio_ticket_hall`:22240, `_on_foot_collision_guard`:22296, `_bio_inside`:22306, `_bio_pass_ok`:22309, `_ticket_near`:22313, `_bio_buy_pass`:22318, `_bio_gates_update`:22334, `_bio_gate_tick`:22360, `_bio_tunnel`:22372, `_bio_grounds`:22425, `_bio_dome`:22471, `_bio_deck_mats`:22539

## 22543-22698  garden planting

`_bio_free`:22544, `_bio_spot`:22561, `_bio_garden`:22569, `_bio_pine`:22610, `_bio_tree`:22613, `_bio_big_tree`:22623, `_bio_rock`:22628, `_bio_pond`:22631, `_bio_particles`:22635, `_bio_mist`:22663, `_bio_mini_dome`:22692

## 22699-23106  the four layouts

`_bio_winter`:22700, `_bio_spring`:22792, `_bio_summer`:22917, `_bio_autumn`:23001

## 23107-23377  animals

`_bio_spawn`:23108, `_bio_load_animal`:23180, `_bio_make_quad`:23201, `_bio_load_bird`:23278, `_bio_make_penguin`:23298, `_bio_make_bird`:23320, `_bio_make_flamingo`:23344, `_bio_make_butterfly`:23365

## 23378-23509  animation, spotting and rewards

`_bio_stuck_check`:23383, `_biosphere_tick`:23401, `_bio_animate`:23410, `_bio_spot_check`:23490, `_bio_spotted`:23502, `_smoke_biosphere`:23506

## 23510-24027  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23597, `_wear_piece`:23600, `_wear_mat`:23623, `_person_index`:23639, `_dress`:23662, `_smoke_style`:23768, `_style_shots`:23919, `_npc_look`:23991

## 24028-24181  your look: apply, save, share

`_look_clean`:24032, `_look_pack`:24047, `_owns`:24053, `_apply_look`:24058, `_relic_model`:24069, `_fc_mesh_mat`:24134, `_relic_refresh`:24137, `_relic_tick`:24151, `_peer_style`:24162

## 24182-24609  stores and the wardrobe

`_style_today`:24201, `_style_items`:24204, `_style_cat`:24212, `_style_price`:24215, `_style_deal`:24229, `_style_price_base`:24242, `_relic_stock`:24249, `_build_style_panel`:24261, `_open_store`:24301, `_open_wardrobe`:24320, `_style_close`:24323, `_style_finish`:24327, `_sync_old_avatar`:24342, `_style_tabs_for`:24349, `_refresh_style`:24354, `_style_body_rows`:24505, `_style_set_tab`:24522, `_style_step`:24526, `_style_color`:24531, `_style_pick`:24536, `_style_buy`:24571, `_ach_relics_check`:24593, `_style_face_camera`:24598

## 24610-25077  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24646, `_ga_text`:24652, `_ga_box`:24669, `_build_galleria`:24685, `_ga_inner_tick`:24826, `_ga_shell`:24842, `_ga_inside`:24892, `_bio_cyl_col_on`:24895, `_ga_models`:24907, `_ga_lbox`:24922, `_ga_ltext`:24936, `_ga_store`:24943, `_bio_cafe_on`:25045, `_ga_mannequins`:25053

## 25078-25229  featured outfits and the Sky Run

`_ga_featured_look`:25091, `_build_ga_fun`:25112, `_ga_fun_tick`:25157, `_sky_finish`:25184, `_extra_near`:25203, `_extra_open`:25212, `_store_near`:25221

## 25230-25326  v0.41: THE SKY GARDEN

`_sg_now`:25284, `_sg_progress`:25287, `_sg_time`:25293, `_sg_stock`:25300, `_sg_mut_roll`:25315

## 25327-25464  building

`_sg_box`:25328, `_sg_text`:25334, `_build_sky_garden`:25348, `_sg_seed_spot`:25459, `_sg_codex_spot`:25462

## 25465-25645  plants

`_sg_plant_model`:25466, `_sg_refresh_all`:25571, `_sg_refresh`:25575, `_sky_garden_tick`:25611, `_sg_ready_count`:25630, `_sg_boot_note`:25637

## 25646-25765  interacting

`_sg_near`:25647, `_sg_button_text`:25670, `_sg_value`:25683, `_sg_interact`:25687, `_sg_buy`:25703, `_sg_plant`:25725, `_sg_harvest`:25736

## 25766-26009  the garden screen

`_build_sg_panel`:25767, `_sg_open`:25802, `_sg_close`:25811, `_sg_row`:25815, `_sg_refresh_panel`:25830, `_sg_pick_buy`:25875, `_sg_pick_plant`:25879, `_smoke_car_barriers`:25885, `_smoke_sky_garden`:25926

## 26010-26048  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26041, `_pass_day`:26044

## 26049-26080  album

`_album_pages`:26050, `_album_claim`:26065

## 26081-26132  season

`_season_index`:26082, `_season_tick`:26085, `_season_xp`:26094, `_season_tier`:26097, `_season_reward`:26100, `_season_claim`:26114

## 26133-26140  Harbor Night

`_harbor_night`:26134

## 26141-26172  check-in calendar

`_cal_tick`:26142

## 26173-26349  the panel

`_build_hp_panel`:26174, `_open_pass`:26209, `_hp_open`:26212, `_hp_close`:26219, `_hp_row`:26223, `_hp_bar`:26238, `_hp_refresh`:26242, `_smoke_pass`:26287

## 26350-26564  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26354, `_cash_pill_tick`:26362, `_build_lb`:26400, `_open_lb`:26443, `_close_lb`:26451, `_lb_pick`:26455, `_lb_headers`:26460, `_lb_url`:26464, `_lb_me`:26467, `_lb_tick`:26470, `_lb_upload`:26478, `_lb_fetch`:26488, `_lb_got`:26496, `_lb_value`:26507, `_lb_refresh_ui`:26518

## 26565-27123  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26589, `_market_near`:26668, `_build_gear`:26678, `_gear_piece`:26686, `_pet_m`:26731, `_pet_eyes`:26745, `_build_pet`:26752, `_pet_nose`:26890, `_pet_anim`:26893, `_market_apply`:26904, `_market_tick`:26928, `_build_market_panel`:26952, `_open_market`:26978, `_close_market`:26985, `_refresh_market`:26989, `_market_pick`:27042, `_toggle_board`:27080, `_board_tick`:27087

## 27124-27365  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27156, `_ds_label`:27175, `_build_display`:27189, `_ds_got`:27268, `_ds_sorted`:27277, `_ds_render_board`:27291, `_ds_render_news`:27317, `_display_tick`:27336

## 27366-27544  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27383, `_toggle_streamer`:27470, `_streamer_badge_tap`:27486, `_streamer_tick`:27490

## 27545-27581  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27551, `_car_back`:27558, `_car_park_tick`:27565

## 27582-27678  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27586, `_bus_eta`:27640, `_bus_displays_tick`:27656

## 27679-27970  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27697, `_treasure_pick`:27700, `_treasure_spot`:27709, `_treasure_district`:27713, `_treasure_clue`:27725, `_treasure_prop`:27738, `_tp_part`:27741, `_tp_sphere`:27751, `_tp_cyl`:27759, `_treasure_prop_side`:27768, `_build_treasure_props`:27780, `_build_treasure`:27824, `_treasure_dir_char`:27893, `_treasure_tick`:27902, `_treasure_claim`:27956

## 27971-28071  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27972, `_halo_mat`:28004, `_smoke_treasure`:28029

## 28072-28395  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28093, `_fm_send`:28096, `_fm_area`:28102, `_fm_glow_mesh`:28118, `_fm_block_reason`:28136, `_fm_start`:28148, `_fm_announce`:28176, `_fm_finish`:28179, `_fm_msg`:28197, `_fm_check_paid`:28248, `_fm_tick`:28266, `_smoke_findme`:28322

## 28396-28506  v0.24.2: road map (for moving people off the road)

`_floor_note`:28402, `_floor_disc`:28416, `_floor_top`:28425, `_ground_at`:28443, `_note_road`:28461, `_on_road`:28468, `_ped_curb`:28478, `_curb_spot`:28488

## 28507-28802  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28529, `_ex_grid`:28537, `_ex_lamps`:28572, `_ex_umbrella`:28595, `_ex_yards`:28602, `_build_expansion`:28617, `_expand_shots`:28780

## 28803-28997  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28844, `_v27_near_cross`:28936, `_v27_near_any_road`:28943, `_v27_in_district`:28949, `_sea_tick`:28963, `_sea_tow`:28982

## 28998-29665  Harbor Loop sky train

`_sky_build_path`:29049, `_sky_pos`:29090, `_sky_dir`:29104, `_sky_project`:29109, `_sky_trip_time`:29128, `_sky_trip_dist`:29134, `_sky_now`:29145, `_sky_state`:29148, `_sky_time_at_station`:29163, `_sky_next_arrival`:29170, `_build_skytrain`:29183, `_sky_make_car`:29335, `_sky_skin`:29372, `_sky_place_trains`:29392, `_sky_build_station`:29411, `_sky_near`:29476, `_sky_fmt`:29485, `_sky_enter`:29489, `_sky_leave_platform`:29507, `_sky_board`:29517, `_sky_alight`:29531, `_sky_action`:29545, `_sky_tick`:29562, `_sky_camera`:29602, `_tour_today`:29618, `_tour_stamp`:29621, `_sky_hud`:29644

## 29666-30039  Day and night

`_toggle_weather`:29749, `_refresh_weather_button`:29755, `_game_hour`:29761, `_day_key`:29773, `_night_setup`:29788, `_night_scan_mesh`:29878, `_daynight_tick`:29903, `_daynight_apply`:29912, `_daynight_lights`:30024, `_cycle_day_mode`:30029, `_refresh_time_button`:30036

## 30040-30677  v0.27 smoke test and screenshots

`_smoke_v27`:30041, `_city_shots`:30246

## 30678-31094  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30712, `_ap_plane`:30888, `_ap_truck`:30908, `_ap_baggage_train`:30949, `_ap_loop_pos`:30962, `_ap_loop_len`:30978, `_ap_flight_at`:30984, `_ap_tick`:31008, `_airport_ped_plan`:31031, `_smoke_airport`:31051

## 31095-31608  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31109, `_nav_spot`:31116, `_nav_idx`:31120, `_nav_pos`:31127, `_nav_blocked`:31131, `_nav_nearest_free`:31141, `_nav_bfs`:31169, `_nav_build`:31213, `_stroller`:31284, `_stroll_place`:31300, `_stroll_next`:31321, `_nav_clear_line`:31355, `_stroll_aim`:31366, `_strollers_tick`:31398, `_smoke_strollers`:31493

## 31609-31769  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31644, `_dir_fmt`:31647, `_signpost_spot`:31650, `_build_signposts`:31667

## 31770-31866  the Directions panel and chip

`_build_dir_panel`:31771, `_open_dir`:31813, `_dir_close`:31822, `_dir_pick`:31826, `_dir_stop`:31831, `_dir_stop_and_close`:31836, `_dir_tick`:31840

## 31867-32408  v0.44: Grand Central

`_gc_mesh`:31896, `_gc_mat`:31929, `_gc_glass`:31938, `_gb`:31948, `_gb_solid`:31954, `_gb_flush`:31958, `_gc_tree`:31988, `_gc_text`:31993, `_gc_planter`:32008, `_gc_kiosk`:32014, `_goods_color`:32044, `_goods_mat`:32047, `_kiosk_goods`:32051, `_build_grand_central`:32129, `_build_gc_towers`:32297, `_gc_tick`:32392

## 32409-32700  v0.44: filling the empty land

`_loft`:32426, `_fill_clear`:32468, `_build_fill`:32478, `_hg_in_lake`:32526, `_hg_path`:32530, `_floor_note_rot`:32538, `_build_gardens`:32546, `_build_fan_plaza`:32656

## 32701-32735  v0.45: hover car underglow

`_car_underglow`:32704

## 32736-32900  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32737

## 32901-32932  v0.47: street stalls downtown

`_build_street_stalls`:32905, `_cull_people_in`:32925

## 32933-33031  v0.48: places that open as you level up

`_place_lock_of`:32946, `_place_root`:32952, `_place_unlocked`:32955, `_build_place_signs`:32963, `_places_refresh`:33008, `_places_tick`:33025

## 33032-33076  v0.50: city careers

`_career_rank_name`:33057, `_career_mult`:33060, `_career_block_reason`:33065, `_career_start`:33068, `_career_end`:33073

## 33077-33127  v0.52: careers as clear job loops

`_cid`:33104, `_career_target`:33118, `_career_tick`:33125

## 33128-33135  taxi

`_taxi_meter`:33129

## 33136-33139  paramedic

(no functions)

## 33140-33144  police

`_career_chase_over`:33142

## 33145-33150  firefighter

`_fire_aimed`:33146

## 33151-33160  the step bar

`_career_bar_text`:33154, `_career_hud`:33158

## 33161-33187  cut scenes

`_cs_skip`:33179

## 33188-33192  siren

(no functions)

## 33193-33204  the Careers panel

`_build_career_panel`:33194, `_open_careers`:33197, `_career_close`:33201

## 33205-33628  v0.50: homes

`_home_door_spots`:33245, `_build_homes`:33260, `_home_labels`:33289, `_home_door_near`:33298, `_home_origin`:33307, `_home_slot_near`:33310, `_home_exit_near`:33321, `_home_btn`:33328, `_home_interact`:33341, `_home_buy`:33360, `_home_default_layout`:33374, `_home_enter`:33382, `_home_leave`:33402, `_hm`:33410, `_home_build_room`:33429, `_home_refresh_room`:33538, `_furni_build`:33552

## 33629-33964  decorating

`_build_home_panels`:33630, `_open_homes`:33675, `_home_row_go`:33685, `_home_panel_close`:33705, `_deco_open`:33709, `_deco_pick`:33732, `_smoke_careers_homes`:33755

## 33965-34099  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33969, `_home_slots`:33977, `_home_ring`:34004, `_furni_cat`:34010, `_home_fix_layout`:34016, `_home_build_layout`:34044

## 34100-34533  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34163, `_ch_homes`:34169, `_ch_step_text`:34176, `_ch_step_done`:34187, `_ch_target`:34201, `_ch_finish_chapter`:34210, `_chapters_tick`:34232, `_hud_top_stack`:34272, `_build_chapters_ui`:34302, `_chapters_restart_ask`:34344, `_chapters_restart`:34347, `_chapters_text`:34357, `_open_chapters`:34377, `_chapters_close`:34384, `_smoke_chapters`:34388, `_step_sound`:34509

## 34534-34572  v0.51.1: join and leave messages

`_announce_join`:34541, `_announce_already_here`:34560, `_announce_leave`:34568

## 34573-34837  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34589, `_shot_tick`:34595, `_draw_shot_icon`:34627, `_shot_enter`:34636, `_shot_exit`:34650, `_shot_release_controls`:34662, `_shot_stick_zone`:34669, `_shot_input`:34672, `_smoke_photo`:34744

## 34838-35136  v0.51.3: stream joiners

`_viewer_count`:34858, `_stream_join_check`:34864, `_stream_join_start`:34871, `_sj_streamer`:34888, `_stream_join_tick`:34897, `_stream_join_land`:34921, `_sj_welcome`:34937, `_smoke_stream_join`:34971, `_career_shot`:35054

## 35137-35253  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35141, `_st_restore`:35179, `_smoke_streamer_clean`:35200, `_world_bio_passport`:35251

