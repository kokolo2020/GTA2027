# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-580  Core (unlabelled)

`_symbol_font`:280, `_ready`:292, `_surf_texture`:523, `_surface_material`:545

## 581-653  v0.34.6: futuristic towers for the old city

`_future_tower`:585

## 654-732  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:661, `_skin_common`:696, `_future_wall`:704, `_future_roof`:718, `_future_pave`:726

## 733-793  v0.34.4: futuristic road surface

`_road_textures`:740, `_future_road`:774

## 794-1999  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:813, `_real_tex`:854, `_real_setup`:862, `_real_kind`:883, `_realify`:889, `_real_glass`:926, `_make_window_textures`:946, `_material`:979, `_box`:1004, `_sign`:1026, `_build_world`:1038, `_future_kiosk`:1146, `_build_collectibles`:1172, `_auto_collect_tick`:1205, `_find_count`:1226, `_nearest_find`:1233, `_destination`:1247, `_toggle_activity`:1283, `_collect_find`:1312, `_owned_count`:1327, `_ridge_open`:1334, `_ridge_count`:1338, `_nearest_ridge`:1345, `_apply_car`:1359, `_tune_level`:1389, `_tune_cost`:1392, `_car_stats`:1398, `_buy_tune`:1405, `_open_tune`:1426, `_back_to_garage`:1432, `_refresh_tune`:1436, `_bay_open`:1447, `_area_open`:1450, `_bay_count`:1453, `_nearest_bay`:1460, `_build_bay`:1474, `_check_bay`:1527, `_discover_bay`:1540, `_north_count`:1553, `_north_open`:1560, `_nearest_north`:1563, `_check_north`:1577, `_discover_north`:1590, `_prop`:1603, `_collider`:1617, `_first_mesh`:1627, `_scatter`:1636, `_prop_stretch`:1670, `_north_token`:1679, `_nm_roads`:1706, `_prop_big`:1721, `_nm_near_cross`:1737, `_build_north`:1744, `_build_nm_blocks`:1861, `_build_north_landscape`:1946, `_nm_free`:1973, `_build_landscape`:1983

## 2000-2479  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2001, `_online_toggle`:2015, `_online_autostart`:2041, `_online_connect`:2060, `_online_stop`:2067, `_online_next_ref`:2078, `_online_send`:2082, `_online_join_frame`:2086, `_online_pos_frame`:2089, `_online_tick`:2098, `_online_handle`:2132, `_online_clean_name`:2185, `_online_peer_update`:2194, `_online_make_peer`:2259, `_peer_look`:2300, `_online_tint`:2357, `_paint_mat`:2373, `_online_update_peers`:2385, `_online_clear_peers`:2465, `_online_refresh_button`:2470

## 2480-2652  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2560, `_marina_count`:2563, `_nearest_marina`:2570, `_check_marina`:2584, `_discover_marina`:2597, `_shop_available`:2610, `_nearest_shop`:2613, `_premium_cars`:2621, `_glass`:2628, `_shop_building`:2634, `_shop_pad`:2644

## 2653-3168  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2654, `_bus_last`:2657, `_build_bus`:2660, `_bus_boxes`:2687, `_bus_skin`:2697, `_bus_side`:2710, `_bus_reset`:2713, `_bus_text`:2722, `_bus_tick`:2727, `_bus_near`:2767, `_bus_board`:2778, `_bus_alight`:2793, `_build_marina`:2807, `_set_hat`:2913, `_build_hat`:2916, `_cyl`:2981, `_hat_part`:2990, `_apply_avatar`:2999, `_shop_count`:3011, `_shop_open`:3021, `_shop_step`:3039, `_shop_close`:3045, `_owned_text`:3058, `_refresh_shop`:3061, `_shop_action`:3114, `_journal_flip`:3165

## 3169-3223  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3180, `_xp`:3183, `_level_for`:3190, `_level`:3198, `_level_text`:3201, `_check_level`:3211

## 3224-3326  v0.11.0: online police vs thief

`_orole_ready`:3225, `_orole_start`:3228, `_orole_end`:3255, `_orole_tick`:3264

## 3327-4270  v0.10.0: chase mode (offline)

`_chase_open`:3328, `_chase_clear`:3333, `_chase_make_unit`:3347, `_chase_spawn_point`:3377, `_chase_start`:3386, `_chase_end`:3422, `_chase_steer`:3441, `_chase_roadblock`:3477, `_chase_heli_build`:3522, `_chase_extras`:3548, `_chase_tick`:3575, `_start_trial`:3639, `_cancel_trial`:3666, `_check_trial`:3671, `_finish_trial`:3688, `_trial_count`:3704, `_open_trials`:3711, `_refresh_trials`:3715, `_update_gate`:3727, `_slab`:3745, `_build_ridge`:3763, `_check_ridge`:3826, `_discover`:3839, `_mission_progress`:3853, `_check_missions`:3915, `_open_garage`:3926, `_open_journal`:3931, `_close_sub`:3936, `_bar`:3939, `_refresh_garage`:3943, `_garage_step`:3968, `_garage_action`:3972, `_refresh_journal`:3992, `_visited_shops`:4025, `_build_panels`:4032, `_build_player`:4192, `_build_car`:4230, `_try_model`:4259

