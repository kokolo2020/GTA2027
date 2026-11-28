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

## 19175-19632  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:19200, `_place_portal_button`:19206, `_portal_pressed`:19213, `_build_travel`:19221, `_toggle_run`:19326, `_refresh_run`:19330, `_hud_v23_tick`:19338, `_travel_block_reason`:19370, `_travel_open`:19390, `_open_travel`:19396, `_open_worlds`:19402, `_open_case`:19408, `_case_step`:19420, `_case_refresh`:19424, `_case_submit`:19428, `_close_case`:19437, `_sky_go`:19441, `_close_worlds`:19451, `_refresh_worlds`:19455, `_world_go`:19461, `_close_travel`:19468, `_refresh_travel`:19472, `_travel_to`:19480, `_smoke_travel`:19507, `_v23_shots`:19545

## 19633-19706  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19640, `_qr_button`:19655, `_qr_layout`:19694, `_smoke_qr`:19700

## 19707-20143  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19727, `_open_crate`:19743, `_build_crate_ui`:19760, `_crate_pick`:19847, `_crate_reveal`:19870, `_crate_draw_car`:19897, `_crate_confetti`:19916, `_crate_sound`:19941, `_crate_drive`:19967, `_feed_add_system`:19997, `_smoke_crate`:20000, `_crate_shots`:20048

## 20144-20635  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:20185, `_quick_today`:20190, `_quick_is_done`:20193, `_quick_left`:20196, `_quick_next`:20203, `_quick_fix_target`:20216, `_quick_daily_check`:20230, `_quick_complete`:20244, `_quick_side`:20278, `_build_quick_props`:20296, `_daily_shots`:20448, `_quick_props_refresh`:20490, `_quick_fx`:20494, `_play_coin`:20510, `_smoke_quick`:20527

## 20636-20786  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20645, `_quest_nearby`:20700, `_open_quests`:20707, `_close_quests`:20714, `_refresh_quests`:20718, `_quest_pick`:20744, `_quest_mode`:20758, `_smoke_quests`:20761

## 20787-20821  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20791, `_my_tag_tick`:20794

## 20822-21136  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20839, `_fc_torus`:20849, `_fc_pearl`:20857, `_fc_chrome`:20867, `_fc_glass`:20876, `_fc_glow`:20886, `_fc_ghost`:20895, `_fc_holo`:20907, `_fc_mesh`:20917, `_fc_sphere`:20937, `_fc_capsule`:20945, `_fc_cone`:20953, `_build_food_court`:20962, `_food_court_tick`:21116

## 21137-21458  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:21166, `_cm_bench`:21182, `_build_commons`:21195, `_commons_tick`:21417

## 21459-21773  v0.36: the daily puzzle

`_pz_today`:21482, `_pz_new`:21485, `_pz_neighbours`:21530, `_pz_flip`:21540, `_pz_done`:21545, `_pz_tap`:21553, `_pz_win`:21569, `_pz_reset`:21590, `_puzzle_near`:21594, `_open_puzzle`:21599, `_close_puzzle`:21607, `_pz_refresh_sign`:21611, `_build_puzzle_panel`:21619, `_pz_draw`:21650, `_smoke_chat`:21691, `_smoke_feet`:21729, `_smoke_commons`:21750

## 21774-21962  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21836, `_bio_theta`:21840, `_bio_sec_n`:21845, `_bio_sec_of`:21848, `_bio_pt`:21851, `_bio_lp`:21856, `_bio_la`:21860, `_bio_dir`:21864, `_bio_hex_r`:21867, `_bio_apo`:21872, `_bio_open_angles`:21878, `_bio_si`:21888, `_bm`:21894, `_bsph`:21899, `_blow`:21902, `_bcone`:21913, `_bbox`:21916, `_bp`:21919, `_bq`:21924, `_bio_glass_mat`:21928, `_bio_water_mat`:21941, `_bio_mat`:21953

## 21963-22335  building blocks

