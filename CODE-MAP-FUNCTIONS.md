# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-602  Core (unlabelled)

`_symbol_font`:282, `_ready`:294, `_surf_texture`:545, `_surface_material`:567

## 603-675  v0.34.6: futuristic towers for the old city

`_future_tower`:607

## 676-754  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:683, `_skin_common`:718, `_future_wall`:726, `_future_roof`:740, `_future_pave`:748

## 755-815  v0.34.4: futuristic road surface

`_road_textures`:762, `_future_road`:796

## 816-2024  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:835, `_real_tex`:876, `_real_setup`:884, `_real_kind`:905, `_realify`:911, `_real_glass`:948, `_make_window_textures`:968, `_material`:1001, `_box`:1026, `_sign`:1048, `_build_world`:1060, `_future_kiosk`:1171, `_build_collectibles`:1197, `_auto_collect_tick`:1230, `_find_count`:1251, `_nearest_find`:1258, `_destination`:1272, `_toggle_activity`:1308, `_collect_find`:1337, `_owned_count`:1352, `_ridge_open`:1359, `_ridge_count`:1363, `_nearest_ridge`:1370, `_apply_car`:1384, `_tune_level`:1414, `_tune_cost`:1417, `_car_stats`:1423, `_buy_tune`:1430, `_open_tune`:1451, `_back_to_garage`:1457, `_refresh_tune`:1461, `_bay_open`:1472, `_area_open`:1475, `_bay_count`:1478, `_nearest_bay`:1485, `_build_bay`:1499, `_check_bay`:1552, `_discover_bay`:1565, `_north_count`:1578, `_north_open`:1585, `_nearest_north`:1588, `_check_north`:1602, `_discover_north`:1615, `_prop`:1628, `_collider`:1642, `_first_mesh`:1652, `_scatter`:1661, `_prop_stretch`:1695, `_north_token`:1704, `_nm_roads`:1731, `_prop_big`:1746, `_nm_near_cross`:1762, `_build_north`:1769, `_build_nm_blocks`:1886, `_build_north_landscape`:1971, `_nm_free`:1998, `_build_landscape`:2008

## 2025-2508  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2026, `_online_toggle`:2040, `_online_autostart`:2066, `_online_connect`:2085, `_online_stop`:2092, `_online_next_ref`:2103, `_online_send`:2107, `_online_join_frame`:2111, `_online_pos_frame`:2114, `_online_tick`:2123, `_online_handle`:2157, `_online_clean_name`:2210, `_online_peer_update`:2219, `_online_make_peer`:2288, `_peer_look`:2329, `_online_tint`:2386, `_paint_mat`:2402, `_online_update_peers`:2414, `_online_clear_peers`:2494, `_online_refresh_button`:2499

## 2509-2681  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2589, `_marina_count`:2592, `_nearest_marina`:2599, `_check_marina`:2613, `_discover_marina`:2626, `_shop_available`:2639, `_nearest_shop`:2642, `_premium_cars`:2650, `_glass`:2657, `_shop_building`:2663, `_shop_pad`:2673

## 2682-3197  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2683, `_bus_last`:2686, `_build_bus`:2689, `_bus_boxes`:2716, `_bus_skin`:2726, `_bus_side`:2739, `_bus_reset`:2742, `_bus_text`:2751, `_bus_tick`:2756, `_bus_near`:2796, `_bus_board`:2807, `_bus_alight`:2822, `_build_marina`:2836, `_set_hat`:2942, `_build_hat`:2945, `_cyl`:3010, `_hat_part`:3019, `_apply_avatar`:3028, `_shop_count`:3040, `_shop_open`:3050, `_shop_step`:3068, `_shop_close`:3074, `_owned_text`:3087, `_refresh_shop`:3090, `_shop_action`:3143, `_journal_flip`:3194

## 3198-3252  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3209, `_xp`:3212, `_level_for`:3219, `_level`:3227, `_level_text`:3230, `_check_level`:3240

## 3253-3355  v0.11.0: online police vs thief

`_orole_ready`:3254, `_orole_start`:3257, `_orole_end`:3284, `_orole_tick`:3293

## 3356-4299  v0.10.0: chase mode (offline)

`_chase_open`:3357, `_chase_clear`:3362, `_chase_make_unit`:3376, `_chase_spawn_point`:3406, `_chase_start`:3415, `_chase_end`:3451, `_chase_steer`:3470, `_chase_roadblock`:3506, `_chase_heli_build`:3551, `_chase_extras`:3577, `_chase_tick`:3604, `_start_trial`:3668, `_cancel_trial`:3695, `_check_trial`:3700, `_finish_trial`:3717, `_trial_count`:3733, `_open_trials`:3740, `_refresh_trials`:3744, `_update_gate`:3756, `_slab`:3774, `_build_ridge`:3792, `_check_ridge`:3855, `_discover`:3868, `_mission_progress`:3882, `_check_missions`:3944, `_open_garage`:3955, `_open_journal`:3960, `_close_sub`:3965, `_bar`:3968, `_refresh_garage`:3972, `_garage_step`:3997, `_garage_action`:4001, `_refresh_journal`:4021, `_visited_shops`:4054, `_build_panels`:4061, `_build_player`:4221, `_build_car`:4259, `_try_model`:4288

