# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-638  Core (unlabelled)

`_symbol_font`:290, `_ready`:302, `_surf_texture`:581, `_surface_material`:603

## 639-711  v0.34.6: futuristic towers for the old city

`_future_tower`:643

## 712-790  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:719, `_skin_common`:754, `_future_wall`:762, `_future_roof`:776, `_future_pave`:784

## 791-851  v0.34.4: futuristic road surface

`_road_textures`:798, `_future_road`:832

## 852-2060  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:871, `_real_tex`:912, `_real_setup`:920, `_real_kind`:941, `_realify`:947, `_real_glass`:984, `_make_window_textures`:1004, `_material`:1037, `_box`:1062, `_sign`:1084, `_build_world`:1096, `_future_kiosk`:1207, `_build_collectibles`:1233, `_auto_collect_tick`:1266, `_find_count`:1287, `_nearest_find`:1294, `_destination`:1308, `_toggle_activity`:1344, `_collect_find`:1373, `_owned_count`:1388, `_ridge_open`:1395, `_ridge_count`:1399, `_nearest_ridge`:1406, `_apply_car`:1420, `_tune_level`:1450, `_tune_cost`:1453, `_car_stats`:1459, `_buy_tune`:1466, `_open_tune`:1487, `_back_to_garage`:1493, `_refresh_tune`:1497, `_bay_open`:1508, `_area_open`:1511, `_bay_count`:1514, `_nearest_bay`:1521, `_build_bay`:1535, `_check_bay`:1588, `_discover_bay`:1601, `_north_count`:1614, `_north_open`:1621, `_nearest_north`:1624, `_check_north`:1638, `_discover_north`:1651, `_prop`:1664, `_collider`:1678, `_first_mesh`:1688, `_scatter`:1697, `_prop_stretch`:1731, `_north_token`:1740, `_nm_roads`:1767, `_prop_big`:1782, `_nm_near_cross`:1798, `_build_north`:1805, `_build_nm_blocks`:1922, `_build_north_landscape`:2007, `_nm_free`:2034, `_build_landscape`:2044

## 2061-2552  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2062, `_online_toggle`:2076, `_online_autostart`:2102, `_online_connect`:2121, `_online_stop`:2128, `_online_next_ref`:2139, `_online_send`:2143, `_online_join_frame`:2147, `_online_pos_frame`:2150, `_online_tick`:2159, `_online_handle`:2193, `_online_clean_name`:2253, `_online_peer_update`:2262, `_online_make_peer`:2332, `_peer_look`:2373, `_online_tint`:2430, `_paint_mat`:2446, `_online_update_peers`:2458, `_online_clear_peers`:2538, `_online_refresh_button`:2543

## 2553-2725  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2633, `_marina_count`:2636, `_nearest_marina`:2643, `_check_marina`:2657, `_discover_marina`:2670, `_shop_available`:2683, `_nearest_shop`:2686, `_premium_cars`:2694, `_glass`:2701, `_shop_building`:2707, `_shop_pad`:2717

## 2726-3244  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2727, `_bus_last`:2730, `_build_bus`:2733, `_bus_boxes`:2760, `_bus_skin`:2770, `_bus_side`:2783, `_bus_reset`:2786, `_bus_text`:2795, `_bus_tick`:2800, `_bus_near`:2840, `_bus_board`:2851, `_bus_alight`:2866, `_build_marina`:2880, `_set_hat`:2989, `_build_hat`:2992, `_cyl`:3057, `_hat_part`:3066, `_apply_avatar`:3075, `_shop_count`:3087, `_shop_open`:3097, `_shop_step`:3115, `_shop_close`:3121, `_owned_text`:3134, `_refresh_shop`:3137, `_shop_action`:3190, `_journal_flip`:3241

## 3245-3299  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3256, `_xp`:3259, `_level_for`:3266, `_level`:3274, `_level_text`:3277, `_check_level`:3287

## 3300-3402  v0.11.0: online police vs thief

`_orole_ready`:3301, `_orole_start`:3304, `_orole_end`:3331, `_orole_tick`:3340

## 3403-4351  v0.10.0: chase mode (offline)

`_chase_open`:3404, `_chase_clear`:3409, `_chase_make_unit`:3423, `_chase_spawn_point`:3453, `_chase_start`:3462, `_chase_end`:3498, `_chase_steer`:3517, `_chase_roadblock`:3553, `_chase_heli_build`:3598, `_chase_extras`:3624, `_chase_tick`:3651, `_start_trial`:3715, `_cancel_trial`:3742, `_check_trial`:3747, `_finish_trial`:3764, `_trial_count`:3780, `_open_trials`:3787, `_refresh_trials`:3791, `_update_gate`:3803, `_slab`:3821, `_build_ridge`:3839, `_check_ridge`:3907, `_discover`:3920, `_mission_progress`:3934, `_check_missions`:3996, `_open_garage`:4007, `_open_journal`:4012, `_close_sub`:4017, `_bar`:4020, `_refresh_garage`:4024, `_garage_step`:4049, `_garage_action`:4053, `_refresh_journal`:4073, `_visited_shops`:4106, `_build_panels`:4113, `_build_player`:4273, `_build_car`:4311, `_try_model`:4340

