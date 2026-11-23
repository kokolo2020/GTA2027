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

## 13545-13654  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13546, `_xm_mesh`:13555, `_xm_tree`:13563, `_hub_christmas`:13596

## 13655-13810  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:13656

## 13811-14063  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:13814, `_vx_cyl`:13821, `_vx_ball`:13829, `_vx_ring`:13837, `_hub_polish`:13845, `_hub_gate`:13868, `_hub_vip`:13934, `_hub_glass`:14047

## 14064-14271  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14065, `_build_hub_bots`:14090, `_seat_of`:14121, `_bubble`:14131, `_emote`:14180, `_hub_people_tick`:14194

## 14272-14390  seats

`_seat_taken`:14273, `_nearest_seat`:14281, `_seat_label`:14293, `_sit`:14309, `_stand_up`:14353, `_seated_tick`:14372

## 14391-14547  game panel

`_build_game_panel`:14392, `_open_game_panel`:14447, `_refresh_game_panel`:14466, `_play_robot`:14511, `_peer_at`:14525, `_opponent_name`:14532, `_pay`:14540

## 14548-14668  tic-tac-toe

`_ttt_ready`:14551, `_ttt_winner`:14557, `_ttt_bot_move`:14567, `_ttt_tap`:14593, `_ttt_code`:14613, `_ttt_check`:14619, `_ttt_tick`:14642

## 14669-14720  rock paper scissors

`_rps_ready`:14670, `_rps_pick`:14676, `_rps_resolve`:14694, `_rps_tick`:14718

## 14721-14803  online table messages

`_online_game_send`:14722, `_hub_game_msg`:14728

## 14804-14879  comedy show

`_joke_start`:14805, `_joke_tick`:14817, `_speak`:14843, `_play_rimshot`:14852

## 14880-15462  quick chat and emotes

`_build_chat`:14897, `_chat_toggle_to`:14997, `_chat_log_add`:15005, `_chat_area`:15011, `_chat_near_count`:15029, `_chat_tick`:15038, `_toggle_chat`:15085, `_say`:15099, `_do_emote`:15113, `_smoke_hub`:15122, `_hub_shots`:15296, `_sg_on_terrace`:15413, `_people_only`:15416, `_people_only_keep_cars_out`:15420, `_car_barrier`:15432, `_hub_keep_cars_out`:15446

## 15463-15625  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:15472, `_feed_add`:15481, `_feed_render`:15487, `_feed_tick`:15515, `_online_event_send`:15524, `_at_pvp_table`:15531, `_game_name`:15538, `_send_lfp`:15541, `_lfp_msg`:15558, `_accept_invite`:15579

## 15626-15866  v0.18.2: nickname and HUD relayout

`_nick_rude`:15638, `_clean_nick`:15653, `_build_nick_panel`:15665, `_open_nick`:15703, `_random_nick`:15712, `_save_nick`:15718, `_close_nick`:15737, `_refresh_nick_button`:15746, `_relayout_hud`:15750, `_smoke_nick`:15786, `_nick_shots`:15818, `_smoke_sites_reachable`:15836

## 15867-16154  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:15893, `_nearest_civic`:15900, `_check_civic`:15914, `_discover_civic`:15927, `_civ_ranges`:15940, `_civ_has`:15954, `_civ_near_cross`:15960, `_build_civic`:15966, `_civic_token`:16092, `_civic_shots`:16109, `_hub_focus`:16131

## 16155-16264  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:16226, `_in_rw_lot`:16229, `_box_batch_rot`:16232, `_multi_collider`:16250

## 16265-16592  circuit geometry

`_cr_point`:16266, `_rw_build_path`:16280, `_rw_dir`:16308, `_rw_bend`:16313, `_ribbon`:16319, `_rw_band`:16339, `_rw_keepout`:16357, `_build_raceway`:16366, `_build_rw_parking`:16400, `_build_rw_pits`:16445, `_build_rw_track`:16482, `_build_rw_trackside`:16523

## 16593-16690  race car rental

`_model_key`:16594, `_race_car_start`:16597, `_tint_ghost`:16635, `_race_car_end`:16648, `_race_keep_cars_out`:16673

## 16691-16705  speed effects

`_eff_max`:16692, `_eff_accel`:16703

## 16706-16756  track helpers

