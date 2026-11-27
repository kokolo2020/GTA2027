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

## 2703-3218  public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield

`_bus_first`:2704, `_bus_last`:2707, `_build_bus`:2710, `_bus_boxes`:2737, `_bus_skin`:2747, `_bus_side`:2760, `_bus_reset`:2763, `_bus_text`:2772, `_bus_tick`:2777, `_bus_near`:2817, `_bus_board`:2828, `_bus_alight`:2843, `_build_marina`:2857, `_set_hat`:2963, `_build_hat`:2966, `_cyl`:3031, `_hat_part`:3040, `_apply_avatar`:3049, `_shop_count`:3061, `_shop_open`:3071, `_shop_step`:3089, `_shop_close`:3095, `_owned_text`:3108, `_refresh_shop`:3111, `_shop_action`:3164, `_journal_flip`:3215

## 3219-3273  v0.12.0: player level (derived from progress, so old saves convert automatically)

`_level_table`:3230, `_xp`:3233, `_level_for`:3240, `_level`:3248, `_level_text`:3251, `_check_level`:3261

## 3274-3376  v0.11.0: online police vs thief

`_orole_ready`:3275, `_orole_start`:3278, `_orole_end`:3305, `_orole_tick`:3314

## 3377-4320  v0.10.0: chase mode (offline)

`_chase_open`:3378, `_chase_clear`:3383, `_chase_make_unit`:3397, `_chase_spawn_point`:3427, `_chase_start`:3436, `_chase_end`:3472, `_chase_steer`:3491, `_chase_roadblock`:3527, `_chase_heli_build`:3572, `_chase_extras`:3598, `_chase_tick`:3625, `_start_trial`:3689, `_cancel_trial`:3716, `_check_trial`:3721, `_finish_trial`:3738, `_trial_count`:3754, `_open_trials`:3761, `_refresh_trials`:3765, `_update_gate`:3777, `_slab`:3795, `_build_ridge`:3813, `_check_ridge`:3876, `_discover`:3889, `_mission_progress`:3903, `_check_missions`:3965, `_open_garage`:3976, `_open_journal`:3981, `_close_sub`:3986, `_bar`:3989, `_refresh_garage`:3993, `_garage_step`:4018, `_garage_action`:4022, `_refresh_journal`:4042, `_visited_shops`:4075, `_build_panels`:4082, `_build_player`:4242, `_build_car`:4280, `_try_model`:4309

## 4321-5005  v0.14.0: Blender-made people (player, pedestrians, online players on foot)

`_make_person`:4322, `_kshader`:4396, `_ksync`:4402, `_kskin`:4417, `_make_kperson`:4423, `_hat_y`:4487, `_sit_drop`:4490, `_kplay`:4493, `_kpeople_tick`:4503, `_pose_person`:4532, `_pose_limbs`:4549, `_person_lift`:4611, `_snap_crowd_feet`:4624, `_people_life_tick`:4640, `_life_one`:4677, `_cull_person`:4687, `_recolor_car_model`:4695, `_apply_car_model`:4709, `_landmark`:4729, `_label`:4739, `_button`:4746, `_panel`:4758, `_build_hud`:4768

## 5006-5124  v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu)

`_clean_on`:5012, `_menu_tab`:5018, `_watch_tick`:5041, `_watch_count`:5083, `_online_pill_tap`:5090, `_online_pill_tick`:5096, `online_config_ok`:5122

## 5125-5162  v0.30.1: nothing to collect stands in a road

`_offroad_ok`:5128, `_offroad`:5134, `_ground_near`:5147, `_collectibles_on_road`:5154

## 5163-5302  v0.30.1: quests are offered when you get near them; you choose to take them

`_qt`:5175, `_build_quest_offer`:5179, `_quest_offer_tick`:5209, `_quest_auto_pick`:5259, `_quest_accept`:5274, `_quest_decline`:5288, `_quest_stop`:5294

## 5303-5670  v0.31: a futuristic Chit Chat City (neon strips, holograms, flying traffic, glowing streets)

`_neon_mat`:5327, `_holo_material`:5336, `_build_future`:5344, `_build_neon`:5358, `_model_profile`:5427, `_model_body_box`:5450, `_build_holograms`:5464, `_holo_tick`:5514, `_build_sky_traffic`:5531, `_sky_hover_car`:5549, `_sky_drone`:5596, `_sky_traffic_tick`:5640, `_future_lights`:5659

## 5671-6170  v0.32: social. Friends, invites, crews, gifts, high-fives, dance floor, photos

`_uid`:5730, `_crew_col`:5738, `_peer_crewmate`:5741, `_set_ring_color`:5744, `_level_color`:5771, `_tier_color`:5784, `_my_ach_tier`:5787, `_style_ring`:5794, `_social_peer_extras`:5842, `_social_tag`:5856, `_my_tag_extra`:5868, `_soc_send`:5881, `_social_msg`:5896, `_social_accept`:5935, `_social_go`:5956, `_soc_friend`:5975, `_soc_invite`:5982, `_soc_goto`:5987, `_soc_high_five`:5995, `_soc_gift`:6015, `_soc_crew_invite`:6032, `_gift_day_check`:6039, `_crew_create`:6045, `_crew_cycle_color`:6055, `_crew_leave`:6060, `_crew_mate_near`:6068, `_crew_board`:6076, `_build_social`:6095, `_social_online`:6157, `_open_social`:6161, `_close_social`:6167

