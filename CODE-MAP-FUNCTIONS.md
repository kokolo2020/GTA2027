# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-576  Core (unlabelled)

`_symbol_font`:280, `_ready`:292, `_surf_texture`:519, `_surface_material`:541

## 577-649  v0.34.6: futuristic towers for the old city

`_future_tower`:581

## 650-728  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:657, `_skin_common`:692, `_future_wall`:700, `_future_roof`:714, `_future_pave`:722

## 729-789  v0.34.4: futuristic road surface

`_road_textures`:736, `_future_road`:770

## 790-1995  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:809, `_real_tex`:850, `_real_setup`:858, `_real_kind`:879, `_realify`:885, `_real_glass`:922, `_make_window_textures`:942, `_material`:975, `_box`:1000, `_sign`:1022, `_build_world`:1034, `_future_kiosk`:1142, `_build_collectibles`:1168, `_auto_collect_tick`:1201, `_find_count`:1222, `_nearest_find`:1229, `_destination`:1243, `_toggle_activity`:1279, `_collect_find`:1308, `_owned_count`:1323, `_ridge_open`:1330, `_ridge_count`:1334, `_nearest_ridge`:1341, `_apply_car`:1355, `_tune_level`:1385, `_tune_cost`:1388, `_car_stats`:1394, `_buy_tune`:1401, `_open_tune`:1422, `_back_to_garage`:1428, `_refresh_tune`:1432, `_bay_open`:1443, `_area_open`:1446, `_bay_count`:1449, `_nearest_bay`:1456, `_build_bay`:1470, `_check_bay`:1523, `_discover_bay`:1536, `_north_count`:1549, `_north_open`:1556, `_nearest_north`:1559, `_check_north`:1573, `_discover_north`:1586, `_prop`:1599, `_collider`:1613, `_first_mesh`:1623, `_scatter`:1632, `_prop_stretch`:1666, `_north_token`:1675, `_nm_roads`:1702, `_prop_big`:1717, `_nm_near_cross`:1733, `_build_north`:1740, `_build_nm_blocks`:1857, `_build_north_landscape`:1942, `_nm_free`:1969, `_build_landscape`:1979

## 1996-2475  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:1997, `_online_toggle`:2011, `_online_autostart`:2037, `_online_connect`:2056, `_online_stop`:2063, `_online_next_ref`:2074, `_online_send`:2078, `_online_join_frame`:2082, `_online_pos_frame`:2085, `_online_tick`:2094, `_online_handle`:2128, `_online_clean_name`:2181, `_online_peer_update`:2190, `_online_make_peer`:2255, `_peer_look`:2296, `_online_tint`:2353, `_paint_mat`:2369, `_online_update_peers`:2381, `_online_clear_peers`:2461, `_online_refresh_button`:2466

## 2476-2648  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2556, `_marina_count`:2559, `_nearest_marina`:2566, `_check_marina`:2580, `_discover_marina`:2593, `_shop_available`:2606, `_nearest_shop`:2609, `_premium_cars`:2617, `_glass`:2624, `_shop_building`:2630, `_shop_pad`:2640

## 2649-3164  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2650, `_bus_last`:2653, `_build_bus`:2656, `_bus_boxes`:2683, `_bus_skin`:2693, `_bus_side`:2706, `_bus_reset`:2709, `_bus_text`:2718, `_bus_tick`:2723, `_bus_near`:2763, `_bus_board`:2774, `_bus_alight`:2789, `_build_marina`:2803, `_set_hat`:2909, `_build_hat`:2912, `_cyl`:2977, `_hat_part`:2986, `_apply_avatar`:2995, `_shop_count`:3007, `_shop_open`:3017, `_shop_step`:3035, `_shop_close`:3041, `_owned_text`:3054, `_refresh_shop`:3057, `_shop_action`:3110, `_journal_flip`:3161

## 3165-3219  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3176, `_xp`:3179, `_level_for`:3186, `_level`:3194, `_level_text`:3197, `_check_level`:3207

## 3220-3322  v0.11.0: online police vs thief

`_orole_ready`:3221, `_orole_start`:3224, `_orole_end`:3251, `_orole_tick`:3260

## 3323-4266  v0.10.0: chase mode (offline)

`_chase_open`:3324, `_chase_clear`:3329, `_chase_make_unit`:3343, `_chase_spawn_point`:3373, `_chase_start`:3382, `_chase_end`:3418, `_chase_steer`:3437, `_chase_roadblock`:3473, `_chase_heli_build`:3518, `_chase_extras`:3544, `_chase_tick`:3571, `_start_trial`:3635, `_cancel_trial`:3662, `_check_trial`:3667, `_finish_trial`:3684, `_trial_count`:3700, `_open_trials`:3707, `_refresh_trials`:3711, `_update_gate`:3723, `_slab`:3741, `_build_ridge`:3759, `_check_ridge`:3822, `_discover`:3835, `_mission_progress`:3849, `_check_missions`:3911, `_open_garage`:3922, `_open_journal`:3927, `_close_sub`:3932, `_bar`:3935, `_refresh_garage`:3939, `_garage_step`:3964, `_garage_action`:3968, `_refresh_journal`:3988, `_visited_shops`:4021, `_build_panels`:4028, `_build_player`:4188, `_build_car`:4226, `_try_model`:4255