`_rw_seg_progress`:16707, `_rw_track_dist`:16727, `_rw_point_dist`:16738, `_rw_player_progress`:16745, `_rw_target`:16751

## 16757-16993  events

`_rec_stop`:16758, `_rw_place`:16774, `_rw_grid_pos`:16781, `_rw_start`:16786, `_rw_spawn_ai`:16818, `_rw_ai_place`:16842, `_rw_tick`:16853, `_rw_ai_tick`:16906, `_rw_lap_done`:16948, `_rw_finish`:16960, `_rw_fmt`:16991

## 16994-17046  boosters and spikes

`_rw_buy`:16995, `_rw_use_boost`:17013, `_rw_use_spike`:17021, `_rw_drop_spike_at`:17032

## 17047-17104  online races

`_race_msg`:17048, `_join_race`:17070

## 17105-17460  raceway panel, HUD, board

`_build_raceway_ui`:17106, `_rw_layout`:17166, `_rw_open`:17173, `_rw_close`:17179, `_rw_refresh_panel`:17183, `_rw_refresh_board`:17196, `_rw_hud`:17208, `_peer_car_model`:17232, `_smoke_raceway`:17242, `_race_shots`:17423

## 17461-17668  v0.22.0: Call Car

`_call_block_reason`:17467, `_call_spot`:17484, `_call_car`:17515, `_play_horn`:17539, `_smoke_follow_call`:17563, `_follow_shots`:17636

## 17669-17968  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:17684, `_build_travel`:17689, `_toggle_run`:17731, `_refresh_run`:17735, `_hud_v23_tick`:17743, `_travel_block_reason`:17772, `_travel_open`:17792, `_open_travel`:17798, `_close_travel`:17804, `_refresh_travel`:17808, `_travel_to`:17816, `_smoke_travel`:17843, `_v23_shots`:17881

## 17969-18042  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:17976, `_qr_button`:17991, `_qr_layout`:18030, `_smoke_qr`:18036

## 18043-18479  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:18063, `_open_crate`:18079, `_build_crate_ui`:18096, `_crate_pick`:18183, `_crate_reveal`:18206, `_crate_draw_car`:18233, `_crate_confetti`:18252, `_crate_sound`:18277, `_crate_drive`:18303, `_feed_add_system`:18333, `_smoke_crate`:18336, `_crate_shots`:18384

## 18480-18971  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:18521, `_quick_today`:18526, `_quick_is_done`:18529, `_quick_left`:18532, `_quick_next`:18539, `_quick_fix_target`:18552, `_quick_daily_check`:18566, `_quick_complete`:18580, `_quick_side`:18614, `_build_quick_props`:18632, `_daily_shots`:18784, `_quick_props_refresh`:18826, `_quick_fx`:18830, `_play_coin`:18846, `_smoke_quick`:18863

## 18972-19122  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:18981, `_quest_nearby`:19036, `_open_quests`:19043, `_close_quests`:19050, `_refresh_quests`:19054, `_quest_pick`:19080, `_quest_mode`:19094, `_smoke_quests`:19097

## 19123-19157  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:19127, `_my_tag_tick`:19130

## 19158-19472  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:19175, `_fc_torus`:19185, `_fc_pearl`:19193, `_fc_chrome`:19203, `_fc_glass`:19212, `_fc_glow`:19222, `_fc_ghost`:19231, `_fc_holo`:19243, `_fc_mesh`:19253, `_fc_sphere`:19273, `_fc_capsule`:19281, `_fc_cone`:19289, `_build_food_court`:19298, `_food_court_tick`:19452

## 19473-19792  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:19500, `_cm_bench`:19516, `_build_commons`:19529, `_commons_tick`:19751

## 19793-20107  v0.36: the daily puzzle

`_pz_today`:19816, `_pz_new`:19819, `_pz_neighbours`:19864, `_pz_flip`:19874, `_pz_done`:19879, `_pz_tap`:19887, `_pz_win`:19903, `_pz_reset`:19924, `_puzzle_near`:19928, `_open_puzzle`:19933, `_close_puzzle`:19941, `_pz_refresh_sign`:19945, `_build_puzzle_panel`:19953, `_pz_draw`:19984, `_smoke_chat`:20025, `_smoke_feet`:20063, `_smoke_commons`:20084