`_bio_inst`:21964, `_bio_add`:21970, `_bio_model`:21973, `_bio_nature_mesh`:21979, `_bio_flush`:22013, `_bio_bar`:22048, `_bio_slab`:22061, `_bio_body`:22076, `_bio_cyl_col`:22089, `_bio_hexmesh`:22102, `_bio_hexslab`:22114, `_bio_hexpt`:22120, `_bio_gridshell`:22127, `_bio_rail`:22234, `_bio_rail_arc`:22239, `_bio_disc_deck`:22251, `_bio_ring_deck`:22257, `_bio_helix`:22268, `_bio_pillar`:22288, `_bio_cafe`:22294, `_bio_fence_line`:22308, `_bio_fence_seg`:22313, `_bio_pen`:22323

## 22336-22837  building

`_build_biosphere`:22337, `_build_biosphere_legacy`:22341, `_bio_text`:22503, `_bio_plaque`:22521, `_bio_ticket_hall`:22535, `_on_foot_collision_guard`:22591, `_bio_inside`:22601, `_bio_pass_ok`:22604, `_ticket_near`:22608, `_bio_buy_pass`:22613, `_bio_gates_update`:22629, `_bio_gate_tick`:22655, `_bio_tunnel`:22667, `_bio_grounds`:22720, `_bio_dome`:22766, `_bio_deck_mats`:22834

## 22838-22993  garden planting

`_bio_free`:22839, `_bio_spot`:22856, `_bio_garden`:22864, `_bio_pine`:22905, `_bio_tree`:22908, `_bio_big_tree`:22918, `_bio_rock`:22923, `_bio_pond`:22926, `_bio_particles`:22930, `_bio_mist`:22958, `_bio_mini_dome`:22987

## 22994-23401  the four layouts

`_bio_winter`:22995, `_bio_spring`:23087, `_bio_summer`:23212, `_bio_autumn`:23296

## 23402-23672  animals

`_bio_spawn`:23403, `_bio_load_animal`:23475, `_bio_make_quad`:23496, `_bio_load_bird`:23573, `_bio_make_penguin`:23593, `_bio_make_bird`:23615, `_bio_make_flamingo`:23639, `_bio_make_butterfly`:23660

## 23673-23810  animation, spotting and rewards

`_bio_stuck_check`:23678, `_biosphere_tick`:23696, `_bio_animate`:23711, `_bio_spot_check`:23791, `_bio_spotted`:23803, `_smoke_biosphere`:23807

## 23811-24328  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23898, `_wear_piece`:23901, `_wear_mat`:23924, `_person_index`:23940, `_dress`:23963, `_smoke_style`:24069, `_style_shots`:24220, `_npc_look`:24292

## 24329-24482  your look: apply, save, share

`_look_clean`:24333, `_look_pack`:24348, `_owns`:24354, `_apply_look`:24359, `_relic_model`:24370, `_fc_mesh_mat`:24435, `_relic_refresh`:24438, `_relic_tick`:24452, `_peer_style`:24463

## 24483-24910  stores and the wardrobe

`_style_today`:24502, `_style_items`:24505, `_style_cat`:24513, `_style_price`:24516, `_style_deal`:24530, `_style_price_base`:24543, `_relic_stock`:24550, `_build_style_panel`:24562, `_open_store`:24602, `_open_wardrobe`:24621, `_style_close`:24624, `_style_finish`:24628, `_sync_old_avatar`:24643, `_style_tabs_for`:24650, `_refresh_style`:24655, `_style_body_rows`:24806, `_style_set_tab`:24823, `_style_step`:24827, `_style_color`:24832, `_style_pick`:24837, `_style_buy`:24872, `_ach_relics_check`:24894, `_style_face_camera`:24899

## 24911-25378  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24947, `_ga_text`:24953, `_ga_box`:24970, `_build_galleria`:24986, `_ga_inner_tick`:25127, `_ga_shell`:25143, `_ga_inside`:25193, `_bio_cyl_col_on`:25196, `_ga_models`:25208, `_ga_lbox`:25223, `_ga_ltext`:25237, `_ga_store`:25244, `_bio_cafe_on`:25346, `_ga_mannequins`:25354

## 25379-25530  featured outfits and the Sky Run

`_ga_featured_look`:25392, `_build_ga_fun`:25413, `_ga_fun_tick`:25458, `_sky_finish`:25485, `_extra_near`:25504, `_extra_open`:25513, `_store_near`:25522