## 4300-4984  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4301, `_kshader`:4375, `_ksync`:4381, `_kskin`:4396, `_make_kperson`:4402, `_hat_y`:4466, `_sit_drop`:4469, `_kplay`:4472, `_kpeople_tick`:4482, `_pose_person`:4511, `_pose_limbs`:4528, `_person_lift`:4590, `_snap_crowd_feet`:4603, `_people_life_tick`:4619, `_life_one`:4656, `_cull_person`:4666, `_recolor_car_model`:4674, `_apply_car_model`:4688, `_landmark`:4708, `_label`:4718, `_button`:4725, `_panel`:4737, `_build_hud`:4747

## 4985-5103  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:4991, `_menu_tab`:4997, `_watch_tick`:5020, `_watch_count`:5062, `_online_pill_tap`:5069, `_online_pill_tick`:5075, `online_config_ok`:5101

## 5104-5141  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5107, `_offroad`:5113, `_ground_near`:5126, `_collectibles_on_road`:5133

## 5142-5281  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5154, `_build_quest_offer`:5158, `_quest_offer_tick`:5188, `_quest_auto_pick`:5238, `_quest_accept`:5253, `_quest_decline`:5267, `_quest_stop`:5273

## 5282-5649  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5306, `_holo_material`:5315, `_build_future`:5323, `_build_neon`:5337, `_model_profile`:5406, `_model_body_box`:5429, `_build_holograms`:5443, `_holo_tick`:5493, `_build_sky_traffic`:5510, `_sky_hover_car`:5528, `_sky_drone`:5575, `_sky_traffic_tick`:5619, `_future_lights`:5638

## 5650-6149  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5709, `_crew_col`:5717, `_peer_crewmate`:5720, `_set_ring_color`:5723, `_level_color`:5750, `_tier_color`:5763, `_my_ach_tier`:5766, `_style_ring`:5773, `_social_peer_extras`:5821, `_social_tag`:5835, `_my_tag_extra`:5847, `_soc_send`:5860, `_social_msg`:5875, `_social_accept`:5914, `_social_go`:5935, `_soc_friend`:5954, `_soc_invite`:5961, `_soc_goto`:5966, `_soc_high_five`:5974, `_soc_gift`:5994, `_soc_crew_invite`:6011, `_gift_day_check`:6018, `_crew_create`:6024, `_crew_cycle_color`:6034, `_crew_leave`:6039, `_crew_mate_near`:6047, `_crew_board`:6055, `_build_social`:6074, `_social_online`:6136, `_open_social`:6140, `_close_social`:6146

## 6150-6400  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6153, `_track_pos`:6162, `_social_row_button`:6173, `_refresh_social`:6180, `_on_dance_floor`:6242, `_toggle_dance`:6245, `_build_dance_floor`:6253, `_social_tick`:6279, `_photo`:6351

## 6401-6896  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6423, `_game_state`:6431, `_build_arcade`:6443, `_c4_empty`:6494, `_c4_drop_row`:6500, `_c4_winner`:6506, `_c4_bot_move`:6527, `_c4_code`:6556, `_c4_ready`:6562, `_c4_tap`:6565, `_c4_check`:6586, `_c4_tick`:6610, `_rx_ready`:6637, `_rx_start`:6640, `_rx_tap`:6654, `_rx_send_time`:6679, `_rx_resolve`:6686, `_rx_tick`:6712, `_mem_start`:6727, `_mem_tap`:6743, `_mem_finish`:6758, `_mem_tick`:6774, `_mem_board_text`:6781, `_build_arcade_panel`:6792, `_refresh_arcade_panel`:6835

## 6897-7190  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6960, `_quiz_slot`:6963, `_quiz_question`:6973, `_quiz_bot_score`:7002, `_in_quiz`:7011, `_build_quiz`:7014, `_quiz_answer`:7084, `_quiz_msg`:7097, `_quiz_board`:7105, `_quiz_tick`:7115, `_quiz_refresh`:7157

## 7191-8755  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7362, `_sites_found`:7365, `_sites_total`:7368, `_bits`:7371, `_ach_value`:7378, `_ach_tick`:7433, `_ach_check`:7458, `_ach_by_id`:7494, `_ach_msg`:7500, `_build_ach`:7513, `_ach_show`:7544, `_open_ach`:7564, `_close_ach`:7570, `_refresh_ach`:7574, `_ach_num`:7605, `_minimap_tap`:7608, `_menu_go`:7615, `_menu_stay`:7620, `_menu_call_car`:7624, `_toggle_clean_hud`:7630, `_refresh_menu_buttons`:7636, `_clean_hud_tick`:7646, `_draw_joystick`:7687, `_input`:7692, `_touch_text_focus`:7779, `_stick_zone`:7799, `_notification`:7803, `_physics_process`:7818, `_follow_camera`:7966, `_follow_walk_camera`:8002, `_interact`:8025, `_refresh_hud`:8187, `_open_panel`:8316, `_layout_panels`:8346, `_toggle_menu`:8373, `_rescue`:8419, `_show_toast`:8451, `_save_progress`:8455, `_load_progress`:8548

