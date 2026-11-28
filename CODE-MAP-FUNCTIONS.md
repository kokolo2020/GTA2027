# CODE MAP: functions per section (generated)

Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.

## 1-645  Core (unlabelled)

`_symbol_font`:296, `_ready`:308, `_surf_texture`:588, `_surface_material`:610

## 646-718  v0.34.6: futuristic towers for the old city

`_future_tower`:650

## 719-797  v0.34.4: "100 years from now" skins for walls, roofs and pavements

`_skin_textures`:726, `_skin_common`:761, `_future_wall`:769, `_future_roof`:783, `_future_pave`:791

## 798-858  v0.34.4: futuristic road surface

`_road_textures`:805, `_future_road`:839

## 859-2067  v0.30: real-looking materials (CC0 photo textures from Poly Haven, see credits.txt)

`_real_foliage`:878, `_real_tex`:919, `_real_setup`:927, `_real_kind`:948, `_realify`:954, `_real_glass`:991, `_make_window_textures`:1011, `_material`:1044, `_box`:1069, `_sign`:1091, `_build_world`:1103, `_future_kiosk`:1214, `_build_collectibles`:1240, `_auto_collect_tick`:1273, `_find_count`:1294, `_nearest_find`:1301, `_destination`:1315, `_toggle_activity`:1351, `_collect_find`:1380, `_owned_count`:1395, `_ridge_open`:1402, `_ridge_count`:1406, `_nearest_ridge`:1413, `_apply_car`:1427, `_tune_level`:1457, `_tune_cost`:1460, `_car_stats`:1466, `_buy_tune`:1473, `_open_tune`:1494, `_back_to_garage`:1500, `_refresh_tune`:1504, `_bay_open`:1515, `_area_open`:1518, `_bay_count`:1521, `_nearest_bay`:1528, `_build_bay`:1542, `_check_bay`:1595, `_discover_bay`:1608, `_north_count`:1621, `_north_open`:1628, `_nearest_north`:1631, `_check_north`:1645, `_discover_north`:1658, `_prop`:1671, `_collider`:1685, `_first_mesh`:1695, `_scatter`:1704, `_prop_stretch`:1738, `_north_token`:1747, `_nm_roads`:1774, `_prop_big`:1789, `_nm_near_cross`:1805, `_build_north`:1812, `_build_nm_blocks`:1929, `_build_north_landscape`:2014, `_nm_free`:2041, `_build_landscape`:2051

## 2068-2559  Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars.

`_online_load_config`:2069, `_online_toggle`:2083, `_online_autostart`:2109, `_online_connect`:2128, `_online_stop`:2135, `_online_next_ref`:2146, `_online_send`:2150, `_online_join_frame`:2154, `_online_pos_frame`:2157, `_online_tick`:2166, `_online_handle`:2200, `_online_clean_name`:2260, `_online_peer_update`:2269, `_online_make_peer`:2339, `_peer_look`:2380, `_online_tint`:2437, `_paint_mat`:2453, `_online_update_peers`:2465, `_online_clear_peers`:2545, `_online_refresh_button`:2550

## 2560-2732  v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop)

`_marina_open`:2640, `_marina_count`:2643, `_nearest_marina`:2650, `_check_marina`:2664, `_discover_marina`:2677, `_shop_available`:2690, `_nearest_shop`:2693, `_premium_cars`:2701, `_glass`:2708, `_shop_building`:2714, `_shop_pad`:2724

## 2733-3251  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2734, `_bus_last`:2737, `_build_bus`:2740, `_bus_boxes`:2767, `_bus_skin`:2777, `_bus_side`:2790, `_bus_reset`:2793, `_bus_text`:2802, `_bus_tick`:2807, `_bus_near`:2847, `_bus_board`:2858, `_bus_alight`:2873, `_build_marina`:2887, `_set_hat`:2996, `_build_hat`:2999, `_cyl`:3064, `_hat_part`:3073, `_apply_avatar`:3082, `_shop_count`:3094, `_shop_open`:3104, `_shop_step`:3122, `_shop_close`:3128, `_owned_text`:3141, `_refresh_shop`:3144, `_shop_action`:3197, `_journal_flip`:3248

## 3252-3306  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3263, `_xp`:3266, `_level_for`:3273, `_level`:3281, `_level_text`:3284, `_check_level`:3294

## 3307-3409  v0.11.0: online police vs thief

`_orole_ready`:3308, `_orole_start`:3311, `_orole_end`:3338, `_orole_tick`:3347

## 3410-4358  v0.10.0: chase mode (offline)

`_chase_open`:3411, `_chase_clear`:3416, `_chase_make_unit`:3430, `_chase_spawn_point`:3460, `_chase_start`:3469, `_chase_end`:3505, `_chase_steer`:3524, `_chase_roadblock`:3560, `_chase_heli_build`:3605, `_chase_extras`:3631, `_chase_tick`:3658, `_start_trial`:3722, `_cancel_trial`:3749, `_check_trial`:3754, `_finish_trial`:3771, `_trial_count`:3787, `_open_trials`:3794, `_refresh_trials`:3798, `_update_gate`:3810, `_slab`:3828, `_build_ridge`:3846, `_check_ridge`:3914, `_discover`:3927, `_mission_progress`:3941, `_check_missions`:4003, `_open_garage`:4014, `_open_journal`:4019, `_close_sub`:4024, `_bar`:4027, `_refresh_garage`:4031, `_garage_step`:4056, `_garage_action`:4060, `_refresh_journal`:4080, `_visited_shops`:4113, `_build_panels`:4120, `_build_player`:4280, `_build_car`:4318, `_try_model`:4347