## 4267-4940  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4268, `_kshader`:4342, `_ksync`:4348, `_kskin`:4363, `_make_kperson`:4369, `_hat_y`:4433, `_sit_drop`:4436, `_kplay`:4439, `_kpeople_tick`:4449, `_pose_person`:4478, `_pose_limbs`:4495, `_person_lift`:4557, `_snap_crowd_feet`:4570, `_people_life_tick`:4586, `_life_one`:4623, `_cull_person`:4633, `_recolor_car_model`:4641, `_apply_car_model`:4655, `_landmark`:4675, `_label`:4685, `_button`:4692, `_panel`:4704, `_build_hud`:4714

## 4941-5059  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4947, `_menu_tab`:4953, `_watch_tick`:4976, `_watch_count`:5018, `_online_pill_tap`:5025, `_online_pill_tick`:5031, `online_config_ok`:5057

## 5060-5097  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5063, `_offroad`:5069, `_ground_near`:5082, `_collectibles_on_road`:5089

## 5098-5237  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5110, `_build_quest_offer`:5114, `_quest_offer_tick`:5144, `_quest_auto_pick`:5194, `_quest_accept`:5209, `_quest_decline`:5223, `_quest_stop`:5229

## 5238-5605  v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5262, `_holo_material`:5271, `_build_future`:5279, `_build_neon`:5293, `_model_profile`:5362, `_model_body_box`:5385, `_build_holograms`:5399, `_holo_tick`:5449, `_build_sky_traffic`:5466, `_sky_hover_car`:5484, `_sky_drone`:5531, `_sky_traffic_tick`:5575, `_future_lights`:5594

## 5606-6105  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5665, `_crew_col`:5673, `_peer_crewmate`:5676, `_set_ring_color`:5679, `_level_color`:5706, `_tier_color`:5719, `_my_ach_tier`:5722, `_style_ring`:5729, `_social_peer_extras`:5777, `_social_tag`:5791, `_my_tag_extra`:5803, `_soc_send`:5816, `_social_msg`:5831, `_social_accept`:5870, `_social_go`:5891, `_soc_friend`:5910, `_soc_invite`:5917, `_soc_goto`:5922, `_soc_high_five`:5930, `_soc_gift`:5950, `_soc_crew_invite`:5967, `_gift_day_check`:5974, `_crew_create`:5980, `_crew_cycle_color`:5990, `_crew_leave`:5995, `_crew_mate_near`:6003, `_crew_board`:6011, `_build_social`:6030, `_social_online`:6092, `_open_social`:6096, `_close_social`:6102

## 6106-6356  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6109, `_track_pos`:6118, `_social_row_button`:6129, `_refresh_social`:6136, `_on_dance_floor`:6198, `_toggle_dance`:6201, `_build_dance_floor`:6209, `_social_tick`:6235, `_photo`:6307

## 6357-6852  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6379, `_game_state`:6387, `_build_arcade`:6399, `_c4_empty`:6450, `_c4_drop_row`:6456, `_c4_winner`:6462, `_c4_bot_move`:6483, `_c4_code`:6512, `_c4_ready`:6518, `_c4_tap`:6521, `_c4_check`:6542, `_c4_tick`:6566, `_rx_ready`:6593, `_rx_start`:6596, `_rx_tap`:6610, `_rx_send_time`:6635, `_rx_resolve`:6642, `_rx_tick`:6668, `_mem_start`:6683, `_mem_tap`:6699, `_mem_finish`:6714, `_mem_tick`:6730, `_mem_board_text`:6737, `_build_arcade_panel`:6748, `_refresh_arcade_panel`:6791

## 6853-7146  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6916, `_quiz_slot`:6919, `_quiz_question`:6929, `_quiz_bot_score`:6958, `_in_quiz`:6967, `_build_quiz`:6970, `_quiz_answer`:7040, `_quiz_msg`:7053, `_quiz_board`:7061, `_quiz_tick`:7071, `_quiz_refresh`:7113

## 7147-8642  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7318, `_sites_found`:7321, `_sites_total`:7324, `_bits`:7327, `_ach_value`:7334, `_ach_tick`:7389, `_ach_check`:7414, `_ach_by_id`:7450, `_ach_msg`:7456, `_build_ach`:7469, `_ach_show`:7500, `_open_ach`:7520, `_close_ach`:7526, `_refresh_ach`:7530, `_ach_num`:7561, `_minimap_tap`:7564, `_menu_go`:7571, `_menu_stay`:7576, `_menu_call_car`:7580, `_toggle_clean_hud`:7586, `_refresh_menu_buttons`:7592, `_clean_hud_tick`:7602, `_draw_joystick`:7643, `_input`:7648, `_stick_zone`:7725, `_notification`:7729, `_physics_process`:7744, `_follow_camera`:7892, `_follow_walk_camera`:7928, `_interact`:7951, `_refresh_hud`:8105, `_open_panel`:8228, `_layout_panels`:8254, `_toggle_menu`:8277, `_rescue`:8317, `_show_toast`:8349, `_save_progress`:8353, `_load_progress`:8441