## 4271-4944  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4272, `_kshader`:4346, `_ksync`:4352, `_kskin`:4367, `_make_kperson`:4373, `_hat_y`:4437, `_sit_drop`:4440, `_kplay`:4443, `_kpeople_tick`:4453, `_pose_person`:4482, `_pose_limbs`:4499, `_person_lift`:4561, `_snap_crowd_feet`:4574, `_people_life_tick`:4590, `_life_one`:4627, `_cull_person`:4637, `_recolor_car_model`:4645, `_apply_car_model`:4659, `_landmark`:4679, `_label`:4689, `_button`:4696, `_panel`:4708, `_build_hud`:4718

## 4945-5063  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4951, `_menu_tab`:4957, `_watch_tick`:4980, `_watch_count`:5022, `_online_pill_tap`:5029, `_online_pill_tick`:5035, `online_config_ok`:5061

## 5064-5101  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5067, `_offroad`:5073, `_ground_near`:5086, `_collectibles_on_road`:5093

## 5102-5241  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5114, `_build_quest_offer`:5118, `_quest_offer_tick`:5148, `_quest_auto_pick`:5198, `_quest_accept`:5213, `_quest_decline`:5227, `_quest_stop`:5233

## 5242-5609  v0.31: a futuristic Harbor City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5266, `_holo_material`:5275, `_build_future`:5283, `_build_neon`:5297, `_model_profile`:5366, `_model_body_box`:5389, `_build_holograms`:5403, `_holo_tick`:5453, `_build_sky_traffic`:5470, `_sky_hover_car`:5488, `_sky_drone`:5535, `_sky_traffic_tick`:5579, `_future_lights`:5598

## 5610-6109  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5669, `_crew_col`:5677, `_peer_crewmate`:5680, `_set_ring_color`:5683, `_level_color`:5710, `_tier_color`:5723, `_my_ach_tier`:5726, `_style_ring`:5733, `_social_peer_extras`:5781, `_social_tag`:5795, `_my_tag_extra`:5807, `_soc_send`:5820, `_social_msg`:5835, `_social_accept`:5874, `_social_go`:5895, `_soc_friend`:5914, `_soc_invite`:5921, `_soc_goto`:5926, `_soc_high_five`:5934, `_soc_gift`:5954, `_soc_crew_invite`:5971, `_gift_day_check`:5978, `_crew_create`:5984, `_crew_cycle_color`:5994, `_crew_leave`:5999, `_crew_mate_near`:6007, `_crew_board`:6015, `_build_social`:6034, `_social_online`:6096, `_open_social`:6100, `_close_social`:6106

## 6110-6360  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6113, `_track_pos`:6122, `_social_row_button`:6133, `_refresh_social`:6140, `_on_dance_floor`:6202, `_toggle_dance`:6205, `_build_dance_floor`:6213, `_social_tick`:6239, `_photo`:6311

## 6361-6856  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6383, `_game_state`:6391, `_build_arcade`:6403, `_c4_empty`:6454, `_c4_drop_row`:6460, `_c4_winner`:6466, `_c4_bot_move`:6487, `_c4_code`:6516, `_c4_ready`:6522, `_c4_tap`:6525, `_c4_check`:6546, `_c4_tick`:6570, `_rx_ready`:6597, `_rx_start`:6600, `_rx_tap`:6614, `_rx_send_time`:6639, `_rx_resolve`:6646, `_rx_tick`:6672, `_mem_start`:6687, `_mem_tap`:6703, `_mem_finish`:6718, `_mem_tick`:6734, `_mem_board_text`:6741, `_build_arcade_panel`:6752, `_refresh_arcade_panel`:6795

## 6857-7150  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6920, `_quiz_slot`:6923, `_quiz_question`:6933, `_quiz_bot_score`:6962, `_in_quiz`:6971, `_build_quiz`:6974, `_quiz_answer`:7044, `_quiz_msg`:7057, `_quiz_board`:7065, `_quiz_tick`:7075, `_quiz_refresh`:7117

## 7151-8646  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7322, `_sites_found`:7325, `_sites_total`:7328, `_bits`:7331, `_ach_value`:7338, `_ach_tick`:7393, `_ach_check`:7418, `_ach_by_id`:7454, `_ach_msg`:7460, `_build_ach`:7473, `_ach_show`:7504, `_open_ach`:7524, `_close_ach`:7530, `_refresh_ach`:7534, `_ach_num`:7565, `_minimap_tap`:7568, `_menu_go`:7575, `_menu_stay`:7580, `_menu_call_car`:7584, `_toggle_clean_hud`:7590, `_refresh_menu_buttons`:7596, `_clean_hud_tick`:7606, `_draw_joystick`:7647, `_input`:7652, `_stick_zone`:7729, `_notification`:7733, `_physics_process`:7748, `_follow_camera`:7896, `_follow_walk_camera`:7932, `_interact`:7955, `_refresh_hud`:8109, `_open_panel`:8232, `_layout_panels`:8258, `_toggle_menu`:8281, `_rescue`:8321, `_show_toast`:8353, `_save_progress`:8357, `_load_progress`:8445

