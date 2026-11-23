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

## 4267-4936  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4268, `_kshader`:4342, `_ksync`:4348, `_kskin`:4363, `_make_kperson`:4369, `_hat_y`:4433, `_sit_drop`:4436, `_kplay`:4439, `_kpeople_tick`:4449, `_pose_person`:4478, `_pose_limbs`:4495, `_person_lift`:4557, `_snap_crowd_feet`:4570, `_people_life_tick`:4586, `_life_one`:4623, `_cull_person`:4633, `_recolor_car_model`:4641, `_apply_car_model`:4655, `_landmark`:4675, `_label`:4685, `_button`:4692, `_panel`:4704, `_build_hud`:4714

## 4937-5055  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4943, `_menu_tab`:4949, `_watch_tick`:4972, `_watch_count`:5014, `_online_pill_tap`:5021, `_online_pill_tick`:5027, `online_config_ok`:5053

## 5056-5093  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5059, `_offroad`:5065, `_ground_near`:5078, `_collectibles_on_road`:5085

## 5094-5233  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5106, `_build_quest_offer`:5110, `_quest_offer_tick`:5140, `_quest_auto_pick`:5190, `_quest_accept`:5205, `_quest_decline`:5219, `_quest_stop`:5225

## 5234-5601  v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5258, `_holo_material`:5267, `_build_future`:5275, `_build_neon`:5289, `_model_profile`:5358, `_model_body_box`:5381, `_build_holograms`:5395, `_holo_tick`:5445, `_build_sky_traffic`:5462, `_sky_hover_car`:5480, `_sky_drone`:5527, `_sky_traffic_tick`:5571, `_future_lights`:5590

## 5602-6101  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5661, `_crew_col`:5669, `_peer_crewmate`:5672, `_set_ring_color`:5675, `_level_color`:5702, `_tier_color`:5715, `_my_ach_tier`:5718, `_style_ring`:5725, `_social_peer_extras`:5773, `_social_tag`:5787, `_my_tag_extra`:5799, `_soc_send`:5812, `_social_msg`:5827, `_social_accept`:5866, `_social_go`:5887, `_soc_friend`:5906, `_soc_invite`:5913, `_soc_goto`:5918, `_soc_high_five`:5926, `_soc_gift`:5946, `_soc_crew_invite`:5963, `_gift_day_check`:5970, `_crew_create`:5976, `_crew_cycle_color`:5986, `_crew_leave`:5991, `_crew_mate_near`:5999, `_crew_board`:6007, `_build_social`:6026, `_social_online`:6088, `_open_social`:6092, `_close_social`:6098

## 6102-6352  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6105, `_track_pos`:6114, `_social_row_button`:6125, `_refresh_social`:6132, `_on_dance_floor`:6194, `_toggle_dance`:6197, `_build_dance_floor`:6205, `_social_tick`:6231, `_photo`:6303

## 6353-6848  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6375, `_game_state`:6383, `_build_arcade`:6395, `_c4_empty`:6446, `_c4_drop_row`:6452, `_c4_winner`:6458, `_c4_bot_move`:6479, `_c4_code`:6508, `_c4_ready`:6514, `_c4_tap`:6517, `_c4_check`:6538, `_c4_tick`:6562, `_rx_ready`:6589, `_rx_start`:6592, `_rx_tap`:6606, `_rx_send_time`:6631, `_rx_resolve`:6638, `_rx_tick`:6664, `_mem_start`:6679, `_mem_tap`:6695, `_mem_finish`:6710, `_mem_tick`:6726, `_mem_board_text`:6733, `_build_arcade_panel`:6744, `_refresh_arcade_panel`:6787

## 6849-7142  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6912, `_quiz_slot`:6915, `_quiz_question`:6925, `_quiz_bot_score`:6954, `_in_quiz`:6963, `_build_quiz`:6966, `_quiz_answer`:7036, `_quiz_msg`:7049, `_quiz_board`:7057, `_quiz_tick`:7067, `_quiz_refresh`:7109