## 4352-5036  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4353, `_kshader`:4427, `_ksync`:4433, `_kskin`:4448, `_make_kperson`:4454, `_hat_y`:4518, `_sit_drop`:4521, `_kplay`:4524, `_kpeople_tick`:4534, `_pose_person`:4563, `_pose_limbs`:4580, `_person_lift`:4642, `_snap_crowd_feet`:4655, `_people_life_tick`:4671, `_life_one`:4708, `_cull_person`:4718, `_recolor_car_model`:4726, `_apply_car_model`:4740, `_landmark`:4760, `_label`:4770, `_button`:4777, `_panel`:4789, `_build_hud`:4799

## 5037-5155  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:5043, `_menu_tab`:5049, `_watch_tick`:5072, `_watch_count`:5114, `_online_pill_tap`:5121, `_online_pill_tick`:5127, `online_config_ok`:5153

## 5156-5193  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5159, `_offroad`:5165, `_ground_near`:5178, `_collectibles_on_road`:5185

## 5194-5333  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5206, `_build_quest_offer`:5210, `_quest_offer_tick`:5240, `_quest_auto_pick`:5290, `_quest_accept`:5305, `_quest_decline`:5319, `_quest_stop`:5325

## 5334-5701  v0.31: a futuristic Bonkers City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5358, `_holo_material`:5367, `_build_future`:5375, `_build_neon`:5389, `_model_profile`:5458, `_model_body_box`:5481, `_build_holograms`:5495, `_holo_tick`:5545, `_build_sky_traffic`:5562, `_sky_hover_car`:5580, `_sky_drone`:5627, `_sky_traffic_tick`:5671, `_future_lights`:5690

## 5702-6201  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5761, `_crew_col`:5769, `_peer_crewmate`:5772, `_set_ring_color`:5775, `_level_color`:5802, `_tier_color`:5815, `_my_ach_tier`:5818, `_style_ring`:5825, `_social_peer_extras`:5873, `_social_tag`:5887, `_my_tag_extra`:5899, `_soc_send`:5912, `_social_msg`:5927, `_social_accept`:5966, `_social_go`:5987, `_soc_friend`:6006, `_soc_invite`:6013, `_soc_goto`:6018, `_soc_high_five`:6026, `_soc_gift`:6046, `_soc_crew_invite`:6063, `_gift_day_check`:6070, `_crew_create`:6076, `_crew_cycle_color`:6086, `_crew_leave`:6091, `_crew_mate_near`:6099, `_crew_board`:6107, `_build_social`:6126, `_social_online`:6188, `_open_social`:6192, `_close_social`:6198

## 6202-6452  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6205, `_track_pos`:6214, `_social_row_button`:6225, `_refresh_social`:6232, `_on_dance_floor`:6294, `_toggle_dance`:6297, `_build_dance_floor`:6305, `_social_tick`:6331, `_photo`:6403

## 6453-6948  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6475, `_game_state`:6483, `_build_arcade`:6495, `_c4_empty`:6546, `_c4_drop_row`:6552, `_c4_winner`:6558, `_c4_bot_move`:6579, `_c4_code`:6608, `_c4_ready`:6614, `_c4_tap`:6617, `_c4_check`:6638, `_c4_tick`:6662, `_rx_ready`:6689, `_rx_start`:6692, `_rx_tap`:6706, `_rx_send_time`:6731, `_rx_resolve`:6738, `_rx_tick`:6764, `_mem_start`:6779, `_mem_tap`:6795, `_mem_finish`:6810, `_mem_tick`:6826, `_mem_board_text`:6833, `_build_arcade_panel`:6844, `_refresh_arcade_panel`:6887

## 6949-7242  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:7012, `_quiz_slot`:7015, `_quiz_question`:7025, `_quiz_bot_score`:7054, `_in_quiz`:7063, `_build_quiz`:7066, `_quiz_answer`:7136, `_quiz_msg`:7149, `_quiz_board`:7157, `_quiz_tick`:7167, `_quiz_refresh`:7209

## 7243-8843  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7414, `_sites_found`:7417, `_sites_total`:7420, `_bits`:7423, `_ach_value`:7430, `_ach_tick`:7485, `_ach_check`:7510, `_ach_by_id`:7546, `_ach_msg`:7552, `_build_ach`:7565, `_ach_show`:7596, `_open_ach`:7616, `_close_ach`:7622, `_refresh_ach`:7626, `_ach_num`:7657, `_minimap_tap`:7660, `_menu_go`:7667, `_menu_stay`:7672, `_menu_call_car`:7676, `_toggle_clean_hud`:7682, `_refresh_menu_buttons`:7688, `_clean_hud_tick`:7698, `_draw_joystick`:7739, `_input`:7744, `_touch_text_focus`:7843, `_stick_zone`:7863, `_notification`:7867, `_physics_process`:7884, `_follow_camera`:8040, `_follow_walk_camera`:8082, `_interact`:8105, `_refresh_hud`:8267, `_open_panel`:8396, `_layout_panels`:8426, `_toggle_menu`:8453, `_rescue`:8499, `_show_toast`:8531, `_save_progress`:8535, `_load_progress`:8632

