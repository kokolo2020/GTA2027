# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-623  Core (unlabelled)

`_symbol_font`:286, `_ready`:298, `_surf_texture`:566, `_surface_material`:588

## 624-696  v0.34.6: futuristic towers for the old city

`_future_tower`:628

## 697-775  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:704, `_skin_common`:739, `_future_wall`:747, `_future_roof`:761, `_future_pave`:769

## 776-836  v0.34.4: futuristic road surface

`_road_textures`:783, `_future_road`:817

## 837-2045  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:856, `_real_tex`:897, `_real_setup`:905, `_real_kind`:926, `_realify`:932, `_real_glass`:969, `_make_window_textures`:989, `_material`:1022, `_box`:1047, `_sign`:1069, `_build_world`:1081, `_future_kiosk`:1192, `_build_collectibles`:1218, `_auto_collect_tick`:1251, `_find_count`:1272, `_nearest_find`:1279, `_destination`:1293, `_toggle_activity`:1329, `_collect_find`:1358, `_owned_count`:1373, `_ridge_open`:1380, `_ridge_count`:1384, `_nearest_ridge`:1391, `_apply_car`:1405, `_tune_level`:1435, `_tune_cost`:1438, `_car_stats`:1444, `_buy_tune`:1451, `_open_tune`:1472, `_back_to_garage`:1478, `_refresh_tune`:1482, `_bay_open`:1493, `_area_open`:1496, `_bay_count`:1499, `_nearest_bay`:1506, `_build_bay`:1520, `_check_bay`:1573, `_discover_bay`:1586, `_north_count`:1599, `_north_open`:1606, `_nearest_north`:1609, `_check_north`:1623, `_discover_north`:1636, `_prop`:1649, `_collider`:1663, `_first_mesh`:1673, `_scatter`:1682, `_prop_stretch`:1716, `_north_token`:1725, `_nm_roads`:1752, `_prop_big`:1767, `_nm_near_cross`:1783, `_build_north`:1790, `_build_nm_blocks`:1907, `_build_north_landscape`:1992, `_nm_free`:2019, `_build_landscape`:2029

## 2046-2529  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2047, `_online_toggle`:2061, `_online_autostart`:2087, `_online_connect`:2106, `_online_stop`:2113, `_online_next_ref`:2124, `_online_send`:2128, `_online_join_frame`:2132, `_online_pos_frame`:2135, `_online_tick`:2144, `_online_handle`:2178, `_online_clean_name`:2231, `_online_peer_update`:2240, `_online_make_peer`:2309, `_peer_look`:2350, `_online_tint`:2407, `_paint_mat`:2423, `_online_update_peers`:2435, `_online_clear_peers`:2515, `_online_refresh_button`:2520

## 2530-2702  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2610, `_marina_count`:2613, `_nearest_marina`:2620, `_check_marina`:2634, `_discover_marina`:2647, `_shop_available`:2660, `_nearest_shop`:2663, `_premium_cars`:2671, `_glass`:2678, `_shop_building`:2684, `_shop_pad`:2694

## 2703-3220  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2704, `_bus_last`:2707, `_build_bus`:2710, `_bus_boxes`:2737, `_bus_skin`:2747, `_bus_side`:2760, `_bus_reset`:2763, `_bus_text`:2772, `_bus_tick`:2777, `_bus_near`:2817, `_bus_board`:2828, `_bus_alight`:2843, `_build_marina`:2857, `_set_hat`:2965, `_build_hat`:2968, `_cyl`:3033, `_hat_part`:3042, `_apply_avatar`:3051, `_shop_count`:3063, `_shop_open`:3073, `_shop_step`:3091, `_shop_close`:3097, `_owned_text`:3110, `_refresh_shop`:3113, `_shop_action`:3166, `_journal_flip`:3217

## 3221-3275  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3232, `_xp`:3235, `_level_for`:3242, `_level`:3250, `_level_text`:3253, `_check_level`:3263

## 3276-3378  v0.11.0: online police vs thief

`_orole_ready`:3277, `_orole_start`:3280, `_orole_end`:3307, `_orole_tick`:3316

## 3379-4322  v0.10.0: chase mode (offline)

`_chase_open`:3380, `_chase_clear`:3385, `_chase_make_unit`:3399, `_chase_spawn_point`:3429, `_chase_start`:3438, `_chase_end`:3474, `_chase_steer`:3493, `_chase_roadblock`:3529, `_chase_heli_build`:3574, `_chase_extras`:3600, `_chase_tick`:3627, `_start_trial`:3691, `_cancel_trial`:3718, `_check_trial`:3723, `_finish_trial`:3740, `_trial_count`:3756, `_open_trials`:3763, `_refresh_trials`:3767, `_update_gate`:3779, `_slab`:3797, `_build_ridge`:3815, `_check_ridge`:3878, `_discover`:3891, `_mission_progress`:3905, `_check_missions`:3967, `_open_garage`:3978, `_open_journal`:3983, `_close_sub`:3988, `_bar`:3991, `_refresh_garage`:3995, `_garage_step`:4020, `_garage_action`:4024, `_refresh_journal`:4044, `_visited_shops`:4077, `_build_panels`:4084, `_build_player`:4244, `_build_car`:4282, `_try_model`:4311