## 7143-8634  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7314, `_sites_found`:7317, `_sites_total`:7320, `_bits`:7323, `_ach_value`:7330, `_ach_tick`:7385, `_ach_check`:7410, `_ach_by_id`:7446, `_ach_msg`:7452, `_build_ach`:7465, `_ach_show`:7496, `_open_ach`:7516, `_close_ach`:7522, `_refresh_ach`:7526, `_ach_num`:7557, `_minimap_tap`:7560, `_menu_go`:7567, `_menu_stay`:7572, `_menu_call_car`:7576, `_toggle_clean_hud`:7582, `_refresh_menu_buttons`:7588, `_clean_hud_tick`:7598, `_draw_joystick`:7639, `_input`:7644, `_stick_zone`:7721, `_notification`:7725, `_physics_process`:7740, `_follow_camera`:7888, `_follow_walk_camera`:7924, `_interact`:7947, `_refresh_hud`:8101, `_open_panel`:8224, `_layout_panels`:8250, `_toggle_menu`:8273, `_rescue`:8313, `_show_toast`:8345, `_save_progress`:8349, `_load_progress`:8435

## 8635-10778  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8636, `_radio_voice`:8639, `_radio_make`:8672, `_radio_set`:8743, `_radio_play`:8765, `_radio_next`:8770, `_radio_talk_line`:8774, `_radio_caption`:8795, `_radio_refresh`:8803, `_process`:8816, `_build_peds`:8865, `_update_peds`:8976, `_update_ped`:8995, `_smoke_test`:9049, `_smoke_chase`:9688, `_smoke_orole`:9721, `_smoke_levels`:9750, `_smoke_bus`:9791, `_smoke_chase_extras`:9876, `_smoke_marina`:9904, `_blocked_at`:10006, `_blocker`:10021, `_on_screen`:10034, `_wait_radio`:10039, `_smoke_radio_peds`:10046, `_smoke_models`:10116, `_smoke_garage_ridge`:10140, `_save_shot`:10516, `_people_shots`:10526, `_shots`:10567, `_shot_car`:10761, `_capture_preview`:10771

## 10779-11427  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10846, `_downtown_count`:10849, `_nearest_downtown`:10856, `_check_downtown`:10870, `_discover_downtown`:10883, `_box_batch`:10897, `_model_batch`:10917, `_cut_ranges`:10971, `_dt_ranges`:10983, `_dt_has`:10990, `_dt_near_cross`:10996, `_place`:11002, `_signal_pole`:11013, `_cyl_batch`:11032, `_city_signals`:11056, `_ensure_light_mats`:11107, `_city_lamps`:11117, `_build_downtown`:11161, `_dt_block`:11361, `_downtown_token`:11367, `_build_park`:11384, `_build_plaza`:11413

## 11428-11531  old city and Bay details

`_build_city_detail`:11429

## 11532-11941  traffic

`_build_traffic`:11533, `_path_sample`:11628, `_light_look`:11642, `_light_green`:11650, `_traffic_place`:11654, `_traffic_blocked_by`:11666, `_traffic_tick`:11678, `_smoke_downtown`:11784, `_skyline_shot`:11896, `_skyline_shots`:11904

## 11942-12294  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:11988, `_web_scale`:12043, `_web_fps_tick`:12053, `_world_to_uv`:12070, `_map_angle`:12073, `_build_minimap`:12081, `_open_map`:12154, `_close_map`:12165, `_mini_point`:12172, `_site_markers`:12176, `_draw_arrow`:12208, `_draw_minimap`:12215, `_draw_full_map`:12262, `_minimap_tick`:12287

## 12295-12552  camera views

`_build_view_controls`:12296, `_cycle_view`:12338, `_apply_view`:12348, `_hide_labels`:12386, `_unfade`:12392, `_bake_map`:12398, `_shot_stats`:12448, `_view_shots`:12451, `_smoke_views`:12492

## 12553-12800  v0.17.0: level-up celebration

`_build_level_fx`:12564, `_draw_level_rays`:12601, `_level_fx_tick`:12611, `_level_sound`:12616, `_fx_material`:12658, `_level_up_fx`:12666, `_smoke_level_fx`:12767, `_levelup_shots`:12776

## 12801-12920  v0.18.0: walk-in stadium

`_collider_yaw`:12806, `_build_stadium_walls`:12817, `_look`:12845, `_smoke_stadium_eye`:12854, `_stadium_shots`:12890

## 12921-13082  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:12945, `_arrow_mesh`:12957, `_build_guidance`:12980, `_guide_target`:13005, `_guidance_tick`:13034, `_draw_hud_arrow`:13060

## 13083-13268  checkpoints