## 6171-6421  v0.33.5: track a player (the arrow follows them around the city)

`_soc_track`:6174, `_track_pos`:6183, `_social_row_button`:6194, `_refresh_social`:6201, `_on_dance_floor`:6263, `_toggle_dance`:6266, `_build_dance_floor`:6274, `_social_tick`:6300, `_photo`:6372

## 6422-6917  v0.33: Harbor Dome arcade (Connect Four, Reaction Duel, Memory Match) and party quiz

`_robot_table`:6444, `_game_state`:6452, `_build_arcade`:6464, `_c4_empty`:6515, `_c4_drop_row`:6521, `_c4_winner`:6527, `_c4_bot_move`:6548, `_c4_code`:6577, `_c4_ready`:6583, `_c4_tap`:6586, `_c4_check`:6607, `_c4_tick`:6631, `_rx_ready`:6658, `_rx_start`:6661, `_rx_tap`:6675, `_rx_send_time`:6700, `_rx_resolve`:6707, `_rx_tick`:6733, `_mem_start`:6748, `_mem_tap`:6764, `_mem_finish`:6779, `_mem_tick`:6795, `_mem_board_text`:6802, `_build_arcade_panel`:6813, `_refresh_arcade_panel`:6856

## 6918-7211  Party Quiz: everyone in the quiz zone gets the same question at the same time

`_quiz_now`:6981, `_quiz_slot`:6984, `_quiz_question`:6994, `_quiz_bot_score`:7023, `_in_quiz`:7032, `_build_quiz`:7035, `_quiz_answer`:7105, `_quiz_msg`:7118, `_quiz_board`:7126, `_quiz_tick`:7136, `_quiz_refresh`:7178

## 7212-8797  v0.34: achievements (75 of them in four tiers; Gold and Legend are announced to everyone online)

`_stat_add`:7383, `_sites_found`:7386, `_sites_total`:7389, `_bits`:7392, `_ach_value`:7399, `_ach_tick`:7454, `_ach_check`:7479, `_ach_by_id`:7515, `_ach_msg`:7521, `_build_ach`:7534, `_ach_show`:7565, `_open_ach`:7585, `_close_ach`:7591, `_refresh_ach`:7595, `_ach_num`:7626, `_minimap_tap`:7629, `_menu_go`:7636, `_menu_stay`:7641, `_menu_call_car`:7645, `_toggle_clean_hud`:7651, `_refresh_menu_buttons`:7657, `_clean_hud_tick`:7667, `_draw_joystick`:7708, `_input`:7713, `_touch_text_focus`:7804, `_stick_zone`:7824, `_notification`:7828, `_physics_process`:7845, `_follow_camera`:7998, `_follow_walk_camera`:8040, `_interact`:8063, `_refresh_hud`:8225, `_open_panel`:8354, `_layout_panels`:8384, `_toggle_menu`:8411, `_rescue`:8457, `_show_toast`:8489, `_save_progress`:8493, `_load_progress`:8588

## 8798-11430  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8799, `_radio_voice`:8802, `_radio_make`:8835, `_radio_set`:8906, `_radio_play`:8928, `_radio_next`:8933, `_radio_talk_line`:8937, `_radio_caption`:8958, `_radio_refresh`:8966, `_process`:8979, `_build_peds`:9030, `_update_peds`:9141, `_update_ped`:9160, `_smoke_test`:9214, `_smoke_chase`:9867, `_smoke_orole`:9900, `_smoke_levels`:9929, `_smoke_bus`:9970, `_smoke_chase_extras`:10055, `_smoke_marina`:10083, `_blocked_at`:10185, `_blocker`:10200, `_on_screen`:10213, `_wait_radio`:10218, `_smoke_radio_peds`:10225, `_smoke_typed_chat`:10295, `_smoke_chat_touch`:10314, `_smoke_cafe`:10335, `_smoke_boutique`:10361, `_smoke_models`:10389, `_smoke_garage_ridge`:10413, `_save_shot`:10789, `_sky_shots`:10799, `_pet_shots`:10828, `_tracker_shots`:10863, `_infected_shots`:10897, `_paris_shots`:10948, `_people_shots`:11178, `_shots`:11219, `_shot_car`:11413, `_capture_preview`:11423