## 4323-5007  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4324, `_kshader`:4398, `_ksync`:4404, `_kskin`:4419, `_make_kperson`:4425, `_hat_y`:4489, `_sit_drop`:4492, `_kplay`:4495, `_kpeople_tick`:4505, `_pose_person`:4534, `_pose_limbs`:4551, `_person_lift`:4613, `_snap_crowd_feet`:4626, `_people_life_tick`:4642, `_life_one`:4679, `_cull_person`:4689, `_recolor_car_model`:4697, `_apply_car_model`:4711, `_landmark`:4731, `_label`:4741, `_button`:4748, `_panel`:4760, `_build_hud`:4770

## 5008-5126  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:5014, `_menu_tab`:5020, `_watch_tick`:5043, `_watch_count`:5085, `_online_pill_tap`:5092, `_online_pill_tick`:5098, `online_config_ok`:5124

## 5127-5164  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5130, `_offroad`:5136, `_ground_near`:5149, `_collectibles_on_road`:5156

## 5165-5304  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5177, `_build_quest_offer`:5181, `_quest_offer_tick`:5211, `_quest_auto_pick`:5261, `_quest_accept`:5276, `_quest_decline`:5290, `_quest_stop`:5296

## 5305-5672  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5329, `_holo_material`:5338, `_build_future`:5346, `_build_neon`:5360, `_model_profile`:5429, `_model_body_box`:5452, `_build_holograms`:5466, `_holo_tick`:5516, `_build_sky_traffic`:5533, `_sky_hover_car`:5551, `_sky_drone`:5598, `_sky_traffic_tick`:5642, `_future_lights`:5661

## 5673-6172  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5732, `_crew_col`:5740, `_peer_crewmate`:5743, `_set_ring_color`:5746, `_level_color`:5773, `_tier_color`:5786, `_my_ach_tier`:5789, `_style_ring`:5796, `_social_peer_extras`:5844, `_social_tag`:5858, `_my_tag_extra`:5870, `_soc_send`:5883, `_social_msg`:5898, `_social_accept`:5937, `_social_go`:5958, `_soc_friend`:5977, `_soc_invite`:5984, `_soc_goto`:5989, `_soc_high_five`:5997, `_soc_gift`:6017, `_soc_crew_invite`:6034, `_gift_day_check`:6041, `_crew_create`:6047, `_crew_cycle_color`:6057, `_crew_leave`:6062, `_crew_mate_near`:6070, `_crew_board`:6078, `_build_social`:6097, `_social_online`:6159, `_open_social`:6163, `_close_social`:6169

## 6173-6423  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6176, `_track_pos`:6185, `_social_row_button`:6196, `_refresh_social`:6203, `_on_dance_floor`:6265, `_toggle_dance`:6268, `_build_dance_floor`:6276, `_social_tick`:6302, `_photo`:6374

## 6424-6919  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6446, `_game_state`:6454, `_build_arcade`:6466, `_c4_empty`:6517, `_c4_drop_row`:6523, `_c4_winner`:6529, `_c4_bot_move`:6550, `_c4_code`:6579, `_c4_ready`:6585, `_c4_tap`:6588, `_c4_check`:6609, `_c4_tick`:6633, `_rx_ready`:6660, `_rx_start`:6663, `_rx_tap`:6677, `_rx_send_time`:6702, `_rx_resolve`:6709, `_rx_tick`:6735, `_mem_start`:6750, `_mem_tap`:6766, `_mem_finish`:6781, `_mem_tick`:6797, `_mem_board_text`:6804, `_build_arcade_panel`:6815, `_refresh_arcade_panel`:6858

## 6920-7213  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6983, `_quiz_slot`:6986, `_quiz_question`:6996, `_quiz_bot_score`:7025, `_in_quiz`:7034, `_build_quiz`:7037, `_quiz_answer`:7107, `_quiz_msg`:7120, `_quiz_board`:7128, `_quiz_tick`:7138, `_quiz_refresh`:7180

## 7214-8799  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7385, `_sites_found`:7388, `_sites_total`:7391, `_bits`:7394, `_ach_value`:7401, `_ach_tick`:7456, `_ach_check`:7481, `_ach_by_id`:7517, `_ach_msg`:7523, `_build_ach`:7536, `_ach_show`:7567, `_open_ach`:7587, `_close_ach`:7593, `_refresh_ach`:7597, `_ach_num`:7628, `_minimap_tap`:7631, `_menu_go`:7638, `_menu_stay`:7643, `_menu_call_car`:7647, `_toggle_clean_hud`:7653, `_refresh_menu_buttons`:7659, `_clean_hud_tick`:7669, `_draw_joystick`:7710, `_input`:7715, `_touch_text_focus`:7806, `_stick_zone`:7826, `_notification`:7830, `_physics_process`:7847, `_follow_camera`:8000, `_follow_walk_camera`:8042, `_interact`:8065, `_refresh_hud`:8227, `_open_panel`:8356, `_layout_panels`:8386, `_toggle_menu`:8413, `_rescue`:8459, `_show_toast`:8491, `_save_progress`:8495, `_load_progress`:8590