## 8647-10790  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8648, `_radio_voice`:8651, `_radio_make`:8684, `_radio_set`:8755, `_radio_play`:8777, `_radio_next`:8782, `_radio_talk_line`:8786, `_radio_caption`:8807, `_radio_refresh`:8815, `_process`:8828, `_build_peds`:8877, `_update_peds`:8988, `_update_ped`:9007, `_smoke_test`:9061, `_smoke_chase`:9700, `_smoke_orole`:9733, `_smoke_levels`:9762, `_smoke_bus`:9803, `_smoke_chase_extras`:9888, `_smoke_marina`:9916, `_blocked_at`:10018, `_blocker`:10033, `_on_screen`:10046, `_wait_radio`:10051, `_smoke_radio_peds`:10058, `_smoke_models`:10128, `_smoke_garage_ridge`:10152, `_save_shot`:10528, `_people_shots`:10538, `_shots`:10579, `_shot_car`:10773, `_capture_preview`:10783

## 10791-11439  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:10858, `_downtown_count`:10861, `_nearest_downtown`:10868, `_check_downtown`:10882, `_discover_downtown`:10895, `_box_batch`:10909, `_model_batch`:10929, `_cut_ranges`:10983, `_dt_ranges`:10995, `_dt_has`:11002, `_dt_near_cross`:11008, `_place`:11014, `_signal_pole`:11025, `_cyl_batch`:11044, `_city_signals`:11068, `_ensure_light_mats`:11119, `_city_lamps`:11129, `_build_downtown`:11173, `_dt_block`:11373, `_downtown_token`:11379, `_build_park`:11396, `_build_plaza`:11425

## 11440-11543  old city and Bay details

`_build_city_detail`:11441

## 11544-11953  traffic

`_build_traffic`:11545, `_path_sample`:11640, `_light_look`:11654, `_light_green`:11662, `_traffic_place`:11666, `_traffic_blocked_by`:11678, `_traffic_tick`:11690, `_smoke_downtown`:11796, `_skyline_shot`:11908, `_skyline_shots`:11916

## 11954-12306  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12000, `_web_scale`:12055, `_web_fps_tick`:12065, `_world_to_uv`:12082, `_map_angle`:12085, `_build_minimap`:12093, `_open_map`:12166, `_close_map`:12177, `_mini_point`:12184, `_site_markers`:12188, `_draw_arrow`:12220, `_draw_minimap`:12227, `_draw_full_map`:12274, `_minimap_tick`:12299

## 12307-12564  camera views

`_build_view_controls`:12308, `_cycle_view`:12350, `_apply_view`:12360, `_hide_labels`:12398, `_unfade`:12404, `_bake_map`:12410, `_shot_stats`:12460, `_view_shots`:12463, `_smoke_views`:12504

## 12565-12812  v0.17.0: level-up celebration

`_build_level_fx`:12576, `_draw_level_rays`:12613, `_level_fx_tick`:12623, `_level_sound`:12628, `_fx_material`:12670, `_level_up_fx`:12678, `_smoke_level_fx`:12779, `_levelup_shots`:12788

## 12813-12932  v0.18.0: walk-in stadium

`_collider_yaw`:12818, `_build_stadium_walls`:12829, `_look`:12857, `_smoke_stadium_eye`:12866, `_stadium_shots`:12902

## 12933-13094  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:12957, `_arrow_mesh`:12969, `_build_guidance`:12992, `_guide_target`:13017, `_guidance_tick`:13046, `_draw_hud_arrow`:13072

## 13095-13280  checkpoints

`_build_checkpoints`:13096, `_refresh_checkpoints`:13141, `_check_checkpoints`:13147, `_activate_checkpoint`:13157, `_checkpoint_spawn`:13178, `_spawn_at_checkpoint`:13183, `_draw_checkpoint_icon`:13199, `_smoke_guidance_checkpoints`:13205, `_guide_shots`:13255

## 13281-13548  v0.18.0: Harbor Dome social hub

`_hub_seat`:13339, `_build_hub`:13343

## 13549-13599  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13550, `_xm_mesh`:13559, `_xm_tree`:13567

## 13600-13923  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13603, `_gt_surface`:13618, `_xm_grand_tree`:13628, `_lux_mat`:13743, `_lux_part`:13759, `_lux_box`:13762, `_lux_cyl`:13767, `_lux_ball`:13775, `_lux_new`:13783, `_lux_commit`:13788, `_lux_sofa_mesh`:13792, `_lux_chair_mesh`:13822, `_lux_table_mesh`:13842, `_lux_pouf_mesh`:13857, `_lux_batch`:13872, `_hub_christmas`:13888

## 13924-14079  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:13925

## 14080-14328  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14083, `_vx_cyl`:14090, `_vx_ball`:14098, `_vx_ring`:14106, `_hub_polish`:14114, `_hub_gate`:14137, `_hub_vip`:14199, `_hub_glass`:14312