## 4359-5043  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4360, `_kshader`:4434, `_ksync`:4440, `_kskin`:4455, `_make_kperson`:4461, `_hat_y`:4525, `_sit_drop`:4528, `_kplay`:4531, `_kpeople_tick`:4541, `_pose_person`:4570, `_pose_limbs`:4587, `_person_lift`:4649, `_snap_crowd_feet`:4662, `_people_life_tick`:4678, `_life_one`:4715, `_cull_person`:4725, `_recolor_car_model`:4733, `_apply_car_model`:4747, `_landmark`:4767, `_label`:4777, `_button`:4784, `_panel`:4796, `_build_hud`:4806

## 5044-5162  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:5050, `_menu_tab`:5056, `_watch_tick`:5079, `_watch_count`:5121, `_online_pill_tap`:5128, `_online_pill_tick`:5134, `online_config_ok`:5160

## 5163-5200  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5166, `_offroad`:5172, `_ground_near`:5185, `_collectibles_on_road`:5192

## 5201-5340  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5213, `_build_quest_offer`:5217, `_quest_offer_tick`:5247, `_quest_auto_pick`:5297, `_quest_accept`:5312, `_quest_decline`:5326, `_quest_stop`:5332

## 5341-5708  v0.31: a futuristic Bonkers City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5365, `_holo_material`:5374, `_build_future`:5382, `_build_neon`:5396, `_model_profile`:5465, `_model_body_box`:5488, `_build_holograms`:5502, `_holo_tick`:5552, `_build_sky_traffic`:5569, `_sky_hover_car`:5587, `_sky_drone`:5634, `_sky_traffic_tick`:5678, `_future_lights`:5697

## 5709-6208  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5768, `_crew_col`:5776, `_peer_crewmate`:5779, `_set_ring_color`:5782, `_level_color`:5809, `_tier_color`:5822, `_my_ach_tier`:5825, `_style_ring`:5832, `_social_peer_extras`:5880, `_social_tag`:5894, `_my_tag_extra`:5906, `_soc_send`:5919, `_social_msg`:5934, `_social_accept`:5973, `_social_go`:5994, `_soc_friend`:6013, `_soc_invite`:6020, `_soc_goto`:6025, `_soc_high_five`:6033, `_soc_gift`:6053, `_soc_crew_invite`:6070, `_gift_day_check`:6077, `_crew_create`:6083, `_crew_cycle_color`:6093, `_crew_leave`:6098, `_crew_mate_near`:6106, `_crew_board`:6114, `_build_social`:6133, `_social_online`:6195, `_open_social`:6199, `_close_social`:6205

## 6209-6459  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6212, `_track_pos`:6221, `_social_row_button`:6232, `_refresh_social`:6239, `_on_dance_floor`:6301, `_toggle_dance`:6304, `_build_dance_floor`:6312, `_social_tick`:6338, `_photo`:6410

## 6460-6955  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6482, `_game_state`:6490, `_build_arcade`:6502, `_c4_empty`:6553, `_c4_drop_row`:6559, `_c4_winner`:6565, `_c4_bot_move`:6586, `_c4_code`:6615, `_c4_ready`:6621, `_c4_tap`:6624, `_c4_check`:6645, `_c4_tick`:6669, `_rx_ready`:6696, `_rx_start`:6699, `_rx_tap`:6713, `_rx_send_time`:6738, `_rx_resolve`:6745, `_rx_tick`:6771, `_mem_start`:6786, `_mem_tap`:6802, `_mem_finish`:6817, `_mem_tick`:6833, `_mem_board_text`:6840, `_build_arcade_panel`:6851, `_refresh_arcade_panel`:6894

## 6956-7249  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:7019, `_quiz_slot`:7022, `_quiz_question`:7032, `_quiz_bot_score`:7061, `_in_quiz`:7070, `_build_quiz`:7073, `_quiz_answer`:7143, `_quiz_msg`:7156, `_quiz_board`:7164, `_quiz_tick`:7174, `_quiz_refresh`:7216

## 7250-8891  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7421, `_sites_found`:7424, `_sites_total`:7427, `_bits`:7430, `_ach_value`:7437, `_ach_tick`:7492, `_ach_check`:7517, `_ach_by_id`:7553, `_ach_msg`:7559, `_build_ach`:7572, `_ach_show`:7603, `_open_ach`:7623, `_close_ach`:7629, `_refresh_ach`:7633, `_ach_num`:7664, `_minimap_tap`:7667, `_menu_go`:7674, `_menu_stay`:7679, `_menu_call_car`:7683, `_toggle_clean_hud`:7689, `_refresh_menu_buttons`:7695, `_clean_hud_tick`:7705, `_draw_joystick`:7746, `_input`:7751, `_touch_text_focus`:7850, `_stick_zone`:7870, `_notification`:7874, `_physics_process`:7891, `_follow_camera`:8047, `_follow_walk_camera`:8089, `_interact`:8112, `_refresh_hud`:8274, `_open_panel`:8403, `_layout_panels`:8433, `_toggle_menu`:8460, `_rescue`:8506, `_cash_note`:8540, `_show_cash_log`:8558, `_show_toast`:8575, `_save_progress`:8579, `_load_progress`:8677

