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

## 7191-8743  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7362, `_sites_found`:7365, `_sites_total`:7368, `_bits`:7371, `_ach_value`:7378, `_ach_tick`:7433, `_ach_check`:7458, `_ach_by_id`:7494, `_ach_msg`:7500, `_build_ach`:7513, `_ach_show`:7544, `_open_ach`:7564, `_close_ach`:7570, `_refresh_ach`:7574, `_ach_num`:7605, `_minimap_tap`:7608, `_menu_go`:7615, `_menu_stay`:7620, `_menu_call_car`:7624, `_toggle_clean_hud`:7630, `_refresh_menu_buttons`:7636, `_clean_hud_tick`:7646, `_draw_joystick`:7687, `_input`:7692, `_touch_text_focus`:7779, `_stick_zone`:7799, `_notification`:7803, `_physics_process`:7818, `_follow_camera`:7966, `_follow_walk_camera`:8002, `_interact`:8025, `_refresh_hud`:8187, `_open_panel`:8316, `_layout_panels`:8342, `_toggle_menu`:8365, `_rescue`:8407, `_show_toast`:8439, `_save_progress`:8443, `_load_progress`:8536

## 8744-11051  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8745, `_radio_voice`:8748, `_radio_make`:8781, `_radio_set`:8852, `_radio_play`:8874, `_radio_next`:8879, `_radio_talk_line`:8883, `_radio_caption`:8904, `_radio_refresh`:8912, `_process`:8925, `_build_peds`:8976, `_update_peds`:9087, `_update_ped`:9106, `_smoke_test`:9160, `_smoke_chase`:9803, `_smoke_orole`:9836, `_smoke_levels`:9865, `_smoke_bus`:9906, `_smoke_chase_extras`:9991, `_smoke_marina`:10019, `_blocked_at`:10121, `_blocker`:10136, `_on_screen`:10149, `_wait_radio`:10154, `_smoke_radio_peds`:10161, `_smoke_typed_chat`:10231, `_smoke_chat_touch`:10250, `_smoke_cafe`:10271, `_smoke_boutique`:10297, `_smoke_models`:10325, `_smoke_garage_ridge`:10349, `_save_shot`:10725, `_paris_shots`:10735, `_people_shots`:10799, `_shots`:10840, `_shot_car`:11034, `_capture_preview`:11044

## 11052-11700  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11119, `_downtown_count`:11122, `_nearest_downtown`:11129, `_check_downtown`:11143, `_discover_downtown`:11156, `_box_batch`:11170, `_model_batch`:11190, `_cut_ranges`:11244, `_dt_ranges`:11256, `_dt_has`:11263, `_dt_near_cross`:11269, `_place`:11275, `_signal_pole`:11286, `_cyl_batch`:11305, `_city_signals`:11329, `_ensure_light_mats`:11380, `_city_lamps`:11390, `_build_downtown`:11434, `_dt_block`:11634, `_downtown_token`:11640, `_build_park`:11657, `_build_plaza`:11686

## 11701-11804  old city and Bay details

`_build_city_detail`:11702

## 11805-12214  traffic

`_build_traffic`:11806, `_path_sample`:11901, `_light_look`:11915, `_light_green`:11923, `_traffic_place`:11927, `_traffic_blocked_by`:11939, `_traffic_tick`:11951, `_smoke_downtown`:12057, `_skyline_shot`:12169, `_skyline_shots`:12177

## 12215-12575  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12261, `_web_scale`:12324, `_web_fps_tick`:12334, `_world_to_uv`:12351, `_map_angle`:12354, `_build_minimap`:12362, `_open_map`:12435, `_close_map`:12446, `_mini_point`:12453, `_site_markers`:12457, `_draw_arrow`:12489, `_draw_minimap`:12496, `_draw_full_map`:12543, `_minimap_tick`:12568

## 12576-12833  camera views

`_build_view_controls`:12577, `_cycle_view`:12619, `_apply_view`:12629, `_hide_labels`:12667, `_unfade`:12673, `_bake_map`:12679, `_shot_stats`:12729, `_view_shots`:12732, `_smoke_views`:12773