## 8756-11113  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8757, `_radio_voice`:8760, `_radio_make`:8793, `_radio_set`:8864, `_radio_play`:8886, `_radio_next`:8891, `_radio_talk_line`:8895, `_radio_caption`:8916, `_radio_refresh`:8924, `_process`:8937, `_build_peds`:8988, `_update_peds`:9099, `_update_ped`:9118, `_smoke_test`:9172, `_smoke_chase`:9815, `_smoke_orole`:9848, `_smoke_levels`:9877, `_smoke_bus`:9918, `_smoke_chase_extras`:10003, `_smoke_marina`:10031, `_blocked_at`:10133, `_blocker`:10148, `_on_screen`:10161, `_wait_radio`:10166, `_smoke_radio_peds`:10173, `_smoke_typed_chat`:10243, `_smoke_chat_touch`:10262, `_smoke_cafe`:10283, `_smoke_boutique`:10309, `_smoke_models`:10337, `_smoke_garage_ridge`:10361, `_save_shot`:10737, `_paris_shots`:10747, `_people_shots`:10861, `_shots`:10902, `_shot_car`:11096, `_capture_preview`:11106

## 11114-11762  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11181, `_downtown_count`:11184, `_nearest_downtown`:11191, `_check_downtown`:11205, `_discover_downtown`:11218, `_box_batch`:11232, `_model_batch`:11252, `_cut_ranges`:11306, `_dt_ranges`:11318, `_dt_has`:11325, `_dt_near_cross`:11331, `_place`:11337, `_signal_pole`:11348, `_cyl_batch`:11367, `_city_signals`:11391, `_ensure_light_mats`:11442, `_city_lamps`:11452, `_build_downtown`:11496, `_dt_block`:11696, `_downtown_token`:11702, `_build_park`:11719, `_build_plaza`:11748

## 11763-11866  old city and Bay details

`_build_city_detail`:11764

## 11867-12276  traffic

`_build_traffic`:11868, `_path_sample`:11963, `_light_look`:11977, `_light_green`:11985, `_traffic_place`:11989, `_traffic_blocked_by`:12001, `_traffic_tick`:12013, `_smoke_downtown`:12119, `_skyline_shot`:12231, `_skyline_shots`:12239

## 12277-12637  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12323, `_web_scale`:12386, `_web_fps_tick`:12396, `_world_to_uv`:12413, `_map_angle`:12416, `_build_minimap`:12424, `_open_map`:12497, `_close_map`:12508, `_mini_point`:12515, `_site_markers`:12519, `_draw_arrow`:12551, `_draw_minimap`:12558, `_draw_full_map`:12605, `_minimap_tick`:12630

## 12638-12895  camera views

`_build_view_controls`:12639, `_cycle_view`:12681, `_apply_view`:12691, `_hide_labels`:12729, `_unfade`:12735, `_bake_map`:12741, `_shot_stats`:12791, `_view_shots`:12794, `_smoke_views`:12835

## 12896-13143  v0.17.0: level-up celebration

`_build_level_fx`:12907, `_draw_level_rays`:12944, `_level_fx_tick`:12954, `_level_sound`:12959, `_fx_material`:13001, `_level_up_fx`:13009, `_smoke_level_fx`:13110, `_levelup_shots`:13119

## 13144-13263  v0.18.0: walk-in stadium

`_collider_yaw`:13149, `_build_stadium_walls`:13160, `_look`:13188, `_smoke_stadium_eye`:13197, `_stadium_shots`:13233

## 13264-13425  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13288, `_arrow_mesh`:13300, `_build_guidance`:13323, `_guide_target`:13348, `_guidance_tick`:13377, `_draw_hud_arrow`:13403

## 13426-13611  checkpoints

`_build_checkpoints`:13427, `_refresh_checkpoints`:13472, `_check_checkpoints`:13478, `_activate_checkpoint`:13488, `_checkpoint_spawn`:13509, `_spawn_at_checkpoint`:13514, `_draw_checkpoint_icon`:13530, `_smoke_guidance_checkpoints`:13536, `_guide_shots`:13586

## 13612-13890  v0.18.0: Harbor Dome social hub

`_hub_seat`:13670, `_build_hub`:13674

## 13891-13941  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13892, `_xm_mesh`:13901, `_xm_tree`:13909

## 13942-14265  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13945, `_gt_surface`:13960, `_xm_grand_tree`:13970, `_lux_mat`:14085, `_lux_part`:14101, `_lux_box`:14104, `_lux_cyl`:14109, `_lux_ball`:14117, `_lux_new`:14125, `_lux_commit`:14130, `_lux_sofa_mesh`:14134, `_lux_chair_mesh`:14164, `_lux_table_mesh`:14184, `_lux_pouf_mesh`:14199, `_lux_batch`:14214, `_hub_christmas`:14230

## 14266-14421  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14267

## 14422-14670  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14425, `_vx_cyl`:14432, `_vx_ball`:14440, `_vx_ring`:14448, `_hub_polish`:14456, `_hub_gate`:14479, `_hub_vip`:14541, `_hub_glass`:14654

## 14671-14885  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14672, `_build_hub_bots`:14697, `_seat_of`:14728, `_bubble`:14738, `_emote`:14794, `_hub_people_tick`:14808