## 8643-10786  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8644, `_radio_voice`:8647, `_radio_make`:8680, `_radio_set`:8751, `_radio_play`:8773, `_radio_next`:8778, `_radio_talk_line`:8782, `_radio_caption`:8803, `_radio_refresh`:8811, `_process`:8824, `_build_peds`:8873, `_update_peds`:8984, `_update_ped`:9003, `_smoke_test`:9057, `_smoke_chase`:9696, `_smoke_orole`:9729, `_smoke_levels`:9758, `_smoke_bus`:9799, `_smoke_chase_extras`:9884, `_smoke_marina`:9912, `_blocked_at`:10014, `_blocker`:10029, `_on_screen`:10042, `_wait_radio`:10047, `_smoke_radio_peds`:10054, `_smoke_models`:10124, `_smoke_garage_ridge`:10148, `_save_shot`:10524, `_people_shots`:10534, `_shots`:10575, `_shot_car`:10769, `_capture_preview`:10779

## 10787-11435  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10854, `_downtown_count`:10857, `_nearest_downtown`:10864, `_check_downtown`:10878, `_discover_downtown`:10891, `_box_batch`:10905, `_model_batch`:10925, `_cut_ranges`:10979, `_dt_ranges`:10991, `_dt_has`:10998, `_dt_near_cross`:11004, `_place`:11010, `_signal_pole`:11021, `_cyl_batch`:11040, `_city_signals`:11064, `_ensure_light_mats`:11115, `_city_lamps`:11125, `_build_downtown`:11169, `_dt_block`:11369, `_downtown_token`:11375, `_build_park`:11392, `_build_plaza`:11421

## 11436-11539  old city and Bay details

`_build_city_detail`:11437

## 11540-11949  traffic

`_build_traffic`:11541, `_path_sample`:11636, `_light_look`:11650, `_light_green`:11658, `_traffic_place`:11662, `_traffic_blocked_by`:11674, `_traffic_tick`:11686, `_smoke_downtown`:11792, `_skyline_shot`:11904, `_skyline_shots`:11912

## 11950-12302  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:11996, `_web_scale`:12051, `_web_fps_tick`:12061, `_world_to_uv`:12078, `_map_angle`:12081, `_build_minimap`:12089, `_open_map`:12162, `_close_map`:12173, `_mini_point`:12180, `_site_markers`:12184, `_draw_arrow`:12216, `_draw_minimap`:12223, `_draw_full_map`:12270, `_minimap_tick`:12295

## 12303-12560  camera views

`_build_view_controls`:12304, `_cycle_view`:12346, `_apply_view`:12356, `_hide_labels`:12394, `_unfade`:12400, `_bake_map`:12406, `_shot_stats`:12456, `_view_shots`:12459, `_smoke_views`:12500

## 12561-12808  v0.17.0: level-up celebration

`_build_level_fx`:12572, `_draw_level_rays`:12609, `_level_fx_tick`:12619, `_level_sound`:12624, `_fx_material`:12666, `_level_up_fx`:12674, `_smoke_level_fx`:12775, `_levelup_shots`:12784

## 12809-12928  v0.18.0: walk-in stadium

`_collider_yaw`:12814, `_build_stadium_walls`:12825, `_look`:12853, `_smoke_stadium_eye`:12862, `_stadium_shots`:12898

## 12929-13090  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:12953, `_arrow_mesh`:12965, `_build_guidance`:12988, `_guide_target`:13013, `_guidance_tick`:13042, `_draw_hud_arrow`:13068

## 13091-13276  checkpoints

`_build_checkpoints`:13092, `_refresh_checkpoints`:13137, `_check_checkpoints`:13143, `_activate_checkpoint`:13153, `_checkpoint_spawn`:13174, `_spawn_at_checkpoint`:13179, `_draw_checkpoint_icon`:13195, `_smoke_guidance_checkpoints`:13201, `_guide_shots`:13251

## 13277-13544  v0.18.0: Harbor Dome social hub

`_hub_seat`:13335, `_build_hub`:13339

## 13545-13595  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13546, `_xm_mesh`:13555, `_xm_tree`:13563

## 13596-13919  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13599, `_gt_surface`:13614, `_xm_grand_tree`:13624, `_lux_mat`:13739, `_lux_part`:13755, `_lux_box`:13758, `_lux_cyl`:13763, `_lux_ball`:13771, `_lux_new`:13779, `_lux_commit`:13784, `_lux_sofa_mesh`:13788, `_lux_chair_mesh`:13818, `_lux_table_mesh`:13838, `_lux_pouf_mesh`:13853, `_lux_batch`:13868, `_hub_christmas`:13884

## 13920-14075  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:13921

## 14076-14324  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14079, `_vx_cyl`:14086, `_vx_ball`:14094, `_vx_ring`:14102, `_hub_polish`:14110, `_hub_gate`:14133, `_hub_vip`:14195, `_hub_glass`:14308

