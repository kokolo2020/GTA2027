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

## 804-2012  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:823, `_real_tex`:864, `_real_setup`:872, `_real_kind`:893, `_realify`:899, `_real_glass`:936, `_make_window_textures`:956, `_material`:989, `_box`:1014, `_sign`:1036, `_build_world`:1048, `_future_kiosk`:1159, `_build_collectibles`:1185, `_auto_collect_tick`:1218, `_find_count`:1239, `_nearest_find`:1246, `_destination`:1260, `_toggle_activity`:1296, `_collect_find`:1325, `_owned_count`:1340, `_ridge_open`:1347, `_ridge_count`:1351, `_nearest_ridge`:1358, `_apply_car`:1372, `_tune_level`:1402, `_tune_cost`:1405, `_car_stats`:1411, `_buy_tune`:1418, `_open_tune`:1439, `_back_to_garage`:1445, `_refresh_tune`:1449, `_bay_open`:1460, `_area_open`:1463, `_bay_count`:1466, `_nearest_bay`:1473, `_build_bay`:1487, `_check_bay`:1540, `_discover_bay`:1553, `_north_count`:1566, `_north_open`:1573, `_nearest_north`:1576, `_check_north`:1590, `_discover_north`:1603, `_prop`:1616, `_collider`:1630, `_first_mesh`:1640, `_scatter`:1649, `_prop_stretch`:1683, `_north_token`:1692, `_nm_roads`:1719, `_prop_big`:1734, `_nm_near_cross`:1750, `_build_north`:1757, `_build_nm_blocks`:1874, `_build_north_landscape`:1959, `_nm_free`:1986, `_build_landscape`:1996

## 2013-2496  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2014, `_online_toggle`:2028, `_online_autostart`:2054, `_online_connect`:2073, `_online_stop`:2080, `_online_next_ref`:2091, `_online_send`:2095, `_online_join_frame`:2099, `_online_pos_frame`:2102, `_online_tick`:2111, `_online_handle`:2145, `_online_clean_name`:2198, `_online_peer_update`:2207, `_online_make_peer`:2276, `_peer_look`:2317, `_online_tint`:2374, `_paint_mat`:2390, `_online_update_peers`:2402, `_online_clear_peers`:2482, `_online_refresh_button`:2487

## 2497-2669  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2577, `_marina_count`:2580, `_nearest_marina`:2587, `_check_marina`:2601, `_discover_marina`:2614, `_shop_available`:2627, `_nearest_shop`:2630, `_premium_cars`:2638, `_glass`:2645, `_shop_building`:2651, `_shop_pad`:2661

## 2670-3185  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2671, `_bus_last`:2674, `_build_bus`:2677, `_bus_boxes`:2704, `_bus_skin`:2714, `_bus_side`:2727, `_bus_reset`:2730, `_bus_text`:2739, `_bus_tick`:2744, `_bus_near`:2784, `_bus_board`:2795, `_bus_alight`:2810, `_build_marina`:2824, `_set_hat`:2930, `_build_hat`:2933, `_cyl`:2998, `_hat_part`:3007, `_apply_avatar`:3016, `_shop_count`:3028, `_shop_open`:3038, `_shop_step`:3056, `_shop_close`:3062, `_owned_text`:3075, `_refresh_shop`:3078, `_shop_action`:3131, `_journal_flip`:3182

## 3186-3240  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3197, `_xp`:3200, `_level_for`:3207, `_level`:3215, `_level_text`:3218, `_check_level`:3228

## 3241-3343  v0.11.0: online police vs thief

`_orole_ready`:3242, `_orole_start`:3245, `_orole_end`:3272, `_orole_tick`:3281

## 3344-4287  v0.10.0: chase mode (offline)

`_chase_open`:3345, `_chase_clear`:3350, `_chase_make_unit`:3364, `_chase_spawn_point`:3394, `_chase_start`:3403, `_chase_end`:3439, `_chase_steer`:3458, `_chase_roadblock`:3494, `_chase_heli_build`:3539, `_chase_extras`:3565, `_chase_tick`:3592, `_start_trial`:3656, `_cancel_trial`:3683, `_check_trial`:3688, `_finish_trial`:3705, `_trial_count`:3721, `_open_trials`:3728, `_refresh_trials`:3732, `_update_gate`:3744, `_slab`:3762, `_build_ridge`:3780, `_check_ridge`:3843, `_discover`:3856, `_mission_progress`:3870, `_check_missions`:3932, `_open_garage`:3943, `_open_journal`:3948, `_close_sub`:3953, `_bar`:3956, `_refresh_garage`:3960, `_garage_step`:3985, `_garage_action`:3989, `_refresh_journal`:4009, `_visited_shops`:4042, `_build_panels`:4049, `_build_player`:4209, `_build_car`:4247, `_try_model`:4276