## 12834-13081  v0.17.0: level-up celebration

`_build_level_fx`:12845, `_draw_level_rays`:12882, `_level_fx_tick`:12892, `_level_sound`:12897, `_fx_material`:12939, `_level_up_fx`:12947, `_smoke_level_fx`:13048, `_levelup_shots`:13057

## 13082-13201  v0.18.0: walk-in stadium

`_collider_yaw`:13087, `_build_stadium_walls`:13098, `_look`:13126, `_smoke_stadium_eye`:13135, `_stadium_shots`:13171

## 13202-13363  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13226, `_arrow_mesh`:13238, `_build_guidance`:13261, `_guide_target`:13286, `_guidance_tick`:13315, `_draw_hud_arrow`:13341

## 13364-13549  checkpoints

`_build_checkpoints`:13365, `_refresh_checkpoints`:13410, `_check_checkpoints`:13416, `_activate_checkpoint`:13426, `_checkpoint_spawn`:13447, `_spawn_at_checkpoint`:13452, `_draw_checkpoint_icon`:13468, `_smoke_guidance_checkpoints`:13474, `_guide_shots`:13524

## 13550-13828  v0.18.0: Harbor Dome social hub

`_hub_seat`:13608, `_build_hub`:13612

## 13829-13879  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13830, `_xm_mesh`:13839, `_xm_tree`:13847

## 13880-14203  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13883, `_gt_surface`:13898, `_xm_grand_tree`:13908, `_lux_mat`:14023, `_lux_part`:14039, `_lux_box`:14042, `_lux_cyl`:14047, `_lux_ball`:14055, `_lux_new`:14063, `_lux_commit`:14068, `_lux_sofa_mesh`:14072, `_lux_chair_mesh`:14102, `_lux_table_mesh`:14122, `_lux_pouf_mesh`:14137, `_lux_batch`:14152, `_hub_christmas`:14168

## 14204-14359  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14205

## 14360-14608  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14363, `_vx_cyl`:14370, `_vx_ball`:14378, `_vx_ring`:14386, `_hub_polish`:14394, `_hub_gate`:14417, `_hub_vip`:14479, `_hub_glass`:14592

## 14609-14823  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14610, `_build_hub_bots`:14635, `_seat_of`:14666, `_bubble`:14676, `_emote`:14732, `_hub_people_tick`:14746

## 14824-14942  seats

`_seat_taken`:14825, `_nearest_seat`:14833, `_seat_label`:14845, `_sit`:14861, `_stand_up`:14905, `_seated_tick`:14924

## 14943-15099  game panel

`_build_game_panel`:14944, `_open_game_panel`:14999, `_refresh_game_panel`:15018, `_play_robot`:15063, `_peer_at`:15077, `_opponent_name`:15084, `_pay`:15092

## 15100-15220  tic-tac-toe

`_ttt_ready`:15103, `_ttt_winner`:15109, `_ttt_bot_move`:15119, `_ttt_tap`:15145, `_ttt_code`:15165, `_ttt_check`:15171, `_ttt_tick`:15194

## 15221-15272  rock paper scissors

`_rps_ready`:15222, `_rps_pick`:15228, `_rps_resolve`:15246, `_rps_tick`:15270

## 15273-15355  online table messages

`_online_game_send`:15274, `_hub_game_msg`:15280

## 15356-15431  comedy show

`_joke_start`:15357, `_joke_tick`:15369, `_speak`:15395, `_play_rimshot`:15404

## 15432-16331  quick chat and emotes