## 14325-14532  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14326, `_build_hub_bots`:14351, `_seat_of`:14382, `_bubble`:14392, `_emote`:14441, `_hub_people_tick`:14455

## 14533-14651  seats

`_seat_taken`:14534, `_nearest_seat`:14542, `_seat_label`:14554, `_sit`:14570, `_stand_up`:14614, `_seated_tick`:14633

## 14652-14808  game panel

`_build_game_panel`:14653, `_open_game_panel`:14708, `_refresh_game_panel`:14727, `_play_robot`:14772, `_peer_at`:14786, `_opponent_name`:14793, `_pay`:14801

## 14809-14929  tic-tac-toe

`_ttt_ready`:14812, `_ttt_winner`:14818, `_ttt_bot_move`:14828, `_ttt_tap`:14854, `_ttt_code`:14874, `_ttt_check`:14880, `_ttt_tick`:14903

## 14930-14981  rock paper scissors

`_rps_ready`:14931, `_rps_pick`:14937, `_rps_resolve`:14955, `_rps_tick`:14979

## 14982-15064  online table messages

`_online_game_send`:14983, `_hub_game_msg`:14989

## 15065-15140  comedy show

`_joke_start`:15066, `_joke_tick`:15078, `_speak`:15104, `_play_rimshot`:15113

## 15141-15741  quick chat and emotes

`_build_chat`:15158, `_chat_toggle_to`:15258, `_chat_log_add`:15266, `_chat_area`:15272, `_chat_near_count`:15290, `_chat_tick`:15299, `_toggle_chat`:15346, `_say`:15360, `_do_emote`:15374, `_smoke_hub`:15383, `_hub_shots`:15557, `_sg_on_terrace`:15692, `_people_only`:15695, `_people_only_keep_cars_out`:15699, `_car_barrier`:15711, `_hub_keep_cars_out`:15725

## 15742-15904  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:15751, `_feed_add`:15760, `_feed_render`:15766, `_feed_tick`:15794, `_online_event_send`:15803, `_at_pvp_table`:15810, `_game_name`:15817, `_send_lfp`:15820, `_lfp_msg`:15837, `_accept_invite`:15858

## 15905-16145  v0.18.2: nickname and HUD relayout

`_nick_rude`:15917, `_clean_nick`:15932, `_build_nick_panel`:15944, `_open_nick`:15982, `_random_nick`:15991, `_save_nick`:15997, `_close_nick`:16016, `_refresh_nick_button`:16025, `_relayout_hud`:16029, `_smoke_nick`:16065, `_nick_shots`:16097, `_smoke_sites_reachable`:16115

## 16146-16433  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16172, `_nearest_civic`:16179, `_check_civic`:16193, `_discover_civic`:16206, `_civ_ranges`:16219, `_civ_has`:16233, `_civ_near_cross`:16239, `_build_civic`:16245, `_civic_token`:16371, `_civic_shots`:16388, `_hub_focus`:16410

## 16434-16543  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:16505, `_in_rw_lot`:16508, `_box_batch_rot`:16511, `_multi_collider`:16529

## 16544-16871  circuit geometry

`_cr_point`:16545, `_rw_build_path`:16559, `_rw_dir`:16587, `_rw_bend`:16592, `_ribbon`:16598, `_rw_band`:16618, `_rw_keepout`:16636, `_build_raceway`:16645, `_build_rw_parking`:16679, `_build_rw_pits`:16724, `_build_rw_track`:16761, `_build_rw_trackside`:16802

## 16872-16969  race car rental

`_model_key`:16873, `_race_car_start`:16876, `_tint_ghost`:16914, `_race_car_end`:16927, `_race_keep_cars_out`:16952

## 16970-16984  speed effects

`_eff_max`:16971, `_eff_accel`:16982

## 16985-17035  track helpers

`_rw_seg_progress`:16986, `_rw_track_dist`:17006, `_rw_point_dist`:17017, `_rw_player_progress`:17024, `_rw_target`:17030

## 17036-17272  events

`_rec_stop`:17037, `_rw_place`:17053, `_rw_grid_pos`:17060, `_rw_start`:17065, `_rw_spawn_ai`:17097, `_rw_ai_place`:17121, `_rw_tick`:17132, `_rw_ai_tick`:17185, `_rw_lap_done`:17227, `_rw_finish`:17239, `_rw_fmt`:17270

## 17273-17325  boosters and spikes

`_rw_buy`:17274, `_rw_use_boost`:17292, `_rw_use_spike`:17300, `_rw_drop_spike_at`:17311

## 17326-17383  online races

`_race_msg`:17327, `_join_race`:17349

## 17384-17739  raceway panel, HUD, board

`_build_raceway_ui`:17385, `_rw_layout`:17445, `_rw_open`:17452, `_rw_close`:17458, `_rw_refresh_panel`:17462, `_rw_refresh_board`:17475, `_rw_hud`:17487, `_peer_car_model`:17511, `_smoke_raceway`:17521, `_race_shots`:17702

## 17740-17947  v0.22.0: Call Car