## 4288-4972  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4289, `_kshader`:4363, `_ksync`:4369, `_kskin`:4384, `_make_kperson`:4390, `_hat_y`:4454, `_sit_drop`:4457, `_kplay`:4460, `_kpeople_tick`:4470, `_pose_person`:4499, `_pose_limbs`:4516, `_person_lift`:4578, `_snap_crowd_feet`:4591, `_people_life_tick`:4607, `_life_one`:4644, `_cull_person`:4654, `_recolor_car_model`:4662, `_apply_car_model`:4676, `_landmark`:4696, `_label`:4706, `_button`:4713, `_panel`:4725, `_build_hud`:4735

## 4973-5091  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4979, `_menu_tab`:4985, `_watch_tick`:5008, `_watch_count`:5050, `_online_pill_tap`:5057, `_online_pill_tick`:5063, `online_config_ok`:5089

## 5092-5129  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5095, `_offroad`:5101, `_ground_near`:5114, `_collectibles_on_road`:5121

## 5130-5269  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5142, `_build_quest_offer`:5146, `_quest_offer_tick`:5176, `_quest_auto_pick`:5226, `_quest_accept`:5241, `_quest_decline`:5255, `_quest_stop`:5261

## 5270-5637  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5294, `_holo_material`:5303, `_build_future`:5311, `_build_neon`:5325, `_model_profile`:5394, `_model_body_box`:5417, `_build_holograms`:5431, `_holo_tick`:5481, `_build_sky_traffic`:5498, `_sky_hover_car`:5516, `_sky_drone`:5563, `_sky_traffic_tick`:5607, `_future_lights`:5626

## 5638-6137  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5697, `_crew_col`:5705, `_peer_crewmate`:5708, `_set_ring_color`:5711, `_level_color`:5738, `_tier_color`:5751, `_my_ach_tier`:5754, `_style_ring`:5761, `_social_peer_extras`:5809, `_social_tag`:5823, `_my_tag_extra`:5835, `_soc_send`:5848, `_social_msg`:5863, `_social_accept`:5902, `_social_go`:5923, `_soc_friend`:5942, `_soc_invite`:5949, `_soc_goto`:5954, `_soc_high_five`:5962, `_soc_gift`:5982, `_soc_crew_invite`:5999, `_gift_day_check`:6006, `_crew_create`:6012, `_crew_cycle_color`:6022, `_crew_leave`:6027, `_crew_mate_near`:6035, `_crew_board`:6043, `_build_social`:6062, `_social_online`:6124, `_open_social`:6128, `_close_social`:6134

## 6138-6388  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6141, `_track_pos`:6150, `_social_row_button`:6161, `_refresh_social`:6168, `_on_dance_floor`:6230, `_toggle_dance`:6233, `_build_dance_floor`:6241, `_social_tick`:6267, `_photo`:6339

## 6389-6884  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6411, `_game_state`:6419, `_build_arcade`:6431, `_c4_empty`:6482, `_c4_drop_row`:6488, `_c4_winner`:6494, `_c4_bot_move`:6515, `_c4_code`:6544, `_c4_ready`:6550, `_c4_tap`:6553, `_c4_check`:6574, `_c4_tick`:6598, `_rx_ready`:6625, `_rx_start`:6628, `_rx_tap`:6642, `_rx_send_time`:6667, `_rx_resolve`:6674, `_rx_tick`:6700, `_mem_start`:6715, `_mem_tap`:6731, `_mem_finish`:6746, `_mem_tick`:6762, `_mem_board_text`:6769, `_build_arcade_panel`:6780, `_refresh_arcade_panel`:6823

## 6885-7178  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6948, `_quiz_slot`:6951, `_quiz_question`:6961, `_quiz_bot_score`:6990, `_in_quiz`:6999, `_build_quiz`:7002, `_quiz_answer`:7072, `_quiz_msg`:7085, `_quiz_board`:7093, `_quiz_tick`:7103, `_quiz_refresh`:7145

## 7179-8723  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7350, `_sites_found`:7353, `_sites_total`:7356, `_bits`:7359, `_ach_value`:7366, `_ach_tick`:7421, `_ach_check`:7446, `_ach_by_id`:7482, `_ach_msg`:7488, `_build_ach`:7501, `_ach_show`:7532, `_open_ach`:7552, `_close_ach`:7558, `_refresh_ach`:7562, `_ach_num`:7593, `_minimap_tap`:7596, `_menu_go`:7603, `_menu_stay`:7608, `_menu_call_car`:7612, `_toggle_clean_hud`:7618, `_refresh_menu_buttons`:7624, `_clean_hud_tick`:7634, `_draw_joystick`:7675, `_input`:7680, `_touch_text_focus`:7767, `_stick_zone`:7787, `_notification`:7791, `_physics_process`:7806, `_follow_camera`:7954, `_follow_walk_camera`:7990, `_interact`:8013, `_refresh_hud`:8173, `_open_panel`:8300, `_layout_panels`:8326, `_toggle_menu`:8349, `_rescue`:8391, `_show_toast`:8423, `_save_progress`:8427, `_load_progress`:8518