## 8800-11432  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8801, `_radio_voice`:8804, `_radio_make`:8837, `_radio_set`:8908, `_radio_play`:8930, `_radio_next`:8935, `_radio_talk_line`:8939, `_radio_caption`:8960, `_radio_refresh`:8968, `_process`:8981, `_build_peds`:9032, `_update_peds`:9143, `_update_ped`:9162, `_smoke_test`:9216, `_smoke_chase`:9869, `_smoke_orole`:9902, `_smoke_levels`:9931, `_smoke_bus`:9972, `_smoke_chase_extras`:10057, `_smoke_marina`:10085, `_blocked_at`:10187, `_blocker`:10202, `_on_screen`:10215, `_wait_radio`:10220, `_smoke_radio_peds`:10227, `_smoke_typed_chat`:10297, `_smoke_chat_touch`:10316, `_smoke_cafe`:10337, `_smoke_boutique`:10363, `_smoke_models`:10391, `_smoke_garage_ridge`:10415, `_save_shot`:10791, `_sky_shots`:10801, `_pet_shots`:10830, `_tracker_shots`:10865, `_infected_shots`:10899, `_paris_shots`:10950, `_people_shots`:11180, `_shots`:11221, `_shot_car`:11415, `_capture_preview`:11425

## 11433-12081  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11500, `_downtown_count`:11503, `_nearest_downtown`:11510, `_check_downtown`:11524, `_discover_downtown`:11537, `_box_batch`:11551, `_model_batch`:11571, `_cut_ranges`:11625, `_dt_ranges`:11637, `_dt_has`:11644, `_dt_near_cross`:11650, `_place`:11656, `_signal_pole`:11667, `_cyl_batch`:11686, `_city_signals`:11710, `_ensure_light_mats`:11761, `_city_lamps`:11771, `_build_downtown`:11815, `_dt_block`:12015, `_downtown_token`:12021, `_build_park`:12038, `_build_plaza`:12067

## 12082-12185  old city and Bay details

`_build_city_detail`:12083

## 12186-12595  traffic

`_build_traffic`:12187, `_path_sample`:12282, `_light_look`:12296, `_light_green`:12304, `_traffic_place`:12308, `_traffic_blocked_by`:12320, `_traffic_tick`:12332, `_smoke_downtown`:12438, `_skyline_shot`:12550, `_skyline_shots`:12558

## 12596-12962  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12642, `_web_scale`:12705, `_web_fps_tick`:12715, `_world_to_uv`:12738, `_map_angle`:12741, `_build_minimap`:12749, `_open_map`:12822, `_close_map`:12833, `_mini_point`:12840, `_site_markers`:12844, `_draw_arrow`:12876, `_draw_minimap`:12883, `_draw_full_map`:12930, `_minimap_tick`:12955

## 12963-13243  camera views

`_build_view_controls`:12964, `_sky_grade`:13006, `_cycle_view`:13021, `_apply_view`:13031, `_hide_labels`:13075, `_unfade`:13081, `_bake_map`:13087, `_shot_stats`:13137, `_view_shots`:13140, `_smoke_views`:13181

## 13244-13491  v0.17.0: level-up celebration

`_build_level_fx`:13255, `_draw_level_rays`:13292, `_level_fx_tick`:13302, `_level_sound`:13307, `_fx_material`:13349, `_level_up_fx`:13357, `_smoke_level_fx`:13458, `_levelup_shots`:13467

## 13492-13613  v0.18.0: walk-in stadium

`_collider_yaw`:13497, `_build_stadium_walls`:13508, `_look`:13536, `_smoke_stadium_eye`:13545, `_stadium_shots`:13583

## 13614-13775  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13638, `_arrow_mesh`:13650, `_build_guidance`:13673, `_guide_target`:13698, `_guidance_tick`:13727, `_draw_hud_arrow`:13753

## 13776-13961  checkpoints

`_build_checkpoints`:13777, `_refresh_checkpoints`:13822, `_check_checkpoints`:13828, `_activate_checkpoint`:13838, `_checkpoint_spawn`:13859, `_spawn_at_checkpoint`:13864, `_draw_checkpoint_icon`:13880, `_smoke_guidance_checkpoints`:13886, `_guide_shots`:13936

## 13962-14240  v0.18.0: Harbor Dome social hub

`_hub_seat`:14020, `_build_hub`:14024

## 14241-14291  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14242, `_xm_mesh`:14251, `_xm_tree`:14259

## 14292-14615  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14295, `_gt_surface`:14310, `_xm_grand_tree`:14320, `_lux_mat`:14435, `_lux_part`:14451, `_lux_box`:14454, `_lux_cyl`:14459, `_lux_ball`:14467, `_lux_new`:14475, `_lux_commit`:14480, `_lux_sofa_mesh`:14484, `_lux_chair_mesh`:14514, `_lux_table_mesh`:14534, `_lux_pouf_mesh`:14549, `_lux_batch`:14564, `_hub_christmas`:14580

## 14616-14771  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14617

## 14772-15020  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14775, `_vx_cyl`:14782, `_vx_ball`:14790, `_vx_ring`:14798, `_hub_polish`:14806, `_hub_gate`:14829, `_hub_vip`:14891, `_hub_glass`:15004