## 20108-20296  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:20170, `_bio_theta`:20174, `_bio_sec_n`:20179, `_bio_sec_of`:20182, `_bio_pt`:20185, `_bio_lp`:20190, `_bio_la`:20194, `_bio_dir`:20198, `_bio_hex_r`:20201, `_bio_apo`:20206, `_bio_open_angles`:20212, `_bio_si`:20222, `_bm`:20228, `_bsph`:20233, `_blow`:20236, `_bcone`:20247, `_bbox`:20250, `_bp`:20253, `_bq`:20258, `_bio_glass_mat`:20262, `_bio_water_mat`:20275, `_bio_mat`:20287

## 20297-20669  building blocks

`_bio_inst`:20298, `_bio_add`:20304, `_bio_model`:20307, `_bio_nature_mesh`:20313, `_bio_flush`:20347, `_bio_bar`:20382, `_bio_slab`:20395, `_bio_body`:20410, `_bio_cyl_col`:20423, `_bio_hexmesh`:20436, `_bio_hexslab`:20448, `_bio_hexpt`:20454, `_bio_gridshell`:20461, `_bio_rail`:20568, `_bio_rail_arc`:20573, `_bio_disc_deck`:20585, `_bio_ring_deck`:20591, `_bio_helix`:20602, `_bio_pillar`:20622, `_bio_cafe`:20628, `_bio_fence_line`:20642, `_bio_fence_seg`:20647, `_bio_pen`:20657

## 20670-21171  building

`_build_biosphere`:20671, `_build_biosphere_legacy`:20675, `_bio_text`:20837, `_bio_plaque`:20855, `_bio_ticket_hall`:20869, `_on_foot_collision_guard`:20925, `_bio_inside`:20935, `_bio_pass_ok`:20938, `_ticket_near`:20942, `_bio_buy_pass`:20947, `_bio_gates_update`:20963, `_bio_gate_tick`:20989, `_bio_tunnel`:21001, `_bio_grounds`:21054, `_bio_dome`:21100, `_bio_deck_mats`:21168

## 21172-21327  garden planting

`_bio_free`:21173, `_bio_spot`:21190, `_bio_garden`:21198, `_bio_pine`:21239, `_bio_tree`:21242, `_bio_big_tree`:21252, `_bio_rock`:21257, `_bio_pond`:21260, `_bio_particles`:21264, `_bio_mist`:21292, `_bio_mini_dome`:21321

## 21328-21735  the four layouts

`_bio_winter`:21329, `_bio_spring`:21421, `_bio_summer`:21546, `_bio_autumn`:21630

## 21736-22006  animals

`_bio_spawn`:21737, `_bio_load_animal`:21809, `_bio_make_quad`:21830, `_bio_load_bird`:21907, `_bio_make_penguin`:21927, `_bio_make_bird`:21949, `_bio_make_flamingo`:21973, `_bio_make_butterfly`:21994

## 22007-22136  animation, spotting and rewards

`_bio_stuck_check`:22012, `_biosphere_tick`:22030, `_bio_animate`:22037, `_bio_spot_check`:22117, `_bio_spotted`:22129, `_smoke_biosphere`:22133

## 22137-22654  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:22224, `_wear_piece`:22227, `_wear_mat`:22250, `_person_index`:22266, `_dress`:22289, `_smoke_style`:22395, `_style_shots`:22546, `_npc_look`:22618

## 22655-22803  your look: apply, save, share

`_look_clean`:22659, `_look_pack`:22674, `_owns`:22680, `_apply_look`:22685, `_relic_model`:22691, `_fc_mesh_mat`:22756, `_relic_refresh`:22759, `_relic_tick`:22773, `_peer_style`:22784

## 22804-23231  stores and the wardrobe

`_style_today`:22823, `_style_items`:22826, `_style_cat`:22834, `_style_price`:22837, `_style_deal`:22851, `_style_price_base`:22864, `_relic_stock`:22871, `_build_style_panel`:22883, `_open_store`:22923, `_open_wardrobe`:22942, `_style_close`:22945, `_style_finish`:22949, `_sync_old_avatar`:22964, `_style_tabs_for`:22971, `_refresh_style`:22976, `_style_body_rows`:23127, `_style_set_tab`:23144, `_style_step`:23148, `_style_color`:23153, `_style_pick`:23158, `_style_buy`:23193, `_ach_relics_check`:23215, `_style_face_camera`:23220