## 8724-10967  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8725, `_radio_voice`:8728, `_radio_make`:8761, `_radio_set`:8832, `_radio_play`:8854, `_radio_next`:8859, `_radio_talk_line`:8863, `_radio_caption`:8884, `_radio_refresh`:8892, `_process`:8905, `_build_peds`:8956, `_update_peds`:9067, `_update_ped`:9086, `_smoke_test`:9140, `_smoke_chase`:9783, `_smoke_orole`:9816, `_smoke_levels`:9845, `_smoke_bus`:9886, `_smoke_chase_extras`:9971, `_smoke_marina`:9999, `_blocked_at`:10101, `_blocker`:10116, `_on_screen`:10129, `_wait_radio`:10134, `_smoke_radio_peds`:10141, `_smoke_typed_chat`:10211, `_smoke_chat_touch`:10230, `_smoke_cafe`:10251, `_smoke_boutique`:10277, `_smoke_models`:10305, `_smoke_garage_ridge`:10329, `_save_shot`:10705, `_people_shots`:10715, `_shots`:10756, `_shot_car`:10950, `_capture_preview`:10960

## 10968-11616  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11035, `_downtown_count`:11038, `_nearest_downtown`:11045, `_check_downtown`:11059, `_discover_downtown`:11072, `_box_batch`:11086, `_model_batch`:11106, `_cut_ranges`:11160, `_dt_ranges`:11172, `_dt_has`:11179, `_dt_near_cross`:11185, `_place`:11191, `_signal_pole`:11202, `_cyl_batch`:11221, `_city_signals`:11245, `_ensure_light_mats`:11296, `_city_lamps`:11306, `_build_downtown`:11350, `_dt_block`:11550, `_downtown_token`:11556, `_build_park`:11573, `_build_plaza`:11602

## 11617-11720  old city and Bay details

`_build_city_detail`:11618

## 11721-12130  traffic

`_build_traffic`:11722, `_path_sample`:11817, `_light_look`:11831, `_light_green`:11839, `_traffic_place`:11843, `_traffic_blocked_by`:11855, `_traffic_tick`:11867, `_smoke_downtown`:11973, `_skyline_shot`:12085, `_skyline_shots`:12093

## 12131-12491  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12177, `_web_scale`:12240, `_web_fps_tick`:12250, `_world_to_uv`:12267, `_map_angle`:12270, `_build_minimap`:12278, `_open_map`:12351, `_close_map`:12362, `_mini_point`:12369, `_site_markers`:12373, `_draw_arrow`:12405, `_draw_minimap`:12412, `_draw_full_map`:12459, `_minimap_tick`:12484

## 12492-12749  camera views

`_build_view_controls`:12493, `_cycle_view`:12535, `_apply_view`:12545, `_hide_labels`:12583, `_unfade`:12589, `_bake_map`:12595, `_shot_stats`:12645, `_view_shots`:12648, `_smoke_views`:12689

## 12750-12997  v0.17.0: level-up celebration

`_build_level_fx`:12761, `_draw_level_rays`:12798, `_level_fx_tick`:12808, `_level_sound`:12813, `_fx_material`:12855, `_level_up_fx`:12863, `_smoke_level_fx`:12964, `_levelup_shots`:12973

## 12998-13117  v0.18.0: walk-in stadium

`_collider_yaw`:13003, `_build_stadium_walls`:13014, `_look`:13042, `_smoke_stadium_eye`:13051, `_stadium_shots`:13087

## 13118-13279  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13142, `_arrow_mesh`:13154, `_build_guidance`:13177, `_guide_target`:13202, `_guidance_tick`:13231, `_draw_hud_arrow`:13257

## 13280-13465  checkpoints

`_build_checkpoints`:13281, `_refresh_checkpoints`:13326, `_check_checkpoints`:13332, `_activate_checkpoint`:13342, `_checkpoint_spawn`:13363, `_spawn_at_checkpoint`:13368, `_draw_checkpoint_icon`:13384, `_smoke_guidance_checkpoints`:13390, `_guide_shots`:13440

## 13466-13744  v0.18.0: Harbor Dome social hub

`_hub_seat`:13524, `_build_hub`:13528

## 13745-13795  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13746, `_xm_mesh`:13755, `_xm_tree`:13763

## 13796-14119  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13799, `_gt_surface`:13814, `_xm_grand_tree`:13824, `_lux_mat`:13939, `_lux_part`:13955, `_lux_box`:13958, `_lux_cyl`:13963, `_lux_ball`:13971, `_lux_new`:13979, `_lux_commit`:13984, `_lux_sofa_mesh`:13988, `_lux_chair_mesh`:14018, `_lux_table_mesh`:14038, `_lux_pouf_mesh`:14053, `_lux_batch`:14068, `_hub_christmas`:14084

## 14120-14275  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14121

## 14276-14524  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14279, `_vx_cyl`:14286, `_vx_ball`:14294, `_vx_ring`:14302, `_hub_polish`:14310, `_hub_gate`:14333, `_hub_vip`:14395, `_hub_glass`:14508

## 14525-14739  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14526, `_build_hub_bots`:14551, `_seat_of`:14582, `_bubble`:14592, `_emote`:14648, `_hub_people_tick`:14662

## 14740-14858  seats

`_seat_taken`:14741, `_nearest_seat`:14749, `_seat_label`:14761, `_sit`:14777, `_stand_up`:14821, `_seated_tick`:14840