## 25531-25627  v0.41: THE SKY GARDEN

`_sg_now`:25585, `_sg_progress`:25588, `_sg_time`:25594, `_sg_stock`:25601, `_sg_mut_roll`:25616

## 25628-25765  building

`_sg_box`:25629, `_sg_text`:25635, `_build_sky_garden`:25649, `_sg_seed_spot`:25760, `_sg_codex_spot`:25763

## 25766-25946  plants

`_sg_plant_model`:25767, `_sg_refresh_all`:25872, `_sg_refresh`:25876, `_sky_garden_tick`:25912, `_sg_ready_count`:25931, `_sg_boot_note`:25938

## 25947-26066  interacting

`_sg_near`:25948, `_sg_button_text`:25971, `_sg_value`:25984, `_sg_interact`:25988, `_sg_buy`:26004, `_sg_plant`:26026, `_sg_harvest`:26037

## 26067-26310  the garden screen

`_build_sg_panel`:26068, `_sg_open`:26103, `_sg_close`:26112, `_sg_row`:26116, `_sg_refresh_panel`:26131, `_sg_pick_buy`:26176, `_sg_pick_plant`:26180, `_smoke_car_barriers`:26186, `_smoke_sky_garden`:26227

## 26311-26349  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26342, `_pass_day`:26345

## 26350-26381  album

`_album_pages`:26351, `_album_claim`:26366

## 26382-26433  season

`_season_index`:26383, `_season_tick`:26386, `_season_xp`:26395, `_season_tier`:26398, `_season_reward`:26401, `_season_claim`:26415

## 26434-26441  Harbor Night

`_harbor_night`:26435

## 26442-26473  check-in calendar

`_cal_tick`:26443

## 26474-26650  the panel

`_build_hp_panel`:26475, `_open_pass`:26510, `_hp_open`:26513, `_hp_close`:26520, `_hp_row`:26524, `_hp_bar`:26539, `_hp_refresh`:26543, `_smoke_pass`:26588

## 26651-26889  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26655, `_cash_pill_tick`:26663, `_build_lb`:26701, `_open_lb`:26747, `_close_lb`:26755, `_lb_pick`:26759, `_lb_headers`:26764, `_lb_url`:26768, `_lb_me`:26771, `_lb_level`:26776, `_lb_test_run`:26786, `_lb_tick`:26793, `_lb_upload`:26801, `_lb_fetch`:26811, `_lb_got`:26819, `_lb_value`:26832, `_lb_refresh_ui`:26843

## 26890-27448  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26914, `_market_near`:26993, `_build_gear`:27003, `_gear_piece`:27011, `_pet_m`:27056, `_pet_eyes`:27070, `_build_pet`:27077, `_pet_nose`:27215, `_pet_anim`:27218, `_market_apply`:27229, `_market_tick`:27253, `_build_market_panel`:27277, `_open_market`:27303, `_close_market`:27310, `_refresh_market`:27314, `_market_pick`:27367, `_toggle_board`:27405, `_board_tick`:27412

## 27449-27693  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27481, `_ds_label`:27500, `_build_display`:27514, `_ds_got`:27594, `_ds_sorted`:27603, `_ds_render_board`:27617, `_ds_render_news`:27643, `_display_tick`:27664

## 27694-27872  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27711, `_toggle_streamer`:27798, `_streamer_badge_tap`:27814, `_streamer_tick`:27818

## 27873-27909  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27879, `_car_back`:27886, `_car_park_tick`:27893

## 27910-28006  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27914, `_bus_eta`:27968, `_bus_displays_tick`:27984

## 28007-28298  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:28025, `_treasure_pick`:28028, `_treasure_spot`:28037, `_treasure_district`:28041, `_treasure_clue`:28053, `_treasure_prop`:28066, `_tp_part`:28069, `_tp_sphere`:28079, `_tp_cyl`:28087, `_treasure_prop_side`:28096, `_build_treasure_props`:28108, `_build_treasure`:28152, `_treasure_dir_char`:28221, `_treasure_tick`:28230, `_treasure_claim`:28284

## 28299-28399  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:28300, `_halo_mat`:28332, `_smoke_treasure`:28357