## 23232-23699  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:23268, `_ga_text`:23274, `_ga_box`:23291, `_build_galleria`:23307, `_ga_inner_tick`:23448, `_ga_shell`:23464, `_ga_inside`:23514, `_bio_cyl_col_on`:23517, `_ga_models`:23529, `_ga_lbox`:23544, `_ga_ltext`:23558, `_ga_store`:23565, `_bio_cafe_on`:23667, `_ga_mannequins`:23675

## 23700-23851  featured outfits and the Sky Run

`_ga_featured_look`:23713, `_build_ga_fun`:23734, `_ga_fun_tick`:23779, `_sky_finish`:23806, `_extra_near`:23825, `_extra_open`:23834, `_store_near`:23843

## 23852-23948  v0.41: THE SKY GARDEN

`_sg_now`:23906, `_sg_progress`:23909, `_sg_time`:23915, `_sg_stock`:23922, `_sg_mut_roll`:23937

## 23949-24086  building

`_sg_box`:23950, `_sg_text`:23956, `_build_sky_garden`:23970, `_sg_seed_spot`:24081, `_sg_codex_spot`:24084

## 24087-24267  plants

`_sg_plant_model`:24088, `_sg_refresh_all`:24193, `_sg_refresh`:24197, `_sky_garden_tick`:24233, `_sg_ready_count`:24252, `_sg_boot_note`:24259

## 24268-24387  interacting

`_sg_near`:24269, `_sg_button_text`:24292, `_sg_value`:24305, `_sg_interact`:24309, `_sg_buy`:24325, `_sg_plant`:24347, `_sg_harvest`:24358

## 24388-24631  the garden screen

`_build_sg_panel`:24389, `_sg_open`:24424, `_sg_close`:24433, `_sg_row`:24437, `_sg_refresh_panel`:24452, `_sg_pick_buy`:24497, `_sg_pick_plant`:24501, `_smoke_car_barriers`:24507, `_smoke_sky_garden`:24548

## 24632-24670  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:24663, `_pass_day`:24666

## 24671-24702  album

`_album_pages`:24672, `_album_claim`:24687

## 24703-24754  season

`_season_index`:24704, `_season_tick`:24707, `_season_xp`:24716, `_season_tier`:24719, `_season_reward`:24722, `_season_claim`:24736

## 24755-24762  Harbor Night

`_harbor_night`:24756

## 24763-24794  check-in calendar

`_cal_tick`:24764

## 24795-24971  the panel

`_build_hp_panel`:24796, `_open_pass`:24831, `_hp_open`:24834, `_hp_close`:24841, `_hp_row`:24845, `_hp_bar`:24860, `_hp_refresh`:24864, `_smoke_pass`:24909

## 24972-25186  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:24976, `_cash_pill_tick`:24984, `_build_lb`:25022, `_open_lb`:25065, `_close_lb`:25073, `_lb_pick`:25077, `_lb_headers`:25082, `_lb_url`:25086, `_lb_me`:25089, `_lb_tick`:25092, `_lb_upload`:25100, `_lb_fetch`:25110, `_lb_got`:25118, `_lb_value`:25129, `_lb_refresh_ui`:25140

## 25187-25610  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:25211, `_market_near`:25288, `_build_gear`:25298, `_gear_piece`:25306, `_build_pet`:25351, `_market_apply`:25393, `_market_tick`:25417, `_build_market_panel`:25439, `_open_market`:25465, `_close_market`:25472, `_refresh_market`:25476, `_market_pick`:25529, `_toggle_board`:25567, `_board_tick`:25574

## 25611-25852  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:25643, `_ds_label`:25662, `_build_display`:25676, `_ds_got`:25755, `_ds_sorted`:25764, `_ds_render_board`:25778, `_ds_render_news`:25804, `_display_tick`:25823

## 25853-26031  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:25870, `_toggle_streamer`:25957, `_streamer_badge_tap`:25973, `_streamer_tick`:25977

## 26032-26068  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:26038, `_car_back`:26045, `_car_park_tick`:26052

## 26069-26165  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:26073, `_bus_eta`:26127, `_bus_displays_tick`:26143