## 14859-15015  game panel

`_build_game_panel`:14860, `_open_game_panel`:14915, `_refresh_game_panel`:14934, `_play_robot`:14979, `_peer_at`:14993, `_opponent_name`:15000, `_pay`:15008

## 15016-15136  tic-tac-toe

`_ttt_ready`:15019, `_ttt_winner`:15025, `_ttt_bot_move`:15035, `_ttt_tap`:15061, `_ttt_code`:15081, `_ttt_check`:15087, `_ttt_tick`:15110

## 15137-15188  rock paper scissors

`_rps_ready`:15138, `_rps_pick`:15144, `_rps_resolve`:15162, `_rps_tick`:15186

## 15189-15271  online table messages

`_online_game_send`:15190, `_hub_game_msg`:15196

## 15272-15347  comedy show

`_joke_start`:15273, `_joke_tick`:15285, `_speak`:15311, `_play_rimshot`:15320

## 15348-16247  quick chat and emotes

`_build_chat`:15370, `_chat_toggle_to`:15487, `_chat_log_add`:15495, `_chat_area`:15501, `_chat_near_count`:15519, `_chat_tick`:15528, `_toggle_chat`:15577, `_chat_fit`:15592, `_chat_clean`:15598, `_chat_wrap`:15615, `_chat_send_text`:15637, `_typing`:15660, `_say`:15663, `_do_emote`:15679, `_smoke_hub`:15688, `_chat_shots`:15862, `_cafe_shots`:15887, `_shop_shots`:15935, `_car_shots`:15984, `_outfit_shots`:16015, `_hub_shots`:16063, `_sg_on_terrace`:16198, `_people_only`:16201, `_people_only_keep_cars_out`:16205, `_car_barrier`:16217, `_hub_keep_cars_out`:16231

## 16248-16410  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16257, `_feed_add`:16266, `_feed_render`:16272, `_feed_tick`:16300, `_online_event_send`:16309, `_at_pvp_table`:16316, `_game_name`:16323, `_send_lfp`:16326, `_lfp_msg`:16343, `_accept_invite`:16364

## 16411-16651  v0.18.2: nickname and HUD relayout

`_nick_rude`:16423, `_clean_nick`:16438, `_build_nick_panel`:16450, `_open_nick`:16488, `_random_nick`:16497, `_save_nick`:16503, `_close_nick`:16522, `_refresh_nick_button`:16531, `_relayout_hud`:16535, `_smoke_nick`:16571, `_nick_shots`:16603, `_smoke_sites_reachable`:16621

## 16652-16939  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16678, `_nearest_civic`:16685, `_check_civic`:16699, `_discover_civic`:16712, `_civ_ranges`:16725, `_civ_has`:16739, `_civ_near_cross`:16745, `_build_civic`:16751, `_civic_token`:16877, `_civic_shots`:16894, `_hub_focus`:16916

## 16940-17049  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17011, `_in_rw_lot`:17014, `_box_batch_rot`:17017, `_multi_collider`:17035

## 17050-17377  circuit geometry

`_cr_point`:17051, `_rw_build_path`:17065, `_rw_dir`:17093, `_rw_bend`:17098, `_ribbon`:17104, `_rw_band`:17124, `_rw_keepout`:17142, `_build_raceway`:17151, `_build_rw_parking`:17185, `_build_rw_pits`:17230, `_build_rw_track`:17267, `_build_rw_trackside`:17308

## 17378-17475  race car rental

`_model_key`:17379, `_race_car_start`:17382, `_tint_ghost`:17420, `_race_car_end`:17433, `_race_keep_cars_out`:17458

## 17476-17490  speed effects

`_eff_max`:17477, `_eff_accel`:17488

## 17491-17541  track helpers

`_rw_seg_progress`:17492, `_rw_track_dist`:17512, `_rw_point_dist`:17523, `_rw_player_progress`:17530, `_rw_target`:17536

## 17542-17778  events

`_rec_stop`:17543, `_rw_place`:17559, `_rw_grid_pos`:17566, `_rw_start`:17571, `_rw_spawn_ai`:17603, `_rw_ai_place`:17627, `_rw_tick`:17638, `_rw_ai_tick`:17691, `_rw_lap_done`:17733, `_rw_finish`:17745, `_rw_fmt`:17776

## 17779-17831  boosters and spikes

`_rw_buy`:17780, `_rw_use_boost`:17798, `_rw_use_spike`:17806, `_rw_drop_spike_at`:17817

## 17832-17889  online races

`_race_msg`:17833, `_join_race`:17855

## 17890-18245  raceway panel, HUD, board

`_build_raceway_ui`:17891, `_rw_layout`:17951, `_rw_open`:17958, `_rw_close`:17964, `_rw_refresh_panel`:17968, `_rw_refresh_board`:17981, `_rw_hud`:17993, `_peer_car_model`:18017, `_smoke_raceway`:18027, `_race_shots`:18208

## 18246-18453  v0.22.0: Call Car