`_build_chat`:15454, `_chat_toggle_to`:15571, `_chat_log_add`:15579, `_chat_area`:15585, `_chat_near_count`:15603, `_chat_tick`:15612, `_toggle_chat`:15661, `_chat_fit`:15676, `_chat_clean`:15682, `_chat_wrap`:15699, `_chat_send_text`:15721, `_typing`:15744, `_say`:15747, `_do_emote`:15763, `_smoke_hub`:15772, `_chat_shots`:15946, `_cafe_shots`:15971, `_shop_shots`:16019, `_car_shots`:16068, `_outfit_shots`:16099, `_hub_shots`:16147, `_sg_on_terrace`:16282, `_people_only`:16285, `_people_only_keep_cars_out`:16289, `_car_barrier`:16301, `_hub_keep_cars_out`:16315

## 16332-16494  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16341, `_feed_add`:16350, `_feed_render`:16356, `_feed_tick`:16384, `_online_event_send`:16393, `_at_pvp_table`:16400, `_game_name`:16407, `_send_lfp`:16410, `_lfp_msg`:16427, `_accept_invite`:16448

## 16495-16735  v0.18.2: nickname and HUD relayout

`_nick_rude`:16507, `_clean_nick`:16522, `_build_nick_panel`:16534, `_open_nick`:16572, `_random_nick`:16581, `_save_nick`:16587, `_close_nick`:16606, `_refresh_nick_button`:16615, `_relayout_hud`:16619, `_smoke_nick`:16655, `_nick_shots`:16687, `_smoke_sites_reachable`:16705

## 16736-17023  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16762, `_nearest_civic`:16769, `_check_civic`:16783, `_discover_civic`:16796, `_civ_ranges`:16809, `_civ_has`:16823, `_civ_near_cross`:16829, `_build_civic`:16835, `_civic_token`:16961, `_civic_shots`:16978, `_hub_focus`:17000

## 17024-17133  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17095, `_in_rw_lot`:17098, `_box_batch_rot`:17101, `_multi_collider`:17119

## 17134-17461  circuit geometry

`_cr_point`:17135, `_rw_build_path`:17149, `_rw_dir`:17177, `_rw_bend`:17182, `_ribbon`:17188, `_rw_band`:17208, `_rw_keepout`:17226, `_build_raceway`:17235, `_build_rw_parking`:17269, `_build_rw_pits`:17314, `_build_rw_track`:17351, `_build_rw_trackside`:17392

## 17462-17559  race car rental

`_model_key`:17463, `_race_car_start`:17466, `_tint_ghost`:17504, `_race_car_end`:17517, `_race_keep_cars_out`:17542

## 17560-17574  speed effects

`_eff_max`:17561, `_eff_accel`:17572

## 17575-17625  track helpers

`_rw_seg_progress`:17576, `_rw_track_dist`:17596, `_rw_point_dist`:17607, `_rw_player_progress`:17614, `_rw_target`:17620

## 17626-17862  events

`_rec_stop`:17627, `_rw_place`:17643, `_rw_grid_pos`:17650, `_rw_start`:17655, `_rw_spawn_ai`:17687, `_rw_ai_place`:17711, `_rw_tick`:17722, `_rw_ai_tick`:17775, `_rw_lap_done`:17817, `_rw_finish`:17829, `_rw_fmt`:17860

## 17863-17915  boosters and spikes

`_rw_buy`:17864, `_rw_use_boost`:17882, `_rw_use_spike`:17890, `_rw_drop_spike_at`:17901

## 17916-17973  online races

`_race_msg`:17917, `_join_race`:17939

## 17974-18329  raceway panel, HUD, board

`_build_raceway_ui`:17975, `_rw_layout`:18035, `_rw_open`:18042, `_rw_close`:18048, `_rw_refresh_panel`:18052, `_rw_refresh_board`:18065, `_rw_hud`:18077, `_peer_car_model`:18101, `_smoke_raceway`:18111, `_race_shots`:18292

## 18330-18537  v0.22.0: Call Car

`_call_block_reason`:18336, `_call_spot`:18353, `_call_car`:18384, `_play_horn`:18408, `_smoke_follow_call`:18432, `_follow_shots`:18505

## 18538-18838  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18553, `_build_travel`:18559, `_toggle_run`:18601, `_refresh_run`:18605, `_hud_v23_tick`:18613, `_travel_block_reason`:18642, `_travel_open`:18662, `_open_travel`:18668, `_close_travel`:18674, `_refresh_travel`:18678, `_travel_to`:18686, `_smoke_travel`:18713, `_v23_shots`:18751