## 26166-26457  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:26184, `_treasure_pick`:26187, `_treasure_spot`:26196, `_treasure_district`:26200, `_treasure_clue`:26212, `_treasure_prop`:26225, `_tp_part`:26228, `_tp_sphere`:26238, `_tp_cyl`:26246, `_treasure_prop_side`:26255, `_build_treasure_props`:26267, `_build_treasure`:26311, `_treasure_dir_char`:26380, `_treasure_tick`:26389, `_treasure_claim`:26443

## 26458-26558  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:26459, `_halo_mat`:26491, `_smoke_treasure`:26516

## 26559-26882  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:26580, `_fm_send`:26583, `_fm_area`:26589, `_fm_glow_mesh`:26605, `_fm_block_reason`:26623, `_fm_start`:26635, `_fm_announce`:26663, `_fm_finish`:26666, `_fm_msg`:26684, `_fm_check_paid`:26735, `_fm_tick`:26753, `_smoke_findme`:26809

## 26883-26993  v0.24.2: road map (for moving people off the road)

`_floor_note`:26889, `_floor_disc`:26903, `_floor_top`:26912, `_ground_at`:26930, `_note_road`:26948, `_on_road`:26955, `_ped_curb`:26965, `_curb_spot`:26975

## 26994-27289  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27016, `_ex_grid`:27024, `_ex_lamps`:27059, `_ex_umbrella`:27082, `_ex_yards`:27089, `_build_expansion`:27104, `_expand_shots`:27267

## 27290-27484  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:27331, `_v27_near_cross`:27423, `_v27_near_any_road`:27430, `_v27_in_district`:27436, `_sea_tick`:27450, `_sea_tow`:27469

## 27485-28125  Harbor Loop sky train

`_sky_build_path`:27536, `_sky_pos`:27577, `_sky_dir`:27591, `_sky_project`:27596, `_sky_trip_time`:27615, `_sky_trip_dist`:27621, `_sky_now`:27632, `_sky_state`:27635, `_sky_time_at_station`:27650, `_sky_next_arrival`:27657, `_build_skytrain`:27670, `_sky_make_car`:27799, `_sky_skin`:27836, `_sky_place_trains`:27856, `_sky_build_station`:27875, `_sky_near`:27940, `_sky_fmt`:27949, `_sky_enter`:27953, `_sky_leave_platform`:27971, `_sky_board`:27981, `_sky_alight`:27994, `_sky_action`:28007, `_sky_tick`:28024, `_sky_camera`:28062, `_tour_today`:28078, `_tour_stamp`:28081, `_sky_hud`:28104

## 28126-28463  Day and night

`_game_hour`:28207, `_day_key`:28219, `_night_setup`:28234, `_night_scan_mesh`:28324, `_daynight_tick`:28349, `_daynight_apply`:28356, `_daynight_lights`:28448, `_cycle_day_mode`:28453, `_refresh_time_button`:28460

## 28464-29099  v0.27 smoke test and screenshots

`_smoke_v27`:28465, `_city_shots`:28668

## 29100-29516  v0.27: Harbor International Airport (north of the city)

`_build_airport`:29134, `_ap_plane`:29310, `_ap_truck`:29330, `_ap_baggage_train`:29371, `_ap_loop_pos`:29384, `_ap_loop_len`:29400, `_ap_flight_at`:29406, `_ap_tick`:29430, `_airport_ped_plan`:29453, `_smoke_airport`:29473

## 29517-30030  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:29531, `_nav_spot`:29538, `_nav_idx`:29542, `_nav_pos`:29549, `_nav_blocked`:29553, `_nav_nearest_free`:29563, `_nav_bfs`:29591, `_nav_build`:29635, `_stroller`:29706, `_stroll_place`:29722, `_stroll_next`:29743, `_nav_clear_line`:29777, `_stroll_aim`:29788, `_strollers_tick`:29820, `_smoke_strollers`:29915

## 30031-30191  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:30066, `_dir_fmt`:30069, `_signpost_spot`:30072, `_build_signposts`:30089

## 30192-30288  the Directions panel and chip

`_build_dir_panel`:30193, `_open_dir`:30235, `_dir_close`:30244, `_dir_pick`:30248, `_dir_stop`:30253, `_dir_stop_and_close`:30258, `_dir_tick`:30262

## 30289-30830  v0.44: Grand Central