## 28400-28723  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28421, `_fm_send`:28424, `_fm_area`:28430, `_fm_glow_mesh`:28446, `_fm_block_reason`:28464, `_fm_start`:28476, `_fm_announce`:28504, `_fm_finish`:28507, `_fm_msg`:28525, `_fm_check_paid`:28576, `_fm_tick`:28594, `_smoke_findme`:28650

## 28724-28834  v0.24.2: road map (for moving people off the road)

`_floor_note`:28730, `_floor_disc`:28744, `_floor_top`:28753, `_ground_at`:28771, `_note_road`:28789, `_on_road`:28796, `_ped_curb`:28806, `_curb_spot`:28816

## 28835-29130  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28857, `_ex_grid`:28865, `_ex_lamps`:28900, `_ex_umbrella`:28923, `_ex_yards`:28930, `_build_expansion`:28945, `_expand_shots`:29108

## 29131-29325  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:29172, `_v27_near_cross`:29264, `_v27_near_any_road`:29271, `_v27_in_district`:29277, `_sea_tick`:29291, `_sea_tow`:29310

## 29326-29993  Harbor Loop sky train

`_sky_build_path`:29377, `_sky_pos`:29418, `_sky_dir`:29432, `_sky_project`:29437, `_sky_trip_time`:29456, `_sky_trip_dist`:29462, `_sky_now`:29473, `_sky_state`:29476, `_sky_time_at_station`:29491, `_sky_next_arrival`:29498, `_build_skytrain`:29511, `_sky_make_car`:29663, `_sky_skin`:29700, `_sky_place_trains`:29720, `_sky_build_station`:29739, `_sky_near`:29804, `_sky_fmt`:29813, `_sky_enter`:29817, `_sky_leave_platform`:29835, `_sky_board`:29845, `_sky_alight`:29859, `_sky_action`:29873, `_sky_tick`:29890, `_sky_camera`:29930, `_tour_today`:29946, `_tour_stamp`:29949, `_sky_hud`:29972

## 29994-30367  Day and night

`_toggle_weather`:30077, `_refresh_weather_button`:30083, `_game_hour`:30089, `_day_key`:30101, `_night_setup`:30116, `_night_scan_mesh`:30206, `_daynight_tick`:30231, `_daynight_apply`:30240, `_daynight_lights`:30352, `_cycle_day_mode`:30357, `_refresh_time_button`:30364

## 30368-31005  v0.27 smoke test and screenshots

`_smoke_v27`:30369, `_city_shots`:30574

## 31006-31422  v0.27: Harbor International Airport (north of the city)

`_build_airport`:31040, `_ap_plane`:31216, `_ap_truck`:31236, `_ap_baggage_train`:31277, `_ap_loop_pos`:31290, `_ap_loop_len`:31306, `_ap_flight_at`:31312, `_ap_tick`:31336, `_airport_ped_plan`:31359, `_smoke_airport`:31379

## 31423-31936  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31437, `_nav_spot`:31444, `_nav_idx`:31448, `_nav_pos`:31455, `_nav_blocked`:31459, `_nav_nearest_free`:31469, `_nav_bfs`:31497, `_nav_build`:31541, `_stroller`:31612, `_stroll_place`:31628, `_stroll_next`:31649, `_nav_clear_line`:31683, `_stroll_aim`:31694, `_strollers_tick`:31726, `_smoke_strollers`:31821

## 31937-32097  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31972, `_dir_fmt`:31975, `_signpost_spot`:31978, `_build_signposts`:31995

## 32098-32194  the Directions panel and chip

`_build_dir_panel`:32099, `_open_dir`:32141, `_dir_close`:32150, `_dir_pick`:32154, `_dir_stop`:32159, `_dir_stop_and_close`:32164, `_dir_tick`:32168

## 32195-32736  v0.44: Grand Central

`_gc_mesh`:32224, `_gc_mat`:32257, `_gc_glass`:32266, `_gb`:32276, `_gb_solid`:32282, `_gb_flush`:32286, `_gc_tree`:32316, `_gc_text`:32321, `_gc_planter`:32336, `_gc_kiosk`:32342, `_goods_color`:32372, `_goods_mat`:32375, `_kiosk_goods`:32379, `_build_grand_central`:32457, `_build_gc_towers`:32625, `_gc_tick`:32720