`_call_block_reason`:18252, `_call_spot`:18269, `_call_car`:18300, `_play_horn`:18324, `_smoke_follow_call`:18348, `_follow_shots`:18421

## 18454-18754  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18469, `_build_travel`:18475, `_toggle_run`:18517, `_refresh_run`:18521, `_hud_v23_tick`:18529, `_travel_block_reason`:18558, `_travel_open`:18578, `_open_travel`:18584, `_close_travel`:18590, `_refresh_travel`:18594, `_travel_to`:18602, `_smoke_travel`:18629, `_v23_shots`:18667

## 18755-18828  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:18762, `_qr_button`:18777, `_qr_layout`:18816, `_smoke_qr`:18822

## 18829-19265  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:18849, `_open_crate`:18865, `_build_crate_ui`:18882, `_crate_pick`:18969, `_crate_reveal`:18992, `_crate_draw_car`:19019, `_crate_confetti`:19038, `_crate_sound`:19063, `_crate_drive`:19089, `_feed_add_system`:19119, `_smoke_crate`:19122, `_crate_shots`:19170

## 19266-19757  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19307, `_quick_today`:19312, `_quick_is_done`:19315, `_quick_left`:19318, `_quick_next`:19325, `_quick_fix_target`:19338, `_quick_daily_check`:19352, `_quick_complete`:19366, `_quick_side`:19400, `_build_quick_props`:19418, `_daily_shots`:19570, `_quick_props_refresh`:19612, `_quick_fx`:19616, `_play_coin`:19632, `_smoke_quick`:19649

## 19758-19908  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:19767, `_quest_nearby`:19822, `_open_quests`:19829, `_close_quests`:19836, `_refresh_quests`:19840, `_quest_pick`:19866, `_quest_mode`:19880, `_smoke_quests`:19883

## 19909-19943  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:19913, `_my_tag_tick`:19916

## 19944-20258  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:19961, `_fc_torus`:19971, `_fc_pearl`:19979, `_fc_chrome`:19989, `_fc_glass`:19998, `_fc_glow`:20008, `_fc_ghost`:20017, `_fc_holo`:20029, `_fc_mesh`:20039, `_fc_sphere`:20059, `_fc_capsule`:20067, `_fc_cone`:20075, `_build_food_court`:20084, `_food_court_tick`:20238

## 20259-20580  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20288, `_cm_bench`:20304, `_build_commons`:20317, `_commons_tick`:20539

## 20581-20895  v0.36: the daily puzzle

`_pz_today`:20604, `_pz_new`:20607, `_pz_neighbours`:20652, `_pz_flip`:20662, `_pz_done`:20667, `_pz_tap`:20675, `_pz_win`:20691, `_pz_reset`:20712, `_puzzle_near`:20716, `_open_puzzle`:20721, `_close_puzzle`:20729, `_pz_refresh_sign`:20733, `_build_puzzle_panel`:20741, `_pz_draw`:20772, `_smoke_chat`:20813, `_smoke_feet`:20851, `_smoke_commons`:20872

## 20896-21084  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:20958, `_bio_theta`:20962, `_bio_sec_n`:20967, `_bio_sec_of`:20970, `_bio_pt`:20973, `_bio_lp`:20978, `_bio_la`:20982, `_bio_dir`:20986, `_bio_hex_r`:20989, `_bio_apo`:20994, `_bio_open_angles`:21000, `_bio_si`:21010, `_bm`:21016, `_bsph`:21021, `_blow`:21024, `_bcone`:21035, `_bbox`:21038, `_bp`:21041, `_bq`:21046, `_bio_glass_mat`:21050, `_bio_water_mat`:21063, `_bio_mat`:21075

## 21085-21457  building blocks

`_bio_inst`:21086, `_bio_add`:21092, `_bio_model`:21095, `_bio_nature_mesh`:21101, `_bio_flush`:21135, `_bio_bar`:21170, `_bio_slab`:21183, `_bio_body`:21198, `_bio_cyl_col`:21211, `_bio_hexmesh`:21224, `_bio_hexslab`:21236, `_bio_hexpt`:21242, `_bio_gridshell`:21249, `_bio_rail`:21356, `_bio_rail_arc`:21361, `_bio_disc_deck`:21373, `_bio_ring_deck`:21379, `_bio_helix`:21390, `_bio_pillar`:21410, `_bio_cafe`:21416, `_bio_fence_line`:21430, `_bio_fence_seg`:21435, `_bio_pen`:21445

## 21458-21959  building

`_build_biosphere`:21459, `_build_biosphere_legacy`:21463, `_bio_text`:21625, `_bio_plaque`:21643, `_bio_ticket_hall`:21657, `_on_foot_collision_guard`:21713, `_bio_inside`:21723, `_bio_pass_ok`:21726, `_ticket_near`:21730, `_bio_buy_pass`:21735, `_bio_gates_update`:21751, `_bio_gate_tick`:21777, `_bio_tunnel`:21789, `_bio_grounds`:21842, `_bio_dome`:21888, `_bio_deck_mats`:21956

## 21960-22115  garden planting