## 18839-18912  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:18846, `_qr_button`:18861, `_qr_layout`:18900, `_smoke_qr`:18906

## 18913-19349  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:18933, `_open_crate`:18949, `_build_crate_ui`:18966, `_crate_pick`:19053, `_crate_reveal`:19076, `_crate_draw_car`:19103, `_crate_confetti`:19122, `_crate_sound`:19147, `_crate_drive`:19173, `_feed_add_system`:19203, `_smoke_crate`:19206, `_crate_shots`:19254

## 19350-19841  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19391, `_quick_today`:19396, `_quick_is_done`:19399, `_quick_left`:19402, `_quick_next`:19409, `_quick_fix_target`:19422, `_quick_daily_check`:19436, `_quick_complete`:19450, `_quick_side`:19484, `_build_quick_props`:19502, `_daily_shots`:19654, `_quick_props_refresh`:19696, `_quick_fx`:19700, `_play_coin`:19716, `_smoke_quick`:19733

## 19842-19992  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:19851, `_quest_nearby`:19906, `_open_quests`:19913, `_close_quests`:19920, `_refresh_quests`:19924, `_quest_pick`:19950, `_quest_mode`:19964, `_smoke_quests`:19967

## 19993-20027  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:19997, `_my_tag_tick`:20000

## 20028-20342  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20045, `_fc_torus`:20055, `_fc_pearl`:20063, `_fc_chrome`:20073, `_fc_glass`:20082, `_fc_glow`:20092, `_fc_ghost`:20101, `_fc_holo`:20113, `_fc_mesh`:20123, `_fc_sphere`:20143, `_fc_capsule`:20151, `_fc_cone`:20159, `_build_food_court`:20168, `_food_court_tick`:20322

## 20343-20664  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20372, `_cm_bench`:20388, `_build_commons`:20401, `_commons_tick`:20623

## 20665-20979  v0.36: the daily puzzle

`_pz_today`:20688, `_pz_new`:20691, `_pz_neighbours`:20736, `_pz_flip`:20746, `_pz_done`:20751, `_pz_tap`:20759, `_pz_win`:20775, `_pz_reset`:20796, `_puzzle_near`:20800, `_open_puzzle`:20805, `_close_puzzle`:20813, `_pz_refresh_sign`:20817, `_build_puzzle_panel`:20825, `_pz_draw`:20856, `_smoke_chat`:20897, `_smoke_feet`:20935, `_smoke_commons`:20956

## 20980-21168  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21042, `_bio_theta`:21046, `_bio_sec_n`:21051, `_bio_sec_of`:21054, `_bio_pt`:21057, `_bio_lp`:21062, `_bio_la`:21066, `_bio_dir`:21070, `_bio_hex_r`:21073, `_bio_apo`:21078, `_bio_open_angles`:21084, `_bio_si`:21094, `_bm`:21100, `_bsph`:21105, `_blow`:21108, `_bcone`:21119, `_bbox`:21122, `_bp`:21125, `_bq`:21130, `_bio_glass_mat`:21134, `_bio_water_mat`:21147, `_bio_mat`:21159

## 21169-21541  building blocks

`_bio_inst`:21170, `_bio_add`:21176, `_bio_model`:21179, `_bio_nature_mesh`:21185, `_bio_flush`:21219, `_bio_bar`:21254, `_bio_slab`:21267, `_bio_body`:21282, `_bio_cyl_col`:21295, `_bio_hexmesh`:21308, `_bio_hexslab`:21320, `_bio_hexpt`:21326, `_bio_gridshell`:21333, `_bio_rail`:21440, `_bio_rail_arc`:21445, `_bio_disc_deck`:21457, `_bio_ring_deck`:21463, `_bio_helix`:21474, `_bio_pillar`:21494, `_bio_cafe`:21500, `_bio_fence_line`:21514, `_bio_fence_seg`:21519, `_bio_pen`:21529