`_build_checkpoints`:13084, `_refresh_checkpoints`:13129, `_check_checkpoints`:13135, `_activate_checkpoint`:13145, `_checkpoint_spawn`:13166, `_spawn_at_checkpoint`:13171, `_draw_checkpoint_icon`:13187, `_smoke_guidance_checkpoints`:13193, `_guide_shots`:13243

## 13269-13528  v0.18.0: Harbor Dome social hub

`_hub_seat`:13327, `_build_hub`:13331

## 13529-13681  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13530, `_xm_mesh`:13539, `_xm_tree`:13547, `_hub_christmas`:13580, `_hub_glass`:13665

## 13682-13889  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:13683, `_build_hub_bots`:13708, `_seat_of`:13739, `_bubble`:13749, `_emote`:13798, `_hub_people_tick`:13812

## 13890-14008  seats

`_seat_taken`:13891, `_nearest_seat`:13899, `_seat_label`:13911, `_sit`:13927, `_stand_up`:13971, `_seated_tick`:13990

## 14009-14165  game panel

`_build_game_panel`:14010, `_open_game_panel`:14065, `_refresh_game_panel`:14084, `_play_robot`:14129, `_peer_at`:14143, `_opponent_name`:14150, `_pay`:14158

## 14166-14286  tic-tac-toe

`_ttt_ready`:14169, `_ttt_winner`:14175, `_ttt_bot_move`:14185, `_ttt_tap`:14211, `_ttt_code`:14231, `_ttt_check`:14237, `_ttt_tick`:14260

## 14287-14338  rock paper scissors

`_rps_ready`:14288, `_rps_pick`:14294, `_rps_resolve`:14312, `_rps_tick`:14336

## 14339-14421  online table messages

`_online_game_send`:14340, `_hub_game_msg`:14346

## 14422-14497  comedy show

`_joke_start`:14423, `_joke_tick`:14435, `_speak`:14461, `_play_rimshot`:14470

## 14498-15036  quick chat and emotes

`_build_chat`:14515, `_chat_toggle_to`:14615, `_chat_log_add`:14623, `_chat_area`:14629, `_chat_near_count`:14647, `_chat_tick`:14656, `_toggle_chat`:14703, `_say`:14717, `_do_emote`:14731, `_smoke_hub`:14740, `_hub_shots`:14914, `_sg_on_terrace`:14987, `_people_only`:14990, `_people_only_keep_cars_out`:14994, `_car_barrier`:15006, `_hub_keep_cars_out`:15020

## 15037-15199  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:15046, `_feed_add`:15055, `_feed_render`:15061, `_feed_tick`:15089, `_online_event_send`:15098, `_at_pvp_table`:15105, `_game_name`:15112, `_send_lfp`:15115, `_lfp_msg`:15132, `_accept_invite`:15153

## 15200-15440  v0.18.2: nickname and HUD relayout

`_nick_rude`:15212, `_clean_nick`:15227, `_build_nick_panel`:15239, `_open_nick`:15277, `_random_nick`:15286, `_save_nick`:15292, `_close_nick`:15311, `_refresh_nick_button`:15320, `_relayout_hud`:15324, `_smoke_nick`:15360, `_nick_shots`:15392, `_smoke_sites_reachable`:15410

## 15441-15728  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:15467, `_nearest_civic`:15474, `_check_civic`:15488, `_discover_civic`:15501, `_civ_ranges`:15514, `_civ_has`:15528, `_civ_near_cross`:15534, `_build_civic`:15540, `_civic_token`:15666, `_civic_shots`:15683, `_hub_focus`:15705

## 15729-15838  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:15800, `_in_rw_lot`:15803, `_box_batch_rot`:15806, `_multi_collider`:15824

## 15839-16166  circuit geometry

`_cr_point`:15840, `_rw_build_path`:15854, `_rw_dir`:15882, `_rw_bend`:15887, `_ribbon`:15893, `_rw_band`:15913, `_rw_keepout`:15931, `_build_raceway`:15940, `_build_rw_parking`:15974, `_build_rw_pits`:16019, `_build_rw_track`:16056, `_build_rw_trackside`:16097

## 16167-16264  race car rental

`_model_key`:16168, `_race_car_start`:16171, `_tint_ghost`:16209, `_race_car_end`:16222, `_race_keep_cars_out`:16247

## 16265-16279  speed effects

`_eff_max`:16266, `_eff_accel`:16277