## 8844-11604  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8845, `_radio_voice`:8848, `_radio_make`:8881, `_radio_set`:8952, `_radio_play`:8974, `_radio_next`:8979, `_radio_talk_line`:8983, `_radio_caption`:9004, `_radio_refresh`:9012, `_process`:9025, `_build_peds`:9076, `_update_peds`:9187, `_update_ped`:9206, `_smoke_test`:9260, `_smoke_chase`:9913, `_smoke_orole`:9946, `_smoke_levels`:9975, `_smoke_bus`:10016, `_smoke_chase_extras`:10101, `_smoke_marina`:10129, `_blocked_at`:10231, `_blocker`:10246, `_on_screen`:10259, `_wait_radio`:10264, `_smoke_radio_peds`:10271, `_smoke_typed_chat`:10341, `_smoke_chat_touch`:10360, `_smoke_cafe`:10381, `_smoke_boutique`:10407, `_smoke_models`:10435, `_smoke_garage_ridge`:10459, `_save_shot`:10835, `_sky_shots`:10845, `_pet_shots`:10874, `_tracker_shots`:10909, `_infected_shots`:10943, `_legend_shots`:10994, `_boss_shots`:11025, `_paris_shots`:11122, `_people_shots`:11352, `_shots`:11393, `_shot_car`:11587, `_capture_preview`:11597

## 11605-12253  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11672, `_downtown_count`:11675, `_nearest_downtown`:11682, `_check_downtown`:11696, `_discover_downtown`:11709, `_box_batch`:11723, `_model_batch`:11743, `_cut_ranges`:11797, `_dt_ranges`:11809, `_dt_has`:11816, `_dt_near_cross`:11822, `_place`:11828, `_signal_pole`:11839, `_cyl_batch`:11858, `_city_signals`:11882, `_ensure_light_mats`:11933, `_city_lamps`:11943, `_build_downtown`:11987, `_dt_block`:12187, `_downtown_token`:12193, `_build_park`:12210, `_build_plaza`:12239

## 12254-12357  old city and Bay details

`_build_city_detail`:12255

## 12358-12767  traffic

`_build_traffic`:12359, `_path_sample`:12454, `_light_look`:12468, `_light_green`:12476, `_traffic_place`:12480, `_traffic_blocked_by`:12492, `_traffic_tick`:12504, `_smoke_downtown`:12610, `_skyline_shot`:12722, `_skyline_shots`:12730

## 12768-13135  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12814, `_web_scale`:12877, `_web_fps_tick`:12887, `_world_to_uv`:12911, `_map_angle`:12914, `_build_minimap`:12922, `_open_map`:12995, `_close_map`:13006, `_mini_point`:13013, `_site_markers`:13017, `_draw_arrow`:13049, `_draw_minimap`:13056, `_draw_full_map`:13103, `_minimap_tick`:13128

## 13136-13416  camera views

`_build_view_controls`:13137, `_sky_grade`:13179, `_cycle_view`:13194, `_apply_view`:13204, `_hide_labels`:13248, `_unfade`:13254, `_bake_map`:13260, `_shot_stats`:13310, `_view_shots`:13313, `_smoke_views`:13354

## 13417-13664  v0.17.0: level-up celebration

`_build_level_fx`:13428, `_draw_level_rays`:13465, `_level_fx_tick`:13475, `_level_sound`:13480, `_fx_material`:13522, `_level_up_fx`:13530, `_smoke_level_fx`:13631, `_levelup_shots`:13640

## 13665-13786  v0.18.0: walk-in stadium

`_collider_yaw`:13670, `_build_stadium_walls`:13681, `_look`:13709, `_smoke_stadium_eye`:13718, `_stadium_shots`:13756

## 13787-13948  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13811, `_arrow_mesh`:13823, `_build_guidance`:13846, `_guide_target`:13871, `_guidance_tick`:13900, `_draw_hud_arrow`:13926

## 13949-14134  checkpoints

`_build_checkpoints`:13950, `_refresh_checkpoints`:13995, `_check_checkpoints`:14001, `_activate_checkpoint`:14011, `_checkpoint_spawn`:14032, `_spawn_at_checkpoint`:14037, `_draw_checkpoint_icon`:14053, `_smoke_guidance_checkpoints`:14059, `_guide_shots`:14109

## 14135-14413  v0.18.0: Harbor Dome social hub

`_hub_seat`:14193, `_build_hub`:14197

## 14414-14464  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14415, `_xm_mesh`:14424, `_xm_tree`:14432

## 14465-14788  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14468, `_gt_surface`:14483, `_xm_grand_tree`:14493, `_lux_mat`:14608, `_lux_part`:14624, `_lux_box`:14627, `_lux_cyl`:14632, `_lux_ball`:14640, `_lux_new`:14648, `_lux_commit`:14653, `_lux_sofa_mesh`:14657, `_lux_chair_mesh`:14687, `_lux_table_mesh`:14707, `_lux_pouf_mesh`:14722, `_lux_batch`:14737, `_hub_christmas`:14753

## 14789-14944  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14790

## 14945-15193  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14948, `_vx_cyl`:14955, `_vx_ball`:14963, `_vx_ring`:14971, `_hub_polish`:14979, `_hub_gate`:15002, `_hub_vip`:15064, `_hub_glass`:15177