`_bio_free`:21961, `_bio_spot`:21978, `_bio_garden`:21986, `_bio_pine`:22027, `_bio_tree`:22030, `_bio_big_tree`:22040, `_bio_rock`:22045, `_bio_pond`:22048, `_bio_particles`:22052, `_bio_mist`:22080, `_bio_mini_dome`:22109

## 22116-22523  the four layouts

`_bio_winter`:22117, `_bio_spring`:22209, `_bio_summer`:22334, `_bio_autumn`:22418

## 22524-22794  animals

`_bio_spawn`:22525, `_bio_load_animal`:22597, `_bio_make_quad`:22618, `_bio_load_bird`:22695, `_bio_make_penguin`:22715, `_bio_make_bird`:22737, `_bio_make_flamingo`:22761, `_bio_make_butterfly`:22782

## 22795-22924  animation, spotting and rewards

`_bio_stuck_check`:22800, `_biosphere_tick`:22818, `_bio_animate`:22825, `_bio_spot_check`:22905, `_bio_spotted`:22917, `_smoke_biosphere`:22921

## 22925-23442  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23012, `_wear_piece`:23015, `_wear_mat`:23038, `_person_index`:23054, `_dress`:23077, `_smoke_style`:23183, `_style_shots`:23334, `_npc_look`:23406

## 23443-23596  your look: apply, save, share

`_look_clean`:23447, `_look_pack`:23462, `_owns`:23468, `_apply_look`:23473, `_relic_model`:23484, `_fc_mesh_mat`:23549, `_relic_refresh`:23552, `_relic_tick`:23566, `_peer_style`:23577

## 23597-24024  stores and the wardrobe

`_style_today`:23616, `_style_items`:23619, `_style_cat`:23627, `_style_price`:23630, `_style_deal`:23644, `_style_price_base`:23657, `_relic_stock`:23664, `_build_style_panel`:23676, `_open_store`:23716, `_open_wardrobe`:23735, `_style_close`:23738, `_style_finish`:23742, `_sync_old_avatar`:23757, `_style_tabs_for`:23764, `_refresh_style`:23769, `_style_body_rows`:23920, `_style_set_tab`:23937, `_style_step`:23941, `_style_color`:23946, `_style_pick`:23951, `_style_buy`:23986, `_ach_relics_check`:24008, `_style_face_camera`:24013

## 24025-24492  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24061, `_ga_text`:24067, `_ga_box`:24084, `_build_galleria`:24100, `_ga_inner_tick`:24241, `_ga_shell`:24257, `_ga_inside`:24307, `_bio_cyl_col_on`:24310, `_ga_models`:24322, `_ga_lbox`:24337, `_ga_ltext`:24351, `_ga_store`:24358, `_bio_cafe_on`:24460, `_ga_mannequins`:24468

## 24493-24644  featured outfits and the Sky Run

`_ga_featured_look`:24506, `_build_ga_fun`:24527, `_ga_fun_tick`:24572, `_sky_finish`:24599, `_extra_near`:24618, `_extra_open`:24627, `_store_near`:24636

## 24645-24741  v0.41: THE SKY GARDEN

`_sg_now`:24699, `_sg_progress`:24702, `_sg_time`:24708, `_sg_stock`:24715, `_sg_mut_roll`:24730

## 24742-24879  building

`_sg_box`:24743, `_sg_text`:24749, `_build_sky_garden`:24763, `_sg_seed_spot`:24874, `_sg_codex_spot`:24877

## 24880-25060  plants

`_sg_plant_model`:24881, `_sg_refresh_all`:24986, `_sg_refresh`:24990, `_sky_garden_tick`:25026, `_sg_ready_count`:25045, `_sg_boot_note`:25052

## 25061-25180  interacting

`_sg_near`:25062, `_sg_button_text`:25085, `_sg_value`:25098, `_sg_interact`:25102, `_sg_buy`:25118, `_sg_plant`:25140, `_sg_harvest`:25151

## 25181-25424  the garden screen

`_build_sg_panel`:25182, `_sg_open`:25217, `_sg_close`:25226, `_sg_row`:25230, `_sg_refresh_panel`:25245, `_sg_pick_buy`:25290, `_sg_pick_plant`:25294, `_smoke_car_barriers`:25300, `_smoke_sky_garden`:25341

## 25425-25463  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25456, `_pass_day`:25459

## 25464-25495  album

`_album_pages`:25465, `_album_claim`:25480

## 25496-25547  season

`_season_index`:25497, `_season_tick`:25500, `_season_xp`:25509, `_season_tier`:25512, `_season_reward`:25515, `_season_claim`:25529

## 25548-25555  Harbor Night

`_harbor_night`:25549

## 25556-25587  check-in calendar

`_cal_tick`:25557

## 25588-25764  the panel

`_build_hp_panel`:25589, `_open_pass`:25624, `_hp_open`:25627, `_hp_close`:25634, `_hp_row`:25638, `_hp_bar`:25653, `_hp_refresh`:25657, `_smoke_pass`:25702