## 16280-16330  track helpers

`_rw_seg_progress`:16281, `_rw_track_dist`:16301, `_rw_point_dist`:16312, `_rw_player_progress`:16319, `_rw_target`:16325

## 16331-16567  events

`_rec_stop`:16332, `_rw_place`:16348, `_rw_grid_pos`:16355, `_rw_start`:16360, `_rw_spawn_ai`:16392, `_rw_ai_place`:16416, `_rw_tick`:16427, `_rw_ai_tick`:16480, `_rw_lap_done`:16522, `_rw_finish`:16534, `_rw_fmt`:16565

## 16568-16620  boosters and spikes

`_rw_buy`:16569, `_rw_use_boost`:16587, `_rw_use_spike`:16595, `_rw_drop_spike_at`:16606

## 16621-16678  online races

`_race_msg`:16622, `_join_race`:16644

## 16679-17034  raceway panel, HUD, board

`_build_raceway_ui`:16680, `_rw_layout`:16740, `_rw_open`:16747, `_rw_close`:16753, `_rw_refresh_panel`:16757, `_rw_refresh_board`:16770, `_rw_hud`:16782, `_peer_car_model`:16806, `_smoke_raceway`:16816, `_race_shots`:16997

## 17035-17242  v0.22.0: Call Car

`_call_block_reason`:17041, `_call_spot`:17058, `_call_car`:17089, `_play_horn`:17113, `_smoke_follow_call`:17137, `_follow_shots`:17210

## 17243-17542  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:17258, `_build_travel`:17263, `_toggle_run`:17305, `_refresh_run`:17309, `_hud_v23_tick`:17317, `_travel_block_reason`:17346, `_travel_open`:17366, `_open_travel`:17372, `_close_travel`:17378, `_refresh_travel`:17382, `_travel_to`:17390, `_smoke_travel`:17417, `_v23_shots`:17455

## 17543-17616  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:17550, `_qr_button`:17565, `_qr_layout`:17604, `_smoke_qr`:17610

## 17617-18053  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:17637, `_open_crate`:17653, `_build_crate_ui`:17670, `_crate_pick`:17757, `_crate_reveal`:17780, `_crate_draw_car`:17807, `_crate_confetti`:17826, `_crate_sound`:17851, `_crate_drive`:17877, `_feed_add_system`:17907, `_smoke_crate`:17910, `_crate_shots`:17958

## 18054-18545  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:18095, `_quick_today`:18100, `_quick_is_done`:18103, `_quick_left`:18106, `_quick_next`:18113, `_quick_fix_target`:18126, `_quick_daily_check`:18140, `_quick_complete`:18154, `_quick_side`:18188, `_build_quick_props`:18206, `_daily_shots`:18358, `_quick_props_refresh`:18400, `_quick_fx`:18404, `_play_coin`:18420, `_smoke_quick`:18437

## 18546-18696  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:18555, `_quest_nearby`:18610, `_open_quests`:18617, `_close_quests`:18624, `_refresh_quests`:18628, `_quest_pick`:18654, `_quest_mode`:18668, `_smoke_quests`:18671

## 18697-18731  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:18701, `_my_tag_tick`:18704

## 18732-19046  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:18749, `_fc_torus`:18759, `_fc_pearl`:18767, `_fc_chrome`:18777, `_fc_glass`:18786, `_fc_glow`:18796, `_fc_ghost`:18805, `_fc_holo`:18817, `_fc_mesh`:18827, `_fc_sphere`:18847, `_fc_capsule`:18855, `_fc_cone`:18863, `_build_food_court`:18872, `_food_court_tick`:19026

## 19047-19365  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:19073, `_cm_bench`:19089, `_build_commons`:19102, `_commons_tick`:19324

## 19366-19680  v0.36: the daily puzzle

`_pz_today`:19389, `_pz_new`:19392, `_pz_neighbours`:19437, `_pz_flip`:19447, `_pz_done`:19452, `_pz_tap`:19460, `_pz_win`:19476, `_pz_reset`:19497, `_puzzle_near`:19501, `_open_puzzle`:19506, `_close_puzzle`:19514, `_pz_refresh_sign`:19518, `_build_puzzle_panel`:19526, `_pz_draw`:19557, `_smoke_chat`:19598, `_smoke_feet`:19636, `_smoke_commons`:19657