## 15021-15235  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:15022, `_build_hub_bots`:15047, `_seat_of`:15078, `_bubble`:15088, `_emote`:15144, `_hub_people_tick`:15158

## 15236-15354  seats

`_seat_taken`:15237, `_nearest_seat`:15245, `_seat_label`:15257, `_sit`:15273, `_stand_up`:15317, `_seated_tick`:15336

## 15355-15511  game panel

`_build_game_panel`:15356, `_open_game_panel`:15411, `_refresh_game_panel`:15430, `_play_robot`:15475, `_peer_at`:15489, `_opponent_name`:15496, `_pay`:15504

## 15512-15632  tic-tac-toe

`_ttt_ready`:15515, `_ttt_winner`:15521, `_ttt_bot_move`:15531, `_ttt_tap`:15557, `_ttt_code`:15577, `_ttt_check`:15583, `_ttt_tick`:15606

## 15633-15684  rock paper scissors

`_rps_ready`:15634, `_rps_pick`:15640, `_rps_resolve`:15658, `_rps_tick`:15682

## 15685-15767  online table messages

`_online_game_send`:15686, `_hub_game_msg`:15692

## 15768-15843  comedy show

`_joke_start`:15769, `_joke_tick`:15781, `_speak`:15807, `_play_rimshot`:15816

## 15844-16743  quick chat and emotes

`_build_chat`:15866, `_chat_toggle_to`:15983, `_chat_log_add`:15991, `_chat_area`:15997, `_chat_near_count`:16015, `_chat_tick`:16024, `_toggle_chat`:16073, `_chat_fit`:16088, `_chat_clean`:16094, `_chat_wrap`:16111, `_chat_send_text`:16133, `_typing`:16156, `_say`:16159, `_do_emote`:16175, `_smoke_hub`:16184, `_chat_shots`:16358, `_cafe_shots`:16383, `_shop_shots`:16431, `_car_shots`:16480, `_outfit_shots`:16511, `_hub_shots`:16559, `_sg_on_terrace`:16694, `_people_only`:16697, `_people_only_keep_cars_out`:16701, `_car_barrier`:16713, `_hub_keep_cars_out`:16727

## 16744-16906  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16753, `_feed_add`:16762, `_feed_render`:16768, `_feed_tick`:16796, `_online_event_send`:16805, `_at_pvp_table`:16812, `_game_name`:16819, `_send_lfp`:16822, `_lfp_msg`:16839, `_accept_invite`:16860

## 16907-17148  v0.18.2: nickname and HUD relayout

`_nick_rude`:16919, `_clean_nick`:16934, `_build_nick_panel`:16946, `_open_nick`:16984, `_random_nick`:16993, `_save_nick`:16999, `_close_nick`:17018, `_refresh_nick_button`:17027, `_relayout_hud`:17031, `_smoke_nick`:17068, `_nick_shots`:17100, `_smoke_sites_reachable`:17118

## 17149-17436  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17175, `_nearest_civic`:17182, `_check_civic`:17196, `_discover_civic`:17209, `_civ_ranges`:17222, `_civ_has`:17236, `_civ_near_cross`:17242, `_build_civic`:17248, `_civic_token`:17374, `_civic_shots`:17391, `_hub_focus`:17413

## 17437-17546  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17508, `_in_rw_lot`:17511, `_box_batch_rot`:17514, `_multi_collider`:17532

## 17547-17874  circuit geometry

`_cr_point`:17548, `_rw_build_path`:17562, `_rw_dir`:17590, `_rw_bend`:17595, `_ribbon`:17601, `_rw_band`:17621, `_rw_keepout`:17639, `_build_raceway`:17648, `_build_rw_parking`:17682, `_build_rw_pits`:17727, `_build_rw_track`:17764, `_build_rw_trackside`:17805

## 17875-17972  race car rental

`_model_key`:17876, `_race_car_start`:17879, `_tint_ghost`:17917, `_race_car_end`:17930, `_race_keep_cars_out`:17955

## 17973-17987  speed effects

`_eff_max`:17974, `_eff_accel`:17985

## 17988-18038  track helpers

`_rw_seg_progress`:17989, `_rw_track_dist`:18009, `_rw_point_dist`:18020, `_rw_player_progress`:18027, `_rw_target`:18033

## 18039-18275  events

`_rec_stop`:18040, `_rw_place`:18056, `_rw_grid_pos`:18063, `_rw_start`:18068, `_rw_spawn_ai`:18100, `_rw_ai_place`:18124, `_rw_tick`:18135, `_rw_ai_tick`:18188, `_rw_lap_done`:18230, `_rw_finish`:18242, `_rw_fmt`:18273

## 18276-18328  boosters and spikes

`_rw_buy`:18277, `_rw_use_boost`:18295, `_rw_use_spike`:18303, `_rw_drop_spike_at`:18314

## 18329-18386  online races

`_race_msg`:18330, `_join_race`:18352

## 18387-18742  raceway panel, HUD, board

`_build_raceway_ui`:18388, `_rw_layout`:18448, `_rw_open`:18455, `_rw_close`:18461, `_rw_refresh_panel`:18465, `_rw_refresh_board`:18478, `_rw_hud`:18490, `_peer_car_model`:18514, `_smoke_raceway`:18524, `_race_shots`:18705