## 11431-12079  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11498, `_downtown_count`:11501, `_nearest_downtown`:11508, `_check_downtown`:11522, `_discover_downtown`:11535, `_box_batch`:11549, `_model_batch`:11569, `_cut_ranges`:11623, `_dt_ranges`:11635, `_dt_has`:11642, `_dt_near_cross`:11648, `_place`:11654, `_signal_pole`:11665, `_cyl_batch`:11684, `_city_signals`:11708, `_ensure_light_mats`:11759, `_city_lamps`:11769, `_build_downtown`:11813, `_dt_block`:12013, `_downtown_token`:12019, `_build_park`:12036, `_build_plaza`:12065

## 12080-12183  old city and Bay details

`_build_city_detail`:12081

## 12184-12593  traffic

`_build_traffic`:12185, `_path_sample`:12280, `_light_look`:12294, `_light_green`:12302, `_traffic_place`:12306, `_traffic_blocked_by`:12318, `_traffic_tick`:12330, `_smoke_downtown`:12436, `_skyline_shot`:12548, `_skyline_shots`:12556

## 12594-12958  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12640, `_web_scale`:12703, `_web_fps_tick`:12713, `_world_to_uv`:12734, `_map_angle`:12737, `_build_minimap`:12745, `_open_map`:12818, `_close_map`:12829, `_mini_point`:12836, `_site_markers`:12840, `_draw_arrow`:12872, `_draw_minimap`:12879, `_draw_full_map`:12926, `_minimap_tick`:12951

## 12959-13239  camera views

`_build_view_controls`:12960, `_sky_grade`:13002, `_cycle_view`:13017, `_apply_view`:13027, `_hide_labels`:13071, `_unfade`:13077, `_bake_map`:13083, `_shot_stats`:13133, `_view_shots`:13136, `_smoke_views`:13177

## 13240-13487  v0.17.0: level-up celebration

`_build_level_fx`:13251, `_draw_level_rays`:13288, `_level_fx_tick`:13298, `_level_sound`:13303, `_fx_material`:13345, `_level_up_fx`:13353, `_smoke_level_fx`:13454, `_levelup_shots`:13463

## 13488-13609  v0.18.0: walk-in stadium

`_collider_yaw`:13493, `_build_stadium_walls`:13504, `_look`:13532, `_smoke_stadium_eye`:13541, `_stadium_shots`:13579

## 13610-13771  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13634, `_arrow_mesh`:13646, `_build_guidance`:13669, `_guide_target`:13694, `_guidance_tick`:13723, `_draw_hud_arrow`:13749

## 13772-13957  checkpoints

`_build_checkpoints`:13773, `_refresh_checkpoints`:13818, `_check_checkpoints`:13824, `_activate_checkpoint`:13834, `_checkpoint_spawn`:13855, `_spawn_at_checkpoint`:13860, `_draw_checkpoint_icon`:13876, `_smoke_guidance_checkpoints`:13882, `_guide_shots`:13932

## 13958-14236  v0.18.0: Harbor Dome social hub

`_hub_seat`:14016, `_build_hub`:14020

## 14237-14287  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:14238, `_xm_mesh`:14247, `_xm_tree`:14255

## 14288-14611  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:14291, `_gt_surface`:14306, `_xm_grand_tree`:14316, `_lux_mat`:14431, `_lux_part`:14447, `_lux_box`:14450, `_lux_cyl`:14455, `_lux_ball`:14463, `_lux_new`:14471, `_lux_commit`:14476, `_lux_sofa_mesh`:14480, `_lux_chair_mesh`:14510, `_lux_table_mesh`:14530, `_lux_pouf_mesh`:14545, `_lux_batch`:14560, `_hub_christmas`:14576

## 14612-14767  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14613

## 14768-15016  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14771, `_vx_cyl`:14778, `_vx_ball`:14786, `_vx_ring`:14794, `_hub_polish`:14802, `_hub_gate`:14825, `_hub_vip`:14887, `_hub_glass`:15000

## 15017-15231  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:15018, `_build_hub_bots`:15043, `_seat_of`:15074, `_bubble`:15084, `_emote`:15140, `_hub_people_tick`:15154

## 15232-15350  seats

`_seat_taken`:15233, `_nearest_seat`:15241, `_seat_label`:15253, `_sit`:15269, `_stand_up`:15313, `_seated_tick`:15332

## 15351-15507  game panel

`_build_game_panel`:15352, `_open_game_panel`:15407, `_refresh_game_panel`:15426, `_play_robot`:15471, `_peer_at`:15485, `_opponent_name`:15492, `_pay`:15500

## 15508-15628  tic-tac-toe

`_ttt_ready`:15511, `_ttt_winner`:15517, `_ttt_bot_move`:15527, `_ttt_tap`:15553, `_ttt_code`:15573, `_ttt_check`:15579, `_ttt_tick`:15602

## 15629-15680  rock paper scissors

`_rps_ready`:15630, `_rps_pick`:15636, `_rps_resolve`:15654, `_rps_tick`:15678

## 15681-15763  online table messages

`_online_game_send`:15682, `_hub_game_msg`:15688

## 15764-15839  comedy show

`_joke_start`:15765, `_joke_tick`:15777, `_speak`:15803, `_play_rimshot`:15812