## 8892-11652  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8893, `_radio_voice`:8896, `_radio_make`:8929, `_radio_set`:9000, `_radio_play`:9022, `_radio_next`:9027, `_radio_talk_line`:9031, `_radio_caption`:9052, `_radio_refresh`:9060, `_process`:9073, `_build_peds`:9124, `_update_peds`:9235, `_update_ped`:9254, `_smoke_test`:9308, `_smoke_chase`:9961, `_smoke_orole`:9994, `_smoke_levels`:10023, `_smoke_bus`:10064, `_smoke_chase_extras`:10149, `_smoke_marina`:10177, `_blocked_at`:10279, `_blocker`:10294, `_on_screen`:10307, `_wait_radio`:10312, `_smoke_radio_peds`:10319, `_smoke_typed_chat`:10389, `_smoke_chat_touch`:10408, `_smoke_cafe`:10429, `_smoke_boutique`:10455, `_smoke_models`:10483, `_smoke_garage_ridge`:10507, `_save_shot`:10883, `_sky_shots`:10893, `_pet_shots`:10922, `_tracker_shots`:10957, `_infected_shots`:10991, `_legend_shots`:11042, `_boss_shots`:11073, `_paris_shots`:11170, `_people_shots`:11400, `_shots`:11441, `_shot_car`:11635, `_capture_preview`:11645

## 11653-12301  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11720, `_downtown_count`:11723, `_nearest_downtown`:11730, `_check_downtown`:11744, `_discover_downtown`:11757, `_box_batch`:11771, `_model_batch`:11791, `_cut_ranges`:11845, `_dt_ranges`:11857, `_dt_has`:11864, `_dt_near_cross`:11870, `_place`:11876, `_signal_pole`:11887, `_cyl_batch`:11906, `_city_signals`:11930, `_ensure_light_mats`:11981, `_city_lamps`:11991, `_build_downtown`:12035, `_dt_block`:12235, `_downtown_token`:12241, `_build_park`:12258, `_build_plaza`:12287

## 12302-12405  old city and Bay details

`_build_city_detail`:12303

## 12406-12815  traffic

`_build_traffic`:12407, `_path_sample`:12502, `_light_look`:12516, `_light_green`:12524, `_traffic_place`:12528, `_traffic_blocked_by`:12540, `_traffic_tick`:12552, `_smoke_downtown`:12658, `_skyline_shot`:12770, `_skyline_shots`:12778

## 12816-13183  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12862, `_web_scale`:12925, `_web_fps_tick`:12935, `_world_to_uv`:12959, `_map_angle`:12962, `_build_minimap`:12970, `_open_map`:13043, `_close_map`:13054, `_mini_point`:13061, `_site_markers`:13065, `_draw_arrow`:13097, `_draw_minimap`:13104, `_draw_full_map`:13151, `_minimap_tick`:13176

## 13184-13464  camera views

`_build_view_controls`:13185, `_sky_grade`:13227, `_cycle_view`:13242, `_apply_view`:13252, `_hide_labels`:13296, `_unfade`:13302, `_bake_map`:13308, `_shot_stats`:13358, `_view_shots`:13361, `_smoke_views`:13402

## 13465-13712  v0.17.0: level-up celebration

`_build_level_fx`:13476, `_draw_level_rays`:13513, `_level_fx_tick`:13523, `_level_sound`:13528, `_fx_material`:13570, `_level_up_fx`:13578, `_smoke_level_fx`:13679, `_levelup_shots`:13688

## 13713-13834  v0.18.0: walk-in stadium

`_collider_yaw`:13718, `_build_stadium_walls`:13729, `_look`:13757, `_smoke_stadium_eye`:13766, `_stadium_shots`:13804

## 13835-13996  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13859, `_arrow_mesh`:13871, `_build_guidance`:13894, `_guide_target`:13919, `_guidance_tick`:13948, `_draw_hud_arrow`:13974

## 13997-14182  checkpoints

`_build_checkpoints`:13998, `_refresh_checkpoints`:14043, `_check_checkpoints`:14049, `_activate_checkpoint`:14059, `_checkpoint_spawn`:14080, `_spawn_at_checkpoint`:14085, `_draw_checkpoint_icon`:14101, `_smoke_guidance_checkpoints`:14107, `_guide_shots`:14157

## 14183-14461  v0.18.0: Harbor Dome social hub

`_hub_seat`:14241, `_build_hub`:14245

## 14462-14512  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14463, `_xm_mesh`:14472, `_xm_tree`:14480

## 14513-14836  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14516, `_gt_surface`:14531, `_xm_grand_tree`:14541, `_lux_mat`:14656, `_lux_part`:14672, `_lux_box`:14675, `_lux_cyl`:14680, `_lux_ball`:14688, `_lux_new`:14696, `_lux_commit`:14701, `_lux_sofa_mesh`:14705, `_lux_chair_mesh`:14735, `_lux_table_mesh`:14755, `_lux_pouf_mesh`:14770, `_lux_batch`:14785, `_hub_christmas`:14801

## 14837-14992  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14838