## 19681-19869  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:19743, `_bio_theta`:19747, `_bio_sec_n`:19752, `_bio_sec_of`:19755, `_bio_pt`:19758, `_bio_lp`:19763, `_bio_la`:19767, `_bio_dir`:19771, `_bio_hex_r`:19774, `_bio_apo`:19779, `_bio_open_angles`:19785, `_bio_si`:19795, `_bm`:19801, `_bsph`:19806, `_blow`:19809, `_bcone`:19820, `_bbox`:19823, `_bp`:19826, `_bq`:19831, `_bio_glass_mat`:19835, `_bio_water_mat`:19848, `_bio_mat`:19860

## 19870-20242  building blocks

`_bio_inst`:19871, `_bio_add`:19877, `_bio_model`:19880, `_bio_nature_mesh`:19886, `_bio_flush`:19920, `_bio_bar`:19955, `_bio_slab`:19968, `_bio_body`:19983, `_bio_cyl_col`:19996, `_bio_hexmesh`:20009, `_bio_hexslab`:20021, `_bio_hexpt`:20027, `_bio_gridshell`:20034, `_bio_rail`:20141, `_bio_rail_arc`:20146, `_bio_disc_deck`:20158, `_bio_ring_deck`:20164, `_bio_helix`:20175, `_bio_pillar`:20195, `_bio_cafe`:20201, `_bio_fence_line`:20215, `_bio_fence_seg`:20220, `_bio_pen`:20230

## 20243-20744  building

`_build_biosphere`:20244, `_build_biosphere_legacy`:20248, `_bio_text`:20410, `_bio_plaque`:20428, `_bio_ticket_hall`:20442, `_on_foot_collision_guard`:20498, `_bio_inside`:20508, `_bio_pass_ok`:20511, `_ticket_near`:20515, `_bio_buy_pass`:20520, `_bio_gates_update`:20536, `_bio_gate_tick`:20562, `_bio_tunnel`:20574, `_bio_grounds`:20627, `_bio_dome`:20673, `_bio_deck_mats`:20741

## 20745-20900  garden planting

`_bio_free`:20746, `_bio_spot`:20763, `_bio_garden`:20771, `_bio_pine`:20812, `_bio_tree`:20815, `_bio_big_tree`:20825, `_bio_rock`:20830, `_bio_pond`:20833, `_bio_particles`:20837, `_bio_mist`:20865, `_bio_mini_dome`:20894

## 20901-21308  the four layouts

`_bio_winter`:20902, `_bio_spring`:20994, `_bio_summer`:21119, `_bio_autumn`:21203

## 21309-21579  animals

`_bio_spawn`:21310, `_bio_load_animal`:21382, `_bio_make_quad`:21403, `_bio_load_bird`:21480, `_bio_make_penguin`:21500, `_bio_make_bird`:21522, `_bio_make_flamingo`:21546, `_bio_make_butterfly`:21567

## 21580-21709  animation, spotting and rewards

`_bio_stuck_check`:21585, `_biosphere_tick`:21603, `_bio_animate`:21610, `_bio_spot_check`:21690, `_bio_spotted`:21702, `_smoke_biosphere`:21706

## 21710-22227  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:21797, `_wear_piece`:21800, `_wear_mat`:21823, `_person_index`:21839, `_dress`:21862, `_smoke_style`:21968, `_style_shots`:22119, `_npc_look`:22191

## 22228-22376  your look: apply, save, share

`_look_clean`:22232, `_look_pack`:22247, `_owns`:22253, `_apply_look`:22258, `_relic_model`:22264, `_fc_mesh_mat`:22329, `_relic_refresh`:22332, `_relic_tick`:22346, `_peer_style`:22357

## 22377-22804  stores and the wardrobe

`_style_today`:22396, `_style_items`:22399, `_style_cat`:22407, `_style_price`:22410, `_style_deal`:22424, `_style_price_base`:22437, `_relic_stock`:22444, `_build_style_panel`:22456, `_open_store`:22496, `_open_wardrobe`:22515, `_style_close`:22518, `_style_finish`:22522, `_sync_old_avatar`:22537, `_style_tabs_for`:22544, `_refresh_style`:22549, `_style_body_rows`:22700, `_style_set_tab`:22717, `_style_step`:22721, `_style_color`:22726, `_style_pick`:22731, `_style_buy`:22766, `_ach_relics_check`:22788, `_style_face_camera`:22793