## 14886-15004  seats

`_seat_taken`:14887, `_nearest_seat`:14895, `_seat_label`:14907, `_sit`:14923, `_stand_up`:14967, `_seated_tick`:14986

## 15005-15161  game panel

`_build_game_panel`:15006, `_open_game_panel`:15061, `_refresh_game_panel`:15080, `_play_robot`:15125, `_peer_at`:15139, `_opponent_name`:15146, `_pay`:15154

## 15162-15282  tic-tac-toe

`_ttt_ready`:15165, `_ttt_winner`:15171, `_ttt_bot_move`:15181, `_ttt_tap`:15207, `_ttt_code`:15227, `_ttt_check`:15233, `_ttt_tick`:15256

## 15283-15334  rock paper scissors

`_rps_ready`:15284, `_rps_pick`:15290, `_rps_resolve`:15308, `_rps_tick`:15332

## 15335-15417  online table messages

`_online_game_send`:15336, `_hub_game_msg`:15342

## 15418-15493  comedy show

`_joke_start`:15419, `_joke_tick`:15431, `_speak`:15457, `_play_rimshot`:15466

## 15494-16393  quick chat and emotes

`_build_chat`:15516, `_chat_toggle_to`:15633, `_chat_log_add`:15641, `_chat_area`:15647, `_chat_near_count`:15665, `_chat_tick`:15674, `_toggle_chat`:15723, `_chat_fit`:15738, `_chat_clean`:15744, `_chat_wrap`:15761, `_chat_send_text`:15783, `_typing`:15806, `_say`:15809, `_do_emote`:15825, `_smoke_hub`:15834, `_chat_shots`:16008, `_cafe_shots`:16033, `_shop_shots`:16081, `_car_shots`:16130, `_outfit_shots`:16161, `_hub_shots`:16209, `_sg_on_terrace`:16344, `_people_only`:16347, `_people_only_keep_cars_out`:16351, `_car_barrier`:16363, `_hub_keep_cars_out`:16377

## 16394-16556  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16403, `_feed_add`:16412, `_feed_render`:16418, `_feed_tick`:16446, `_online_event_send`:16455, `_at_pvp_table`:16462, `_game_name`:16469, `_send_lfp`:16472, `_lfp_msg`:16489, `_accept_invite`:16510

## 16557-16798  v0.18.2: nickname and HUD relayout

`_nick_rude`:16569, `_clean_nick`:16584, `_build_nick_panel`:16596, `_open_nick`:16634, `_random_nick`:16643, `_save_nick`:16649, `_close_nick`:16668, `_refresh_nick_button`:16677, `_relayout_hud`:16681, `_smoke_nick`:16718, `_nick_shots`:16750, `_smoke_sites_reachable`:16768

## 16799-17086  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16825, `_nearest_civic`:16832, `_check_civic`:16846, `_discover_civic`:16859, `_civ_ranges`:16872, `_civ_has`:16886, `_civ_near_cross`:16892, `_build_civic`:16898, `_civic_token`:17024, `_civic_shots`:17041, `_hub_focus`:17063

## 17087-17196  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17158, `_in_rw_lot`:17161, `_box_batch_rot`:17164, `_multi_collider`:17182

## 17197-17524  circuit geometry

`_cr_point`:17198, `_rw_build_path`:17212, `_rw_dir`:17240, `_rw_bend`:17245, `_ribbon`:17251, `_rw_band`:17271, `_rw_keepout`:17289, `_build_raceway`:17298, `_build_rw_parking`:17332, `_build_rw_pits`:17377, `_build_rw_track`:17414, `_build_rw_trackside`:17455

## 17525-17622  race car rental

`_model_key`:17526, `_race_car_start`:17529, `_tint_ghost`:17567, `_race_car_end`:17580, `_race_keep_cars_out`:17605

## 17623-17637  speed effects

`_eff_max`:17624, `_eff_accel`:17635

## 17638-17688  track helpers

`_rw_seg_progress`:17639, `_rw_track_dist`:17659, `_rw_point_dist`:17670, `_rw_player_progress`:17677, `_rw_target`:17683

## 17689-17925  events

`_rec_stop`:17690, `_rw_place`:17706, `_rw_grid_pos`:17713, `_rw_start`:17718, `_rw_spawn_ai`:17750, `_rw_ai_place`:17774, `_rw_tick`:17785, `_rw_ai_tick`:17838, `_rw_lap_done`:17880, `_rw_finish`:17892, `_rw_fmt`:17923

## 17926-17978  boosters and spikes

`_rw_buy`:17927, `_rw_use_boost`:17945, `_rw_use_spike`:17953, `_rw_drop_spike_at`:17964

## 17979-18036  online races

`_race_msg`:17980, `_join_race`:18002

## 18037-18392  raceway panel, HUD, board

`_build_raceway_ui`:18038, `_rw_layout`:18098, `_rw_open`:18105, `_rw_close`:18111, `_rw_refresh_panel`:18115, `_rw_refresh_board`:18128, `_rw_hud`:18140, `_peer_car_model`:18164, `_smoke_raceway`:18174, `_race_shots`:18355