## 14993-15241  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14996, `_vx_cyl`:15003, `_vx_ball`:15011, `_vx_ring`:15019, `_hub_polish`:15027, `_hub_gate`:15050, `_hub_vip`:15112, `_hub_glass`:15225

## 15242-15456  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:15243, `_build_hub_bots`:15268, `_seat_of`:15299, `_bubble`:15309, `_emote`:15365, `_hub_people_tick`:15379

## 15457-15575  seats

`_seat_taken`:15458, `_nearest_seat`:15466, `_seat_label`:15478, `_sit`:15494, `_stand_up`:15538, `_seated_tick`:15557

## 15576-15732  game panel

`_build_game_panel`:15577, `_open_game_panel`:15632, `_refresh_game_panel`:15651, `_play_robot`:15696, `_peer_at`:15710, `_opponent_name`:15717, `_pay`:15725

## 15733-15853  tic-tac-toe

`_ttt_ready`:15736, `_ttt_winner`:15742, `_ttt_bot_move`:15752, `_ttt_tap`:15778, `_ttt_code`:15798, `_ttt_check`:15804, `_ttt_tick`:15827

## 15854-15905  rock paper scissors

`_rps_ready`:15855, `_rps_pick`:15861, `_rps_resolve`:15879, `_rps_tick`:15903

## 15906-15988  online table messages

`_online_game_send`:15907, `_hub_game_msg`:15913

## 15989-16064  comedy show

`_joke_start`:15990, `_joke_tick`:16002, `_speak`:16028, `_play_rimshot`:16037

## 16065-16964  quick chat and emotes

`_build_chat`:16087, `_chat_toggle_to`:16204, `_chat_log_add`:16212, `_chat_area`:16218, `_chat_near_count`:16236, `_chat_tick`:16245, `_toggle_chat`:16294, `_chat_fit`:16309, `_chat_clean`:16315, `_chat_wrap`:16332, `_chat_send_text`:16354, `_typing`:16377, `_say`:16380, `_do_emote`:16396, `_smoke_hub`:16405, `_chat_shots`:16579, `_cafe_shots`:16604, `_shop_shots`:16652, `_car_shots`:16701, `_outfit_shots`:16732, `_hub_shots`:16780, `_sg_on_terrace`:16915, `_people_only`:16918, `_people_only_keep_cars_out`:16922, `_car_barrier`:16934, `_hub_keep_cars_out`:16948

## 16965-17130  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16974, `_feed_add`:16983, `_feed_render`:16989, `_feed_tick`:17017, `_online_event_send`:17026, `_at_pvp_table`:17033, `_game_name`:17040, `_send_lfp`:17043, `_lfp_msg`:17060, `_accept_invite`:17081

## 17131-17372  v0.18.2: nickname and HUD relayout

`_nick_rude`:17143, `_clean_nick`:17158, `_build_nick_panel`:17170, `_open_nick`:17208, `_random_nick`:17217, `_save_nick`:17223, `_close_nick`:17242, `_refresh_nick_button`:17251, `_relayout_hud`:17255, `_smoke_nick`:17292, `_nick_shots`:17324, `_smoke_sites_reachable`:17342

## 17373-17660  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17399, `_nearest_civic`:17406, `_check_civic`:17420, `_discover_civic`:17433, `_civ_ranges`:17446, `_civ_has`:17460, `_civ_near_cross`:17466, `_build_civic`:17472, `_civic_token`:17598, `_civic_shots`:17615, `_hub_focus`:17637

## 17661-17770  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17732, `_in_rw_lot`:17735, `_box_batch_rot`:17738, `_multi_collider`:17756

## 17771-18098  circuit geometry

`_cr_point`:17772, `_rw_build_path`:17786, `_rw_dir`:17814, `_rw_bend`:17819, `_ribbon`:17825, `_rw_band`:17845, `_rw_keepout`:17863, `_build_raceway`:17872, `_build_rw_parking`:17906, `_build_rw_pits`:17951, `_build_rw_track`:17988, `_build_rw_trackside`:18029

## 18099-18196  race car rental

`_model_key`:18100, `_race_car_start`:18103, `_tint_ghost`:18141, `_race_car_end`:18154, `_race_keep_cars_out`:18179

## 18197-18211  speed effects

`_eff_max`:18198, `_eff_accel`:18209

## 18212-18262  track helpers

`_rw_seg_progress`:18213, `_rw_track_dist`:18233, `_rw_point_dist`:18244, `_rw_player_progress`:18251, `_rw_target`:18257

## 18263-18499  events

`_rec_stop`:18264, `_rw_place`:18280, `_rw_grid_pos`:18287, `_rw_start`:18292, `_rw_spawn_ai`:18324, `_rw_ai_place`:18348, `_rw_tick`:18359, `_rw_ai_tick`:18412, `_rw_lap_done`:18454, `_rw_finish`:18466, `_rw_fmt`:18497

## 18500-18552  boosters and spikes

`_rw_buy`:18501, `_rw_use_boost`:18519, `_rw_use_spike`:18527, `_rw_drop_spike_at`:18538

## 18553-18610  online races

`_race_msg`:18554, `_join_race`:18576

## 18611-18966  raceway panel, HUD, board

`_build_raceway_ui`:18612, `_rw_layout`:18672, `_rw_open`:18679, `_rw_close`:18685, `_rw_refresh_panel`:18689, `_rw_refresh_board`:18702, `_rw_hud`:18714, `_peer_car_model`:18738, `_smoke_raceway`:18748, `_race_shots`:18929