## 21542-22043  building

`_build_biosphere`:21543, `_build_biosphere_legacy`:21547, `_bio_text`:21709, `_bio_plaque`:21727, `_bio_ticket_hall`:21741, `_on_foot_collision_guard`:21797, `_bio_inside`:21807, `_bio_pass_ok`:21810, `_ticket_near`:21814, `_bio_buy_pass`:21819, `_bio_gates_update`:21835, `_bio_gate_tick`:21861, `_bio_tunnel`:21873, `_bio_grounds`:21926, `_bio_dome`:21972, `_bio_deck_mats`:22040

## 22044-22199  garden planting

`_bio_free`:22045, `_bio_spot`:22062, `_bio_garden`:22070, `_bio_pine`:22111, `_bio_tree`:22114, `_bio_big_tree`:22124, `_bio_rock`:22129, `_bio_pond`:22132, `_bio_particles`:22136, `_bio_mist`:22164, `_bio_mini_dome`:22193

## 22200-22607  the four layouts

`_bio_winter`:22201, `_bio_spring`:22293, `_bio_summer`:22418, `_bio_autumn`:22502

## 22608-22878  animals

`_bio_spawn`:22609, `_bio_load_animal`:22681, `_bio_make_quad`:22702, `_bio_load_bird`:22779, `_bio_make_penguin`:22799, `_bio_make_bird`:22821, `_bio_make_flamingo`:22845, `_bio_make_butterfly`:22866

## 22879-23010  animation, spotting and rewards

`_bio_stuck_check`:22884, `_biosphere_tick`:22902, `_bio_animate`:22911, `_bio_spot_check`:22991, `_bio_spotted`:23003, `_smoke_biosphere`:23007

## 23011-23528  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23098, `_wear_piece`:23101, `_wear_mat`:23124, `_person_index`:23140, `_dress`:23163, `_smoke_style`:23269, `_style_shots`:23420, `_npc_look`:23492

## 23529-23682  your look: apply, save, share

`_look_clean`:23533, `_look_pack`:23548, `_owns`:23554, `_apply_look`:23559, `_relic_model`:23570, `_fc_mesh_mat`:23635, `_relic_refresh`:23638, `_relic_tick`:23652, `_peer_style`:23663

## 23683-24110  stores and the wardrobe

`_style_today`:23702, `_style_items`:23705, `_style_cat`:23713, `_style_price`:23716, `_style_deal`:23730, `_style_price_base`:23743, `_relic_stock`:23750, `_build_style_panel`:23762, `_open_store`:23802, `_open_wardrobe`:23821, `_style_close`:23824, `_style_finish`:23828, `_sync_old_avatar`:23843, `_style_tabs_for`:23850, `_refresh_style`:23855, `_style_body_rows`:24006, `_style_set_tab`:24023, `_style_step`:24027, `_style_color`:24032, `_style_pick`:24037, `_style_buy`:24072, `_ach_relics_check`:24094, `_style_face_camera`:24099

## 24111-24578  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24147, `_ga_text`:24153, `_ga_box`:24170, `_build_galleria`:24186, `_ga_inner_tick`:24327, `_ga_shell`:24343, `_ga_inside`:24393, `_bio_cyl_col_on`:24396, `_ga_models`:24408, `_ga_lbox`:24423, `_ga_ltext`:24437, `_ga_store`:24444, `_bio_cafe_on`:24546, `_ga_mannequins`:24554

## 24579-24730  featured outfits and the Sky Run

`_ga_featured_look`:24592, `_build_ga_fun`:24613, `_ga_fun_tick`:24658, `_sky_finish`:24685, `_extra_near`:24704, `_extra_open`:24713, `_store_near`:24722

## 24731-24827  v0.41: THE SKY GARDEN

`_sg_now`:24785, `_sg_progress`:24788, `_sg_time`:24794, `_sg_stock`:24801, `_sg_mut_roll`:24816

## 24828-24965  building