## 25765-25979  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:25769, `_cash_pill_tick`:25777, `_build_lb`:25815, `_open_lb`:25858, `_close_lb`:25866, `_lb_pick`:25870, `_lb_headers`:25875, `_lb_url`:25879, `_lb_me`:25882, `_lb_tick`:25885, `_lb_upload`:25893, `_lb_fetch`:25903, `_lb_got`:25911, `_lb_value`:25922, `_lb_refresh_ui`:25933

## 25980-26403  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26004, `_market_near`:26081, `_build_gear`:26091, `_gear_piece`:26099, `_build_pet`:26144, `_market_apply`:26186, `_market_tick`:26210, `_build_market_panel`:26232, `_open_market`:26258, `_close_market`:26265, `_refresh_market`:26269, `_market_pick`:26322, `_toggle_board`:26360, `_board_tick`:26367

## 26404-26645  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26436, `_ds_label`:26455, `_build_display`:26469, `_ds_got`:26548, `_ds_sorted`:26557, `_ds_render_board`:26571, `_ds_render_news`:26597, `_display_tick`:26616

## 26646-26824  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26663, `_toggle_streamer`:26750, `_streamer_badge_tap`:26766, `_streamer_tick`:26770

## 26825-26861  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:26831, `_car_back`:26838, `_car_park_tick`:26845

## 26862-26958  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:26866, `_bus_eta`:26920, `_bus_displays_tick`:26936

## 26959-27250  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:26977, `_treasure_pick`:26980, `_treasure_spot`:26989, `_treasure_district`:26993, `_treasure_clue`:27005, `_treasure_prop`:27018, `_tp_part`:27021, `_tp_sphere`:27031, `_tp_cyl`:27039, `_treasure_prop_side`:27048, `_build_treasure_props`:27060, `_build_treasure`:27104, `_treasure_dir_char`:27173, `_treasure_tick`:27182, `_treasure_claim`:27236

## 27251-27351  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27252, `_halo_mat`:27284, `_smoke_treasure`:27309

## 27352-27675  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27373, `_fm_send`:27376, `_fm_area`:27382, `_fm_glow_mesh`:27398, `_fm_block_reason`:27416, `_fm_start`:27428, `_fm_announce`:27456, `_fm_finish`:27459, `_fm_msg`:27477, `_fm_check_paid`:27528, `_fm_tick`:27546, `_smoke_findme`:27602

## 27676-27786  v0.24.2: road map (for moving people off the road)

`_floor_note`:27682, `_floor_disc`:27696, `_floor_top`:27705, `_ground_at`:27723, `_note_road`:27741, `_on_road`:27748, `_ped_curb`:27758, `_curb_spot`:27768

## 27787-28082  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27809, `_ex_grid`:27817, `_ex_lamps`:27852, `_ex_umbrella`:27875, `_ex_yards`:27882, `_build_expansion`:27897, `_expand_shots`:28060

## 28083-28277  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28124, `_v27_near_cross`:28216, `_v27_near_any_road`:28223, `_v27_in_district`:28229, `_sea_tick`:28243, `_sea_tow`:28262

## 28278-28945  Harbor Loop sky train

`_sky_build_path`:28329, `_sky_pos`:28370, `_sky_dir`:28384, `_sky_project`:28389, `_sky_trip_time`:28408, `_sky_trip_dist`:28414, `_sky_now`:28425, `_sky_state`:28428, `_sky_time_at_station`:28443, `_sky_next_arrival`:28450, `_build_skytrain`:28463, `_sky_make_car`:28615, `_sky_skin`:28652, `_sky_place_trains`:28672, `_sky_build_station`:28691, `_sky_near`:28756, `_sky_fmt`:28765, `_sky_enter`:28769, `_sky_leave_platform`:28787, `_sky_board`:28797, `_sky_alight`:28811, `_sky_action`:28825, `_sky_tick`:28842, `_sky_camera`:28882, `_tour_today`:28898, `_tour_stamp`:28901, `_sky_hud`:28924

## 28946-29306  Day and night

`_toggle_weather`:29029, `_refresh_weather_button`:29035, `_game_hour`:29041, `_day_key`:29053, `_night_setup`:29068, `_night_scan_mesh`:29158, `_daynight_tick`:29183, `_daynight_apply`:29190, `_daynight_lights`:29291, `_cycle_day_mode`:29296, `_refresh_time_button`:29303

## 29307-29942  v0.27 smoke test and screenshots

`_smoke_v27`:29308, `_city_shots`:29511

## 29943-30359  v0.27: Harbor International Airport (north of the city)

`_build_airport`:29977, `_ap_plane`:30153, `_ap_truck`:30173, `_ap_baggage_train`:30214, `_ap_loop_pos`:30227, `_ap_loop_len`:30243, `_ap_flight_at`:30249, `_ap_tick`:30273, `_airport_ped_plan`:30296, `_smoke_airport`:30316

## 30360-30873  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30374, `_nav_spot`:30381, `_nav_idx`:30385, `_nav_pos`:30392, `_nav_blocked`:30396, `_nav_nearest_free`:30406, `_nav_bfs`:30434, `_nav_build`:30478, `_stroller`:30549, `_stroll_place`:30565, `_stroll_next`:30586, `_nav_clear_line`:30620, `_stroll_aim`:30631, `_strollers_tick`:30663, `_smoke_strollers`:30758