## 18743-18950  v0.22.0: Call Car

`_call_block_reason`:18749, `_call_spot`:18766, `_call_car`:18797, `_play_horn`:18821, `_smoke_follow_call`:18845, `_follow_shots`:18918

## 18951-19408  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18976, `_place_portal_button`:18982, `_portal_pressed`:18989, `_build_travel`:18997, `_toggle_run`:19102, `_refresh_run`:19106, `_hud_v23_tick`:19114, `_travel_block_reason`:19146, `_travel_open`:19166, `_open_travel`:19172, `_open_worlds`:19178, `_open_case`:19184, `_case_step`:19196, `_case_refresh`:19200, `_case_submit`:19204, `_close_case`:19213, `_sky_go`:19217, `_close_worlds`:19227, `_refresh_worlds`:19231, `_world_go`:19237, `_close_travel`:19244, `_refresh_travel`:19248, `_travel_to`:19256, `_smoke_travel`:19283, `_v23_shots`:19321

## 19409-19482  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19416, `_qr_button`:19431, `_qr_layout`:19470, `_smoke_qr`:19476

## 19483-19919  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19503, `_open_crate`:19519, `_build_crate_ui`:19536, `_crate_pick`:19623, `_crate_reveal`:19646, `_crate_draw_car`:19673, `_crate_confetti`:19692, `_crate_sound`:19717, `_crate_drive`:19743, `_feed_add_system`:19773, `_smoke_crate`:19776, `_crate_shots`:19824

## 19920-20411  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19961, `_quick_today`:19966, `_quick_is_done`:19969, `_quick_left`:19972, `_quick_next`:19979, `_quick_fix_target`:19992, `_quick_daily_check`:20006, `_quick_complete`:20020, `_quick_side`:20054, `_build_quick_props`:20072, `_daily_shots`:20224, `_quick_props_refresh`:20266, `_quick_fx`:20270, `_play_coin`:20286, `_smoke_quick`:20303

## 20412-20562  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20421, `_quest_nearby`:20476, `_open_quests`:20483, `_close_quests`:20490, `_refresh_quests`:20494, `_quest_pick`:20520, `_quest_mode`:20534, `_smoke_quests`:20537

## 20563-20597  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20567, `_my_tag_tick`:20570

## 20598-20912  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20615, `_fc_torus`:20625, `_fc_pearl`:20633, `_fc_chrome`:20643, `_fc_glass`:20652, `_fc_glow`:20662, `_fc_ghost`:20671, `_fc_holo`:20683, `_fc_mesh`:20693, `_fc_sphere`:20713, `_fc_capsule`:20721, `_fc_cone`:20729, `_build_food_court`:20738, `_food_court_tick`:20892

## 20913-21234  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20942, `_cm_bench`:20958, `_build_commons`:20971, `_commons_tick`:21193

## 21235-21549  v0.36: the daily puzzle

`_pz_today`:21258, `_pz_new`:21261, `_pz_neighbours`:21306, `_pz_flip`:21316, `_pz_done`:21321, `_pz_tap`:21329, `_pz_win`:21345, `_pz_reset`:21366, `_puzzle_near`:21370, `_open_puzzle`:21375, `_close_puzzle`:21383, `_pz_refresh_sign`:21387, `_build_puzzle_panel`:21395, `_pz_draw`:21426, `_smoke_chat`:21467, `_smoke_feet`:21505, `_smoke_commons`:21526

## 21550-21738  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21612, `_bio_theta`:21616, `_bio_sec_n`:21621, `_bio_sec_of`:21624, `_bio_pt`:21627, `_bio_lp`:21632, `_bio_la`:21636, `_bio_dir`:21640, `_bio_hex_r`:21643, `_bio_apo`:21648, `_bio_open_angles`:21654, `_bio_si`:21664, `_bm`:21670, `_bsph`:21675, `_blow`:21678, `_bcone`:21689, `_bbox`:21692, `_bp`:21695, `_bq`:21700, `_bio_glass_mat`:21704, `_bio_water_mat`:21717, `_bio_mat`:21729

## 21739-22111  building blocks

`_bio_inst`:21740, `_bio_add`:21746, `_bio_model`:21749, `_bio_nature_mesh`:21755, `_bio_flush`:21789, `_bio_bar`:21824, `_bio_slab`:21837, `_bio_body`:21852, `_bio_cyl_col`:21865, `_bio_hexmesh`:21878, `_bio_hexslab`:21890, `_bio_hexpt`:21896, `_bio_gridshell`:21903, `_bio_rail`:22010, `_bio_rail_arc`:22015, `_bio_disc_deck`:22027, `_bio_ring_deck`:22033, `_bio_helix`:22044, `_bio_pillar`:22064, `_bio_cafe`:22070, `_bio_fence_line`:22084, `_bio_fence_seg`:22089, `_bio_pen`:22099

## 22112-22613  building

`_build_biosphere`:22113, `_build_biosphere_legacy`:22117, `_bio_text`:22279, `_bio_plaque`:22297, `_bio_ticket_hall`:22311, `_on_foot_collision_guard`:22367, `_bio_inside`:22377, `_bio_pass_ok`:22380, `_ticket_near`:22384, `_bio_buy_pass`:22389, `_bio_gates_update`:22405, `_bio_gate_tick`:22431, `_bio_tunnel`:22443, `_bio_grounds`:22496, `_bio_dome`:22542, `_bio_deck_mats`:22610