`_call_block_reason`:17746, `_call_spot`:17763, `_call_car`:17794, `_play_horn`:17818, `_smoke_follow_call`:17842, `_follow_shots`:17915

## 17948-18247  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:17963, `_build_travel`:17968, `_toggle_run`:18010, `_refresh_run`:18014, `_hud_v23_tick`:18022, `_travel_block_reason`:18051, `_travel_open`:18071, `_open_travel`:18077, `_close_travel`:18083, `_refresh_travel`:18087, `_travel_to`:18095, `_smoke_travel`:18122, `_v23_shots`:18160

## 18248-18321  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:18255, `_qr_button`:18270, `_qr_layout`:18309, `_smoke_qr`:18315

## 18322-18758  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:18342, `_open_crate`:18358, `_build_crate_ui`:18375, `_crate_pick`:18462, `_crate_reveal`:18485, `_crate_draw_car`:18512, `_crate_confetti`:18531, `_crate_sound`:18556, `_crate_drive`:18582, `_feed_add_system`:18612, `_smoke_crate`:18615, `_crate_shots`:18663

## 18759-19250  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:18800, `_quick_today`:18805, `_quick_is_done`:18808, `_quick_left`:18811, `_quick_next`:18818, `_quick_fix_target`:18831, `_quick_daily_check`:18845, `_quick_complete`:18859, `_quick_side`:18893, `_build_quick_props`:18911, `_daily_shots`:19063, `_quick_props_refresh`:19105, `_quick_fx`:19109, `_play_coin`:19125, `_smoke_quick`:19142

## 19251-19401  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:19260, `_quest_nearby`:19315, `_open_quests`:19322, `_close_quests`:19329, `_refresh_quests`:19333, `_quest_pick`:19359, `_quest_mode`:19373, `_smoke_quests`:19376

## 19402-19436  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:19406, `_my_tag_tick`:19409

## 19437-19751  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:19454, `_fc_torus`:19464, `_fc_pearl`:19472, `_fc_chrome`:19482, `_fc_glass`:19491, `_fc_glow`:19501, `_fc_ghost`:19510, `_fc_holo`:19522, `_fc_mesh`:19532, `_fc_sphere`:19552, `_fc_capsule`:19560, `_fc_cone`:19568, `_build_food_court`:19577, `_food_court_tick`:19731

## 19752-20071  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:19779, `_cm_bench`:19795, `_build_commons`:19808, `_commons_tick`:20030

## 20072-20386  v0.36: the daily puzzle

`_pz_today`:20095, `_pz_new`:20098, `_pz_neighbours`:20143, `_pz_flip`:20153, `_pz_done`:20158, `_pz_tap`:20166, `_pz_win`:20182, `_pz_reset`:20203, `_puzzle_near`:20207, `_open_puzzle`:20212, `_close_puzzle`:20220, `_pz_refresh_sign`:20224, `_build_puzzle_panel`:20232, `_pz_draw`:20263, `_smoke_chat`:20304, `_smoke_feet`:20342, `_smoke_commons`:20363

## 20387-20575  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:20449, `_bio_theta`:20453, `_bio_sec_n`:20458, `_bio_sec_of`:20461, `_bio_pt`:20464, `_bio_lp`:20469, `_bio_la`:20473, `_bio_dir`:20477, `_bio_hex_r`:20480, `_bio_apo`:20485, `_bio_open_angles`:20491, `_bio_si`:20501, `_bm`:20507, `_bsph`:20512, `_blow`:20515, `_bcone`:20526, `_bbox`:20529, `_bp`:20532, `_bq`:20537, `_bio_glass_mat`:20541, `_bio_water_mat`:20554, `_bio_mat`:20566

## 20576-20948  building blocks

`_bio_inst`:20577, `_bio_add`:20583, `_bio_model`:20586, `_bio_nature_mesh`:20592, `_bio_flush`:20626, `_bio_bar`:20661, `_bio_slab`:20674, `_bio_body`:20689, `_bio_cyl_col`:20702, `_bio_hexmesh`:20715, `_bio_hexslab`:20727, `_bio_hexpt`:20733, `_bio_gridshell`:20740, `_bio_rail`:20847, `_bio_rail_arc`:20852, `_bio_disc_deck`:20864, `_bio_ring_deck`:20870, `_bio_helix`:20881, `_bio_pillar`:20901, `_bio_cafe`:20907, `_bio_fence_line`:20921, `_bio_fence_seg`:20926, `_bio_pen`:20936

## 20949-21450  building

`_build_biosphere`:20950, `_build_biosphere_legacy`:20954, `_bio_text`:21116, `_bio_plaque`:21134, `_bio_ticket_hall`:21148, `_on_foot_collision_guard`:21204, `_bio_inside`:21214, `_bio_pass_ok`:21217, `_ticket_near`:21221, `_bio_buy_pass`:21226, `_bio_gates_update`:21242, `_bio_gate_tick`:21268, `_bio_tunnel`:21280, `_bio_grounds`:21333, `_bio_dome`:21379, `_bio_deck_mats`:21447

## 21451-21606  garden planting