## 15840-16739  quick chat and emotes

`_build_chat`:15862, `_chat_toggle_to`:15979, `_chat_log_add`:15987, `_chat_area`:15993, `_chat_near_count`:16011, `_chat_tick`:16020, `_toggle_chat`:16069, `_chat_fit`:16084, `_chat_clean`:16090, `_chat_wrap`:16107, `_chat_send_text`:16129, `_typing`:16152, `_say`:16155, `_do_emote`:16171, `_smoke_hub`:16180, `_chat_shots`:16354, `_cafe_shots`:16379, `_shop_shots`:16427, `_car_shots`:16476, `_outfit_shots`:16507, `_hub_shots`:16555, `_sg_on_terrace`:16690, `_people_only`:16693, `_people_only_keep_cars_out`:16697, `_car_barrier`:16709, `_hub_keep_cars_out`:16723

## 16740-16902  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16749, `_feed_add`:16758, `_feed_render`:16764, `_feed_tick`:16792, `_online_event_send`:16801, `_at_pvp_table`:16808, `_game_name`:16815, `_send_lfp`:16818, `_lfp_msg`:16835, `_accept_invite`:16856

## 16903-17144  v0.18.2: nickname and HUD relayout

`_nick_rude`:16915, `_clean_nick`:16930, `_build_nick_panel`:16942, `_open_nick`:16980, `_random_nick`:16989, `_save_nick`:16995, `_close_nick`:17014, `_refresh_nick_button`:17023, `_relayout_hud`:17027, `_smoke_nick`:17064, `_nick_shots`:17096, `_smoke_sites_reachable`:17114

## 17145-17432  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:17171, `_nearest_civic`:17178, `_check_civic`:17192, `_discover_civic`:17205, `_civ_ranges`:17218, `_civ_has`:17232, `_civ_near_cross`:17238, `_build_civic`:17244, `_civic_token`:17370, `_civic_shots`:17387, `_hub_focus`:17409

## 17433-17542  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17504, `_in_rw_lot`:17507, `_box_batch_rot`:17510, `_multi_collider`:17528

## 17543-17870  circuit geometry

`_cr_point`:17544, `_rw_build_path`:17558, `_rw_dir`:17586, `_rw_bend`:17591, `_ribbon`:17597, `_rw_band`:17617, `_rw_keepout`:17635, `_build_raceway`:17644, `_build_rw_parking`:17678, `_build_rw_pits`:17723, `_build_rw_track`:17760, `_build_rw_trackside`:17801

## 17871-17968  race car rental

`_model_key`:17872, `_race_car_start`:17875, `_tint_ghost`:17913, `_race_car_end`:17926, `_race_keep_cars_out`:17951

## 17969-17983  speed effects

`_eff_max`:17970, `_eff_accel`:17981

## 17984-18034  track helpers

`_rw_seg_progress`:17985, `_rw_track_dist`:18005, `_rw_point_dist`:18016, `_rw_player_progress`:18023, `_rw_target`:18029

## 18035-18271  events

`_rec_stop`:18036, `_rw_place`:18052, `_rw_grid_pos`:18059, `_rw_start`:18064, `_rw_spawn_ai`:18096, `_rw_ai_place`:18120, `_rw_tick`:18131, `_rw_ai_tick`:18184, `_rw_lap_done`:18226, `_rw_finish`:18238, `_rw_fmt`:18269

## 18272-18324  boosters and spikes

`_rw_buy`:18273, `_rw_use_boost`:18291, `_rw_use_spike`:18299, `_rw_drop_spike_at`:18310

## 18325-18382  online races

`_race_msg`:18326, `_join_race`:18348

## 18383-18738  raceway panel, HUD, board

`_build_raceway_ui`:18384, `_rw_layout`:18444, `_rw_open`:18451, `_rw_close`:18457, `_rw_refresh_panel`:18461, `_rw_refresh_board`:18474, `_rw_hud`:18486, `_peer_car_model`:18510, `_smoke_raceway`:18520, `_race_shots`:18701

## 18739-18946  v0.22.0: Call Car

`_call_block_reason`:18745, `_call_spot`:18762, `_call_car`:18793, `_play_horn`:18817, `_smoke_follow_call`:18841, `_follow_shots`:18914

## 18947-19404  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18972, `_place_portal_button`:18978, `_portal_pressed`:18985, `_build_travel`:18993, `_toggle_run`:19098, `_refresh_run`:19102, `_hud_v23_tick`:19110, `_travel_block_reason`:19142, `_travel_open`:19162, `_open_travel`:19168, `_open_worlds`:19174, `_open_case`:19180, `_case_step`:19192, `_case_refresh`:19196, `_case_submit`:19200, `_close_case`:19209, `_sky_go`:19213, `_close_worlds`:19223, `_refresh_worlds`:19227, `_world_go`:19233, `_close_travel`:19240, `_refresh_travel`:19244, `_travel_to`:19252, `_smoke_travel`:19279, `_v23_shots`:19317