## 15194-15408  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:15195, `_build_hub_bots`:15220, `_seat_of`:15251, `_bubble`:15261, `_emote`:15317, `_hub_people_tick`:15331

## 15409-15527  seats

`_seat_taken`:15410, `_nearest_seat`:15418, `_seat_label`:15430, `_sit`:15446, `_stand_up`:15490, `_seated_tick`:15509

## 15528-15684  game panel

`_build_game_panel`:15529, `_open_game_panel`:15584, `_refresh_game_panel`:15603, `_play_robot`:15648, `_peer_at`:15662, `_opponent_name`:15669, `_pay`:15677

## 15685-15805  tic-tac-toe

`_ttt_ready`:15688, `_ttt_winner`:15694, `_ttt_bot_move`:15704, `_ttt_tap`:15730, `_ttt_code`:15750, `_ttt_check`:15756, `_ttt_tick`:15779

## 15806-15857  rock paper scissors

`_rps_ready`:15807, `_rps_pick`:15813, `_rps_resolve`:15831, `_rps_tick`:15855

## 15858-15940  online table messages

`_online_game_send`:15859, `_hub_game_msg`:15865

## 15941-16016  comedy show

`_joke_start`:15942, `_joke_tick`:15954, `_speak`:15980, `_play_rimshot`:15989

## 16017-16916  quick chat and emotes

`_build_chat`:16039, `_chat_toggle_to`:16156, `_chat_log_add`:16164, `_chat_area`:16170, `_chat_near_count`:16188, `_chat_tick`:16197, `_toggle_chat`:16246, `_chat_fit`:16261, `_chat_clean`:16267, `_chat_wrap`:16284, `_chat_send_text`:16306, `_typing`:16329, `_say`:16332, `_do_emote`:16348, `_smoke_hub`:16357, `_chat_shots`:16531, `_cafe_shots`:16556, `_shop_shots`:16604, `_car_shots`:16653, `_outfit_shots`:16684, `_hub_shots`:16732, `_sg_on_terrace`:16867, `_people_only`:16870, `_people_only_keep_cars_out`:16874, `_car_barrier`:16886, `_hub_keep_cars_out`:16900

## 16917-17082  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16926, `_feed_add`:16935, `_feed_render`:16941, `_feed_tick`:16969, `_online_event_send`:16978, `_at_pvp_table`:16985, `_game_name`:16992, `_send_lfp`:16995, `_lfp_msg`:17012, `_accept_invite`:17033

## 17083-17324  v0.18.2: nickname and HUD relayout

`_nick_rude`:17095, `_clean_nick`:17110, `_build_nick_panel`:17122, `_open_nick`:17160, `_random_nick`:17169, `_save_nick`:17175, `_close_nick`:17194, `_refresh_nick_button`:17203, `_relayout_hud`:17207, `_smoke_nick`:17244, `_nick_shots`:17276, `_smoke_sites_reachable`:17294

## 17325-17612  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17351, `_nearest_civic`:17358, `_check_civic`:17372, `_discover_civic`:17385, `_civ_ranges`:17398, `_civ_has`:17412, `_civ_near_cross`:17418, `_build_civic`:17424, `_civic_token`:17550, `_civic_shots`:17567, `_hub_focus`:17589

## 17613-17722  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17684, `_in_rw_lot`:17687, `_box_batch_rot`:17690, `_multi_collider`:17708

## 17723-18050  circuit geometry

`_cr_point`:17724, `_rw_build_path`:17738, `_rw_dir`:17766, `_rw_bend`:17771, `_ribbon`:17777, `_rw_band`:17797, `_rw_keepout`:17815, `_build_raceway`:17824, `_build_rw_parking`:17858, `_build_rw_pits`:17903, `_build_rw_track`:17940, `_build_rw_trackside`:17981

## 18051-18148  race car rental

`_model_key`:18052, `_race_car_start`:18055, `_tint_ghost`:18093, `_race_car_end`:18106, `_race_keep_cars_out`:18131

## 18149-18163  speed effects

`_eff_max`:18150, `_eff_accel`:18161

## 18164-18214  track helpers

`_rw_seg_progress`:18165, `_rw_track_dist`:18185, `_rw_point_dist`:18196, `_rw_player_progress`:18203, `_rw_target`:18209

## 18215-18451  events

`_rec_stop`:18216, `_rw_place`:18232, `_rw_grid_pos`:18239, `_rw_start`:18244, `_rw_spawn_ai`:18276, `_rw_ai_place`:18300, `_rw_tick`:18311, `_rw_ai_tick`:18364, `_rw_lap_done`:18406, `_rw_finish`:18418, `_rw_fmt`:18449

## 18452-18504  boosters and spikes

`_rw_buy`:18453, `_rw_use_boost`:18471, `_rw_use_spike`:18479, `_rw_drop_spike_at`:18490

## 18505-18562  online races

`_race_msg`:18506, `_join_race`:18528

## 18563-18918  raceway panel, HUD, board

`_build_raceway_ui`:18564, `_rw_layout`:18624, `_rw_open`:18631, `_rw_close`:18637, `_rw_refresh_panel`:18641, `_rw_refresh_board`:18654, `_rw_hud`:18666, `_peer_car_model`:18690, `_smoke_raceway`:18700, `_race_shots`:18881