`_bio_free`:21452, `_bio_spot`:21469, `_bio_garden`:21477, `_bio_pine`:21518, `_bio_tree`:21521, `_bio_big_tree`:21531, `_bio_rock`:21536, `_bio_pond`:21539, `_bio_particles`:21543, `_bio_mist`:21571, `_bio_mini_dome`:21600

## 21607-22014  the four layouts

`_bio_winter`:21608, `_bio_spring`:21700, `_bio_summer`:21825, `_bio_autumn`:21909

## 22015-22285  animals

`_bio_spawn`:22016, `_bio_load_animal`:22088, `_bio_make_quad`:22109, `_bio_load_bird`:22186, `_bio_make_penguin`:22206, `_bio_make_bird`:22228, `_bio_make_flamingo`:22252, `_bio_make_butterfly`:22273

## 22286-22415  animation, spotting and rewards

`_bio_stuck_check`:22291, `_biosphere_tick`:22309, `_bio_animate`:22316, `_bio_spot_check`:22396, `_bio_spotted`:22408, `_smoke_biosphere`:22412

## 22416-22933  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:22503, `_wear_piece`:22506, `_wear_mat`:22529, `_person_index`:22545, `_dress`:22568, `_smoke_style`:22674, `_style_shots`:22825, `_npc_look`:22897

## 22934-23082  your look: apply, save, share

`_look_clean`:22938, `_look_pack`:22953, `_owns`:22959, `_apply_look`:22964, `_relic_model`:22970, `_fc_mesh_mat`:23035, `_relic_refresh`:23038, `_relic_tick`:23052, `_peer_style`:23063

## 23083-23510  stores and the wardrobe

`_style_today`:23102, `_style_items`:23105, `_style_cat`:23113, `_style_price`:23116, `_style_deal`:23130, `_style_price_base`:23143, `_relic_stock`:23150, `_build_style_panel`:23162, `_open_store`:23202, `_open_wardrobe`:23221, `_style_close`:23224, `_style_finish`:23228, `_sync_old_avatar`:23243, `_style_tabs_for`:23250, `_refresh_style`:23255, `_style_body_rows`:23406, `_style_set_tab`:23423, `_style_step`:23427, `_style_color`:23432, `_style_pick`:23437, `_style_buy`:23472, `_ach_relics_check`:23494, `_style_face_camera`:23499

## 23511-23978  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:23547, `_ga_text`:23553, `_ga_box`:23570, `_build_galleria`:23586, `_ga_inner_tick`:23727, `_ga_shell`:23743, `_ga_inside`:23793, `_bio_cyl_col_on`:23796, `_ga_models`:23808, `_ga_lbox`:23823, `_ga_ltext`:23837, `_ga_store`:23844, `_bio_cafe_on`:23946, `_ga_mannequins`:23954

## 23979-24130  featured outfits and the Sky Run

`_ga_featured_look`:23992, `_build_ga_fun`:24013, `_ga_fun_tick`:24058, `_sky_finish`:24085, `_extra_near`:24104, `_extra_open`:24113, `_store_near`:24122

## 24131-24227  v0.41: THE SKY GARDEN

`_sg_now`:24185, `_sg_progress`:24188, `_sg_time`:24194, `_sg_stock`:24201, `_sg_mut_roll`:24216

## 24228-24365  building

`_sg_box`:24229, `_sg_text`:24235, `_build_sky_garden`:24249, `_sg_seed_spot`:24360, `_sg_codex_spot`:24363

## 24366-24546  plants

`_sg_plant_model`:24367, `_sg_refresh_all`:24472, `_sg_refresh`:24476, `_sky_garden_tick`:24512, `_sg_ready_count`:24531, `_sg_boot_note`:24538

## 24547-24666  interacting

`_sg_near`:24548, `_sg_button_text`:24571, `_sg_value`:24584, `_sg_interact`:24588, `_sg_buy`:24604, `_sg_plant`:24626, `_sg_harvest`:24637

## 24667-24910  the garden screen

`_build_sg_panel`:24668, `_sg_open`:24703, `_sg_close`:24712, `_sg_row`:24716, `_sg_refresh_panel`:24731, `_sg_pick_buy`:24776, `_sg_pick_plant`:24780, `_smoke_car_barriers`:24786, `_smoke_sky_garden`:24827

## 24911-24949  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:24942, `_pass_day`:24945

## 24950-24981  album

`_album_pages`:24951, `_album_claim`:24966

## 24982-25033  season

`_season_index`:24983, `_season_tick`:24986, `_season_xp`:24995, `_season_tier`:24998, `_season_reward`:25001, `_season_claim`:25015

## 25034-25041  Harbor Night

`_harbor_night`:25035

## 25042-25073  check-in calendar

`_cal_tick`:25043

## 25074-25250  the panel

`_build_hp_panel`:25075, `_open_pass`:25110, `_hp_open`:25113, `_hp_close`:25120, `_hp_row`:25124, `_hp_bar`:25139, `_hp_refresh`:25143, `_smoke_pass`:25188