## 19405-19478  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:19412, `_qr_button`:19427, `_qr_layout`:19466, `_smoke_qr`:19472

## 19479-19915  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:19499, `_open_crate`:19515, `_build_crate_ui`:19532, `_crate_pick`:19619, `_crate_reveal`:19642, `_crate_draw_car`:19669, `_crate_confetti`:19688, `_crate_sound`:19713, `_crate_drive`:19739, `_feed_add_system`:19769, `_smoke_crate`:19772, `_crate_shots`:19820

## 19916-20407  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19957, `_quick_today`:19962, `_quick_is_done`:19965, `_quick_left`:19968, `_quick_next`:19975, `_quick_fix_target`:19988, `_quick_daily_check`:20002, `_quick_complete`:20016, `_quick_side`:20050, `_build_quick_props`:20068, `_daily_shots`:20220, `_quick_props_refresh`:20262, `_quick_fx`:20266, `_play_coin`:20282, `_smoke_quick`:20299

## 20408-20558  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:20417, `_quest_nearby`:20472, `_open_quests`:20479, `_close_quests`:20486, `_refresh_quests`:20490, `_quest_pick`:20516, `_quest_mode`:20530, `_smoke_quests`:20533

## 20559-20593  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20563, `_my_tag_tick`:20566

## 20594-20908  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20611, `_fc_torus`:20621, `_fc_pearl`:20629, `_fc_chrome`:20639, `_fc_glass`:20648, `_fc_glow`:20658, `_fc_ghost`:20667, `_fc_holo`:20679, `_fc_mesh`:20689, `_fc_sphere`:20709, `_fc_capsule`:20717, `_fc_cone`:20725, `_build_food_court`:20734, `_food_court_tick`:20888

## 20909-21230  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20938, `_cm_bench`:20954, `_build_commons`:20967, `_commons_tick`:21189

## 21231-21545  v0.36: the daily puzzle

`_pz_today`:21254, `_pz_new`:21257, `_pz_neighbours`:21302, `_pz_flip`:21312, `_pz_done`:21317, `_pz_tap`:21325, `_pz_win`:21341, `_pz_reset`:21362, `_puzzle_near`:21366, `_open_puzzle`:21371, `_close_puzzle`:21379, `_pz_refresh_sign`:21383, `_build_puzzle_panel`:21391, `_pz_draw`:21422, `_smoke_chat`:21463, `_smoke_feet`:21501, `_smoke_commons`:21522

## 21546-21734  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21608, `_bio_theta`:21612, `_bio_sec_n`:21617, `_bio_sec_of`:21620, `_bio_pt`:21623, `_bio_lp`:21628, `_bio_la`:21632, `_bio_dir`:21636, `_bio_hex_r`:21639, `_bio_apo`:21644, `_bio_open_angles`:21650, `_bio_si`:21660, `_bm`:21666, `_bsph`:21671, `_blow`:21674, `_bcone`:21685, `_bbox`:21688, `_bp`:21691, `_bq`:21696, `_bio_glass_mat`:21700, `_bio_water_mat`:21713, `_bio_mat`:21725

## 21735-22107  building blocks

`_bio_inst`:21736, `_bio_add`:21742, `_bio_model`:21745, `_bio_nature_mesh`:21751, `_bio_flush`:21785, `_bio_bar`:21820, `_bio_slab`:21833, `_bio_body`:21848, `_bio_cyl_col`:21861, `_bio_hexmesh`:21874, `_bio_hexslab`:21886, `_bio_hexpt`:21892, `_bio_gridshell`:21899, `_bio_rail`:22006, `_bio_rail_arc`:22011, `_bio_disc_deck`:22023, `_bio_ring_deck`:22029, `_bio_helix`:22040, `_bio_pillar`:22060, `_bio_cafe`:22066, `_bio_fence_line`:22080, `_bio_fence_seg`:22085, `_bio_pen`:22095

## 22108-22609  building

`_build_biosphere`:22109, `_build_biosphere_legacy`:22113, `_bio_text`:22275, `_bio_plaque`:22293, `_bio_ticket_hall`:22307, `_on_foot_collision_guard`:22363, `_bio_inside`:22373, `_bio_pass_ok`:22376, `_ticket_near`:22380, `_bio_buy_pass`:22385, `_bio_gates_update`:22401, `_bio_gate_tick`:22427, `_bio_tunnel`:22439, `_bio_grounds`:22492, `_bio_dome`:22538, `_bio_deck_mats`:22606

## 22610-22765  garden planting

`_bio_free`:22611, `_bio_spot`:22628, `_bio_garden`:22636, `_bio_pine`:22677, `_bio_tree`:22680, `_bio_big_tree`:22690, `_bio_rock`:22695, `_bio_pond`:22698, `_bio_particles`:22702, `_bio_mist`:22730, `_bio_mini_dome`:22759

## 22766-23173  the four layouts

`_bio_winter`:22767, `_bio_spring`:22859, `_bio_summer`:22984, `_bio_autumn`:23068