## 22805-23272  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:22841, `_ga_text`:22847, `_ga_box`:22864, `_build_galleria`:22880, `_ga_inner_tick`:23021, `_ga_shell`:23037, `_ga_inside`:23087, `_bio_cyl_col_on`:23090, `_ga_models`:23102, `_ga_lbox`:23117, `_ga_ltext`:23131, `_ga_store`:23138, `_bio_cafe_on`:23240, `_ga_mannequins`:23248

## 23273-23424  featured outfits and the Sky Run

`_ga_featured_look`:23286, `_build_ga_fun`:23307, `_ga_fun_tick`:23352, `_sky_finish`:23379, `_extra_near`:23398, `_extra_open`:23407, `_store_near`:23416

## 23425-23521  v0.41: THE SKY GARDEN

`_sg_now`:23479, `_sg_progress`:23482, `_sg_time`:23488, `_sg_stock`:23495, `_sg_mut_roll`:23510

## 23522-23659  building

`_sg_box`:23523, `_sg_text`:23529, `_build_sky_garden`:23543, `_sg_seed_spot`:23654, `_sg_codex_spot`:23657

## 23660-23840  plants

`_sg_plant_model`:23661, `_sg_refresh_all`:23766, `_sg_refresh`:23770, `_sky_garden_tick`:23806, `_sg_ready_count`:23825, `_sg_boot_note`:23832

## 23841-23960  interacting

`_sg_near`:23842, `_sg_button_text`:23865, `_sg_value`:23878, `_sg_interact`:23882, `_sg_buy`:23898, `_sg_plant`:23920, `_sg_harvest`:23931

## 23961-24204  the garden screen

`_build_sg_panel`:23962, `_sg_open`:23997, `_sg_close`:24006, `_sg_row`:24010, `_sg_refresh_panel`:24025, `_sg_pick_buy`:24070, `_sg_pick_plant`:24074, `_smoke_car_barriers`:24080, `_smoke_sky_garden`:24121

## 24205-24243  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:24236, `_pass_day`:24239

## 24244-24275  album

`_album_pages`:24245, `_album_claim`:24260

## 24276-24327  season

`_season_index`:24277, `_season_tick`:24280, `_season_xp`:24289, `_season_tier`:24292, `_season_reward`:24295, `_season_claim`:24309

## 24328-24335  Harbor Night

`_harbor_night`:24329

## 24336-24367  check-in calendar

`_cal_tick`:24337

## 24368-24544  the panel

`_build_hp_panel`:24369, `_open_pass`:24404, `_hp_open`:24407, `_hp_close`:24414, `_hp_row`:24418, `_hp_bar`:24433, `_hp_refresh`:24437, `_smoke_pass`:24482

## 24545-24759  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:24549, `_cash_pill_tick`:24557, `_build_lb`:24595, `_open_lb`:24638, `_close_lb`:24646, `_lb_pick`:24650, `_lb_headers`:24655, `_lb_url`:24659, `_lb_me`:24662, `_lb_tick`:24665, `_lb_upload`:24673, `_lb_fetch`:24683, `_lb_got`:24691, `_lb_value`:24702, `_lb_refresh_ui`:24713

## 24760-25183  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:24784, `_market_near`:24861, `_build_gear`:24871, `_gear_piece`:24879, `_build_pet`:24924, `_market_apply`:24966, `_market_tick`:24990, `_build_market_panel`:25012, `_open_market`:25038, `_close_market`:25045, `_refresh_market`:25049, `_market_pick`:25102, `_toggle_board`:25140, `_board_tick`:25147

## 25184-25425  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:25216, `_ds_label`:25235, `_build_display`:25249, `_ds_got`:25328, `_ds_sorted`:25337, `_ds_render_board`:25351, `_ds_render_news`:25377, `_display_tick`:25396

## 25426-25604  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:25443, `_toggle_streamer`:25530, `_streamer_badge_tap`:25546, `_streamer_tick`:25550

## 25605-25641  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:25611, `_car_back`:25618, `_car_park_tick`:25625

## 25642-25738  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:25646, `_bus_eta`:25700, `_bus_displays_tick`:25716