`_gc_mesh`:30318, `_gc_mat`:30351, `_gc_glass`:30360, `_gb`:30370, `_gb_solid`:30376, `_gb_flush`:30380, `_gc_tree`:30410, `_gc_text`:30415, `_gc_planter`:30430, `_gc_kiosk`:30436, `_goods_color`:30466, `_goods_mat`:30469, `_kiosk_goods`:30473, `_build_grand_central`:30551, `_build_gc_towers`:30719, `_gc_tick`:30814

## 30831-31122  v0.44: filling the empty land

`_loft`:30848, `_fill_clear`:30890, `_build_fill`:30900, `_hg_in_lake`:30948, `_hg_path`:30952, `_floor_note_rot`:30960, `_build_gardens`:30968, `_build_fan_plaza`:31078

## 31123-31157  v0.45: hover car underglow

`_car_underglow`:31126

## 31158-31322  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:31159

## 31323-31354  v0.47: street stalls downtown

`_build_street_stalls`:31327, `_cull_people_in`:31347

## 31355-31453  v0.48: places that open as you level up

`_place_lock_of`:31368, `_place_root`:31374, `_place_unlocked`:31377, `_build_place_signs`:31385, `_places_refresh`:31430, `_places_tick`:31447

## 31454-31498  v0.50: city careers

`_career_rank_name`:31479, `_career_mult`:31482, `_career_block_reason`:31487, `_career_start`:31490, `_career_end`:31495

## 31499-31549  v0.52: careers as clear job loops

`_cid`:31526, `_career_target`:31540, `_career_tick`:31547

## 31550-31557  taxi

`_taxi_meter`:31551

## 31558-31561  paramedic

(no functions)

## 31562-31566  police

`_career_chase_over`:31564

## 31567-31572  firefighter

`_fire_aimed`:31568

## 31573-31582  the step bar

`_career_bar_text`:31576, `_career_hud`:31580

## 31583-31609  cut scenes

`_cs_skip`:31601

## 31610-31614  siren

(no functions)

## 31615-31626  the Careers panel

`_build_career_panel`:31616, `_open_careers`:31619, `_career_close`:31623

## 31627-32050  v0.50: homes

`_home_door_spots`:31667, `_build_homes`:31682, `_home_labels`:31711, `_home_door_near`:31720, `_home_origin`:31729, `_home_slot_near`:31732, `_home_exit_near`:31743, `_home_btn`:31750, `_home_interact`:31763, `_home_buy`:31782, `_home_default_layout`:31796, `_home_enter`:31804, `_home_leave`:31824, `_hm`:31832, `_home_build_room`:31851, `_home_refresh_room`:31960, `_furni_build`:31974

## 32051-32386  decorating

`_build_home_panels`:32052, `_open_homes`:32097, `_home_row_go`:32107, `_home_panel_close`:32127, `_deco_open`:32131, `_deco_pick`:32154, `_smoke_careers_homes`:32177

## 32387-32521  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:32391, `_home_slots`:32399, `_home_ring`:32426, `_furni_cat`:32432, `_home_fix_layout`:32438, `_home_build_layout`:32466

## 32522-32955  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:32585, `_ch_homes`:32591, `_ch_step_text`:32598, `_ch_step_done`:32609, `_ch_target`:32623, `_ch_finish_chapter`:32632, `_chapters_tick`:32654, `_hud_top_stack`:32694, `_build_chapters_ui`:32724, `_chapters_restart_ask`:32766, `_chapters_restart`:32769, `_chapters_text`:32779, `_open_chapters`:32799, `_chapters_close`:32806, `_smoke_chapters`:32810, `_step_sound`:32931

## 32956-32994  v0.51.1: join and leave messages

`_announce_join`:32963, `_announce_already_here`:32982, `_announce_leave`:32990

## 32995-33259  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33011, `_shot_tick`:33017, `_draw_shot_icon`:33049, `_shot_enter`:33058, `_shot_exit`:33072, `_shot_release_controls`:33084, `_shot_stick_zone`:33091, `_shot_input`:33094, `_smoke_photo`:33166

## 33260-33558  v0.51.3: stream joiners

`_viewer_count`:33280, `_stream_join_check`:33286, `_stream_join_start`:33293, `_sj_streamer`:33310, `_stream_join_tick`:33319, `_stream_join_land`:33343, `_sj_welcome`:33359, `_smoke_stream_join`:33393, `_career_shot`:33476

## 33559-33675  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:33563, `_st_restore`:33601, `_smoke_streamer_clean`:33622, `_world_bio_passport`:33673