## 32737-33028  v0.44: filling the empty land

`_loft`:32754, `_fill_clear`:32796, `_build_fill`:32806, `_hg_in_lake`:32854, `_hg_path`:32858, `_floor_note_rot`:32866, `_build_gardens`:32874, `_build_fan_plaza`:32984

## 33029-33063  v0.45: hover car underglow

`_car_underglow`:33032

## 33064-33228  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:33065

## 33229-33260  v0.47: street stalls downtown

`_build_street_stalls`:33233, `_cull_people_in`:33253

## 33261-33359  v0.48: places that open as you level up

`_place_lock_of`:33274, `_place_root`:33280, `_place_unlocked`:33283, `_build_place_signs`:33291, `_places_refresh`:33336, `_places_tick`:33353

## 33360-33404  v0.50: city careers

`_career_rank_name`:33385, `_career_mult`:33388, `_career_block_reason`:33393, `_career_start`:33396, `_career_end`:33401

## 33405-33455  v0.52: careers as clear job loops

`_cid`:33432, `_career_target`:33446, `_career_tick`:33453

## 33456-33463  taxi

`_taxi_meter`:33457

## 33464-33467  paramedic

(no functions)

## 33468-33472  police

`_career_chase_over`:33470

## 33473-33478  firefighter

`_fire_aimed`:33474

## 33479-33488  the step bar

`_career_bar_text`:33482, `_career_hud`:33486

## 33489-33515  cut scenes

`_cs_skip`:33507

## 33516-33520  siren

(no functions)

## 33521-33532  the Careers panel

`_build_career_panel`:33522, `_open_careers`:33525, `_career_close`:33529

## 33533-33956  v0.50: homes

`_home_door_spots`:33573, `_build_homes`:33588, `_home_labels`:33617, `_home_door_near`:33626, `_home_origin`:33635, `_home_slot_near`:33638, `_home_exit_near`:33649, `_home_btn`:33656, `_home_interact`:33669, `_home_buy`:33688, `_home_default_layout`:33702, `_home_enter`:33710, `_home_leave`:33730, `_hm`:33738, `_home_build_room`:33757, `_home_refresh_room`:33866, `_furni_build`:33880

## 33957-34292  decorating

`_build_home_panels`:33958, `_open_homes`:34003, `_home_row_go`:34013, `_home_panel_close`:34033, `_deco_open`:34037, `_deco_pick`:34060, `_smoke_careers_homes`:34083

## 34293-34427  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:34297, `_home_slots`:34305, `_home_ring`:34332, `_furni_cat`:34338, `_home_fix_layout`:34344, `_home_build_layout`:34372

## 34428-34861  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34491, `_ch_homes`:34497, `_ch_step_text`:34504, `_ch_step_done`:34515, `_ch_target`:34529, `_ch_finish_chapter`:34538, `_chapters_tick`:34560, `_hud_top_stack`:34600, `_build_chapters_ui`:34630, `_chapters_restart_ask`:34672, `_chapters_restart`:34675, `_chapters_text`:34685, `_open_chapters`:34705, `_chapters_close`:34712, `_smoke_chapters`:34716, `_step_sound`:34837

## 34862-34900  v0.51.1: join and leave messages

`_announce_join`:34869, `_announce_already_here`:34888, `_announce_leave`:34896

## 34901-35165  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34917, `_shot_tick`:34923, `_draw_shot_icon`:34955, `_shot_enter`:34964, `_shot_exit`:34978, `_shot_release_controls`:34990, `_shot_stick_zone`:34997, `_shot_input`:35000, `_smoke_photo`:35072

## 35166-35464  v0.51.3: stream joiners

`_viewer_count`:35186, `_stream_join_check`:35192, `_stream_join_start`:35199, `_sj_streamer`:35216, `_stream_join_tick`:35225, `_stream_join_land`:35249, `_sj_welcome`:35265, `_smoke_stream_join`:35299, `_career_shot`:35382

## 35465-35581  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35469, `_st_restore`:35507, `_smoke_streamer_clean`:35528, `_world_bio_passport`:35579