## 25739-26030  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:25757, `_treasure_pick`:25760, `_treasure_spot`:25769, `_treasure_district`:25773, `_treasure_clue`:25785, `_treasure_prop`:25798, `_tp_part`:25801, `_tp_sphere`:25811, `_tp_cyl`:25819, `_treasure_prop_side`:25828, `_build_treasure_props`:25840, `_build_treasure`:25884, `_treasure_dir_char`:25953, `_treasure_tick`:25962, `_treasure_claim`:26016

## 26031-26131  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:26032, `_halo_mat`:26064, `_smoke_treasure`:26089

## 26132-26455  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:26153, `_fm_send`:26156, `_fm_area`:26162, `_fm_glow_mesh`:26178, `_fm_block_reason`:26196, `_fm_start`:26208, `_fm_announce`:26236, `_fm_finish`:26239, `_fm_msg`:26257, `_fm_check_paid`:26308, `_fm_tick`:26326, `_smoke_findme`:26382

## 26456-26566  v0.24.2: road map (for moving people off the road)

`_floor_note`:26462, `_floor_disc`:26476, `_floor_top`:26485, `_ground_at`:26503, `_note_road`:26521, `_on_road`:26528, `_ped_curb`:26538, `_curb_spot`:26548

## 26567-26862  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:26589, `_ex_grid`:26597, `_ex_lamps`:26632, `_ex_umbrella`:26655, `_ex_yards`:26662, `_build_expansion`:26677, `_expand_shots`:26840

## 26863-27057  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:26904, `_v27_near_cross`:26996, `_v27_near_any_road`:27003, `_v27_in_district`:27009, `_sea_tick`:27023, `_sea_tow`:27042

## 27058-27698  Harbor Loop sky train

`_sky_build_path`:27109, `_sky_pos`:27150, `_sky_dir`:27164, `_sky_project`:27169, `_sky_trip_time`:27188, `_sky_trip_dist`:27194, `_sky_now`:27205, `_sky_state`:27208, `_sky_time_at_station`:27223, `_sky_next_arrival`:27230, `_build_skytrain`:27243, `_sky_make_car`:27372, `_sky_skin`:27409, `_sky_place_trains`:27429, `_sky_build_station`:27448, `_sky_near`:27513, `_sky_fmt`:27522, `_sky_enter`:27526, `_sky_leave_platform`:27544, `_sky_board`:27554, `_sky_alight`:27567, `_sky_action`:27580, `_sky_tick`:27597, `_sky_camera`:27635, `_tour_today`:27651, `_tour_stamp`:27654, `_sky_hud`:27677

## 27699-28036  Day and night

`_game_hour`:27780, `_day_key`:27792, `_night_setup`:27807, `_night_scan_mesh`:27897, `_daynight_tick`:27922, `_daynight_apply`:27929, `_daynight_lights`:28021, `_cycle_day_mode`:28026, `_refresh_time_button`:28033

## 28037-28672  v0.27 smoke test and screenshots

`_smoke_v27`:28038, `_city_shots`:28241

## 28673-29089  v0.27: Harbor International Airport (north of the city)

`_build_airport`:28707, `_ap_plane`:28883, `_ap_truck`:28903, `_ap_baggage_train`:28944, `_ap_loop_pos`:28957, `_ap_loop_len`:28973, `_ap_flight_at`:28979, `_ap_tick`:29003, `_airport_ped_plan`:29026, `_smoke_airport`:29046

## 29090-29603  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:29104, `_nav_spot`:29111, `_nav_idx`:29115, `_nav_pos`:29122, `_nav_blocked`:29126, `_nav_nearest_free`:29136, `_nav_bfs`:29164, `_nav_build`:29208, `_stroller`:29279, `_stroll_place`:29295, `_stroll_next`:29316, `_nav_clear_line`:29350, `_stroll_aim`:29361, `_strollers_tick`:29393, `_smoke_strollers`:29488

## 29604-29764  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:29639, `_dir_fmt`:29642, `_signpost_spot`:29645, `_build_signposts`:29662

## 29765-29861  the Directions panel and chip

`_build_dir_panel`:29766, `_open_dir`:29808, `_dir_close`:29817, `_dir_pick`:29821, `_dir_stop`:29826, `_dir_stop_and_close`:29831, `_dir_tick`:29835

## 29862-30403  v0.44: Grand Central