## 14329-14536  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14330, `_build_hub_bots`:14355, `_seat_of`:14386, `_bubble`:14396, `_emote`:14445, `_hub_people_tick`:14459

## 14537-14655  seats

`_seat_taken`:14538, `_nearest_seat`:14546, `_seat_label`:14558, `_sit`:14574, `_stand_up`:14618, `_seated_tick`:14637

## 14656-14812  game panel

`_build_game_panel`:14657, `_open_game_panel`:14712, `_refresh_game_panel`:14731, `_play_robot`:14776, `_peer_at`:14790, `_opponent_name`:14797, `_pay`:14805

## 14813-14933  tic-tac-toe

`_ttt_ready`:14816, `_ttt_winner`:14822, `_ttt_bot_move`:14832, `_ttt_tap`:14858, `_ttt_code`:14878, `_ttt_check`:14884, `_ttt_tick`:14907

## 14934-14985  rock paper scissors

`_rps_ready`:14935, `_rps_pick`:14941, `_rps_resolve`:14959, `_rps_tick`:14983

## 14986-15068  online table messages

`_online_game_send`:14987, `_hub_game_msg`:14993

## 15069-15144  comedy show

`_joke_start`:15070, `_joke_tick`:15082, `_speak`:15108, `_play_rimshot`:15117

## 15145-15824  quick chat and emotes

`_build_chat`:15162, `_chat_toggle_to`:15262, `_chat_log_add`:15270, `_chat_area`:15276, `_chat_near_count`:15294, `_chat_tick`:15303, `_toggle_chat`:15350, `_say`:15364, `_do_emote`:15378, `_smoke_hub`:15387, `_car_shots`:15561, `_outfit_shots`:15592, `_hub_shots`:15640, `_sg_on_terrace`:15775, `_people_only`:15778, `_people_only_keep_cars_out`:15782, `_car_barrier`:15794, `_hub_keep_cars_out`:15808

## 15825-15987  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:15834, `_feed_add`:15843, `_feed_render`:15849, `_feed_tick`:15877, `_online_event_send`:15886, `_at_pvp_table`:15893, `_game_name`:15900, `_send_lfp`:15903, `_lfp_msg`:15920, `_accept_invite`:15941

## 15988-16228  v0.18.2: nickname and HUD relayout

`_nick_rude`:16000, `_clean_nick`:16015, `_build_nick_panel`:16027, `_open_nick`:16065, `_random_nick`:16074, `_save_nick`:16080, `_close_nick`:16099, `_refresh_nick_button`:16108, `_relayout_hud`:16112, `_smoke_nick`:16148, `_nick_shots`:16180, `_smoke_sites_reachable`:16198

## 16229-16516  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16255, `_nearest_civic`:16262, `_check_civic`:16276, `_discover_civic`:16289, `_civ_ranges`:16302, `_civ_has`:16316, `_civ_near_cross`:16322, `_build_civic`:16328, `_civic_token`:16454, `_civic_shots`:16471, `_hub_focus`:16493

## 16517-16626  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:16588, `_in_rw_lot`:16591, `_box_batch_rot`:16594, `_multi_collider`:16612

## 16627-16954  circuit geometry

`_cr_point`:16628, `_rw_build_path`:16642, `_rw_dir`:16670, `_rw_bend`:16675, `_ribbon`:16681, `_rw_band`:16701, `_rw_keepout`:16719, `_build_raceway`:16728, `_build_rw_parking`:16762, `_build_rw_pits`:16807, `_build_rw_track`:16844, `_build_rw_trackside`:16885

## 16955-17052  race car rental

`_model_key`:16956, `_race_car_start`:16959, `_tint_ghost`:16997, `_race_car_end`:17010, `_race_keep_cars_out`:17035

## 17053-17067  speed effects

`_eff_max`:17054, `_eff_accel`:17065

## 17068-17118  track helpers

`_rw_seg_progress`:17069, `_rw_track_dist`:17089, `_rw_point_dist`:17100, `_rw_player_progress`:17107, `_rw_target`:17113

## 17119-17355  events

`_rec_stop`:17120, `_rw_place`:17136, `_rw_grid_pos`:17143, `_rw_start`:17148, `_rw_spawn_ai`:17180, `_rw_ai_place`:17204, `_rw_tick`:17215, `_rw_ai_tick`:17268, `_rw_lap_done`:17310, `_rw_finish`:17322, `_rw_fmt`:17353

## 17356-17408  boosters and spikes

`_rw_buy`:17357, `_rw_use_boost`:17375, `_rw_use_spike`:17383, `_rw_drop_spike_at`:17394

## 17409-17466  online races

`_race_msg`:17410, `_join_race`:17432

## 17467-17822  raceway panel, HUD, board

`_build_raceway_ui`:17468, `_rw_layout`:17528, `_rw_open`:17535, `_rw_close`:17541, `_rw_refresh_panel`:17545, `_rw_refresh_board`:17558, `_rw_hud`:17570, `_peer_car_model`:17594, `_smoke_raceway`:17604, `_race_shots`:17785

## 17823-18030  v0.22.0: Call Car