## 23174-23444  animals

`_bio_spawn`:23175, `_bio_load_animal`:23247, `_bio_make_quad`:23268, `_bio_load_bird`:23345, `_bio_make_penguin`:23365, `_bio_make_bird`:23387, `_bio_make_flamingo`:23411, `_bio_make_butterfly`:23432

## 23445-23576  animation, spotting and rewards

`_bio_stuck_check`:23450, `_biosphere_tick`:23468, `_bio_animate`:23477, `_bio_spot_check`:23557, `_bio_spotted`:23569, `_smoke_biosphere`:23573

## 23577-24094  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23664, `_wear_piece`:23667, `_wear_mat`:23690, `_person_index`:23706, `_dress`:23729, `_smoke_style`:23835, `_style_shots`:23986, `_npc_look`:24058

## 24095-24248  your look: apply, save, share

`_look_clean`:24099, `_look_pack`:24114, `_owns`:24120, `_apply_look`:24125, `_relic_model`:24136, `_fc_mesh_mat`:24201, `_relic_refresh`:24204, `_relic_tick`:24218, `_peer_style`:24229

## 24249-24676  stores and the wardrobe

`_style_today`:24268, `_style_items`:24271, `_style_cat`:24279, `_style_price`:24282, `_style_deal`:24296, `_style_price_base`:24309, `_relic_stock`:24316, `_build_style_panel`:24328, `_open_store`:24368, `_open_wardrobe`:24387, `_style_close`:24390, `_style_finish`:24394, `_sync_old_avatar`:24409, `_style_tabs_for`:24416, `_refresh_style`:24421, `_style_body_rows`:24572, `_style_set_tab`:24589, `_style_step`:24593, `_style_color`:24598, `_style_pick`:24603, `_style_buy`:24638, `_ach_relics_check`:24660, `_style_face_camera`:24665

## 24677-25144  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24713, `_ga_text`:24719, `_ga_box`:24736, `_build_galleria`:24752, `_ga_inner_tick`:24893, `_ga_shell`:24909, `_ga_inside`:24959, `_bio_cyl_col_on`:24962, `_ga_models`:24974, `_ga_lbox`:24989, `_ga_ltext`:25003, `_ga_store`:25010, `_bio_cafe_on`:25112, `_ga_mannequins`:25120

## 25145-25296  featured outfits and the Sky Run

`_ga_featured_look`:25158, `_build_ga_fun`:25179, `_ga_fun_tick`:25224, `_sky_finish`:25251, `_extra_near`:25270, `_extra_open`:25279, `_store_near`:25288

## 25297-25393  v0.41: THE SKY GARDEN

`_sg_now`:25351, `_sg_progress`:25354, `_sg_time`:25360, `_sg_stock`:25367, `_sg_mut_roll`:25382

## 25394-25531  building

`_sg_box`:25395, `_sg_text`:25401, `_build_sky_garden`:25415, `_sg_seed_spot`:25526, `_sg_codex_spot`:25529

## 25532-25712  plants

`_sg_plant_model`:25533, `_sg_refresh_all`:25638, `_sg_refresh`:25642, `_sky_garden_tick`:25678, `_sg_ready_count`:25697, `_sg_boot_note`:25704

## 25713-25832  interacting

`_sg_near`:25714, `_sg_button_text`:25737, `_sg_value`:25750, `_sg_interact`:25754, `_sg_buy`:25770, `_sg_plant`:25792, `_sg_harvest`:25803

## 25833-26076  the garden screen

`_build_sg_panel`:25834, `_sg_open`:25869, `_sg_close`:25878, `_sg_row`:25882, `_sg_refresh_panel`:25897, `_sg_pick_buy`:25942, `_sg_pick_plant`:25946, `_smoke_car_barriers`:25952, `_smoke_sky_garden`:25993

## 26077-26115  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:26108, `_pass_day`:26111

## 26116-26147  album

`_album_pages`:26117, `_album_claim`:26132

## 26148-26199  season

`_season_index`:26149, `_season_tick`:26152, `_season_xp`:26161, `_season_tier`:26164, `_season_reward`:26167, `_season_claim`:26181

## 26200-26207  Harbor Night

`_harbor_night`:26201

## 26208-26239  check-in calendar

`_cal_tick`:26209

## 26240-26416  the panel

`_build_hp_panel`:26241, `_open_pass`:26276, `_hp_open`:26279, `_hp_close`:26286, `_hp_row`:26290, `_hp_bar`:26305, `_hp_refresh`:26309, `_smoke_pass`:26354

## 26417-26631  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:26421, `_cash_pill_tick`:26429, `_build_lb`:26467, `_open_lb`:26510, `_close_lb`:26518, `_lb_pick`:26522, `_lb_headers`:26527, `_lb_url`:26531, `_lb_me`:26534, `_lb_tick`:26537, `_lb_upload`:26545, `_lb_fetch`:26555, `_lb_got`:26563, `_lb_value`:26574, `_lb_refresh_ui`:26585