## 25251-25465  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:25255, `_cash_pill_tick`:25263, `_build_lb`:25301, `_open_lb`:25344, `_close_lb`:25352, `_lb_pick`:25356, `_lb_headers`:25361, `_lb_url`:25365, `_lb_me`:25368, `_lb_tick`:25371, `_lb_upload`:25379, `_lb_fetch`:25389, `_lb_got`:25397, `_lb_value`:25408, `_lb_refresh_ui`:25419

## 25466-25889  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:25490, `_market_near`:25567, `_build_gear`:25577, `_gear_piece`:25585, `_build_pet`:25630, `_market_apply`:25672, `_market_tick`:25696, `_build_market_panel`:25718, `_open_market`:25744, `_close_market`:25751, `_refresh_market`:25755, `_market_pick`:25808, `_toggle_board`:25846, `_board_tick`:25853

## 25890-26131  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:25922, `_ds_label`:25941, `_build_display`:25955, `_ds_got`:26034, `_ds_sorted`:26043, `_ds_render_board`:26057, `_ds_render_news`:26083, `_display_tick`:26102

## 26132-26310  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26149, `_toggle_streamer`:26236, `_streamer_badge_tap`:26252, `_streamer_tick`:26256

## 26311-26347  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:26317, `_car_back`:26324, `_car_park_tick`:26331

## 26348-26444  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:26352, `_bus_eta`:26406, `_bus_displays_tick`:26422

## 26445-26736  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:26463, `_treasure_pick`:26466, `_treasure_spot`:26475, `_treasure_district`:26479, `_treasure_clue`:26491, `_treasure_prop`:26504, `_tp_part`:26507, `_tp_sphere`:26517, `_tp_cyl`:26525, `_treasure_prop_side`:26534, `_build_treasure_props`:26546, `_build_treasure`:26590, `_treasure_dir_char`:26659, `_treasure_tick`:26668, `_treasure_claim`:26722

## 26737-26837  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:26738, `_halo_mat`:26770, `_smoke_treasure`:26795

## 26838-27161  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:26859, `_fm_send`:26862, `_fm_area`:26868, `_fm_glow_mesh`:26884, `_fm_block_reason`:26902, `_fm_start`:26914, `_fm_announce`:26942, `_fm_finish`:26945, `_fm_msg`:26963, `_fm_check_paid`:27014, `_fm_tick`:27032, `_smoke_findme`:27088

## 27162-27272  v0.24.2: road map (for moving people off the road)

`_floor_note`:27168, `_floor_disc`:27182, `_floor_top`:27191, `_ground_at`:27209, `_note_road`:27227, `_on_road`:27234, `_ped_curb`:27244, `_curb_spot`:27254

## 27273-27568  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27295, `_ex_grid`:27303, `_ex_lamps`:27338, `_ex_umbrella`:27361, `_ex_yards`:27368, `_build_expansion`:27383, `_expand_shots`:27546

## 27569-27763  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:27610, `_v27_near_cross`:27702, `_v27_near_any_road`:27709, `_v27_in_district`:27715, `_sea_tick`:27729, `_sea_tow`:27748

## 27764-28404  Harbor Loop sky train

`_sky_build_path`:27815, `_sky_pos`:27856, `_sky_dir`:27870, `_sky_project`:27875, `_sky_trip_time`:27894, `_sky_trip_dist`:27900, `_sky_now`:27911, `_sky_state`:27914, `_sky_time_at_station`:27929, `_sky_next_arrival`:27936, `_build_skytrain`:27949, `_sky_make_car`:28078, `_sky_skin`:28115, `_sky_place_trains`:28135, `_sky_build_station`:28154, `_sky_near`:28219, `_sky_fmt`:28228, `_sky_enter`:28232, `_sky_leave_platform`:28250, `_sky_board`:28260, `_sky_alight`:28273, `_sky_action`:28286, `_sky_tick`:28303, `_sky_camera`:28341, `_tour_today`:28357, `_tour_stamp`:28360, `_sky_hud`:28383

## 28405-28742  Day and night

`_game_hour`:28486, `_day_key`:28498, `_night_setup`:28513, `_night_scan_mesh`:28603, `_daynight_tick`:28628, `_daynight_apply`:28635, `_daynight_lights`:28727, `_cycle_day_mode`:28732, `_refresh_time_button`:28739

## 28743-29378  v0.27 smoke test and screenshots

`_smoke_v27`:28744, `_city_shots`:28947

## 29379-29795  v0.27: Harbor International Airport (north of the city)

`_build_airport`:29413, `_ap_plane`:29589, `_ap_truck`:29609, `_ap_baggage_train`:29650, `_ap_loop_pos`:29663, `_ap_loop_len`:29679, `_ap_flight_at`:29685, `_ap_tick`:29709, `_airport_ped_plan`:29732, `_smoke_airport`:29752

## 29796-30309  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:29810, `_nav_spot`:29817, `_nav_idx`:29821, `_nav_pos`:29828, `_nav_blocked`:29832, `_nav_nearest_free`:29842, `_nav_bfs`:29870, `_nav_build`:29914, `_stroller`:29985, `_stroll_place`:30001, `_stroll_next`:30022, `_nav_clear_line`:30056, `_stroll_aim`:30067, `_strollers_tick`:30099, `_smoke_strollers`:30194