`_call_block_reason`:17829, `_call_spot`:17846, `_call_car`:17877, `_play_horn`:17901, `_smoke_follow_call`:17925, `_follow_shots`:17998

## 18031-18330  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18046, `_build_travel`:18051, `_toggle_run`:18093, `_refresh_run`:18097, `_hud_v23_tick`:18105, `_travel_block_reason`:18134, `_travel_open`:18154, `_open_travel`:18160, `_close_travel`:18166, `_refresh_travel`:18170, `_travel_to`:18178, `_smoke_travel`:18205, `_v23_shots`:18243

## 18331-18404  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:18338, `_qr_button`:18353, `_qr_layout`:18392, `_smoke_qr`:18398

## 18405-18841  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:18425, `_open_crate`:18441, `_build_crate_ui`:18458, `_crate_pick`:18545, `_crate_reveal`:18568, `_crate_draw_car`:18595, `_crate_confetti`:18614, `_crate_sound`:18639, `_crate_drive`:18665, `_feed_add_system`:18695, `_smoke_crate`:18698, `_crate_shots`:18746

## 18842-19333  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:18883, `_quick_today`:18888, `_quick_is_done`:18891, `_quick_left`:18894, `_quick_next`:18901, `_quick_fix_target`:18914, `_quick_daily_check`:18928, `_quick_complete`:18942, `_quick_side`:18976, `_build_quick_props`:18994, `_daily_shots`:19146, `_quick_props_refresh`:19188, `_quick_fx`:19192, `_play_coin`:19208, `_smoke_quick`:19225

## 19334-19484  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:19343, `_quest_nearby`:19398, `_open_quests`:19405, `_close_quests`:19412, `_refresh_quests`:19416, `_quest_pick`:19442, `_quest_mode`:19456, `_smoke_quests`:19459

## 19485-19519  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:19489, `_my_tag_tick`:19492

## 19520-19834  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:19537, `_fc_torus`:19547, `_fc_pearl`:19555, `_fc_chrome`:19565, `_fc_glass`:19574, `_fc_glow`:19584, `_fc_ghost`:19593, `_fc_holo`:19605, `_fc_mesh`:19615, `_fc_sphere`:19635, `_fc_capsule`:19643, `_fc_cone`:19651, `_build_food_court`:19660, `_food_court_tick`:19814

## 19835-20154  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:19862, `_cm_bench`:19878, `_build_commons`:19891, `_commons_tick`:20113

## 20155-20469  v0.36: the daily puzzle

`_pz_today`:20178, `_pz_new`:20181, `_pz_neighbours`:20226, `_pz_flip`:20236, `_pz_done`:20241, `_pz_tap`:20249, `_pz_win`:20265, `_pz_reset`:20286, `_puzzle_near`:20290, `_open_puzzle`:20295, `_close_puzzle`:20303, `_pz_refresh_sign`:20307, `_build_puzzle_panel`:20315, `_pz_draw`:20346, `_smoke_chat`:20387, `_smoke_feet`:20425, `_smoke_commons`:20446

## 20470-20658  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:20532, `_bio_theta`:20536, `_bio_sec_n`:20541, `_bio_sec_of`:20544, `_bio_pt`:20547, `_bio_lp`:20552, `_bio_la`:20556, `_bio_dir`:20560, `_bio_hex_r`:20563, `_bio_apo`:20568, `_bio_open_angles`:20574, `_bio_si`:20584, `_bm`:20590, `_bsph`:20595, `_blow`:20598, `_bcone`:20609, `_bbox`:20612, `_bp`:20615, `_bq`:20620, `_bio_glass_mat`:20624, `_bio_water_mat`:20637, `_bio_mat`:20649

## 20659-21031  building blocks

`_bio_inst`:20660, `_bio_add`:20666, `_bio_model`:20669, `_bio_nature_mesh`:20675, `_bio_flush`:20709, `_bio_bar`:20744, `_bio_slab`:20757, `_bio_body`:20772, `_bio_cyl_col`:20785, `_bio_hexmesh`:20798, `_bio_hexslab`:20810, `_bio_hexpt`:20816, `_bio_gridshell`:20823, `_bio_rail`:20930, `_bio_rail_arc`:20935, `_bio_disc_deck`:20947, `_bio_ring_deck`:20953, `_bio_helix`:20964, `_bio_pillar`:20984, `_bio_cafe`:20990, `_bio_fence_line`:21004, `_bio_fence_seg`:21009, `_bio_pen`:21019

## 21032-21533  building

`_build_biosphere`:21033, `_build_biosphere_legacy`:21037, `_bio_text`:21199, `_bio_plaque`:21217, `_bio_ticket_hall`:21231, `_on_foot_collision_guard`:21287, `_bio_inside`:21297, `_bio_pass_ok`:21300, `_ticket_near`:21304, `_bio_buy_pass`:21309, `_bio_gates_update`:21325, `_bio_gate_tick`:21351, `_bio_tunnel`:21363, `_bio_grounds`:21416, `_bio_dome`:21462, `_bio_deck_mats`:21530

## 21534-21689  garden planting