## 18919-19126  v0.22.0: Call Car

`_call_block_reason`:18925, `_call_spot`:18942, `_call_car`:18973, `_play_horn`:18997, `_smoke_follow_call`:19021, `_follow_shots`:19094

## 19127-19584  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:19152, `_place_portal_button`:19158, `_portal_pressed`:19165, `_build_travel`:19173, `_toggle_run`:19278, `_refresh_run`:19282, `_hud_v23_tick`:19290, `_travel_block_reason`:19322, `_travel_open`:19342, `_open_travel`:19348, `_open_worlds`:19354, `_open_case`:19360, `_case_step`:19372, `_case_refresh`:19376, `_case_submit`:19380, `_close_case`:19389, `_sky_go`:19393, `_close_worlds`:19403, `_refresh_worlds`:19407, `_world_go`:19413, `_close_travel`:19420, `_refresh_travel`:19424, `_travel_to`:19432, `_smoke_travel`:19459, `_v23_shots`:19497

## 19585-19658  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19592, `_qr_button`:19607, `_qr_layout`:19646, `_smoke_qr`:19652

## 19659-20095  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19679, `_open_crate`:19695, `_build_crate_ui`:19712, `_crate_pick`:19799, `_crate_reveal`:19822, `_crate_draw_car`:19849, `_crate_confetti`:19868, `_crate_sound`:19893, `_crate_drive`:19919, `_feed_add_system`:19949, `_smoke_crate`:19952, `_crate_shots`:20000

## 20096-20587  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:20137, `_quick_today`:20142, `_quick_is_done`:20145, `_quick_left`:20148, `_quick_next`:20155, `_quick_fix_target`:20168, `_quick_daily_check`:20182, `_quick_complete`:20196, `_quick_side`:20230, `_build_quick_props`:20248, `_daily_shots`:20400, `_quick_props_refresh`:20442, `_quick_fx`:20446, `_play_coin`:20462, `_smoke_quick`:20479

## 20588-20738  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20597, `_quest_nearby`:20652, `_open_quests`:20659, `_close_quests`:20666, `_refresh_quests`:20670, `_quest_pick`:20696, `_quest_mode`:20710, `_smoke_quests`:20713

## 20739-20773  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20743, `_my_tag_tick`:20746

## 20774-21088  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20791, `_fc_torus`:20801, `_fc_pearl`:20809, `_fc_chrome`:20819, `_fc_glass`:20828, `_fc_glow`:20838, `_fc_ghost`:20847, `_fc_holo`:20859, `_fc_mesh`:20869, `_fc_sphere`:20889, `_fc_capsule`:20897, `_fc_cone`:20905, `_build_food_court`:20914, `_food_court_tick`:21068

## 21089-21410  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:21118, `_cm_bench`:21134, `_build_commons`:21147, `_commons_tick`:21369

## 21411-21725  v0.36: the daily puzzle

`_pz_today`:21434, `_pz_new`:21437, `_pz_neighbours`:21482, `_pz_flip`:21492, `_pz_done`:21497, `_pz_tap`:21505, `_pz_win`:21521, `_pz_reset`:21542, `_puzzle_near`:21546, `_open_puzzle`:21551, `_close_puzzle`:21559, `_pz_refresh_sign`:21563, `_build_puzzle_panel`:21571, `_pz_draw`:21602, `_smoke_chat`:21643, `_smoke_feet`:21681, `_smoke_commons`:21702

## 21726-21914  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21788, `_bio_theta`:21792, `_bio_sec_n`:21797, `_bio_sec_of`:21800, `_bio_pt`:21803, `_bio_lp`:21808, `_bio_la`:21812, `_bio_dir`:21816, `_bio_hex_r`:21819, `_bio_apo`:21824, `_bio_open_angles`:21830, `_bio_si`:21840, `_bm`:21846, `_bsph`:21851, `_blow`:21854, `_bcone`:21865, `_bbox`:21868, `_bp`:21871, `_bq`:21876, `_bio_glass_mat`:21880, `_bio_water_mat`:21893, `_bio_mat`:21905

## 21915-22287  building blocks

`_bio_inst`:21916, `_bio_add`:21922, `_bio_model`:21925, `_bio_nature_mesh`:21931, `_bio_flush`:21965, `_bio_bar`:22000, `_bio_slab`:22013, `_bio_body`:22028, `_bio_cyl_col`:22041, `_bio_hexmesh`:22054, `_bio_hexslab`:22066, `_bio_hexpt`:22072, `_bio_gridshell`:22079, `_bio_rail`:22186, `_bio_rail_arc`:22191, `_bio_disc_deck`:22203, `_bio_ring_deck`:22209, `_bio_helix`:22220, `_bio_pillar`:22240, `_bio_cafe`:22246, `_bio_fence_line`:22260, `_bio_fence_seg`:22265, `_bio_pen`:22275

## 22288-22789  building

`_build_biosphere`:22289, `_build_biosphere_legacy`:22293, `_bio_text`:22455, `_bio_plaque`:22473, `_bio_ticket_hall`:22487, `_on_foot_collision_guard`:22543, `_bio_inside`:22553, `_bio_pass_ok`:22556, `_ticket_near`:22560, `_bio_buy_pass`:22565, `_bio_gates_update`:22581, `_bio_gate_tick`:22607, `_bio_tunnel`:22619, `_bio_grounds`:22672, `_bio_dome`:22718, `_bio_deck_mats`:22786