## 18967-19174  v0.22.0: Call Car

`_call_block_reason`:18973, `_call_spot`:18990, `_call_car`:19021, `_play_horn`:19045, `_smoke_follow_call`:19069, `_follow_shots`:19142

## 19175-19642  v0.23: RUN toggle and fast travel between districts

`_board_blocked`:19200, `_walk_speed`:19210, `_place_portal_button`:19216, `_portal_pressed`:19223, `_build_travel`:19231, `_toggle_run`:19336, `_refresh_run`:19340, `_hud_v23_tick`:19348, `_travel_block_reason`:19380, `_travel_open`:19400, `_open_travel`:19406, `_open_worlds`:19412, `_open_case`:19418, `_case_step`:19430, `_case_refresh`:19434, `_case_submit`:19438, `_close_case`:19447, `_sky_go`:19451, `_close_worlds`:19461, `_refresh_worlds`:19465, `_world_go`:19471, `_close_travel`:19478, `_refresh_travel`:19482, `_travel_to`:19490, `_smoke_travel`:19517, `_v23_shots`:19555

## 19643-19716  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19650, `_qr_button`:19665, `_qr_layout`:19704, `_smoke_qr`:19710

## 19717-20153  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19737, `_open_crate`:19753, `_build_crate_ui`:19770, `_crate_pick`:19857, `_crate_reveal`:19880, `_crate_draw_car`:19907, `_crate_confetti`:19926, `_crate_sound`:19951, `_crate_drive`:19977, `_feed_add_system`:20007, `_smoke_crate`:20010, `_crate_shots`:20058

## 20154-20645  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:20195, `_quick_today`:20200, `_quick_is_done`:20203, `_quick_left`:20206, `_quick_next`:20213, `_quick_fix_target`:20226, `_quick_daily_check`:20240, `_quick_complete`:20254, `_quick_side`:20288, `_build_quick_props`:20306, `_daily_shots`:20458, `_quick_props_refresh`:20500, `_quick_fx`:20504, `_play_coin`:20520, `_smoke_quick`:20537

## 20646-20796  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20655, `_quest_nearby`:20710, `_open_quests`:20717, `_close_quests`:20724, `_refresh_quests`:20728, `_quest_pick`:20754, `_quest_mode`:20768, `_smoke_quests`:20771

## 20797-20831  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20801, `_my_tag_tick`:20804

## 20832-21146  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20849, `_fc_torus`:20859, `_fc_pearl`:20867, `_fc_chrome`:20877, `_fc_glass`:20886, `_fc_glow`:20896, `_fc_ghost`:20905, `_fc_holo`:20917, `_fc_mesh`:20927, `_fc_sphere`:20947, `_fc_capsule`:20955, `_fc_cone`:20963, `_build_food_court`:20972, `_food_court_tick`:21126

## 21147-21468  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:21176, `_cm_bench`:21192, `_build_commons`:21205, `_commons_tick`:21427

## 21469-21783  v0.36: the daily puzzle

`_pz_today`:21492, `_pz_new`:21495, `_pz_neighbours`:21540, `_pz_flip`:21550, `_pz_done`:21555, `_pz_tap`:21563, `_pz_win`:21579, `_pz_reset`:21600, `_puzzle_near`:21604, `_open_puzzle`:21609, `_close_puzzle`:21617, `_pz_refresh_sign`:21621, `_build_puzzle_panel`:21629, `_pz_draw`:21660, `_smoke_chat`:21701, `_smoke_feet`:21739, `_smoke_commons`:21760

## 21784-21972  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21846, `_bio_theta`:21850, `_bio_sec_n`:21855, `_bio_sec_of`:21858, `_bio_pt`:21861, `_bio_lp`:21866, `_bio_la`:21870, `_bio_dir`:21874, `_bio_hex_r`:21877, `_bio_apo`:21882, `_bio_open_angles`:21888, `_bio_si`:21898, `_bm`:21904, `_bsph`:21909, `_blow`:21912, `_bcone`:21923, `_bbox`:21926, `_bp`:21929, `_bq`:21934, `_bio_glass_mat`:21938, `_bio_water_mat`:21951, `_bio_mat`:21963

## 21973-22345  building blocks

`_bio_inst`:21974, `_bio_add`:21980, `_bio_model`:21983, `_bio_nature_mesh`:21989, `_bio_flush`:22023, `_bio_bar`:22058, `_bio_slab`:22071, `_bio_body`:22086, `_bio_cyl_col`:22099, `_bio_hexmesh`:22112, `_bio_hexslab`:22124, `_bio_hexpt`:22130, `_bio_gridshell`:22137, `_bio_rail`:22244, `_bio_rail_arc`:22249, `_bio_disc_deck`:22261, `_bio_ring_deck`:22267, `_bio_helix`:22278, `_bio_pillar`:22298, `_bio_cafe`:22304, `_bio_fence_line`:22318, `_bio_fence_seg`:22323, `_bio_pen`:22333

## 22346-22847  building