## 22614-22769  garden planting

`_bio_free`:22615, `_bio_spot`:22632, `_bio_garden`:22640, `_bio_pine`:22681, `_bio_tree`:22684, `_bio_big_tree`:22694, `_bio_rock`:22699, `_bio_pond`:22702, `_bio_particles`:22706, `_bio_mist`:22734, `_bio_mini_dome`:22763

## 22770-23177  the four layouts

`_bio_winter`:22771, `_bio_spring`:22863, `_bio_summer`:22988, `_bio_autumn`:23072

## 23178-23448  animals

`_bio_spawn`:23179, `_bio_load_animal`:23251, `_bio_make_quad`:23272, `_bio_load_bird`:23349, `_bio_make_penguin`:23369, `_bio_make_bird`:23391, `_bio_make_flamingo`:23415, `_bio_make_butterfly`:23436

## 23449-23580  animation, spotting and rewards

`_bio_stuck_check`:23454, `_biosphere_tick`:23472, `_bio_animate`:23481, `_bio_spot_check`:23561, `_bio_spotted`:23573, `_smoke_biosphere`:23577

## 23581-24098  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23668, `_wear_piece`:23671, `_wear_mat`:23694, `_person_index`:23710, `_dress`:23733, `_smoke_style`:23839, `_style_shots`:23990, `_npc_look`:24062

## 24099-24252  your look: apply, save, share

`_look_clean`:24103, `_look_pack`:24118, `_owns`:24124, `_apply_look`:24129, `_relic_model`:24140, `_fc_mesh_mat`:24205, `_relic_refresh`:24208, `_relic_tick`:24222, `_peer_style`:24233

## 24253-24680  stores and the wardrobe

`_style_today`:24272, `_style_items`:24275, `_style_cat`:24283, `_style_price`:24286, `_style_deal`:24300, `_style_price_base`:24313, `_relic_stock`:24320, `_build_style_panel`:24332, `_open_store`:24372, `_open_wardrobe`:24391, `_style_close`:24394, `_style_finish`:24398, `_sync_old_avatar`:24413, `_style_tabs_for`:24420, `_refresh_style`:24425, `_style_body_rows`:24576, `_style_set_tab`:24593, `_style_step`:24597, `_style_color`:24602, `_style_pick`:24607, `_style_buy`:24642, `_ach_relics_check`:24664, `_style_face_camera`:24669

## 24681-25148  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24717, `_ga_text`:24723, `_ga_box`:24740, `_build_galleria`:24756, `_ga_inner_tick`:24897, `_ga_shell`:24913, `_ga_inside`:24963, `_bio_cyl_col_on`:24966, `_ga_models`:24978, `_ga_lbox`:24993, `_ga_ltext`:25007, `_ga_store`:25014, `_bio_cafe_on`:25116, `_ga_mannequins`:25124

## 25149-25300  featured outfits and the Sky Run

`_ga_featured_look`:25162, `_build_ga_fun`:25183, `_ga_fun_tick`:25228, `_sky_finish`:25255, `_extra_near`:25274, `_extra_open`:25283, `_store_near`:25292

## 25301-25397  v0.41: THE SKY GARDEN

`_sg_now`:25355, `_sg_progress`:25358, `_sg_time`:25364, `_sg_stock`:25371, `_sg_mut_roll`:25386

## 25398-25535  building

`_sg_box`:25399, `_sg_text`:25405, `_build_sky_garden`:25419, `_sg_seed_spot`:25530, `_sg_codex_spot`:25533

## 25536-25716  plants

`_sg_plant_model`:25537, `_sg_refresh_all`:25642, `_sg_refresh`:25646, `_sky_garden_tick`:25682, `_sg_ready_count`:25701, `_sg_boot_note`:25708

## 25717-25836  interacting

`_sg_near`:25718, `_sg_button_text`:25741, `_sg_value`:25754, `_sg_interact`:25758, `_sg_buy`:25774, `_sg_plant`:25796, `_sg_harvest`:25807

## 25837-26080  the garden screen

`_build_sg_panel`:25838, `_sg_open`:25873, `_sg_close`:25882, `_sg_row`:25886, `_sg_refresh_panel`:25901, `_sg_pick_buy`:25946, `_sg_pick_plant`:25950, `_smoke_car_barriers`:25956, `_smoke_sky_garden`:25997

## 26081-26119  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26112, `_pass_day`:26115

## 26120-26151  album

`_album_pages`:26121, `_album_claim`:26136

## 26152-26203  season

`_season_index`:26153, `_season_tick`:26156, `_season_xp`:26165, `_season_tier`:26168, `_season_reward`:26171, `_season_claim`:26185

## 26204-26211  Harbor Night

`_harbor_night`:26205

## 26212-26243  check-in calendar

`_cal_tick`:26213

## 26244-26420  the panel

`_build_hp_panel`:26245, `_open_pass`:26280, `_hp_open`:26283, `_hp_close`:26290, `_hp_row`:26294, `_hp_bar`:26309, `_hp_refresh`:26313, `_smoke_pass`:26358