## 22790-22945  garden planting

`_bio_free`:22791, `_bio_spot`:22808, `_bio_garden`:22816, `_bio_pine`:22857, `_bio_tree`:22860, `_bio_big_tree`:22870, `_bio_rock`:22875, `_bio_pond`:22878, `_bio_particles`:22882, `_bio_mist`:22910, `_bio_mini_dome`:22939

## 22946-23353  the four layouts

`_bio_winter`:22947, `_bio_spring`:23039, `_bio_summer`:23164, `_bio_autumn`:23248

## 23354-23624  animals

`_bio_spawn`:23355, `_bio_load_animal`:23427, `_bio_make_quad`:23448, `_bio_load_bird`:23525, `_bio_make_penguin`:23545, `_bio_make_bird`:23567, `_bio_make_flamingo`:23591, `_bio_make_butterfly`:23612

## 23625-23762  animation, spotting and rewards

`_bio_stuck_check`:23630, `_biosphere_tick`:23648, `_bio_animate`:23663, `_bio_spot_check`:23743, `_bio_spotted`:23755, `_smoke_biosphere`:23759

## 23763-24280  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23850, `_wear_piece`:23853, `_wear_mat`:23876, `_person_index`:23892, `_dress`:23915, `_smoke_style`:24021, `_style_shots`:24172, `_npc_look`:24244

## 24281-24434  your look: apply, save, share

`_look_clean`:24285, `_look_pack`:24300, `_owns`:24306, `_apply_look`:24311, `_relic_model`:24322, `_fc_mesh_mat`:24387, `_relic_refresh`:24390, `_relic_tick`:24404, `_peer_style`:24415

## 24435-24862  stores and the wardrobe

`_style_today`:24454, `_style_items`:24457, `_style_cat`:24465, `_style_price`:24468, `_style_deal`:24482, `_style_price_base`:24495, `_relic_stock`:24502, `_build_style_panel`:24514, `_open_store`:24554, `_open_wardrobe`:24573, `_style_close`:24576, `_style_finish`:24580, `_sync_old_avatar`:24595, `_style_tabs_for`:24602, `_refresh_style`:24607, `_style_body_rows`:24758, `_style_set_tab`:24775, `_style_step`:24779, `_style_color`:24784, `_style_pick`:24789, `_style_buy`:24824, `_ach_relics_check`:24846, `_style_face_camera`:24851

## 24863-25330  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24899, `_ga_text`:24905, `_ga_box`:24922, `_build_galleria`:24938, `_ga_inner_tick`:25079, `_ga_shell`:25095, `_ga_inside`:25145, `_bio_cyl_col_on`:25148, `_ga_models`:25160, `_ga_lbox`:25175, `_ga_ltext`:25189, `_ga_store`:25196, `_bio_cafe_on`:25298, `_ga_mannequins`:25306

## 25331-25482  featured outfits and the Sky Run

`_ga_featured_look`:25344, `_build_ga_fun`:25365, `_ga_fun_tick`:25410, `_sky_finish`:25437, `_extra_near`:25456, `_extra_open`:25465, `_store_near`:25474

## 25483-25579  v0.41: THE SKY GARDEN

`_sg_now`:25537, `_sg_progress`:25540, `_sg_time`:25546, `_sg_stock`:25553, `_sg_mut_roll`:25568

## 25580-25717  building

`_sg_box`:25581, `_sg_text`:25587, `_build_sky_garden`:25601, `_sg_seed_spot`:25712, `_sg_codex_spot`:25715

## 25718-25898  plants

`_sg_plant_model`:25719, `_sg_refresh_all`:25824, `_sg_refresh`:25828, `_sky_garden_tick`:25864, `_sg_ready_count`:25883, `_sg_boot_note`:25890

## 25899-26018  interacting

`_sg_near`:25900, `_sg_button_text`:25923, `_sg_value`:25936, `_sg_interact`:25940, `_sg_buy`:25956, `_sg_plant`:25978, `_sg_harvest`:25989

## 26019-26262  the garden screen

`_build_sg_panel`:26020, `_sg_open`:26055, `_sg_close`:26064, `_sg_row`:26068, `_sg_refresh_panel`:26083, `_sg_pick_buy`:26128, `_sg_pick_plant`:26132, `_smoke_car_barriers`:26138, `_smoke_sky_garden`:26179

## 26263-26301  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26294, `_pass_day`:26297

## 26302-26333  album

`_album_pages`:26303, `_album_claim`:26318

## 26334-26385  season

`_season_index`:26335, `_season_tick`:26338, `_season_xp`:26347, `_season_tier`:26350, `_season_reward`:26353, `_season_claim`:26367

## 26386-26393  Harbor Night

`_harbor_night`:26387

## 26394-26425  check-in calendar

`_cal_tick`:26395

## 26426-26602  the panel

`_build_hp_panel`:26427, `_open_pass`:26462, `_hp_open`:26465, `_hp_close`:26472, `_hp_row`:26476, `_hp_bar`:26491, `_hp_refresh`:26495, `_smoke_pass`:26540