## 18393-18600  v0.22.0: Call Car

`_call_block_reason`:18399, `_call_spot`:18416, `_call_car`:18447, `_play_horn`:18471, `_smoke_follow_call`:18495, `_follow_shots`:18568

## 18601-19058  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18626, `_place_portal_button`:18632, `_portal_pressed`:18639, `_build_travel`:18647, `_toggle_run`:18752, `_refresh_run`:18756, `_hud_v23_tick`:18764, `_travel_block_reason`:18796, `_travel_open`:18816, `_open_travel`:18822, `_open_worlds`:18828, `_open_case`:18834, `_case_step`:18846, `_case_refresh`:18850, `_case_submit`:18854, `_close_case`:18863, `_sky_go`:18867, `_close_worlds`:18877, `_refresh_worlds`:18881, `_world_go`:18887, `_close_travel`:18894, `_refresh_travel`:18898, `_travel_to`:18906, `_smoke_travel`:18933, `_v23_shots`:18971

## 19059-19132  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19066, `_qr_button`:19081, `_qr_layout`:19120, `_smoke_qr`:19126

## 19133-19569  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19153, `_open_crate`:19169, `_build_crate_ui`:19186, `_crate_pick`:19273, `_crate_reveal`:19296, `_crate_draw_car`:19323, `_crate_confetti`:19342, `_crate_sound`:19367, `_crate_drive`:19393, `_feed_add_system`:19423, `_smoke_crate`:19426, `_crate_shots`:19474

## 19570-20061  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19611, `_quick_today`:19616, `_quick_is_done`:19619, `_quick_left`:19622, `_quick_next`:19629, `_quick_fix_target`:19642, `_quick_daily_check`:19656, `_quick_complete`:19670, `_quick_side`:19704, `_build_quick_props`:19722, `_daily_shots`:19874, `_quick_props_refresh`:19916, `_quick_fx`:19920, `_play_coin`:19936, `_smoke_quick`:19953

## 20062-20212  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20071, `_quest_nearby`:20126, `_open_quests`:20133, `_close_quests`:20140, `_refresh_quests`:20144, `_quest_pick`:20170, `_quest_mode`:20184, `_smoke_quests`:20187

## 20213-20247  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20217, `_my_tag_tick`:20220

## 20248-20562  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20265, `_fc_torus`:20275, `_fc_pearl`:20283, `_fc_chrome`:20293, `_fc_glass`:20302, `_fc_glow`:20312, `_fc_ghost`:20321, `_fc_holo`:20333, `_fc_mesh`:20343, `_fc_sphere`:20363, `_fc_capsule`:20371, `_fc_cone`:20379, `_build_food_court`:20388, `_food_court_tick`:20542

## 20563-20884  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20592, `_cm_bench`:20608, `_build_commons`:20621, `_commons_tick`:20843

## 20885-21199  v0.36: the daily puzzle

`_pz_today`:20908, `_pz_new`:20911, `_pz_neighbours`:20956, `_pz_flip`:20966, `_pz_done`:20971, `_pz_tap`:20979, `_pz_win`:20995, `_pz_reset`:21016, `_puzzle_near`:21020, `_open_puzzle`:21025, `_close_puzzle`:21033, `_pz_refresh_sign`:21037, `_build_puzzle_panel`:21045, `_pz_draw`:21076, `_smoke_chat`:21117, `_smoke_feet`:21155, `_smoke_commons`:21176

## 21200-21388  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21262, `_bio_theta`:21266, `_bio_sec_n`:21271, `_bio_sec_of`:21274, `_bio_pt`:21277, `_bio_lp`:21282, `_bio_la`:21286, `_bio_dir`:21290, `_bio_hex_r`:21293, `_bio_apo`:21298, `_bio_open_angles`:21304, `_bio_si`:21314, `_bm`:21320, `_bsph`:21325, `_blow`:21328, `_bcone`:21339, `_bbox`:21342, `_bp`:21345, `_bq`:21350, `_bio_glass_mat`:21354, `_bio_water_mat`:21367, `_bio_mat`:21379

## 21389-21761  building blocks

`_bio_inst`:21390, `_bio_add`:21396, `_bio_model`:21399, `_bio_nature_mesh`:21405, `_bio_flush`:21439, `_bio_bar`:21474, `_bio_slab`:21487, `_bio_body`:21502, `_bio_cyl_col`:21515, `_bio_hexmesh`:21528, `_bio_hexslab`:21540, `_bio_hexpt`:21546, `_bio_gridshell`:21553, `_bio_rail`:21660, `_bio_rail_arc`:21665, `_bio_disc_deck`:21677, `_bio_ring_deck`:21683, `_bio_helix`:21694, `_bio_pillar`:21714, `_bio_cafe`:21720, `_bio_fence_line`:21734, `_bio_fence_seg`:21739, `_bio_pen`:21749

## 21762-22263  building

`_build_biosphere`:21763, `_build_biosphere_legacy`:21767, `_bio_text`:21929, `_bio_plaque`:21947, `_bio_ticket_hall`:21961, `_on_foot_collision_guard`:22017, `_bio_inside`:22027, `_bio_pass_ok`:22030, `_ticket_near`:22034, `_bio_buy_pass`:22039, `_bio_gates_update`:22055, `_bio_gate_tick`:22081, `_bio_tunnel`:22093, `_bio_grounds`:22146, `_bio_dome`:22192, `_bio_deck_mats`:22260