`_sg_box`:24829, `_sg_text`:24835, `_build_sky_garden`:24849, `_sg_seed_spot`:24960, `_sg_codex_spot`:24963

## 24966-25146  plants

`_sg_plant_model`:24967, `_sg_refresh_all`:25072, `_sg_refresh`:25076, `_sky_garden_tick`:25112, `_sg_ready_count`:25131, `_sg_boot_note`:25138

## 25147-25266  interacting

`_sg_near`:25148, `_sg_button_text`:25171, `_sg_value`:25184, `_sg_interact`:25188, `_sg_buy`:25204, `_sg_plant`:25226, `_sg_harvest`:25237

## 25267-25510  the garden screen

`_build_sg_panel`:25268, `_sg_open`:25303, `_sg_close`:25312, `_sg_row`:25316, `_sg_refresh_panel`:25331, `_sg_pick_buy`:25376, `_sg_pick_plant`:25380, `_smoke_car_barriers`:25386, `_smoke_sky_garden`:25427

## 25511-25549  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25542, `_pass_day`:25545

## 25550-25581  album

`_album_pages`:25551, `_album_claim`:25566

## 25582-25633  season

`_season_index`:25583, `_season_tick`:25586, `_season_xp`:25595, `_season_tier`:25598, `_season_reward`:25601, `_season_claim`:25615

## 25634-25641  Harbor Night

`_harbor_night`:25635

## 25642-25673  check-in calendar

`_cal_tick`:25643

## 25674-25850  the panel

`_build_hp_panel`:25675, `_open_pass`:25710, `_hp_open`:25713, `_hp_close`:25720, `_hp_row`:25724, `_hp_bar`:25739, `_hp_refresh`:25743, `_smoke_pass`:25788

## 25851-26065  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:25855, `_cash_pill_tick`:25863, `_build_lb`:25901, `_open_lb`:25944, `_close_lb`:25952, `_lb_pick`:25956, `_lb_headers`:25961, `_lb_url`:25965, `_lb_me`:25968, `_lb_tick`:25971, `_lb_upload`:25979, `_lb_fetch`:25989, `_lb_got`:25997, `_lb_value`:26008, `_lb_refresh_ui`:26019

## 26066-26489  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26090, `_market_near`:26167, `_build_gear`:26177, `_gear_piece`:26185, `_build_pet`:26230, `_market_apply`:26272, `_market_tick`:26296, `_build_market_panel`:26318, `_open_market`:26344, `_close_market`:26351, `_refresh_market`:26355, `_market_pick`:26408, `_toggle_board`:26446, `_board_tick`:26453

## 26490-26731  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26522, `_ds_label`:26541, `_build_display`:26555, `_ds_got`:26634, `_ds_sorted`:26643, `_ds_render_board`:26657, `_ds_render_news`:26683, `_display_tick`:26702

## 26732-26910  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26749, `_toggle_streamer`:26836, `_streamer_badge_tap`:26852, `_streamer_tick`:26856

## 26911-26947  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:26917, `_car_back`:26924, `_car_park_tick`:26931

## 26948-27044  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:26952, `_bus_eta`:27006, `_bus_displays_tick`:27022

## 27045-27336  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27063, `_treasure_pick`:27066, `_treasure_spot`:27075, `_treasure_district`:27079, `_treasure_clue`:27091, `_treasure_prop`:27104, `_tp_part`:27107, `_tp_sphere`:27117, `_tp_cyl`:27125, `_treasure_prop_side`:27134, `_build_treasure_props`:27146, `_build_treasure`:27190, `_treasure_dir_char`:27259, `_treasure_tick`:27268, `_treasure_claim`:27322

## 27337-27437  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27338, `_halo_mat`:27370, `_smoke_treasure`:27395

## 27438-27761  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27459, `_fm_send`:27462, `_fm_area`:27468, `_fm_glow_mesh`:27484, `_fm_block_reason`:27502, `_fm_start`:27514, `_fm_announce`:27542, `_fm_finish`:27545, `_fm_msg`:27563, `_fm_check_paid`:27614, `_fm_tick`:27632, `_smoke_findme`:27688