## 30874-31034  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:30909, `_dir_fmt`:30912, `_signpost_spot`:30915, `_build_signposts`:30932

## 31035-31131  the Directions panel and chip

`_build_dir_panel`:31036, `_open_dir`:31078, `_dir_close`:31087, `_dir_pick`:31091, `_dir_stop`:31096, `_dir_stop_and_close`:31101, `_dir_tick`:31105

## 31132-31673  v0.44: Grand Central

`_gc_mesh`:31161, `_gc_mat`:31194, `_gc_glass`:31203, `_gb`:31213, `_gb_solid`:31219, `_gb_flush`:31223, `_gc_tree`:31253, `_gc_text`:31258, `_gc_planter`:31273, `_gc_kiosk`:31279, `_goods_color`:31309, `_goods_mat`:31312, `_kiosk_goods`:31316, `_build_grand_central`:31394, `_build_gc_towers`:31562, `_gc_tick`:31657

## 31674-31965  v0.44: filling the empty land

`_loft`:31691, `_fill_clear`:31733, `_build_fill`:31743, `_hg_in_lake`:31791, `_hg_path`:31795, `_floor_note_rot`:31803, `_build_gardens`:31811, `_build_fan_plaza`:31921

## 31966-32000  v0.45: hover car underglow

`_car_underglow`:31969

## 32001-32165  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32002

## 32166-32197  v0.47: street stalls downtown

`_build_street_stalls`:32170, `_cull_people_in`:32190

## 32198-32296  v0.48: places that open as you level up

`_place_lock_of`:32211, `_place_root`:32217, `_place_unlocked`:32220, `_build_place_signs`:32228, `_places_refresh`:32273, `_places_tick`:32290

## 32297-32341  v0.50: city careers

`_career_rank_name`:32322, `_career_mult`:32325, `_career_block_reason`:32330, `_career_start`:32333, `_career_end`:32338

## 32342-32392  v0.52: careers as clear job loops

`_cid`:32369, `_career_target`:32383, `_career_tick`:32390

## 32393-32400  taxi

`_taxi_meter`:32394

## 32401-32404  paramedic

(no functions)

## 32405-32409  police

`_career_chase_over`:32407

## 32410-32415  firefighter

`_fire_aimed`:32411

## 32416-32425  the step bar

`_career_bar_text`:32419, `_career_hud`:32423

## 32426-32452  cut scenes

`_cs_skip`:32444

## 32453-32457  siren

(no functions)

## 32458-32469  the Careers panel

`_build_career_panel`:32459, `_open_careers`:32462, `_career_close`:32466

## 32470-32893  v0.50: homes

`_home_door_spots`:32510, `_build_homes`:32525, `_home_labels`:32554, `_home_door_near`:32563, `_home_origin`:32572, `_home_slot_near`:32575, `_home_exit_near`:32586, `_home_btn`:32593, `_home_interact`:32606, `_home_buy`:32625, `_home_default_layout`:32639, `_home_enter`:32647, `_home_leave`:32667, `_hm`:32675, `_home_build_room`:32694, `_home_refresh_room`:32803, `_furni_build`:32817

## 32894-33229  decorating

`_build_home_panels`:32895, `_open_homes`:32940, `_home_row_go`:32950, `_home_panel_close`:32970, `_deco_open`:32974, `_deco_pick`:32997, `_smoke_careers_homes`:33020

## 33230-33364  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33234, `_home_slots`:33242, `_home_ring`:33269, `_furni_cat`:33275, `_home_fix_layout`:33281, `_home_build_layout`:33309

## 33365-33798  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33428, `_ch_homes`:33434, `_ch_step_text`:33441, `_ch_step_done`:33452, `_ch_target`:33466, `_ch_finish_chapter`:33475, `_chapters_tick`:33497, `_hud_top_stack`:33537, `_build_chapters_ui`:33567, `_chapters_restart_ask`:33609, `_chapters_restart`:33612, `_chapters_text`:33622, `_open_chapters`:33642, `_chapters_close`:33649, `_smoke_chapters`:33653, `_step_sound`:33774

## 33799-33837  v0.51.1: join and leave messages

`_announce_join`:33806, `_announce_already_here`:33825, `_announce_leave`:33833

## 33838-34102  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33854, `_shot_tick`:33860, `_draw_shot_icon`:33892, `_shot_enter`:33901, `_shot_exit`:33915, `_shot_release_controls`:33927, `_shot_stick_zone`:33934, `_shot_input`:33937, `_smoke_photo`:34009

## 34103-34401  v0.51.3: stream joiners

`_viewer_count`:34123, `_stream_join_check`:34129, `_stream_join_start`:34136, `_sj_streamer`:34153, `_stream_join_tick`:34162, `_stream_join_land`:34186, `_sj_welcome`:34202, `_smoke_stream_join`:34236, `_career_shot`:34319

## 34402-34518  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34406, `_st_restore`:34444, `_smoke_streamer_clean`:34465, `_world_bio_passport`:34516