`_build_biosphere`:22347, `_build_biosphere_legacy`:22351, `_bio_text`:22513, `_bio_plaque`:22531, `_bio_ticket_hall`:22545, `_on_foot_collision_guard`:22601, `_bio_inside`:22611, `_bio_pass_ok`:22614, `_ticket_near`:22618, `_bio_buy_pass`:22623, `_bio_gates_update`:22639, `_bio_gate_tick`:22665, `_bio_tunnel`:22677, `_bio_grounds`:22730, `_bio_dome`:22776, `_bio_deck_mats`:22844

## 22848-23003  garden planting

`_bio_free`:22849, `_bio_spot`:22866, `_bio_garden`:22874, `_bio_pine`:22915, `_bio_tree`:22918, `_bio_big_tree`:22928, `_bio_rock`:22933, `_bio_pond`:22936, `_bio_particles`:22940, `_bio_mist`:22968, `_bio_mini_dome`:22997

## 23004-23411  the four layouts

`_bio_winter`:23005, `_bio_spring`:23097, `_bio_summer`:23222, `_bio_autumn`:23306

## 23412-23682  animals

`_bio_spawn`:23413, `_bio_load_animal`:23485, `_bio_make_quad`:23506, `_bio_load_bird`:23583, `_bio_make_penguin`:23603, `_bio_make_bird`:23625, `_bio_make_flamingo`:23649, `_bio_make_butterfly`:23670

## 23683-23820  animation, spotting and rewards

`_bio_stuck_check`:23688, `_biosphere_tick`:23706, `_bio_animate`:23721, `_bio_spot_check`:23801, `_bio_spotted`:23813, `_smoke_biosphere`:23817

## 23821-24338  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23908, `_wear_piece`:23911, `_wear_mat`:23934, `_person_index`:23950, `_dress`:23973, `_smoke_style`:24079, `_style_shots`:24230, `_npc_look`:24302

## 24339-24492  your look: apply, save, share

`_look_clean`:24343, `_look_pack`:24358, `_owns`:24364, `_apply_look`:24369, `_relic_model`:24380, `_fc_mesh_mat`:24445, `_relic_refresh`:24448, `_relic_tick`:24462, `_peer_style`:24473

## 24493-24920  stores and the wardrobe

`_style_today`:24512, `_style_items`:24515, `_style_cat`:24523, `_style_price`:24526, `_style_deal`:24540, `_style_price_base`:24553, `_relic_stock`:24560, `_build_style_panel`:24572, `_open_store`:24612, `_open_wardrobe`:24631, `_style_close`:24634, `_style_finish`:24638, `_sync_old_avatar`:24653, `_style_tabs_for`:24660, `_refresh_style`:24665, `_style_body_rows`:24816, `_style_set_tab`:24833, `_style_step`:24837, `_style_color`:24842, `_style_pick`:24847, `_style_buy`:24882, `_ach_relics_check`:24904, `_style_face_camera`:24909

## 24921-25388  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24957, `_ga_text`:24963, `_ga_box`:24980, `_build_galleria`:24996, `_ga_inner_tick`:25137, `_ga_shell`:25153, `_ga_inside`:25203, `_bio_cyl_col_on`:25206, `_ga_models`:25218, `_ga_lbox`:25233, `_ga_ltext`:25247, `_ga_store`:25254, `_bio_cafe_on`:25356, `_ga_mannequins`:25364

## 25389-25540  featured outfits and the Sky Run

`_ga_featured_look`:25402, `_build_ga_fun`:25423, `_ga_fun_tick`:25468, `_sky_finish`:25495, `_extra_near`:25514, `_extra_open`:25523, `_store_near`:25532

## 25541-25637  v0.41: THE SKY GARDEN

`_sg_now`:25595, `_sg_progress`:25598, `_sg_time`:25604, `_sg_stock`:25611, `_sg_mut_roll`:25626

## 25638-25775  building

`_sg_box`:25639, `_sg_text`:25645, `_build_sky_garden`:25659, `_sg_seed_spot`:25770, `_sg_codex_spot`:25773

## 25776-25956  plants

`_sg_plant_model`:25777, `_sg_refresh_all`:25882, `_sg_refresh`:25886, `_sky_garden_tick`:25922, `_sg_ready_count`:25941, `_sg_boot_note`:25948

## 25957-26076  interacting

`_sg_near`:25958, `_sg_button_text`:25981, `_sg_value`:25994, `_sg_interact`:25998, `_sg_buy`:26014, `_sg_plant`:26036, `_sg_harvest`:26047

## 26077-26320  the garden screen

`_build_sg_panel`:26078, `_sg_open`:26113, `_sg_close`:26122, `_sg_row`:26126, `_sg_refresh_panel`:26141, `_sg_pick_buy`:26186, `_sg_pick_plant`:26190, `_smoke_car_barriers`:26196, `_smoke_sky_garden`:26237

## 26321-26359  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26352, `_pass_day`:26355

## 26360-26391  album

`_album_pages`:26361, `_album_claim`:26376

## 26392-26443  season

`_season_index`:26393, `_season_tick`:26396, `_season_xp`:26405, `_season_tier`:26408, `_season_reward`:26411, `_season_claim`:26425

## 26444-26451  Harbor Night

`_harbor_night`:26445

## 26452-26483  check-in calendar

`_cal_tick`:26453

## 26484-26660  the panel

`_build_hp_panel`:26485, `_open_pass`:26520, `_hp_open`:26523, `_hp_close`:26530, `_hp_row`:26534, `_hp_bar`:26549, `_hp_refresh`:26553, `_smoke_pass`:26598