## 26603-26841  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26607, `_cash_pill_tick`:26615, `_build_lb`:26653, `_open_lb`:26699, `_close_lb`:26707, `_lb_pick`:26711, `_lb_headers`:26716, `_lb_url`:26720, `_lb_me`:26723, `_lb_level`:26728, `_lb_test_run`:26738, `_lb_tick`:26745, `_lb_upload`:26753, `_lb_fetch`:26763, `_lb_got`:26771, `_lb_value`:26784, `_lb_refresh_ui`:26795

## 26842-27400  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26866, `_market_near`:26945, `_build_gear`:26955, `_gear_piece`:26963, `_pet_m`:27008, `_pet_eyes`:27022, `_build_pet`:27029, `_pet_nose`:27167, `_pet_anim`:27170, `_market_apply`:27181, `_market_tick`:27205, `_build_market_panel`:27229, `_open_market`:27255, `_close_market`:27262, `_refresh_market`:27266, `_market_pick`:27319, `_toggle_board`:27357, `_board_tick`:27364

## 27401-27645  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27433, `_ds_label`:27452, `_build_display`:27466, `_ds_got`:27546, `_ds_sorted`:27555, `_ds_render_board`:27569, `_ds_render_news`:27595, `_display_tick`:27616

## 27646-27824  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27663, `_toggle_streamer`:27750, `_streamer_badge_tap`:27766, `_streamer_tick`:27770

## 27825-27861  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27831, `_car_back`:27838, `_car_park_tick`:27845

## 27862-27958  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27866, `_bus_eta`:27920, `_bus_displays_tick`:27936

## 27959-28250  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27977, `_treasure_pick`:27980, `_treasure_spot`:27989, `_treasure_district`:27993, `_treasure_clue`:28005, `_treasure_prop`:28018, `_tp_part`:28021, `_tp_sphere`:28031, `_tp_cyl`:28039, `_treasure_prop_side`:28048, `_build_treasure_props`:28060, `_build_treasure`:28104, `_treasure_dir_char`:28173, `_treasure_tick`:28182, `_treasure_claim`:28236

## 28251-28351  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:28252, `_halo_mat`:28284, `_smoke_treasure`:28309

## 28352-28675  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28373, `_fm_send`:28376, `_fm_area`:28382, `_fm_glow_mesh`:28398, `_fm_block_reason`:28416, `_fm_start`:28428, `_fm_announce`:28456, `_fm_finish`:28459, `_fm_msg`:28477, `_fm_check_paid`:28528, `_fm_tick`:28546, `_smoke_findme`:28602

## 28676-28786  v0.24.2: road map (for moving people off the road)

`_floor_note`:28682, `_floor_disc`:28696, `_floor_top`:28705, `_ground_at`:28723, `_note_road`:28741, `_on_road`:28748, `_ped_curb`:28758, `_curb_spot`:28768

## 28787-29082  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28809, `_ex_grid`:28817, `_ex_lamps`:28852, `_ex_umbrella`:28875, `_ex_yards`:28882, `_build_expansion`:28897, `_expand_shots`:29060

## 29083-29277  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:29124, `_v27_near_cross`:29216, `_v27_near_any_road`:29223, `_v27_in_district`:29229, `_sea_tick`:29243, `_sea_tow`:29262

## 29278-29945  Harbor Loop sky train

`_sky_build_path`:29329, `_sky_pos`:29370, `_sky_dir`:29384, `_sky_project`:29389, `_sky_trip_time`:29408, `_sky_trip_dist`:29414, `_sky_now`:29425, `_sky_state`:29428, `_sky_time_at_station`:29443, `_sky_next_arrival`:29450, `_build_skytrain`:29463, `_sky_make_car`:29615, `_sky_skin`:29652, `_sky_place_trains`:29672, `_sky_build_station`:29691, `_sky_near`:29756, `_sky_fmt`:29765, `_sky_enter`:29769, `_sky_leave_platform`:29787, `_sky_board`:29797, `_sky_alight`:29811, `_sky_action`:29825, `_sky_tick`:29842, `_sky_camera`:29882, `_tour_today`:29898, `_tour_stamp`:29901, `_sky_hud`:29924

## 29946-30319  Day and night

`_toggle_weather`:30029, `_refresh_weather_button`:30035, `_game_hour`:30041, `_day_key`:30053, `_night_setup`:30068, `_night_scan_mesh`:30158, `_daynight_tick`:30183, `_daynight_apply`:30192, `_daynight_lights`:30304, `_cycle_day_mode`:30309, `_refresh_time_button`:30316

## 30320-30957  v0.27 smoke test and screenshots

`_smoke_v27`:30321, `_city_shots`:30526

## 30958-31374  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30992, `_ap_plane`:31168, `_ap_truck`:31188, `_ap_baggage_train`:31229, `_ap_loop_pos`:31242, `_ap_loop_len`:31258, `_ap_flight_at`:31264, `_ap_tick`:31288, `_airport_ped_plan`:31311, `_smoke_airport`:31331