## 27762-27872  v0.24.2: road map (for moving people off the road)

`_floor_note`:27768, `_floor_disc`:27782, `_floor_top`:27791, `_ground_at`:27809, `_note_road`:27827, `_on_road`:27834, `_ped_curb`:27844, `_curb_spot`:27854

## 27873-28168  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27895, `_ex_grid`:27903, `_ex_lamps`:27938, `_ex_umbrella`:27961, `_ex_yards`:27968, `_build_expansion`:27983, `_expand_shots`:28146

## 28169-28363  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28210, `_v27_near_cross`:28302, `_v27_near_any_road`:28309, `_v27_in_district`:28315, `_sea_tick`:28329, `_sea_tow`:28348

## 28364-29031  Harbor Loop sky train

`_sky_build_path`:28415, `_sky_pos`:28456, `_sky_dir`:28470, `_sky_project`:28475, `_sky_trip_time`:28494, `_sky_trip_dist`:28500, `_sky_now`:28511, `_sky_state`:28514, `_sky_time_at_station`:28529, `_sky_next_arrival`:28536, `_build_skytrain`:28549, `_sky_make_car`:28701, `_sky_skin`:28738, `_sky_place_trains`:28758, `_sky_build_station`:28777, `_sky_near`:28842, `_sky_fmt`:28851, `_sky_enter`:28855, `_sky_leave_platform`:28873, `_sky_board`:28883, `_sky_alight`:28897, `_sky_action`:28911, `_sky_tick`:28928, `_sky_camera`:28968, `_tour_today`:28984, `_tour_stamp`:28987, `_sky_hud`:29010

## 29032-29392  Day and night

`_toggle_weather`:29115, `_refresh_weather_button`:29121, `_game_hour`:29127, `_day_key`:29139, `_night_setup`:29154, `_night_scan_mesh`:29244, `_daynight_tick`:29269, `_daynight_apply`:29276, `_daynight_lights`:29377, `_cycle_day_mode`:29382, `_refresh_time_button`:29389

## 29393-30028  v0.27 smoke test and screenshots

`_smoke_v27`:29394, `_city_shots`:29597

## 30029-30445  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30063, `_ap_plane`:30239, `_ap_truck`:30259, `_ap_baggage_train`:30300, `_ap_loop_pos`:30313, `_ap_loop_len`:30329, `_ap_flight_at`:30335, `_ap_tick`:30359, `_airport_ped_plan`:30382, `_smoke_airport`:30402

## 30446-30959  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30460, `_nav_spot`:30467, `_nav_idx`:30471, `_nav_pos`:30478, `_nav_blocked`:30482, `_nav_nearest_free`:30492, `_nav_bfs`:30520, `_nav_build`:30564, `_stroller`:30635, `_stroll_place`:30651, `_stroll_next`:30672, `_nav_clear_line`:30706, `_stroll_aim`:30717, `_strollers_tick`:30749, `_smoke_strollers`:30844

## 30960-31120  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:30995, `_dir_fmt`:30998, `_signpost_spot`:31001, `_build_signposts`:31018

## 31121-31217  the Directions panel and chip

`_build_dir_panel`:31122, `_open_dir`:31164, `_dir_close`:31173, `_dir_pick`:31177, `_dir_stop`:31182, `_dir_stop_and_close`:31187, `_dir_tick`:31191

## 31218-31759  v0.44: Grand Central

`_gc_mesh`:31247, `_gc_mat`:31280, `_gc_glass`:31289, `_gb`:31299, `_gb_solid`:31305, `_gb_flush`:31309, `_gc_tree`:31339, `_gc_text`:31344, `_gc_planter`:31359, `_gc_kiosk`:31365, `_goods_color`:31395, `_goods_mat`:31398, `_kiosk_goods`:31402, `_build_grand_central`:31480, `_build_gc_towers`:31648, `_gc_tick`:31743

## 31760-32051  v0.44: filling the empty land