## 26661-26899  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26665, `_cash_pill_tick`:26673, `_build_lb`:26711, `_open_lb`:26757, `_close_lb`:26765, `_lb_pick`:26769, `_lb_headers`:26774, `_lb_url`:26778, `_lb_me`:26781, `_lb_level`:26786, `_lb_test_run`:26796, `_lb_tick`:26803, `_lb_upload`:26811, `_lb_fetch`:26821, `_lb_got`:26829, `_lb_value`:26842, `_lb_refresh_ui`:26853

## 26900-27461  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26924, `_market_near`:27003, `_build_gear`:27013, `_gear_piece`:27021, `_pet_m`:27066, `_pet_eyes`:27080, `_build_pet`:27087, `_pet_nose`:27225, `_pet_anim`:27228, `_market_apply`:27239, `_market_tick`:27263, `_build_market_panel`:27287, `_open_market`:27313, `_close_market`:27320, `_refresh_market`:27324, `_market_pick`:27377, `_toggle_board`:27415, `_board_tick`:27425

## 27462-27706  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27494, `_ds_label`:27513, `_build_display`:27527, `_ds_got`:27607, `_ds_sorted`:27616, `_ds_render_board`:27630, `_ds_render_news`:27656, `_display_tick`:27677

## 27707-27885  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27724, `_toggle_streamer`:27811, `_streamer_badge_tap`:27827, `_streamer_tick`:27831

## 27886-27922  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27892, `_car_back`:27899, `_car_park_tick`:27906

## 27923-28019  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27927, `_bus_eta`:27981, `_bus_displays_tick`:27997

## 28020-28311  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:28038, `_treasure_pick`:28041, `_treasure_spot`:28050, `_treasure_district`:28054, `_treasure_clue`:28066, `_treasure_prop`:28079, `_tp_part`:28082, `_tp_sphere`:28092, `_tp_cyl`:28100, `_treasure_prop_side`:28109, `_build_treasure_props`:28121, `_build_treasure`:28165, `_treasure_dir_char`:28234, `_treasure_tick`:28243, `_treasure_claim`:28297

## 28312-28412  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:28313, `_halo_mat`:28345, `_smoke_treasure`:28370

## 28413-28736  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28434, `_fm_send`:28437, `_fm_area`:28443, `_fm_glow_mesh`:28459, `_fm_block_reason`:28477, `_fm_start`:28489, `_fm_announce`:28517, `_fm_finish`:28520, `_fm_msg`:28538, `_fm_check_paid`:28589, `_fm_tick`:28607, `_smoke_findme`:28663

## 28737-28847  v0.24.2: road map (for moving people off the road)

`_floor_note`:28743, `_floor_disc`:28757, `_floor_top`:28766, `_ground_at`:28784, `_note_road`:28802, `_on_road`:28809, `_ped_curb`:28819, `_curb_spot`:28829

## 28848-29143  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28870, `_ex_grid`:28878, `_ex_lamps`:28913, `_ex_umbrella`:28936, `_ex_yards`:28943, `_build_expansion`:28958, `_expand_shots`:29121

## 29144-29338  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:29185, `_v27_near_cross`:29277, `_v27_near_any_road`:29284, `_v27_in_district`:29290, `_sea_tick`:29304, `_sea_tow`:29323

## 29339-30006  Harbor Loop sky train

`_sky_build_path`:29390, `_sky_pos`:29431, `_sky_dir`:29445, `_sky_project`:29450, `_sky_trip_time`:29469, `_sky_trip_dist`:29475, `_sky_now`:29486, `_sky_state`:29489, `_sky_time_at_station`:29504, `_sky_next_arrival`:29511, `_build_skytrain`:29524, `_sky_make_car`:29676, `_sky_skin`:29713, `_sky_place_trains`:29733, `_sky_build_station`:29752, `_sky_near`:29817, `_sky_fmt`:29826, `_sky_enter`:29830, `_sky_leave_platform`:29848, `_sky_board`:29858, `_sky_alight`:29872, `_sky_action`:29886, `_sky_tick`:29903, `_sky_camera`:29943, `_tour_today`:29959, `_tour_stamp`:29962, `_sky_hud`:29985

## 30007-30380  Day and night

`_toggle_weather`:30090, `_refresh_weather_button`:30096, `_game_hour`:30102, `_day_key`:30114, `_night_setup`:30129, `_night_scan_mesh`:30219, `_daynight_tick`:30244, `_daynight_apply`:30253, `_daynight_lights`:30365, `_cycle_day_mode`:30370, `_refresh_time_button`:30377

## 30381-31018  v0.27 smoke test and screenshots

`_smoke_v27`:30382, `_city_shots`:30587

## 31019-31435  v0.27: Harbor International Airport (north of the city)

`_build_airport`:31053, `_ap_plane`:31229, `_ap_truck`:31249, `_ap_baggage_train`:31290, `_ap_loop_pos`:31303, `_ap_loop_len`:31319, `_ap_flight_at`:31325, `_ap_tick`:31349, `_airport_ped_plan`:31372, `_smoke_airport`:31392