## 26421-26635  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26425, `_cash_pill_tick`:26433, `_build_lb`:26471, `_open_lb`:26514, `_close_lb`:26522, `_lb_pick`:26526, `_lb_headers`:26531, `_lb_url`:26535, `_lb_me`:26538, `_lb_tick`:26541, `_lb_upload`:26549, `_lb_fetch`:26559, `_lb_got`:26567, `_lb_value`:26578, `_lb_refresh_ui`:26589

## 26636-27194  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26660, `_market_near`:26739, `_build_gear`:26749, `_gear_piece`:26757, `_pet_m`:26802, `_pet_eyes`:26816, `_build_pet`:26823, `_pet_nose`:26961, `_pet_anim`:26964, `_market_apply`:26975, `_market_tick`:26999, `_build_market_panel`:27023, `_open_market`:27049, `_close_market`:27056, `_refresh_market`:27060, `_market_pick`:27113, `_toggle_board`:27151, `_board_tick`:27158

## 27195-27436  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27227, `_ds_label`:27246, `_build_display`:27260, `_ds_got`:27339, `_ds_sorted`:27348, `_ds_render_board`:27362, `_ds_render_news`:27388, `_display_tick`:27407

## 27437-27615  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27454, `_toggle_streamer`:27541, `_streamer_badge_tap`:27557, `_streamer_tick`:27561

## 27616-27652  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27622, `_car_back`:27629, `_car_park_tick`:27636

## 27653-27749  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27657, `_bus_eta`:27711, `_bus_displays_tick`:27727

## 27750-28041  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27768, `_treasure_pick`:27771, `_treasure_spot`:27780, `_treasure_district`:27784, `_treasure_clue`:27796, `_treasure_prop`:27809, `_tp_part`:27812, `_tp_sphere`:27822, `_tp_cyl`:27830, `_treasure_prop_side`:27839, `_build_treasure_props`:27851, `_build_treasure`:27895, `_treasure_dir_char`:27964, `_treasure_tick`:27973, `_treasure_claim`:28027

## 28042-28142  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:28043, `_halo_mat`:28075, `_smoke_treasure`:28100

## 28143-28466  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28164, `_fm_send`:28167, `_fm_area`:28173, `_fm_glow_mesh`:28189, `_fm_block_reason`:28207, `_fm_start`:28219, `_fm_announce`:28247, `_fm_finish`:28250, `_fm_msg`:28268, `_fm_check_paid`:28319, `_fm_tick`:28337, `_smoke_findme`:28393

## 28467-28577  v0.24.2: road map (for moving people off the road)

`_floor_note`:28473, `_floor_disc`:28487, `_floor_top`:28496, `_ground_at`:28514, `_note_road`:28532, `_on_road`:28539, `_ped_curb`:28549, `_curb_spot`:28559

## 28578-28873  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28600, `_ex_grid`:28608, `_ex_lamps`:28643, `_ex_umbrella`:28666, `_ex_yards`:28673, `_build_expansion`:28688, `_expand_shots`:28851

## 28874-29068  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28915, `_v27_near_cross`:29007, `_v27_near_any_road`:29014, `_v27_in_district`:29020, `_sea_tick`:29034, `_sea_tow`:29053

## 29069-29736  Harbor Loop sky train

`_sky_build_path`:29120, `_sky_pos`:29161, `_sky_dir`:29175, `_sky_project`:29180, `_sky_trip_time`:29199, `_sky_trip_dist`:29205, `_sky_now`:29216, `_sky_state`:29219, `_sky_time_at_station`:29234, `_sky_next_arrival`:29241, `_build_skytrain`:29254, `_sky_make_car`:29406, `_sky_skin`:29443, `_sky_place_trains`:29463, `_sky_build_station`:29482, `_sky_near`:29547, `_sky_fmt`:29556, `_sky_enter`:29560, `_sky_leave_platform`:29578, `_sky_board`:29588, `_sky_alight`:29602, `_sky_action`:29616, `_sky_tick`:29633, `_sky_camera`:29673, `_tour_today`:29689, `_tour_stamp`:29692, `_sky_hud`:29715

## 29737-30110  Day and night

`_toggle_weather`:29820, `_refresh_weather_button`:29826, `_game_hour`:29832, `_day_key`:29844, `_night_setup`:29859, `_night_scan_mesh`:29949, `_daynight_tick`:29974, `_daynight_apply`:29983, `_daynight_lights`:30095, `_cycle_day_mode`:30100, `_refresh_time_button`:30107

## 30111-30748  v0.27 smoke test and screenshots

`_smoke_v27`:30112, `_city_shots`:30317

## 30749-31165  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30783, `_ap_plane`:30959, `_ap_truck`:30979, `_ap_baggage_train`:31020, `_ap_loop_pos`:31033, `_ap_loop_len`:31049, `_ap_flight_at`:31055, `_ap_tick`:31079, `_airport_ped_plan`:31102, `_smoke_airport`:31122