## 31375-31888  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31389, `_nav_spot`:31396, `_nav_idx`:31400, `_nav_pos`:31407, `_nav_blocked`:31411, `_nav_nearest_free`:31421, `_nav_bfs`:31449, `_nav_build`:31493, `_stroller`:31564, `_stroll_place`:31580, `_stroll_next`:31601, `_nav_clear_line`:31635, `_stroll_aim`:31646, `_strollers_tick`:31678, `_smoke_strollers`:31773

## 31889-32049  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31924, `_dir_fmt`:31927, `_signpost_spot`:31930, `_build_signposts`:31947

## 32050-32146  the Directions panel and chip

`_build_dir_panel`:32051, `_open_dir`:32093, `_dir_close`:32102, `_dir_pick`:32106, `_dir_stop`:32111, `_dir_stop_and_close`:32116, `_dir_tick`:32120

## 32147-32688  v0.44: Grand Central

`_gc_mesh`:32176, `_gc_mat`:32209, `_gc_glass`:32218, `_gb`:32228, `_gb_solid`:32234, `_gb_flush`:32238, `_gc_tree`:32268, `_gc_text`:32273, `_gc_planter`:32288, `_gc_kiosk`:32294, `_goods_color`:32324, `_goods_mat`:32327, `_kiosk_goods`:32331, `_build_grand_central`:32409, `_build_gc_towers`:32577, `_gc_tick`:32672

## 32689-32980  v0.44: filling the empty land

`_loft`:32706, `_fill_clear`:32748, `_build_fill`:32758, `_hg_in_lake`:32806, `_hg_path`:32810, `_floor_note_rot`:32818, `_build_gardens`:32826, `_build_fan_plaza`:32936

## 32981-33015  v0.45: hover car underglow

`_car_underglow`:32984

## 33016-33180  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:33017

## 33181-33212  v0.47: street stalls downtown

`_build_street_stalls`:33185, `_cull_people_in`:33205

## 33213-33311  v0.48: places that open as you level up

`_place_lock_of`:33226, `_place_root`:33232, `_place_unlocked`:33235, `_build_place_signs`:33243, `_places_refresh`:33288, `_places_tick`:33305

## 33312-33356  v0.50: city careers

`_career_rank_name`:33337, `_career_mult`:33340, `_career_block_reason`:33345, `_career_start`:33348, `_career_end`:33353

## 33357-33407  v0.52: careers as clear job loops

`_cid`:33384, `_career_target`:33398, `_career_tick`:33405

## 33408-33415  taxi

`_taxi_meter`:33409

## 33416-33419  paramedic

(no functions)

## 33420-33424  police

`_career_chase_over`:33422

## 33425-33430  firefighter

`_fire_aimed`:33426

## 33431-33440  the step bar

`_career_bar_text`:33434, `_career_hud`:33438

## 33441-33467  cut scenes

`_cs_skip`:33459

## 33468-33472  siren

(no functions)

## 33473-33484  the Careers panel

`_build_career_panel`:33474, `_open_careers`:33477, `_career_close`:33481

## 33485-33908  v0.50: homes

`_home_door_spots`:33525, `_build_homes`:33540, `_home_labels`:33569, `_home_door_near`:33578, `_home_origin`:33587, `_home_slot_near`:33590, `_home_exit_near`:33601, `_home_btn`:33608, `_home_interact`:33621, `_home_buy`:33640, `_home_default_layout`:33654, `_home_enter`:33662, `_home_leave`:33682, `_hm`:33690, `_home_build_room`:33709, `_home_refresh_room`:33818, `_furni_build`:33832

## 33909-34244  decorating

`_build_home_panels`:33910, `_open_homes`:33955, `_home_row_go`:33965, `_home_panel_close`:33985, `_deco_open`:33989, `_deco_pick`:34012, `_smoke_careers_homes`:34035

## 34245-34379  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:34249, `_home_slots`:34257, `_home_ring`:34284, `_furni_cat`:34290, `_home_fix_layout`:34296, `_home_build_layout`:34324

## 34380-34813  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34443, `_ch_homes`:34449, `_ch_step_text`:34456, `_ch_step_done`:34467, `_ch_target`:34481, `_ch_finish_chapter`:34490, `_chapters_tick`:34512, `_hud_top_stack`:34552, `_build_chapters_ui`:34582, `_chapters_restart_ask`:34624, `_chapters_restart`:34627, `_chapters_text`:34637, `_open_chapters`:34657, `_chapters_close`:34664, `_smoke_chapters`:34668, `_step_sound`:34789

## 34814-34852  v0.51.1: join and leave messages

`_announce_join`:34821, `_announce_already_here`:34840, `_announce_leave`:34848

## 34853-35117  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34869, `_shot_tick`:34875, `_draw_shot_icon`:34907, `_shot_enter`:34916, `_shot_exit`:34930, `_shot_release_controls`:34942, `_shot_stick_zone`:34949, `_shot_input`:34952, `_smoke_photo`:35024

## 35118-35416  v0.51.3: stream joiners

`_viewer_count`:35138, `_stream_join_check`:35144, `_stream_join_start`:35151, `_sj_streamer`:35168, `_stream_join_tick`:35177, `_stream_join_land`:35201, `_sj_welcome`:35217, `_smoke_stream_join`:35251, `_career_shot`:35334

## 35417-35533  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35421, `_st_restore`:35459, `_smoke_streamer_clean`:35480, `_world_bio_passport`:35531