## 22264-22419  garden planting

`_bio_free`:22265, `_bio_spot`:22282, `_bio_garden`:22290, `_bio_pine`:22331, `_bio_tree`:22334, `_bio_big_tree`:22344, `_bio_rock`:22349, `_bio_pond`:22352, `_bio_particles`:22356, `_bio_mist`:22384, `_bio_mini_dome`:22413

## 22420-22827  the four layouts

`_bio_winter`:22421, `_bio_spring`:22513, `_bio_summer`:22638, `_bio_autumn`:22722

## 22828-23098  animals

`_bio_spawn`:22829, `_bio_load_animal`:22901, `_bio_make_quad`:22922, `_bio_load_bird`:22999, `_bio_make_penguin`:23019, `_bio_make_bird`:23041, `_bio_make_flamingo`:23065, `_bio_make_butterfly`:23086

## 23099-23230  animation, spotting and rewards

`_bio_stuck_check`:23104, `_biosphere_tick`:23122, `_bio_animate`:23131, `_bio_spot_check`:23211, `_bio_spotted`:23223, `_smoke_biosphere`:23227

## 23231-23748  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23318, `_wear_piece`:23321, `_wear_mat`:23344, `_person_index`:23360, `_dress`:23383, `_smoke_style`:23489, `_style_shots`:23640, `_npc_look`:23712

## 23749-23902  your look: apply, save, share

`_look_clean`:23753, `_look_pack`:23768, `_owns`:23774, `_apply_look`:23779, `_relic_model`:23790, `_fc_mesh_mat`:23855, `_relic_refresh`:23858, `_relic_tick`:23872, `_peer_style`:23883

## 23903-24330  stores and the wardrobe

`_style_today`:23922, `_style_items`:23925, `_style_cat`:23933, `_style_price`:23936, `_style_deal`:23950, `_style_price_base`:23963, `_relic_stock`:23970, `_build_style_panel`:23982, `_open_store`:24022, `_open_wardrobe`:24041, `_style_close`:24044, `_style_finish`:24048, `_sync_old_avatar`:24063, `_style_tabs_for`:24070, `_refresh_style`:24075, `_style_body_rows`:24226, `_style_set_tab`:24243, `_style_step`:24247, `_style_color`:24252, `_style_pick`:24257, `_style_buy`:24292, `_ach_relics_check`:24314, `_style_face_camera`:24319

## 24331-24798  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24367, `_ga_text`:24373, `_ga_box`:24390, `_build_galleria`:24406, `_ga_inner_tick`:24547, `_ga_shell`:24563, `_ga_inside`:24613, `_bio_cyl_col_on`:24616, `_ga_models`:24628, `_ga_lbox`:24643, `_ga_ltext`:24657, `_ga_store`:24664, `_bio_cafe_on`:24766, `_ga_mannequins`:24774

## 24799-24950  featured outfits and the Sky Run

`_ga_featured_look`:24812, `_build_ga_fun`:24833, `_ga_fun_tick`:24878, `_sky_finish`:24905, `_extra_near`:24924, `_extra_open`:24933, `_store_near`:24942

## 24951-25047  v0.41: THE SKY GARDEN

`_sg_now`:25005, `_sg_progress`:25008, `_sg_time`:25014, `_sg_stock`:25021, `_sg_mut_roll`:25036

## 25048-25185  building

`_sg_box`:25049, `_sg_text`:25055, `_build_sky_garden`:25069, `_sg_seed_spot`:25180, `_sg_codex_spot`:25183

## 25186-25366  plants

`_sg_plant_model`:25187, `_sg_refresh_all`:25292, `_sg_refresh`:25296, `_sky_garden_tick`:25332, `_sg_ready_count`:25351, `_sg_boot_note`:25358

## 25367-25486  interacting

`_sg_near`:25368, `_sg_button_text`:25391, `_sg_value`:25404, `_sg_interact`:25408, `_sg_buy`:25424, `_sg_plant`:25446, `_sg_harvest`:25457

## 25487-25730  the garden screen

`_build_sg_panel`:25488, `_sg_open`:25523, `_sg_close`:25532, `_sg_row`:25536, `_sg_refresh_panel`:25551, `_sg_pick_buy`:25596, `_sg_pick_plant`:25600, `_smoke_car_barriers`:25606, `_smoke_sky_garden`:25647

## 25731-25769  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25762, `_pass_day`:25765

## 25770-25801  album

`_album_pages`:25771, `_album_claim`:25786

## 25802-25853  season

`_season_index`:25803, `_season_tick`:25806, `_season_xp`:25815, `_season_tier`:25818, `_season_reward`:25821, `_season_claim`:25835

## 25854-25861  Harbor Night

`_harbor_night`:25855

## 25862-25893  check-in calendar

`_cal_tick`:25863

## 25894-26070  the panel

`_build_hp_panel`:25895, `_open_pass`:25930, `_hp_open`:25933, `_hp_close`:25940, `_hp_row`:25944, `_hp_bar`:25959, `_hp_refresh`:25963, `_smoke_pass`:26008