## 30310-30470  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:30345, `_dir_fmt`:30348, `_signpost_spot`:30351, `_build_signposts`:30368

## 30471-30567  the Directions panel and chip

`_build_dir_panel`:30472, `_open_dir`:30514, `_dir_close`:30523, `_dir_pick`:30527, `_dir_stop`:30532, `_dir_stop_and_close`:30537, `_dir_tick`:30541

## 30568-31109  v0.44: Grand Central

`_gc_mesh`:30597, `_gc_mat`:30630, `_gc_glass`:30639, `_gb`:30649, `_gb_solid`:30655, `_gb_flush`:30659, `_gc_tree`:30689, `_gc_text`:30694, `_gc_planter`:30709, `_gc_kiosk`:30715, `_goods_color`:30745, `_goods_mat`:30748, `_kiosk_goods`:30752, `_build_grand_central`:30830, `_build_gc_towers`:30998, `_gc_tick`:31093

## 31110-31401  v0.44: filling the empty land

`_loft`:31127, `_fill_clear`:31169, `_build_fill`:31179, `_hg_in_lake`:31227, `_hg_path`:31231, `_floor_note_rot`:31239, `_build_gardens`:31247, `_build_fan_plaza`:31357

## 31402-31436  v0.45: hover car underglow

`_car_underglow`:31405

## 31437-31601  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:31438

## 31602-31633  v0.47: street stalls downtown

`_build_street_stalls`:31606, `_cull_people_in`:31626

## 31634-31732  v0.48: places that open as you level up

`_place_lock_of`:31647, `_place_root`:31653, `_place_unlocked`:31656, `_build_place_signs`:31664, `_places_refresh`:31709, `_places_tick`:31726

## 31733-31777  v0.50: city careers

`_career_rank_name`:31758, `_career_mult`:31761, `_career_block_reason`:31766, `_career_start`:31769, `_career_end`:31774

## 31778-31828  v0.52: careers as clear job loops

`_cid`:31805, `_career_target`:31819, `_career_tick`:31826

## 31829-31836  taxi

`_taxi_meter`:31830

## 31837-31840  paramedic

(no functions)

## 31841-31845  police

`_career_chase_over`:31843

## 31846-31851  firefighter

`_fire_aimed`:31847

## 31852-31861  the step bar

`_career_bar_text`:31855, `_career_hud`:31859

## 31862-31888  cut scenes

`_cs_skip`:31880

## 31889-31893  siren

(no functions)

## 31894-31905  the Careers panel

`_build_career_panel`:31895, `_open_careers`:31898, `_career_close`:31902

## 31906-32329  v0.50: homes

`_home_door_spots`:31946, `_build_homes`:31961, `_home_labels`:31990, `_home_door_near`:31999, `_home_origin`:32008, `_home_slot_near`:32011, `_home_exit_near`:32022, `_home_btn`:32029, `_home_interact`:32042, `_home_buy`:32061, `_home_default_layout`:32075, `_home_enter`:32083, `_home_leave`:32103, `_hm`:32111, `_home_build_room`:32130, `_home_refresh_room`:32239, `_furni_build`:32253

## 32330-32665  decorating

`_build_home_panels`:32331, `_open_homes`:32376, `_home_row_go`:32386, `_home_panel_close`:32406, `_deco_open`:32410, `_deco_pick`:32433, `_smoke_careers_homes`:32456

## 32666-32800  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:32670, `_home_slots`:32678, `_home_ring`:32705, `_furni_cat`:32711, `_home_fix_layout`:32717, `_home_build_layout`:32745

## 32801-33234  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:32864, `_ch_homes`:32870, `_ch_step_text`:32877, `_ch_step_done`:32888, `_ch_target`:32902, `_ch_finish_chapter`:32911, `_chapters_tick`:32933, `_hud_top_stack`:32973, `_build_chapters_ui`:33003, `_chapters_restart_ask`:33045, `_chapters_restart`:33048, `_chapters_text`:33058, `_open_chapters`:33078, `_chapters_close`:33085, `_smoke_chapters`:33089, `_step_sound`:33210

## 33235-33273  v0.51.1: join and leave messages

`_announce_join`:33242, `_announce_already_here`:33261, `_announce_leave`:33269

## 33274-33538  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33290, `_shot_tick`:33296, `_draw_shot_icon`:33328, `_shot_enter`:33337, `_shot_exit`:33351, `_shot_release_controls`:33363, `_shot_stick_zone`:33370, `_shot_input`:33373, `_smoke_photo`:33445

## 33539-33837  v0.51.3: stream joiners

`_viewer_count`:33559, `_stream_join_check`:33565, `_stream_join_start`:33572, `_sj_streamer`:33589, `_stream_join_tick`:33598, `_stream_join_land`:33622, `_sj_welcome`:33638, `_smoke_stream_join`:33672, `_career_shot`:33755

## 33838-33954  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:33842, `_st_restore`:33880, `_smoke_streamer_clean`:33901, `_world_bio_passport`:33952