## 31436-31949  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31450, `_nav_spot`:31457, `_nav_idx`:31461, `_nav_pos`:31468, `_nav_blocked`:31472, `_nav_nearest_free`:31482, `_nav_bfs`:31510, `_nav_build`:31554, `_stroller`:31625, `_stroll_place`:31641, `_stroll_next`:31662, `_nav_clear_line`:31696, `_stroll_aim`:31707, `_strollers_tick`:31739, `_smoke_strollers`:31834

## 31950-32110  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31985, `_dir_fmt`:31988, `_signpost_spot`:31991, `_build_signposts`:32008

## 32111-32207  the Directions panel and chip

`_build_dir_panel`:32112, `_open_dir`:32154, `_dir_close`:32163, `_dir_pick`:32167, `_dir_stop`:32172, `_dir_stop_and_close`:32177, `_dir_tick`:32181

## 32208-32749  v0.44: Grand Central

`_gc_mesh`:32237, `_gc_mat`:32270, `_gc_glass`:32279, `_gb`:32289, `_gb_solid`:32295, `_gb_flush`:32299, `_gc_tree`:32329, `_gc_text`:32334, `_gc_planter`:32349, `_gc_kiosk`:32355, `_goods_color`:32385, `_goods_mat`:32388, `_kiosk_goods`:32392, `_build_grand_central`:32470, `_build_gc_towers`:32638, `_gc_tick`:32733

## 32750-33041  v0.44: filling the empty land

`_loft`:32767, `_fill_clear`:32809, `_build_fill`:32819, `_hg_in_lake`:32867, `_hg_path`:32871, `_floor_note_rot`:32879, `_build_gardens`:32887, `_build_fan_plaza`:32997

## 33042-33076  v0.45: hover car underglow

`_car_underglow`:33045

## 33077-33241  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:33078

## 33242-33273  v0.47: street stalls downtown

`_build_street_stalls`:33246, `_cull_people_in`:33266

## 33274-33372  v0.48: places that open as you level up

`_place_lock_of`:33287, `_place_root`:33293, `_place_unlocked`:33296, `_build_place_signs`:33304, `_places_refresh`:33349, `_places_tick`:33366

## 33373-33417  v0.50: city careers

`_career_rank_name`:33398, `_career_mult`:33401, `_career_block_reason`:33406, `_career_start`:33409, `_career_end`:33414

## 33418-33468  v0.52: careers as clear job loops

`_cid`:33445, `_career_target`:33459, `_career_tick`:33466

## 33469-33476  taxi

`_taxi_meter`:33470

## 33477-33480  paramedic

(no functions)

## 33481-33485  police

`_career_chase_over`:33483

## 33486-33491  firefighter

`_fire_aimed`:33487

## 33492-33501  the step bar

`_career_bar_text`:33495, `_career_hud`:33499

## 33502-33528  cut scenes

`_cs_skip`:33520

## 33529-33533  siren

(no functions)

## 33534-33545  the Careers panel

`_build_career_panel`:33535, `_open_careers`:33538, `_career_close`:33542

## 33546-33969  v0.50: homes

`_home_door_spots`:33586, `_build_homes`:33601, `_home_labels`:33630, `_home_door_near`:33639, `_home_origin`:33648, `_home_slot_near`:33651, `_home_exit_near`:33662, `_home_btn`:33669, `_home_interact`:33682, `_home_buy`:33701, `_home_default_layout`:33715, `_home_enter`:33723, `_home_leave`:33743, `_hm`:33751, `_home_build_room`:33770, `_home_refresh_room`:33879, `_furni_build`:33893

## 33970-34305  decorating

`_build_home_panels`:33971, `_open_homes`:34016, `_home_row_go`:34026, `_home_panel_close`:34046, `_deco_open`:34050, `_deco_pick`:34073, `_smoke_careers_homes`:34096

## 34306-34440  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:34310, `_home_slots`:34318, `_home_ring`:34345, `_furni_cat`:34351, `_home_fix_layout`:34357, `_home_build_layout`:34385

## 34441-34874  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34504, `_ch_homes`:34510, `_ch_step_text`:34517, `_ch_step_done`:34528, `_ch_target`:34542, `_ch_finish_chapter`:34551, `_chapters_tick`:34573, `_hud_top_stack`:34613, `_build_chapters_ui`:34643, `_chapters_restart_ask`:34685, `_chapters_restart`:34688, `_chapters_text`:34698, `_open_chapters`:34718, `_chapters_close`:34725, `_smoke_chapters`:34729, `_step_sound`:34850

## 34875-34913  v0.51.1: join and leave messages

`_announce_join`:34882, `_announce_already_here`:34901, `_announce_leave`:34909

## 34914-35178  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34930, `_shot_tick`:34936, `_draw_shot_icon`:34968, `_shot_enter`:34977, `_shot_exit`:34991, `_shot_release_controls`:35003, `_shot_stick_zone`:35010, `_shot_input`:35013, `_smoke_photo`:35085

## 35179-35477  v0.51.3: stream joiners

`_viewer_count`:35199, `_stream_join_check`:35205, `_stream_join_start`:35212, `_sj_streamer`:35229, `_stream_join_tick`:35238, `_stream_join_land`:35262, `_sj_welcome`:35278, `_smoke_stream_join`:35312, `_career_shot`:35395

## 35478-35594  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35482, `_st_restore`:35520, `_smoke_streamer_clean`:35541, `_world_bio_passport`:35592