## 26071-26285  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26075, `_cash_pill_tick`:26083, `_build_lb`:26121, `_open_lb`:26164, `_close_lb`:26172, `_lb_pick`:26176, `_lb_headers`:26181, `_lb_url`:26185, `_lb_me`:26188, `_lb_tick`:26191, `_lb_upload`:26199, `_lb_fetch`:26209, `_lb_got`:26217, `_lb_value`:26228, `_lb_refresh_ui`:26239

## 26286-26709  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26310, `_market_near`:26387, `_build_gear`:26397, `_gear_piece`:26405, `_build_pet`:26450, `_market_apply`:26492, `_market_tick`:26516, `_build_market_panel`:26538, `_open_market`:26564, `_close_market`:26571, `_refresh_market`:26575, `_market_pick`:26628, `_toggle_board`:26666, `_board_tick`:26673

## 26710-26951  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26742, `_ds_label`:26761, `_build_display`:26775, `_ds_got`:26854, `_ds_sorted`:26863, `_ds_render_board`:26877, `_ds_render_news`:26903, `_display_tick`:26922

## 26952-27130  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26969, `_toggle_streamer`:27056, `_streamer_badge_tap`:27072, `_streamer_tick`:27076

## 27131-27167  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27137, `_car_back`:27144, `_car_park_tick`:27151

## 27168-27264  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27172, `_bus_eta`:27226, `_bus_displays_tick`:27242

## 27265-27556  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27283, `_treasure_pick`:27286, `_treasure_spot`:27295, `_treasure_district`:27299, `_treasure_clue`:27311, `_treasure_prop`:27324, `_tp_part`:27327, `_tp_sphere`:27337, `_tp_cyl`:27345, `_treasure_prop_side`:27354, `_build_treasure_props`:27366, `_build_treasure`:27410, `_treasure_dir_char`:27479, `_treasure_tick`:27488, `_treasure_claim`:27542

## 27557-27657  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27558, `_halo_mat`:27590, `_smoke_treasure`:27615

## 27658-27981  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27679, `_fm_send`:27682, `_fm_area`:27688, `_fm_glow_mesh`:27704, `_fm_block_reason`:27722, `_fm_start`:27734, `_fm_announce`:27762, `_fm_finish`:27765, `_fm_msg`:27783, `_fm_check_paid`:27834, `_fm_tick`:27852, `_smoke_findme`:27908

## 27982-28092  v0.24.2: road map (for moving people off the road)

`_floor_note`:27988, `_floor_disc`:28002, `_floor_top`:28011, `_ground_at`:28029, `_note_road`:28047, `_on_road`:28054, `_ped_curb`:28064, `_curb_spot`:28074

## 28093-28388  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28115, `_ex_grid`:28123, `_ex_lamps`:28158, `_ex_umbrella`:28181, `_ex_yards`:28188, `_build_expansion`:28203, `_expand_shots`:28366

## 28389-28583  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28430, `_v27_near_cross`:28522, `_v27_near_any_road`:28529, `_v27_in_district`:28535, `_sea_tick`:28549, `_sea_tow`:28568

## 28584-29251  Harbor Loop sky train

`_sky_build_path`:28635, `_sky_pos`:28676, `_sky_dir`:28690, `_sky_project`:28695, `_sky_trip_time`:28714, `_sky_trip_dist`:28720, `_sky_now`:28731, `_sky_state`:28734, `_sky_time_at_station`:28749, `_sky_next_arrival`:28756, `_build_skytrain`:28769, `_sky_make_car`:28921, `_sky_skin`:28958, `_sky_place_trains`:28978, `_sky_build_station`:28997, `_sky_near`:29062, `_sky_fmt`:29071, `_sky_enter`:29075, `_sky_leave_platform`:29093, `_sky_board`:29103, `_sky_alight`:29117, `_sky_action`:29131, `_sky_tick`:29148, `_sky_camera`:29188, `_tour_today`:29204, `_tour_stamp`:29207, `_sky_hud`:29230

## 29252-29612  Day and night

`_toggle_weather`:29335, `_refresh_weather_button`:29341, `_game_hour`:29347, `_day_key`:29359, `_night_setup`:29374, `_night_scan_mesh`:29464, `_daynight_tick`:29489, `_daynight_apply`:29496, `_daynight_lights`:29597, `_cycle_day_mode`:29602, `_refresh_time_button`:29609

## 29613-30248  v0.27 smoke test and screenshots

`_smoke_v27`:29614, `_city_shots`:29817

## 30249-30665  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30283, `_ap_plane`:30459, `_ap_truck`:30479, `_ap_baggage_train`:30520, `_ap_loop_pos`:30533, `_ap_loop_len`:30549, `_ap_flight_at`:30555, `_ap_tick`:30579, `_airport_ped_plan`:30602, `_smoke_airport`:30622

## 30666-31179  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30680, `_nav_spot`:30687, `_nav_idx`:30691, `_nav_pos`:30698, `_nav_blocked`:30702, `_nav_nearest_free`:30712, `_nav_bfs`:30740, `_nav_build`:30784, `_stroller`:30855, `_stroll_place`:30871, `_stroll_next`:30892, `_nav_clear_line`:30926, `_stroll_aim`:30937, `_strollers_tick`:30969, `_smoke_strollers`:31064