## 26632-27190  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26656, `_market_near`:26735, `_build_gear`:26745, `_gear_piece`:26753, `_pet_m`:26798, `_pet_eyes`:26812, `_build_pet`:26819, `_pet_nose`:26957, `_pet_anim`:26960, `_market_apply`:26971, `_market_tick`:26995, `_build_market_panel`:27019, `_open_market`:27045, `_close_market`:27052, `_refresh_market`:27056, `_market_pick`:27109, `_toggle_board`:27147, `_board_tick`:27154

## 27191-27432  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:27223, `_ds_label`:27242, `_build_display`:27256, `_ds_got`:27335, `_ds_sorted`:27344, `_ds_render_board`:27358, `_ds_render_news`:27384, `_display_tick`:27403

## 27433-27611  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:27450, `_toggle_streamer`:27537, `_streamer_badge_tap`:27553, `_streamer_tick`:27557

## 27612-27648  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:27618, `_car_back`:27625, `_car_park_tick`:27632

## 27649-27745  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:27653, `_bus_eta`:27707, `_bus_displays_tick`:27723

## 27746-28037  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27764, `_treasure_pick`:27767, `_treasure_spot`:27776, `_treasure_district`:27780, `_treasure_clue`:27792, `_treasure_prop`:27805, `_tp_part`:27808, `_tp_sphere`:27818, `_tp_cyl`:27826, `_treasure_prop_side`:27835, `_build_treasure_props`:27847, `_build_treasure`:27891, `_treasure_dir_char`:27960, `_treasure_tick`:27969, `_treasure_claim`:28023

## 28038-28138  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:28039, `_halo_mat`:28071, `_smoke_treasure`:28096

## 28139-28462  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:28160, `_fm_send`:28163, `_fm_area`:28169, `_fm_glow_mesh`:28185, `_fm_block_reason`:28203, `_fm_start`:28215, `_fm_announce`:28243, `_fm_finish`:28246, `_fm_msg`:28264, `_fm_check_paid`:28315, `_fm_tick`:28333, `_smoke_findme`:28389

## 28463-28573  v0.24.2: road map (for moving people off the road)

`_floor_note`:28469, `_floor_disc`:28483, `_floor_top`:28492, `_ground_at`:28510, `_note_road`:28528, `_on_road`:28535, `_ped_curb`:28545, `_curb_spot`:28555

## 28574-28869  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:28596, `_ex_grid`:28604, `_ex_lamps`:28639, `_ex_umbrella`:28662, `_ex_yards`:28669, `_build_expansion`:28684, `_expand_shots`:28847

## 28870-29064  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28911, `_v27_near_cross`:29003, `_v27_near_any_road`:29010, `_v27_in_district`:29016, `_sea_tick`:29030, `_sea_tow`:29049

## 29065-29732  Harbor Loop sky train

`_sky_build_path`:29116, `_sky_pos`:29157, `_sky_dir`:29171, `_sky_project`:29176, `_sky_trip_time`:29195, `_sky_trip_dist`:29201, `_sky_now`:29212, `_sky_state`:29215, `_sky_time_at_station`:29230, `_sky_next_arrival`:29237, `_build_skytrain`:29250, `_sky_make_car`:29402, `_sky_skin`:29439, `_sky_place_trains`:29459, `_sky_build_station`:29478, `_sky_near`:29543, `_sky_fmt`:29552, `_sky_enter`:29556, `_sky_leave_platform`:29574, `_sky_board`:29584, `_sky_alight`:29598, `_sky_action`:29612, `_sky_tick`:29629, `_sky_camera`:29669, `_tour_today`:29685, `_tour_stamp`:29688, `_sky_hud`:29711

## 29733-30106  Day and night

`_toggle_weather`:29816, `_refresh_weather_button`:29822, `_game_hour`:29828, `_day_key`:29840, `_night_setup`:29855, `_night_scan_mesh`:29945, `_daynight_tick`:29970, `_daynight_apply`:29979, `_daynight_lights`:30091, `_cycle_day_mode`:30096, `_refresh_time_button`:30103

## 30107-30744  v0.27 smoke test and screenshots

`_smoke_v27`:30108, `_city_shots`:30313

## 30745-31161  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30779, `_ap_plane`:30955, `_ap_truck`:30975, `_ap_baggage_train`:31016, `_ap_loop_pos`:31029, `_ap_loop_len`:31045, `_ap_flight_at`:31051, `_ap_tick`:31075, `_airport_ped_plan`:31098, `_smoke_airport`:31118

## 31162-31675  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:31176, `_nav_spot`:31183, `_nav_idx`:31187, `_nav_pos`:31194, `_nav_blocked`:31198, `_nav_nearest_free`:31208, `_nav_bfs`:31236, `_nav_build`:31280, `_stroller`:31351, `_stroll_place`:31367, `_stroll_next`:31388, `_nav_clear_line`:31422, `_stroll_aim`:31433, `_strollers_tick`:31465, `_smoke_strollers`:31560