`_gc_mesh`:29891, `_gc_mat`:29924, `_gc_glass`:29933, `_gb`:29943, `_gb_solid`:29949, `_gb_flush`:29953, `_gc_tree`:29983, `_gc_text`:29988, `_gc_planter`:30003, `_gc_kiosk`:30009, `_goods_color`:30039, `_goods_mat`:30042, `_kiosk_goods`:30046, `_build_grand_central`:30124, `_build_gc_towers`:30292, `_gc_tick`:30387

## 30404-30695  v0.44: filling the empty land

`_loft`:30421, `_fill_clear`:30463, `_build_fill`:30473, `_hg_in_lake`:30521, `_hg_path`:30525, `_floor_note_rot`:30533, `_build_gardens`:30541, `_build_fan_plaza`:30651

## 30696-30730  v0.45: hover car underglow

`_car_underglow`:30699

## 30731-30895  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:30732

## 30896-30927  v0.47: street stalls downtown

`_build_street_stalls`:30900, `_cull_people_in`:30920

## 30928-31026  v0.48: places that open as you level up

`_place_lock_of`:30941, `_place_root`:30947, `_place_unlocked`:30950, `_build_place_signs`:30958, `_places_refresh`:31003, `_places_tick`:31020

## 31027-31071  v0.50: city careers

`_career_rank_name`:31052, `_career_mult`:31055, `_career_block_reason`:31060, `_career_start`:31063, `_career_end`:31068

## 31072-31122  v0.52: careers as clear job loops

`_cid`:31099, `_career_target`:31113, `_career_tick`:31120

## 31123-31130  taxi

`_taxi_meter`:31124

## 31131-31134  paramedic

(no functions)

## 31135-31139  police

`_career_chase_over`:31137

## 31140-31145  firefighter

`_fire_aimed`:31141

## 31146-31155  the step bar

`_career_bar_text`:31149, `_career_hud`:31153

## 31156-31182  cut scenes

`_cs_skip`:31174

## 31183-31187  siren

(no functions)

## 31188-31199  the Careers panel

`_build_career_panel`:31189, `_open_careers`:31192, `_career_close`:31196

## 31200-31623  v0.50: homes

`_home_door_spots`:31240, `_build_homes`:31255, `_home_labels`:31284, `_home_door_near`:31293, `_home_origin`:31302, `_home_slot_near`:31305, `_home_exit_near`:31316, `_home_btn`:31323, `_home_interact`:31336, `_home_buy`:31355, `_home_default_layout`:31369, `_home_enter`:31377, `_home_leave`:31397, `_hm`:31405, `_home_build_room`:31424, `_home_refresh_room`:31533, `_furni_build`:31547

## 31624-31959  decorating

`_build_home_panels`:31625, `_open_homes`:31670, `_home_row_go`:31680, `_home_panel_close`:31700, `_deco_open`:31704, `_deco_pick`:31727, `_smoke_careers_homes`:31750

## 31960-32094  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:31964, `_home_slots`:31972, `_home_ring`:31999, `_furni_cat`:32005, `_home_fix_layout`:32011, `_home_build_layout`:32039

## 32095-32527  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:32158, `_ch_homes`:32164, `_ch_step_text`:32171, `_ch_step_done`:32182, `_ch_target`:32196, `_ch_finish_chapter`:32205, `_chapters_tick`:32227, `_hud_top_stack`:32267, `_build_chapters_ui`:32297, `_chapters_restart_ask`:32339, `_chapters_restart`:32342, `_chapters_text`:32352, `_open_chapters`:32372, `_chapters_close`:32379, `_smoke_chapters`:32383, `_step_sound`:32503

## 32528-32566  v0.51.1: join and leave messages

`_announce_join`:32535, `_announce_already_here`:32554, `_announce_leave`:32562

## 32567-32831  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:32583, `_shot_tick`:32589, `_draw_shot_icon`:32621, `_shot_enter`:32630, `_shot_exit`:32644, `_shot_release_controls`:32656, `_shot_stick_zone`:32663, `_shot_input`:32666, `_smoke_photo`:32738

## 32832-33130  v0.51.3: stream joiners

`_viewer_count`:32852, `_stream_join_check`:32858, `_stream_join_start`:32865, `_sj_streamer`:32882, `_stream_join_tick`:32891, `_stream_join_land`:32915, `_sj_welcome`:32931, `_smoke_stream_join`:32965, `_career_shot`:33048

## 33131-33247  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:33135, `_st_restore`:33173, `_smoke_streamer_clean`:33194, `_world_bio_passport`:33245