`_bio_free`:21535, `_bio_spot`:21552, `_bio_garden`:21560, `_bio_pine`:21601, `_bio_tree`:21604, `_bio_big_tree`:21614, `_bio_rock`:21619, `_bio_pond`:21622, `_bio_particles`:21626, `_bio_mist`:21654, `_bio_mini_dome`:21683

## 21690-22097  the four layouts

`_bio_winter`:21691, `_bio_spring`:21783, `_bio_summer`:21908, `_bio_autumn`:21992

## 22098-22368  animals

`_bio_spawn`:22099, `_bio_load_animal`:22171, `_bio_make_quad`:22192, `_bio_load_bird`:22269, `_bio_make_penguin`:22289, `_bio_make_bird`:22311, `_bio_make_flamingo`:22335, `_bio_make_butterfly`:22356

## 22369-22498  animation, spotting and rewards

`_bio_stuck_check`:22374, `_biosphere_tick`:22392, `_bio_animate`:22399, `_bio_spot_check`:22479, `_bio_spotted`:22491, `_smoke_biosphere`:22495

## 22499-23016  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:22586, `_wear_piece`:22589, `_wear_mat`:22612, `_person_index`:22628, `_dress`:22651, `_smoke_style`:22757, `_style_shots`:22908, `_npc_look`:22980

## 23017-23165  your look: apply, save, share

`_look_clean`:23021, `_look_pack`:23036, `_owns`:23042, `_apply_look`:23047, `_relic_model`:23053, `_fc_mesh_mat`:23118, `_relic_refresh`:23121, `_relic_tick`:23135, `_peer_style`:23146

## 23166-23593  stores and the wardrobe

`_style_today`:23185, `_style_items`:23188, `_style_cat`:23196, `_style_price`:23199, `_style_deal`:23213, `_style_price_base`:23226, `_relic_stock`:23233, `_build_style_panel`:23245, `_open_store`:23285, `_open_wardrobe`:23304, `_style_close`:23307, `_style_finish`:23311, `_sync_old_avatar`:23326, `_style_tabs_for`:23333, `_refresh_style`:23338, `_style_body_rows`:23489, `_style_set_tab`:23506, `_style_step`:23510, `_style_color`:23515, `_style_pick`:23520, `_style_buy`:23555, `_ach_relics_check`:23577, `_style_face_camera`:23582

## 23594-24061  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:23630, `_ga_text`:23636, `_ga_box`:23653, `_build_galleria`:23669, `_ga_inner_tick`:23810, `_ga_shell`:23826, `_ga_inside`:23876, `_bio_cyl_col_on`:23879, `_ga_models`:23891, `_ga_lbox`:23906, `_ga_ltext`:23920, `_ga_store`:23927, `_bio_cafe_on`:24029, `_ga_mannequins`:24037

## 24062-24213  featured outfits and the Sky Run

`_ga_featured_look`:24075, `_build_ga_fun`:24096, `_ga_fun_tick`:24141, `_sky_finish`:24168, `_extra_near`:24187, `_extra_open`:24196, `_store_near`:24205

## 24214-24310  v0.41: THE SKY GARDEN

`_sg_now`:24268, `_sg_progress`:24271, `_sg_time`:24277, `_sg_stock`:24284, `_sg_mut_roll`:24299

## 24311-24448  building

`_sg_box`:24312, `_sg_text`:24318, `_build_sky_garden`:24332, `_sg_seed_spot`:24443, `_sg_codex_spot`:24446

## 24449-24629  plants

`_sg_plant_model`:24450, `_sg_refresh_all`:24555, `_sg_refresh`:24559, `_sky_garden_tick`:24595, `_sg_ready_count`:24614, `_sg_boot_note`:24621

## 24630-24749  interacting

`_sg_near`:24631, `_sg_button_text`:24654, `_sg_value`:24667, `_sg_interact`:24671, `_sg_buy`:24687, `_sg_plant`:24709, `_sg_harvest`:24720

## 24750-24993  the garden screen

`_build_sg_panel`:24751, `_sg_open`:24786, `_sg_close`:24795, `_sg_row`:24799, `_sg_refresh_panel`:24814, `_sg_pick_buy`:24859, `_sg_pick_plant`:24863, `_smoke_car_barriers`:24869, `_smoke_sky_garden`:24910

## 24994-25032  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25025, `_pass_day`:25028

## 25033-25064  album

`_album_pages`:25034, `_album_claim`:25049

## 25065-25116  season

`_season_index`:25066, `_season_tick`:25069, `_season_xp`:25078, `_season_tier`:25081, `_season_reward`:25084, `_season_claim`:25098

## 25117-25124  Harbor Night

`_harbor_night`:25118

## 25125-25156  check-in calendar

`_cal_tick`:25126

## 25157-25333  the panel

`_build_hp_panel`:25158, `_open_pass`:25193, `_hp_open`:25196, `_hp_close`:25203, `_hp_row`:25207, `_hp_bar`:25222, `_hp_refresh`:25226, `_smoke_pass`:25271