## 31676-31836  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31711, `_dir_fmt`:31714, `_signpost_spot`:31717, `_build_signposts`:31734

## 31837-31933  the Directions panel and chip

`_build_dir_panel`:31838, `_open_dir`:31880, `_dir_close`:31889, `_dir_pick`:31893, `_dir_stop`:31898, `_dir_stop_and_close`:31903, `_dir_tick`:31907

## 31934-32475  v0.44: Grand Central

`_gc_mesh`:31963, `_gc_mat`:31996, `_gc_glass`:32005, `_gb`:32015, `_gb_solid`:32021, `_gb_flush`:32025, `_gc_tree`:32055, `_gc_text`:32060, `_gc_planter`:32075, `_gc_kiosk`:32081, `_goods_color`:32111, `_goods_mat`:32114, `_kiosk_goods`:32118, `_build_grand_central`:32196, `_build_gc_towers`:32364, `_gc_tick`:32459

## 32476-32767  v0.44: filling the empty land

`_loft`:32493, `_fill_clear`:32535, `_build_fill`:32545, `_hg_in_lake`:32593, `_hg_path`:32597, `_floor_note_rot`:32605, `_build_gardens`:32613, `_build_fan_plaza`:32723

## 32768-32802  v0.45: hover car underglow

`_car_underglow`:32771

## 32803-32967  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32804

## 32968-32999  v0.47: street stalls downtown

`_build_street_stalls`:32972, `_cull_people_in`:32992

## 33000-33098  v0.48: places that open as you level up

`_place_lock_of`:33013, `_place_root`:33019, `_place_unlocked`:33022, `_build_place_signs`:33030, `_places_refresh`:33075, `_places_tick`:33092

## 33099-33143  v0.50: city careers

`_career_rank_name`:33124, `_career_mult`:33127, `_career_block_reason`:33132, `_career_start`:33135, `_career_end`:33140

## 33144-33194  v0.52: careers as clear job loops

`_cid`:33171, `_career_target`:33185, `_career_tick`:33192

## 33195-33202  taxi

`_taxi_meter`:33196

## 33203-33206  paramedic

(no functions)

## 33207-33211  police

`_career_chase_over`:33209

## 33212-33217  firefighter

`_fire_aimed`:33213

## 33218-33227  the step bar

`_career_bar_text`:33221, `_career_hud`:33225

## 33228-33254  cut scenes

`_cs_skip`:33246

## 33255-33259  siren

(no functions)

## 33260-33271  the Careers panel

`_build_career_panel`:33261, `_open_careers`:33264, `_career_close`:33268

## 33272-33695  v0.50: homes

`_home_door_spots`:33312, `_build_homes`:33327, `_home_labels`:33356, `_home_door_near`:33365, `_home_origin`:33374, `_home_slot_near`:33377, `_home_exit_near`:33388, `_home_btn`:33395, `_home_interact`:33408, `_home_buy`:33427, `_home_default_layout`:33441, `_home_enter`:33449, `_home_leave`:33469, `_hm`:33477, `_home_build_room`:33496, `_home_refresh_room`:33605, `_furni_build`:33619

## 33696-34031  decorating

`_build_home_panels`:33697, `_open_homes`:33742, `_home_row_go`:33752, `_home_panel_close`:33772, `_deco_open`:33776, `_deco_pick`:33799, `_smoke_careers_homes`:33822

## 34032-34166  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:34036, `_home_slots`:34044, `_home_ring`:34071, `_furni_cat`:34077, `_home_fix_layout`:34083, `_home_build_layout`:34111

## 34167-34600  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:34230, `_ch_homes`:34236, `_ch_step_text`:34243, `_ch_step_done`:34254, `_ch_target`:34268, `_ch_finish_chapter`:34277, `_chapters_tick`:34299, `_hud_top_stack`:34339, `_build_chapters_ui`:34369, `_chapters_restart_ask`:34411, `_chapters_restart`:34414, `_chapters_text`:34424, `_open_chapters`:34444, `_chapters_close`:34451, `_smoke_chapters`:34455, `_step_sound`:34576

## 34601-34639  v0.51.1: join and leave messages

`_announce_join`:34608, `_announce_already_here`:34627, `_announce_leave`:34635

## 34640-34904  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:34656, `_shot_tick`:34662, `_draw_shot_icon`:34694, `_shot_enter`:34703, `_shot_exit`:34717, `_shot_release_controls`:34729, `_shot_stick_zone`:34736, `_shot_input`:34739, `_smoke_photo`:34811

## 34905-35203  v0.51.3: stream joiners

`_viewer_count`:34925, `_stream_join_check`:34931, `_stream_join_start`:34938, `_sj_streamer`:34955, `_stream_join_tick`:34964, `_stream_join_land`:34988, `_sj_welcome`:35004, `_smoke_stream_join`:35038, `_career_shot`:35121

## 35204-35320  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:35208, `_st_restore`:35246, `_smoke_streamer_clean`:35267, `_world_bio_passport`:35318