## 31180-31340  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31215, `_dir_fmt`:31218, `_signpost_spot`:31221, `_build_signposts`:31238

## 31341-31437  the Directions panel and chip

`_build_dir_panel`:31342, `_open_dir`:31384, `_dir_close`:31393, `_dir_pick`:31397, `_dir_stop`:31402, `_dir_stop_and_close`:31407, `_dir_tick`:31411

## 31438-31979  v0.44: Grand Central

`_gc_mesh`:31467, `_gc_mat`:31500, `_gc_glass`:31509, `_gb`:31519, `_gb_solid`:31525, `_gb_flush`:31529, `_gc_tree`:31559, `_gc_text`:31564, `_gc_planter`:31579, `_gc_kiosk`:31585, `_goods_color`:31615, `_goods_mat`:31618, `_kiosk_goods`:31622, `_build_grand_central`:31700, `_build_gc_towers`:31868, `_gc_tick`:31963

## 31980-32271  v0.44: filling the empty land

`_loft`:31997, `_fill_clear`:32039, `_build_fill`:32049, `_hg_in_lake`:32097, `_hg_path`:32101, `_floor_note_rot`:32109, `_build_gardens`:32117, `_build_fan_plaza`:32227

## 32272-32306  v0.45: hover car underglow

`_car_underglow`:32275

## 32307-32471  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32308

## 32472-32503  v0.47: street stalls downtown

`_build_street_stalls`:32476, `_cull_people_in`:32496

## 32504-32602  v0.48: places that open as you level up

`_place_lock_of`:32517, `_place_root`:32523, `_place_unlocked`:32526, `_build_place_signs`:32534, `_places_refresh`:32579, `_places_tick`:32596

## 32603-32647  v0.50: city careers

`_career_rank_name`:32628, `_career_mult`:32631, `_career_block_reason`:32636, `_career_start`:32639, `_career_end`:32644

## 32648-32698  v0.52: careers as clear job loops

`_cid`:32675, `_career_target`:32689, `_career_tick`:32696

## 32699-32706  taxi

`_taxi_meter`:32700

## 32707-32710  paramedic

(no functions)

## 32711-32715  police

`_career_chase_over`:32713

## 32716-32721  firefighter

`_fire_aimed`:32717

## 32722-32731  the step bar

`_career_bar_text`:32725, `_career_hud`:32729

## 32732-32758  cut scenes

`_cs_skip`:32750

## 32759-32763  siren

(no functions)

## 32764-32775  the Careers panel

`_build_career_panel`:32765, `_open_careers`:32768, `_career_close`:32772

## 32776-33199  v0.50: homes

`_home_door_spots`:32816, `_build_homes`:32831, `_home_labels`:32860, `_home_door_near`:32869, `_home_origin`:32878, `_home_slot_near`:32881, `_home_exit_near`:32892, `_home_btn`:32899, `_home_interact`:32912, `_home_buy`:32931, `_home_default_layout`:32945, `_home_enter`:32953, `_home_leave`:32973, `_hm`:32981, `_home_build_room`:33000, `_home_refresh_room`:33109, `_furni_build`:33123

## 33200-33535  decorating

`_build_home_panels`:33201, `_open_homes`:33246, `_home_row_go`:33256, `_home_panel_close`:33276, `_deco_open`:33280, `_deco_pick`:33303, `_smoke_careers_homes`:33326

## 33536-33670  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33540, `_home_slots`:33548, `_home_ring`:33575, `_furni_cat`:33581, `_home_fix_layout`:33587, `_home_build_layout`:33615

## 33671-34104  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33734, `_ch_homes`:33740, `_ch_step_text`:33747, `_ch_step_done`:33758, `_ch_target`:33772, `_ch_finish_chapter`:33781, `_chapters_tick`:33803, `_hud_top_stack`:33843, `_build_chapters_ui`:33873, `_chapters_restart_ask`:33915, `_chapters_restart`:33918, `_chapters_text`:33928, `_open_chapters`:33948, `_chapters_close`:33955, `_smoke_chapters`:33959, `_step_sound`:34080

## 34105-34143  v0.51.1: join and leave messages

`_announce_join`:34112, `_announce_already_here`:34131, `_announce_leave`:34139

## 34144-34408  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34160, `_shot_tick`:34166, `_draw_shot_icon`:34198, `_shot_enter`:34207, `_shot_exit`:34221, `_shot_release_controls`:34233, `_shot_stick_zone`:34240, `_shot_input`:34243, `_smoke_photo`:34315

## 34409-34707  v0.51.3: stream joiners

`_viewer_count`:34429, `_stream_join_check`:34435, `_stream_join_start`:34442, `_sj_streamer`:34459, `_stream_join_tick`:34468, `_stream_join_land`:34492, `_sj_welcome`:34508, `_smoke_stream_join`:34542, `_career_shot`:34625

## 34708-34824  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34712, `_st_restore`:34750, `_smoke_streamer_clean`:34771, `_world_bio_passport`:34822