## 25334-25548  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:25338, `_cash_pill_tick`:25346, `_build_lb`:25384, `_open_lb`:25427, `_close_lb`:25435, `_lb_pick`:25439, `_lb_headers`:25444, `_lb_url`:25448, `_lb_me`:25451, `_lb_tick`:25454, `_lb_upload`:25462, `_lb_fetch`:25472, `_lb_got`:25480, `_lb_value`:25491, `_lb_refresh_ui`:25502

## 25549-25972  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:25573, `_market_near`:25650, `_build_gear`:25660, `_gear_piece`:25668, `_build_pet`:25713, `_market_apply`:25755, `_market_tick`:25779, `_build_market_panel`:25801, `_open_market`:25827, `_close_market`:25834, `_refresh_market`:25838, `_market_pick`:25891, `_toggle_board`:25929, `_board_tick`:25936

## 25973-26214  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26005, `_ds_label`:26024, `_build_display`:26038, `_ds_got`:26117, `_ds_sorted`:26126, `_ds_render_board`:26140, `_ds_render_news`:26166, `_display_tick`:26185

## 26215-26393  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26232, `_toggle_streamer`:26319, `_streamer_badge_tap`:26335, `_streamer_tick`:26339

## 26394-26430  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:26400, `_car_back`:26407, `_car_park_tick`:26414

## 26431-26527  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:26435, `_bus_eta`:26489, `_bus_displays_tick`:26505

## 26528-26819  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:26546, `_treasure_pick`:26549, `_treasure_spot`:26558, `_treasure_district`:26562, `_treasure_clue`:26574, `_treasure_prop`:26587, `_tp_part`:26590, `_tp_sphere`:26600, `_tp_cyl`:26608, `_treasure_prop_side`:26617, `_build_treasure_props`:26629, `_build_treasure`:26673, `_treasure_dir_char`:26742, `_treasure_tick`:26751, `_treasure_claim`:26805

## 26820-26920  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:26821, `_halo_mat`:26853, `_smoke_treasure`:26878

## 26921-27244  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:26942, `_fm_send`:26945, `_fm_area`:26951, `_fm_glow_mesh`:26967, `_fm_block_reason`:26985, `_fm_start`:26997, `_fm_announce`:27025, `_fm_finish`:27028, `_fm_msg`:27046, `_fm_check_paid`:27097, `_fm_tick`:27115, `_smoke_findme`:27171

## 27245-27355  v0.24.2: road map (for moving people off the road)

`_floor_note`:27251, `_floor_disc`:27265, `_floor_top`:27274, `_ground_at`:27292, `_note_road`:27310, `_on_road`:27317, `_ped_curb`:27327, `_curb_spot`:27337

## 27356-27651  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27378, `_ex_grid`:27386, `_ex_lamps`:27421, `_ex_umbrella`:27444, `_ex_yards`:27451, `_build_expansion`:27466, `_expand_shots`:27629

## 27652-27846  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:27693, `_v27_near_cross`:27785, `_v27_near_any_road`:27792, `_v27_in_district`:27798, `_sea_tick`:27812, `_sea_tow`:27831

## 27847-28487  Harbor Loop sky train

`_sky_build_path`:27898, `_sky_pos`:27939, `_sky_dir`:27953, `_sky_project`:27958, `_sky_trip_time`:27977, `_sky_trip_dist`:27983, `_sky_now`:27994, `_sky_state`:27997, `_sky_time_at_station`:28012, `_sky_next_arrival`:28019, `_build_skytrain`:28032, `_sky_make_car`:28161, `_sky_skin`:28198, `_sky_place_trains`:28218, `_sky_build_station`:28237, `_sky_near`:28302, `_sky_fmt`:28311, `_sky_enter`:28315, `_sky_leave_platform`:28333, `_sky_board`:28343, `_sky_alight`:28356, `_sky_action`:28369, `_sky_tick`:28386, `_sky_camera`:28424, `_tour_today`:28440, `_tour_stamp`:28443, `_sky_hud`:28466

## 28488-28825  Day and night

`_game_hour`:28569, `_day_key`:28581, `_night_setup`:28596, `_night_scan_mesh`:28686, `_daynight_tick`:28711, `_daynight_apply`:28718, `_daynight_lights`:28810, `_cycle_day_mode`:28815, `_refresh_time_button`:28822

## 28826-29461  v0.27 smoke test and screenshots

`_smoke_v27`:28827, `_city_shots`:29030

## 29462-29878  v0.27: Harbor International Airport (north of the city)

`_build_airport`:29496, `_ap_plane`:29672, `_ap_truck`:29692, `_ap_baggage_train`:29733, `_ap_loop_pos`:29746, `_ap_loop_len`:29762, `_ap_flight_at`:29768, `_ap_tick`:29792, `_airport_ped_plan`:29815, `_smoke_airport`:29835

## 29879-30392  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:29893, `_nav_spot`:29900, `_nav_idx`:29904, `_nav_pos`:29911, `_nav_blocked`:29915, `_nav_nearest_free`:29925, `_nav_bfs`:29953, `_nav_build`:29997, `_stroller`:30068, `_stroll_place`:30084, `_stroll_next`:30105, `_nav_clear_line`:30139, `_stroll_aim`:30150, `_strollers_tick`:30182, `_smoke_strollers`:30277