`_loft`:31777, `_fill_clear`:31819, `_build_fill`:31829, `_hg_in_lake`:31877, `_hg_path`:31881, `_floor_note_rot`:31889, `_build_gardens`:31897, `_build_fan_plaza`:32007

## 32052-32086  v0.45: hover car underglow

`_car_underglow`:32055

## 32087-32251  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32088

## 32252-32283  v0.47: street stalls downtown

`_build_street_stalls`:32256, `_cull_people_in`:32276

## 32284-32382  v0.48: places that open as you level up

`_place_lock_of`:32297, `_place_root`:32303, `_place_unlocked`:32306, `_build_place_signs`:32314, `_places_refresh`:32359, `_places_tick`:32376

## 32383-32427  v0.50: city careers

`_career_rank_name`:32408, `_career_mult`:32411, `_career_block_reason`:32416, `_career_start`:32419, `_career_end`:32424

## 32428-32478  v0.52: careers as clear job loops

`_cid`:32455, `_career_target`:32469, `_career_tick`:32476

## 32479-32486  taxi

`_taxi_meter`:32480

## 32487-32490  paramedic

(no functions)

## 32491-32495  police

`_career_chase_over`:32493

## 32496-32501  firefighter

`_fire_aimed`:32497

## 32502-32511  the step bar

`_career_bar_text`:32505, `_career_hud`:32509

## 32512-32538  cut scenes

`_cs_skip`:32530

## 32539-32543  siren

(no functions)

## 32544-32555  the Careers panel

`_build_career_panel`:32545, `_open_careers`:32548, `_career_close`:32552

## 32556-32979  v0.50: homes

`_home_door_spots`:32596, `_build_homes`:32611, `_home_labels`:32640, `_home_door_near`:32649, `_home_origin`:32658, `_home_slot_near`:32661, `_home_exit_near`:32672, `_home_btn`:32679, `_home_interact`:32692, `_home_buy`:32711, `_home_default_layout`:32725, `_home_enter`:32733, `_home_leave`:32753, `_hm`:32761, `_home_build_room`:32780, `_home_refresh_room`:32889, `_furni_build`:32903

## 32980-33315  decorating

`_build_home_panels`:32981, `_open_homes`:33026, `_home_row_go`:33036, `_home_panel_close`:33056, `_deco_open`:33060, `_deco_pick`:33083, `_smoke_careers_homes`:33106

## 33316-33450  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33320, `_home_slots`:33328, `_home_ring`:33355, `_furni_cat`:33361, `_home_fix_layout`:33367, `_home_build_layout`:33395

## 33451-33884  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33514, `_ch_homes`:33520, `_ch_step_text`:33527, `_ch_step_done`:33538, `_ch_target`:33552, `_ch_finish_chapter`:33561, `_chapters_tick`:33583, `_hud_top_stack`:33623, `_build_chapters_ui`:33653, `_chapters_restart_ask`:33695, `_chapters_restart`:33698, `_chapters_text`:33708, `_open_chapters`:33728, `_chapters_close`:33735, `_smoke_chapters`:33739, `_step_sound`:33860

## 33885-33923  v0.51.1: join and leave messages

`_announce_join`:33892, `_announce_already_here`:33911, `_announce_leave`:33919

## 33924-34188  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33940, `_shot_tick`:33946, `_draw_shot_icon`:33978, `_shot_enter`:33987, `_shot_exit`:34001, `_shot_release_controls`:34013, `_shot_stick_zone`:34020, `_shot_input`:34023, `_smoke_photo`:34095

## 34189-34487  v0.51.3: stream joiners

`_viewer_count`:34209, `_stream_join_check`:34215, `_stream_join_start`:34222, `_sj_streamer`:34239, `_stream_join_tick`:34248, `_stream_join_land`:34272, `_sj_welcome`:34288, `_smoke_stream_join`:34322, `_career_shot`:34405

## 34488-34604  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34492, `_st_restore`:34530, `_smoke_streamer_clean`:34551, `_world_bio_passport`:34602