## 31166-31679  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31180, `_nav_spot`:31187, `_nav_idx`:31191, `_nav_pos`:31198, `_nav_blocked`:31202, `_nav_nearest_free`:31212, `_nav_bfs`:31240, `_nav_build`:31284, `_stroller`:31355, `_stroll_place`:31371, `_stroll_next`:31392, `_nav_clear_line`:31426, `_stroll_aim`:31437, `_strollers_tick`:31469, `_smoke_strollers`:31564

## 31680-31840  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31715, `_dir_fmt`:31718, `_signpost_spot`:31721, `_build_signposts`:31738

## 31841-31937  the Directions panel and chip

`_build_dir_panel`:31842, `_open_dir`:31884, `_dir_close`:31893, `_dir_pick`:31897, `_dir_stop`:31902, `_dir_stop_and_close`:31907, `_dir_tick`:31911

## 31938-32479  v0.44: Grand Central

`_gc_mesh`:31967, `_gc_mat`:32000, `_gc_glass`:32009, `_gb`:32019, `_gb_solid`:32025, `_gb_flush`:32029, `_gc_tree`:32059, `_gc_text`:32064, `_gc_planter`:32079, `_gc_kiosk`:32085, `_goods_color`:32115, `_goods_mat`:32118, `_kiosk_goods`:32122, `_build_grand_central`:32200, `_build_gc_towers`:32368, `_gc_tick`:32463

## 32480-32771  v0.44: filling the empty land

`_loft`:32497, `_fill_clear`:32539, `_build_fill`:32549, `_hg_in_lake`:32597, `_hg_path`:32601, `_floor_note_rot`:32609, `_build_gardens`:32617, `_build_fan_plaza`:32727

## 32772-32806  v0.45: hover car underglow

`_car_underglow`:32775

## 32807-32971  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32808

## 32972-33003  v0.47: street stalls downtown

`_build_street_stalls`:32976, `_cull_people_in`:32996

## 33004-33102  v0.48: places that open as you level up

`_place_lock_of`:33017, `_place_root`:33023, `_place_unlocked`:33026, `_build_place_signs`:33034, `_places_refresh`:33079, `_places_tick`:33096

## 33103-33147  v0.50: city careers

`_career_rank_name`:33128, `_career_mult`:33131, `_career_block_reason`:33136, `_career_start`:33139, `_career_end`:33144

## 33148-33198  v0.52: careers as clear job loops

`_cid`:33175, `_career_target`:33189, `_career_tick`:33196

## 33199-33206  taxi

`_taxi_meter`:33200

## 33207-33210  paramedic

(no functions)

## 33211-33215  police

`_career_chase_over`:33213

## 33216-33221  firefighter

`_fire_aimed`:33217

## 33222-33231  the step bar

`_career_bar_text`:33225, `_career_hud`:33229

## 33232-33258  cut scenes

`_cs_skip`:33250

## 33259-33263  siren

(no functions)

## 33264-33275  the Careers panel

`_build_career_panel`:33265, `_open_careers`:33268, `_career_close`:33272

## 33276-33699  v0.50: homes

`_home_door_spots`:33316, `_build_homes`:33331, `_home_labels`:33360, `_home_door_near`:33369, `_home_origin`:33378, `_home_slot_near`:33381, `_home_exit_near`:33392, `_home_btn`:33399, `_home_interact`:33412, `_home_buy`:33431, `_home_default_layout`:33445, `_home_enter`:33453, `_home_leave`:33473, `_hm`:33481, `_home_build_room`:33500, `_home_refresh_room`:33609, `_furni_build`:33623

## 33700-34035  decorating

`_build_home_panels`:33701, `_open_homes`:33746, `_home_row_go`:33756, `_home_panel_close`:33776, `_deco_open`:33780, `_deco_pick`:33803, `_smoke_careers_homes`:33826

## 34036-34170  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:34040, `_home_slots`:34048, `_home_ring`:34075, `_furni_cat`:34081, `_home_fix_layout`:34087, `_home_build_layout`:34115

## 34171-34604  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34234, `_ch_homes`:34240, `_ch_step_text`:34247, `_ch_step_done`:34258, `_ch_target`:34272, `_ch_finish_chapter`:34281, `_chapters_tick`:34303, `_hud_top_stack`:34343, `_build_chapters_ui`:34373, `_chapters_restart_ask`:34415, `_chapters_restart`:34418, `_chapters_text`:34428, `_open_chapters`:34448, `_chapters_close`:34455, `_smoke_chapters`:34459, `_step_sound`:34580

## 34605-34643  v0.51.1: join and leave messages

`_announce_join`:34612, `_announce_already_here`:34631, `_announce_leave`:34639

## 34644-34908  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34660, `_shot_tick`:34666, `_draw_shot_icon`:34698, `_shot_enter`:34707, `_shot_exit`:34721, `_shot_release_controls`:34733, `_shot_stick_zone`:34740, `_shot_input`:34743, `_smoke_photo`:34815

## 34909-35207  v0.51.3: stream joiners

`_viewer_count`:34929, `_stream_join_check`:34935, `_stream_join_start`:34942, `_sj_streamer`:34959, `_stream_join_tick`:34968, `_stream_join_land`:34992, `_sj_welcome`:35008, `_smoke_stream_join`:35042, `_career_shot`:35125

## 35208-35324  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35212, `_st_restore`:35250, `_smoke_streamer_clean`:35271, `_world_bio_passport`:35322