## 30393-30553  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:30428, `_dir_fmt`:30431, `_signpost_spot`:30434, `_build_signposts`:30451

## 30554-30650  the Directions panel and chip

`_build_dir_panel`:30555, `_open_dir`:30597, `_dir_close`:30606, `_dir_pick`:30610, `_dir_stop`:30615, `_dir_stop_and_close`:30620, `_dir_tick`:30624

## 30651-31192  v0.44: Grand Central

`_gc_mesh`:30680, `_gc_mat`:30713, `_gc_glass`:30722, `_gb`:30732, `_gb_solid`:30738, `_gb_flush`:30742, `_gc_tree`:30772, `_gc_text`:30777, `_gc_planter`:30792, `_gc_kiosk`:30798, `_goods_color`:30828, `_goods_mat`:30831, `_kiosk_goods`:30835, `_build_grand_central`:30913, `_build_gc_towers`:31081, `_gc_tick`:31176

## 31193-31484  v0.44: filling the empty land

`_loft`:31210, `_fill_clear`:31252, `_build_fill`:31262, `_hg_in_lake`:31310, `_hg_path`:31314, `_floor_note_rot`:31322, `_build_gardens`:31330, `_build_fan_plaza`:31440

## 31485-31519  v0.45: hover car underglow

`_car_underglow`:31488

## 31520-31684  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:31521

## 31685-31716  v0.47: street stalls downtown

`_build_street_stalls`:31689, `_cull_people_in`:31709

## 31717-31815  v0.48: places that open as you level up

`_place_lock_of`:31730, `_place_root`:31736, `_place_unlocked`:31739, `_build_place_signs`:31747, `_places_refresh`:31792, `_places_tick`:31809

## 31816-31860  v0.50: city careers

`_career_rank_name`:31841, `_career_mult`:31844, `_career_block_reason`:31849, `_career_start`:31852, `_career_end`:31857

## 31861-31911  v0.52: careers as clear job loops

`_cid`:31888, `_career_target`:31902, `_career_tick`:31909

## 31912-31919  taxi

`_taxi_meter`:31913

## 31920-31923  paramedic

(no functions)

## 31924-31928  police

`_career_chase_over`:31926

## 31929-31934  firefighter

`_fire_aimed`:31930

## 31935-31944  the step bar

`_career_bar_text`:31938, `_career_hud`:31942

## 31945-31971  cut scenes

`_cs_skip`:31963

## 31972-31976  siren

(no functions)

## 31977-31988  the Careers panel

`_build_career_panel`:31978, `_open_careers`:31981, `_career_close`:31985

## 31989-32412  v0.50: homes

`_home_door_spots`:32029, `_build_homes`:32044, `_home_labels`:32073, `_home_door_near`:32082, `_home_origin`:32091, `_home_slot_near`:32094, `_home_exit_near`:32105, `_home_btn`:32112, `_home_interact`:32125, `_home_buy`:32144, `_home_default_layout`:32158, `_home_enter`:32166, `_home_leave`:32186, `_hm`:32194, `_home_build_room`:32213, `_home_refresh_room`:32322, `_furni_build`:32336

## 32413-32748  decorating

`_build_home_panels`:32414, `_open_homes`:32459, `_home_row_go`:32469, `_home_panel_close`:32489, `_deco_open`:32493, `_deco_pick`:32516, `_smoke_careers_homes`:32539

## 32749-32883  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:32753, `_home_slots`:32761, `_home_ring`:32788, `_furni_cat`:32794, `_home_fix_layout`:32800, `_home_build_layout`:32828

## 32884-33317  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:32947, `_ch_homes`:32953, `_ch_step_text`:32960, `_ch_step_done`:32971, `_ch_target`:32985, `_ch_finish_chapter`:32994, `_chapters_tick`:33016, `_hud_top_stack`:33056, `_build_chapters_ui`:33086, `_chapters_restart_ask`:33128, `_chapters_restart`:33131, `_chapters_text`:33141, `_open_chapters`:33161, `_chapters_close`:33168, `_smoke_chapters`:33172, `_step_sound`:33293

## 33318-33356  v0.51.1: join and leave messages

`_announce_join`:33325, `_announce_already_here`:33344, `_announce_leave`:33352

## 33357-33621  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33373, `_shot_tick`:33379, `_draw_shot_icon`:33411, `_shot_enter`:33420, `_shot_exit`:33434, `_shot_release_controls`:33446, `_shot_stick_zone`:33453, `_shot_input`:33456, `_smoke_photo`:33528

## 33622-33920  v0.51.3: stream joiners

`_viewer_count`:33642, `_stream_join_check`:33648, `_stream_join_start`:33655, `_sj_streamer`:33672, `_stream_join_tick`:33681, `_stream_join_land`:33705, `_sj_welcome`:33721, `_smoke_stream_join`:33755, `_career_shot`:33838

## 33921-34037  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:33925, `_st_restore`:33963, `_smoke_streamer_clean`:33984, `_world_bio_passport`:34035

