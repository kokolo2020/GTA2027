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

## 8744-11055  v0.5.0: original synthesized radio and ambient pedestrians

`_midi`:8745, `_radio_voice`:8748, `_radio_make`:8781, `_radio_set`:8852, `_radio_play`:8874, `_radio_next`:8879, `_radio_talk_line`:8883, `_radio_caption`:8904, `_radio_refresh`:8912, `_process`:8925, `_build_peds`:8976, `_update_peds`:9087, `_update_ped`:9106, `_smoke_test`:9160, `_smoke_chase`:9803, `_smoke_orole`:9836, `_smoke_levels`:9865, `_smoke_bus`:9906, `_smoke_chase_extras`:9991, `_smoke_marina`:10019, `_blocked_at`:10121, `_blocker`:10136, `_on_screen`:10149, `_wait_radio`:10154, `_smoke_radio_peds`:10161, `_smoke_typed_chat`:10231, `_smoke_chat_touch`:10250, `_smoke_cafe`:10271, `_smoke_boutique`:10297, `_smoke_models`:10325, `_smoke_garage_ridge`:10349, `_save_shot`:10725, `_paris_shots`:10735, `_people_shots`:10803, `_shots`:10844, `_shot_car`:11038, `_capture_preview`:11048

## 11056-11704  v0.16.0: Skyline District (big downtown), traffic with signals, busier streets

`_downtown_open`:11123, `_downtown_count`:11126, `_nearest_downtown`:11133, `_check_downtown`:11147, `_discover_downtown`:11160, `_box_batch`:11174, `_model_batch`:11194, `_cut_ranges`:11248, `_dt_ranges`:11260, `_dt_has`:11267, `_dt_near_cross`:11273, `_place`:11279, `_signal_pole`:11290, `_cyl_batch`:11309, `_city_signals`:11333, `_ensure_light_mats`:11384, `_city_lamps`:11394, `_build_downtown`:11438, `_dt_block`:11638, `_downtown_token`:11644, `_build_park`:11661, `_build_plaza`:11690

## 11705-11808  old city and Bay details

`_build_city_detail`:11706

## 11809-12218  traffic

`_build_traffic`:11810, `_path_sample`:11905, `_light_look`:11919, `_light_green`:11927, `_traffic_place`:11931, `_traffic_blocked_by`:11943, `_traffic_tick`:11955, `_smoke_downtown`:12061, `_skyline_shot`:12173, `_skyline_shots`:12181

## 12219-12579  v0.17.0: minimap, full map and camera views (Far / Close / In-car)

`_web_perf_setup`:12265, `_web_scale`:12328, `_web_fps_tick`:12338, `_world_to_uv`:12355, `_map_angle`:12358, `_build_minimap`:12366, `_open_map`:12439, `_close_map`:12450, `_mini_point`:12457, `_site_markers`:12461, `_draw_arrow`:12493, `_draw_minimap`:12500, `_draw_full_map`:12547, `_minimap_tick`:12572

## 12580-12837  camera views

`_build_view_controls`:12581, `_cycle_view`:12623, `_apply_view`:12633, `_hide_labels`:12671, `_unfade`:12677, `_bake_map`:12683, `_shot_stats`:12733, `_view_shots`:12736, `_smoke_views`:12777

## 12838-13085  v0.17.0: level-up celebration

`_build_level_fx`:12849, `_draw_level_rays`:12886, `_level_fx_tick`:12896, `_level_sound`:12901, `_fx_material`:12943, `_level_up_fx`:12951, `_smoke_level_fx`:13052, `_levelup_shots`:13061

## 13086-13205  v0.18.0: walk-in stadium

`_collider_yaw`:13091, `_build_stadium_walls`:13102, `_look`:13130, `_smoke_stadium_eye`:13139, `_stadium_shots`:13175

## 13206-13367  v0.18.0: guidance arrows and checkpoints

`_hidden_place`:13230, `_arrow_mesh`:13242, `_build_guidance`:13265, `_guide_target`:13290, `_guidance_tick`:13319, `_draw_hud_arrow`:13345

## 13368-13553  checkpoints

`_build_checkpoints`:13369, `_refresh_checkpoints`:13414, `_check_checkpoints`:13420, `_activate_checkpoint`:13430, `_checkpoint_spawn`:13451, `_spawn_at_checkpoint`:13456, `_draw_checkpoint_icon`:13472, `_smoke_guidance_checkpoints`:13478, `_guide_shots`:13528

## 13554-13832  v0.18.0: Harbor Dome social hub

`_hub_seat`:13612, `_build_hub`:13616

## 13833-13883  v0.56.2: Christmas in the Harbor Dome (snow, giant tree, lights, snowmen, presents)

`_xm_mat`:13834, `_xm_mesh`:13843, `_xm_tree`:13851

## 13884-14207  v0.56.5: one grand Christmas tree and luxury furniture

`_xm_multi`:13887, `_gt_surface`:13902, `_xm_grand_tree`:13912, `_lux_mat`:14027, `_lux_part`:14043, `_lux_box`:14046, `_lux_cyl`:14051, `_lux_ball`:14059, `_lux_new`:14067, `_lux_commit`:14072, `_lux_sofa_mesh`:14076, `_lux_chair_mesh`:14106, `_lux_table_mesh`:14126, `_lux_pouf_mesh`:14141, `_lux_batch`:14156, `_hub_christmas`:14172

## 14208-14363  v0.56.3: geodesic frame and warm glow so the Harbor Dome looks like a glass biosphere from outside

`_hub_geodesic`:14209

## 14364-14612  v0.56.4: grand entrance, VIP Lounge and a richer plaza for the Harbor Dome

`_vx_box`:14367, `_vx_cyl`:14374, `_vx_ball`:14382, `_vx_ring`:14390, `_hub_polish`:14398, `_hub_gate`:14421, `_hub_vip`:14483, `_hub_glass`:14596

## 14613-14827  people: sitting pose, bots, bubbles, emotes

`_sit_pose`:14614, `_build_hub_bots`:14639, `_seat_of`:14670, `_bubble`:14680, `_emote`:14736, `_hub_people_tick`:14750

## 14828-14946  seats

`_seat_taken`:14829, `_nearest_seat`:14837, `_seat_label`:14849, `_sit`:14865, `_stand_up`:14909, `_seated_tick`:14928

## 14947-15103  game panel

`_build_game_panel`:14948, `_open_game_panel`:15003, `_refresh_game_panel`:15022, `_play_robot`:15067, `_peer_at`:15081, `_opponent_name`:15088, `_pay`:15096

## 15104-15224  tic-tac-toe

`_ttt_ready`:15107, `_ttt_winner`:15113, `_ttt_bot_move`:15123, `_ttt_tap`:15149, `_ttt_code`:15169, `_ttt_check`:15175, `_ttt_tick`:15198

## 15225-15276  rock paper scissors

`_rps_ready`:15226, `_rps_pick`:15232, `_rps_resolve`:15250, `_rps_tick`:15274

## 15277-15359  online table messages

`_online_game_send`:15278, `_hub_game_msg`:15284

## 15360-15435  comedy show

`_joke_start`:15361, `_joke_tick`:15373, `_speak`:15399, `_play_rimshot`:15408

## 15436-16335  quick chat and emotes

`_build_chat`:15458, `_chat_toggle_to`:15575, `_chat_log_add`:15583, `_chat_area`:15589, `_chat_near_count`:15607, `_chat_tick`:15616, `_toggle_chat`:15665, `_chat_fit`:15680, `_chat_clean`:15686, `_chat_wrap`:15703, `_chat_send_text`:15725, `_typing`:15748, `_say`:15751, `_do_emote`:15767, `_smoke_hub`:15776, `_chat_shots`:15950, `_cafe_shots`:15975, `_shop_shots`:16023, `_car_shots`:16072, `_outfit_shots`:16103, `_hub_shots`:16151, `_sg_on_terrace`:16286, `_people_only`:16289, `_people_only_keep_cars_out`:16293, `_car_barrier`:16305, `_hub_keep_cars_out`:16319

## 16336-16498  v0.18.1: main chat feed and "looking for players" invites

`_build_feed`:16345, `_feed_add`:16354, `_feed_render`:16360, `_feed_tick`:16388, `_online_event_send`:16397, `_at_pvp_table`:16404, `_game_name`:16411, `_send_lfp`:16414, `_lfp_msg`:16431, `_accept_invite`:16452

## 16499-16740  v0.18.2: nickname and HUD relayout

`_nick_rude`:16511, `_clean_nick`:16526, `_build_nick_panel`:16538, `_open_nick`:16576, `_random_nick`:16585, `_save_nick`:16591, `_close_nick`:16610, `_refresh_nick_button`:16619, `_relayout_hud`:16623, `_smoke_nick`:16660, `_nick_shots`:16692, `_smoke_sites_reachable`:16710

## 16741-17028  v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park)

`_civic_count`:16767, `_nearest_civic`:16774, `_check_civic`:16788, `_discover_civic`:16801, `_civ_ranges`:16814, `_civ_has`:16828, `_civ_near_cross`:16834, `_build_civic`:16840, `_civic_token`:16966, `_civic_shots`:16983, `_hub_focus`:17005

## 17029-17138  v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes)

`_in_raceway`:17100, `_in_rw_lot`:17103, `_box_batch_rot`:17106, `_multi_collider`:17124

## 17139-17466  circuit geometry

`_cr_point`:17140, `_rw_build_path`:17154, `_rw_dir`:17182, `_rw_bend`:17187, `_ribbon`:17193, `_rw_band`:17213, `_rw_keepout`:17231, `_build_raceway`:17240, `_build_rw_parking`:17274, `_build_rw_pits`:17319, `_build_rw_track`:17356, `_build_rw_trackside`:17397

## 17467-17564  race car rental

`_model_key`:17468, `_race_car_start`:17471, `_tint_ghost`:17509, `_race_car_end`:17522, `_race_keep_cars_out`:17547

## 17565-17579  speed effects

`_eff_max`:17566, `_eff_accel`:17577

## 17580-17630  track helpers

`_rw_seg_progress`:17581, `_rw_track_dist`:17601, `_rw_point_dist`:17612, `_rw_player_progress`:17619, `_rw_target`:17625

## 17631-17867  events

`_rec_stop`:17632, `_rw_place`:17648, `_rw_grid_pos`:17655, `_rw_start`:17660, `_rw_spawn_ai`:17692, `_rw_ai_place`:17716, `_rw_tick`:17727, `_rw_ai_tick`:17780, `_rw_lap_done`:17822, `_rw_finish`:17834, `_rw_fmt`:17865

## 17868-17920  boosters and spikes

`_rw_buy`:17869, `_rw_use_boost`:17887, `_rw_use_spike`:17895, `_rw_drop_spike_at`:17906

## 17921-17978  online races

`_race_msg`:17922, `_join_race`:17944

## 17979-18334  raceway panel, HUD, board

`_build_raceway_ui`:17980, `_rw_layout`:18040, `_rw_open`:18047, `_rw_close`:18053, `_rw_refresh_panel`:18057, `_rw_refresh_board`:18070, `_rw_hud`:18082, `_peer_car_model`:18106, `_smoke_raceway`:18116, `_race_shots`:18297

## 18335-18542  v0.22.0: Call Car

`_call_block_reason`:18341, `_call_spot`:18358, `_call_car`:18389, `_play_horn`:18413, `_smoke_follow_call`:18437, `_follow_shots`:18510

## 18543-18867  v0.23: RUN toggle and fast travel between districts

`_walk_speed`:18559, `_place_portal_button`:18565, `_portal_pressed`:18572, `_build_travel`:18580, `_toggle_run`:18627, `_refresh_run`:18631, `_hud_v23_tick`:18639, `_travel_block_reason`:18671, `_travel_open`:18691, `_open_travel`:18697, `_close_travel`:18703, `_refresh_travel`:18707, `_travel_to`:18715, `_smoke_travel`:18742, `_v23_shots`:18780

## 18868-18941  v0.24: "Scan to play" QR code (opens the browser version and turns Online on)

`_build_qr`:18875, `_qr_button`:18890, `_qr_layout`:18929, `_smoke_qr`:18935

## 18942-19378  v0.24: starter crate (new players) / welcome-back crate (one time for existing saves)

`_crate_roll`:18962, `_open_crate`:18978, `_build_crate_ui`:18995, `_crate_pick`:19082, `_crate_reveal`:19105, `_crate_draw_car`:19132, `_crate_confetti`:19151, `_crate_sound`:19176, `_crate_drive`:19202, `_feed_add_system`:19232, `_smoke_crate`:19235, `_crate_shots`:19283

## 19379-19870  v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once)

`_quick_pay`:19420, `_quick_today`:19425, `_quick_is_done`:19428, `_quick_left`:19431, `_quick_next`:19438, `_quick_fix_target`:19451, `_quick_daily_check`:19465, `_quick_complete`:19479, `_quick_side`:19513, `_build_quick_props`:19531, `_daily_shots`:19683, `_quick_props_refresh`:19725, `_quick_fx`:19729, `_play_coin`:19745, `_smoke_quick`:19762

## 19871-20021  v0.24.1: Quests list (nearby quick quests, pick any one)

`_build_quest_list`:19880, `_quest_nearby`:19935, `_open_quests`:19942, `_close_quests`:19949, `_refresh_quests`:19953, `_quest_pick`:19979, `_quest_mode`:19993, `_smoke_quests`:19996

## 20022-20056  v0.24.1: your own name tag above your head (or above your car)

`_my_name`:20026, `_my_tag_tick`:20029

## 20057-20371  v0.33.6: Harbor Food Court (three street stands with crowds, old city)

`_fc_part`:20074, `_fc_torus`:20084, `_fc_pearl`:20092, `_fc_chrome`:20102, `_fc_glass`:20111, `_fc_glow`:20121, `_fc_ghost`:20130, `_fc_holo`:20142, `_fc_mesh`:20152, `_fc_sphere`:20172, `_fc_capsule`:20180, `_fc_cone`:20188, `_build_food_court`:20197, `_food_court_tick`:20351

## 20372-20693  v0.36: Harbor Commons, a modern park in the empty field by Bay Road

`_cm_person`:20401, `_cm_bench`:20417, `_build_commons`:20430, `_commons_tick`:20652

## 20694-21008  v0.36: the daily puzzle

`_pz_today`:20717, `_pz_new`:20720, `_pz_neighbours`:20765, `_pz_flip`:20775, `_pz_done`:20780, `_pz_tap`:20788, `_pz_win`:20804, `_pz_reset`:20825, `_puzzle_near`:20829, `_open_puzzle`:20834, `_close_puzzle`:20842, `_pz_refresh_sign`:20846, `_build_puzzle_panel`:20854, `_pz_draw`:20885, `_smoke_chat`:20926, `_smoke_feet`:20964, `_smoke_commons`:20985

## 21009-21197  v0.37 - v0.39: THE BIOSPHERE

`_bio_dome_c`:21071, `_bio_theta`:21075, `_bio_sec_n`:21080, `_bio_sec_of`:21083, `_bio_pt`:21086, `_bio_lp`:21091, `_bio_la`:21095, `_bio_dir`:21099, `_bio_hex_r`:21102, `_bio_apo`:21107, `_bio_open_angles`:21113, `_bio_si`:21123, `_bm`:21129, `_bsph`:21134, `_blow`:21137, `_bcone`:21148, `_bbox`:21151, `_bp`:21154, `_bq`:21159, `_bio_glass_mat`:21163, `_bio_water_mat`:21176, `_bio_mat`:21188

## 21198-21570  building blocks

`_bio_inst`:21199, `_bio_add`:21205, `_bio_model`:21208, `_bio_nature_mesh`:21214, `_bio_flush`:21248, `_bio_bar`:21283, `_bio_slab`:21296, `_bio_body`:21311, `_bio_cyl_col`:21324, `_bio_hexmesh`:21337, `_bio_hexslab`:21349, `_bio_hexpt`:21355, `_bio_gridshell`:21362, `_bio_rail`:21469, `_bio_rail_arc`:21474, `_bio_disc_deck`:21486, `_bio_ring_deck`:21492, `_bio_helix`:21503, `_bio_pillar`:21523, `_bio_cafe`:21529, `_bio_fence_line`:21543, `_bio_fence_seg`:21548, `_bio_pen`:21558

## 21571-22072  building

`_build_biosphere`:21572, `_build_biosphere_legacy`:21576, `_bio_text`:21738, `_bio_plaque`:21756, `_bio_ticket_hall`:21770, `_on_foot_collision_guard`:21826, `_bio_inside`:21836, `_bio_pass_ok`:21839, `_ticket_near`:21843, `_bio_buy_pass`:21848, `_bio_gates_update`:21864, `_bio_gate_tick`:21890, `_bio_tunnel`:21902, `_bio_grounds`:21955, `_bio_dome`:22001, `_bio_deck_mats`:22069

## 22073-22228  garden planting

`_bio_free`:22074, `_bio_spot`:22091, `_bio_garden`:22099, `_bio_pine`:22140, `_bio_tree`:22143, `_bio_big_tree`:22153, `_bio_rock`:22158, `_bio_pond`:22161, `_bio_particles`:22165, `_bio_mist`:22193, `_bio_mini_dome`:22222

## 22229-22636  the four layouts

`_bio_winter`:22230, `_bio_spring`:22322, `_bio_summer`:22447, `_bio_autumn`:22531

## 22637-22907  animals

`_bio_spawn`:22638, `_bio_load_animal`:22710, `_bio_make_quad`:22731, `_bio_load_bird`:22808, `_bio_make_penguin`:22828, `_bio_make_bird`:22850, `_bio_make_flamingo`:22874, `_bio_make_butterfly`:22895

## 22908-23039  animation, spotting and rewards

`_bio_stuck_check`:22913, `_biosphere_tick`:22931, `_bio_animate`:22940, `_bio_spot_check`:23020, `_bio_spotted`:23032, `_smoke_biosphere`:23036

## 23040-23557  v0.40: STYLE - hair, faces, builds, clothes, accessories and relics

`_lk`:23127, `_wear_piece`:23130, `_wear_mat`:23153, `_person_index`:23169, `_dress`:23192, `_smoke_style`:23298, `_style_shots`:23449, `_npc_look`:23521

## 23558-23711  your look: apply, save, share

`_look_clean`:23562, `_look_pack`:23577, `_owns`:23583, `_apply_look`:23588, `_relic_model`:23599, `_fc_mesh_mat`:23664, `_relic_refresh`:23667, `_relic_tick`:23681, `_peer_style`:23692

## 23712-24139  stores and the wardrobe

`_style_today`:23731, `_style_items`:23734, `_style_cat`:23742, `_style_price`:23745, `_style_deal`:23759, `_style_price_base`:23772, `_relic_stock`:23779, `_build_style_panel`:23791, `_open_store`:23831, `_open_wardrobe`:23850, `_style_close`:23853, `_style_finish`:23857, `_sync_old_avatar`:23872, `_style_tabs_for`:23879, `_refresh_style`:23884, `_style_body_rows`:24035, `_style_set_tab`:24052, `_style_step`:24056, `_style_color`:24061, `_style_pick`:24066, `_style_buy`:24101, `_ach_relics_check`:24123, `_style_face_camera`:24128

## 24140-24607  HARBOR GALLERIA: the shopping mall

`_ga_walkable`:24176, `_ga_text`:24182, `_ga_box`:24199, `_build_galleria`:24215, `_ga_inner_tick`:24356, `_ga_shell`:24372, `_ga_inside`:24422, `_bio_cyl_col_on`:24425, `_ga_models`:24437, `_ga_lbox`:24452, `_ga_ltext`:24466, `_ga_store`:24473, `_bio_cafe_on`:24575, `_ga_mannequins`:24583

## 24608-24759  featured outfits and the Sky Run

`_ga_featured_look`:24621, `_build_ga_fun`:24642, `_ga_fun_tick`:24687, `_sky_finish`:24714, `_extra_near`:24733, `_extra_open`:24742, `_store_near`:24751

## 24760-24856  v0.41: THE SKY GARDEN

`_sg_now`:24814, `_sg_progress`:24817, `_sg_time`:24823, `_sg_stock`:24830, `_sg_mut_roll`:24845

## 24857-24994  building

`_sg_box`:24858, `_sg_text`:24864, `_build_sky_garden`:24878, `_sg_seed_spot`:24989, `_sg_codex_spot`:24992

## 24995-25175  plants

`_sg_plant_model`:24996, `_sg_refresh_all`:25101, `_sg_refresh`:25105, `_sky_garden_tick`:25141, `_sg_ready_count`:25160, `_sg_boot_note`:25167

## 25176-25295  interacting

`_sg_near`:25177, `_sg_button_text`:25200, `_sg_value`:25213, `_sg_interact`:25217, `_sg_buy`:25233, `_sg_plant`:25255, `_sg_harvest`:25266

## 25296-25539  the garden screen

`_build_sg_panel`:25297, `_sg_open`:25332, `_sg_close`:25341, `_sg_row`:25345, `_sg_refresh_panel`:25360, `_sg_pick_buy`:25405, `_sg_pick_plant`:25409, `_smoke_car_barriers`:25415, `_smoke_sky_garden`:25456

## 25540-25578  v0.43: HARBOR ALBUM, the free SEASON PASS, HARBOR NIGHT and the CHECK-IN calendar

`_pass_now`:25571, `_pass_day`:25574

## 25579-25610  album

`_album_pages`:25580, `_album_claim`:25595

## 25611-25662  season

`_season_index`:25612, `_season_tick`:25615, `_season_xp`:25624, `_season_tier`:25627, `_season_reward`:25630, `_season_claim`:25644

## 25663-25670  Harbor Night

`_harbor_night`:25664

## 25671-25702  check-in calendar

`_cal_tick`:25672

## 25703-25879  the panel

`_build_hp_panel`:25704, `_open_pass`:25739, `_hp_open`:25742, `_hp_close`:25749, `_hp_row`:25753, `_hp_bar`:25768, `_hp_refresh`:25772, `_smoke_pass`:25817

## 25880-26094  v0.34: your money on screen, and a global leaderboard (Supabase table "leaderboard")

`_money`:25884, `_cash_pill_tick`:25892, `_build_lb`:25930, `_open_lb`:25973, `_close_lb`:25981, `_lb_pick`:25985, `_lb_headers`:25990, `_lb_url`:25994, `_lb_me`:25997, `_lb_tick`:26000, `_lb_upload`:26008, `_lb_fetch`:26018, `_lb_got`:26026, `_lb_value`:26037, `_lb_refresh_ui`:26048

## 26095-26518  v0.34: Neon Market (gear for your avatar, pets from level 20) and the hoverboard

`_build_market`:26119, `_market_near`:26196, `_build_gear`:26206, `_gear_piece`:26214, `_build_pet`:26259, `_market_apply`:26301, `_market_tick`:26325, `_build_market_panel`:26347, `_open_market`:26373, `_close_market`:26380, `_refresh_market`:26384, `_market_pick`:26437, `_toggle_board`:26475, `_board_tick`:26482

## 26519-26760  v0.34.2: Harbor Live, a plaza of giant screens (leaderboards and city news)

`_ds_screen`:26551, `_ds_label`:26570, `_build_display`:26584, `_ds_got`:26663, `_ds_sorted`:26672, `_ds_render_board`:26686, `_ds_render_news`:26712, `_display_tick`:26731

## 26761-26939  v0.34.3: streamer mode (a clean, viewer-friendly screen for livestreams)

`_build_streamer`:26778, `_toggle_streamer`:26865, `_streamer_badge_tap`:26881, `_streamer_tick`:26885

## 26940-26976  v0.34.5: a parked car drives itself home after 2 minutes

`_car_away`:26946, `_car_back`:26953, `_car_park_tick`:26960

## 26977-27073  v0.34.7: modern bus shelters with live displays, and city buses in traffic

`_bus_shelter`:26981, `_bus_eta`:27035, `_bus_displays_tick`:27051

## 27074-27365  v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online)

`_treasure_now`:27092, `_treasure_pick`:27095, `_treasure_spot`:27104, `_treasure_district`:27108, `_treasure_clue`:27120, `_treasure_prop`:27133, `_tp_part`:27136, `_tp_sphere`:27146, `_tp_cyl`:27154, `_treasure_prop_side`:27163, `_build_treasure_props`:27175, `_build_treasure`:27219, `_treasure_dir_char`:27288, `_treasure_tick`:27297, `_treasure_claim`:27351

## 27366-27466  v0.24.1: glowing ring under real players (NPC walkers have none)

`_player_ring`:27367, `_halo_mat`:27399, `_smoke_treasure`:27424

## 27467-27790  v0.24.1: FIND ME! (online hide-and-seek with prize money)

`_fm_now`:27488, `_fm_send`:27491, `_fm_area`:27497, `_fm_glow_mesh`:27513, `_fm_block_reason`:27531, `_fm_start`:27543, `_fm_announce`:27571, `_fm_finish`:27574, `_fm_msg`:27592, `_fm_check_paid`:27643, `_fm_tick`:27661, `_smoke_findme`:27717

## 27791-27901  v0.24.2: road map (for moving people off the road)

`_floor_note`:27797, `_floor_disc`:27811, `_floor_top`:27820, `_ground_at`:27838, `_note_road`:27856, `_on_road`:27863, `_ped_curb`:27873, `_curb_spot`:27883

## 27902-28197  v0.26: Sunset Beach (east island) and Westside (west of the Civic Center)

`_ex_house`:27924, `_ex_grid`:27932, `_ex_lamps`:27967, `_ex_umbrella`:27990, `_ex_yards`:27997, `_build_expansion`:28012, `_expand_shots`:28175

## 28198-28392  v0.27: one connected city, Harbor Loop sky train, day and night

`_build_connect`:28239, `_v27_near_cross`:28331, `_v27_near_any_road`:28338, `_v27_in_district`:28344, `_sea_tick`:28358, `_sea_tow`:28377

## 28393-29060  Harbor Loop sky train

`_sky_build_path`:28444, `_sky_pos`:28485, `_sky_dir`:28499, `_sky_project`:28504, `_sky_trip_time`:28523, `_sky_trip_dist`:28529, `_sky_now`:28540, `_sky_state`:28543, `_sky_time_at_station`:28558, `_sky_next_arrival`:28565, `_build_skytrain`:28578, `_sky_make_car`:28730, `_sky_skin`:28767, `_sky_place_trains`:28787, `_sky_build_station`:28806, `_sky_near`:28871, `_sky_fmt`:28880, `_sky_enter`:28884, `_sky_leave_platform`:28902, `_sky_board`:28912, `_sky_alight`:28926, `_sky_action`:28940, `_sky_tick`:28957, `_sky_camera`:28997, `_tour_today`:29013, `_tour_stamp`:29016, `_sky_hud`:29039

## 29061-29421  Day and night

`_toggle_weather`:29144, `_refresh_weather_button`:29150, `_game_hour`:29156, `_day_key`:29168, `_night_setup`:29183, `_night_scan_mesh`:29273, `_daynight_tick`:29298, `_daynight_apply`:29305, `_daynight_lights`:29406, `_cycle_day_mode`:29411, `_refresh_time_button`:29418

## 29422-30057  v0.27 smoke test and screenshots

`_smoke_v27`:29423, `_city_shots`:29626

## 30058-30474  v0.27: Harbor International Airport (north of the city)

`_build_airport`:30092, `_ap_plane`:30268, `_ap_truck`:30288, `_ap_baggage_train`:30329, `_ap_loop_pos`:30342, `_ap_loop_len`:30358, `_ap_flight_at`:30364, `_ap_tick`:30388, `_airport_ped_plan`:30411, `_smoke_airport`:30431

## 30475-30988  v0.44: people who walk around (Galleria, Biosphere, plazas)

`_nav_area`:30489, `_nav_spot`:30496, `_nav_idx`:30500, `_nav_pos`:30507, `_nav_blocked`:30511, `_nav_nearest_free`:30521, `_nav_bfs`:30549, `_nav_build`:30593, `_stroller`:30664, `_stroll_place`:30680, `_stroll_next`:30701, `_nav_clear_line`:30735, `_stroll_aim`:30746, `_strollers_tick`:30778, `_smoke_strollers`:30873

## 30989-31149  v0.44: directions (signposts at junctions, Directions menu)

`_dir_pos`:31024, `_dir_fmt`:31027, `_signpost_spot`:31030, `_build_signposts`:31047

## 31150-31246  the Directions panel and chip

`_build_dir_panel`:31151, `_open_dir`:31193, `_dir_close`:31202, `_dir_pick`:31206, `_dir_stop`:31211, `_dir_stop_and_close`:31216, `_dir_tick`:31220

## 31247-31788  v0.44: Grand Central

`_gc_mesh`:31276, `_gc_mat`:31309, `_gc_glass`:31318, `_gb`:31328, `_gb_solid`:31334, `_gb_flush`:31338, `_gc_tree`:31368, `_gc_text`:31373, `_gc_planter`:31388, `_gc_kiosk`:31394, `_goods_color`:31424, `_goods_mat`:31427, `_kiosk_goods`:31431, `_build_grand_central`:31509, `_build_gc_towers`:31677, `_gc_tick`:31772

## 31789-32080  v0.44: filling the empty land

`_loft`:31806, `_fill_clear`:31848, `_build_fill`:31858, `_hg_in_lake`:31906, `_hg_path`:31910, `_floor_note_rot`:31918, `_build_gardens`:31926, `_build_fan_plaza`:32036

## 32081-32115  v0.45: hover car underglow

`_car_underglow`:32084

## 32116-32280  v0.46: what is inside the Grand Central shops

`_gc_shop_inside`:32117

## 32281-32312  v0.47: street stalls downtown

`_build_street_stalls`:32285, `_cull_people_in`:32305

## 32313-32411  v0.48: places that open as you level up

`_place_lock_of`:32326, `_place_root`:32332, `_place_unlocked`:32335, `_build_place_signs`:32343, `_places_refresh`:32388, `_places_tick`:32405

## 32412-32456  v0.50: city careers

`_career_rank_name`:32437, `_career_mult`:32440, `_career_block_reason`:32445, `_career_start`:32448, `_career_end`:32453

## 32457-32507  v0.52: careers as clear job loops

`_cid`:32484, `_career_target`:32498, `_career_tick`:32505

## 32508-32515  taxi

`_taxi_meter`:32509

## 32516-32519  paramedic

(no functions)

## 32520-32524  police

`_career_chase_over`:32522

## 32525-32530  firefighter

`_fire_aimed`:32526

## 32531-32540  the step bar

`_career_bar_text`:32534, `_career_hud`:32538

## 32541-32567  cut scenes

`_cs_skip`:32559

## 32568-32572  siren

(no functions)

## 32573-32584  the Careers panel

`_build_career_panel`:32574, `_open_careers`:32577, `_career_close`:32581

## 32585-33008  v0.50: homes

`_home_door_spots`:32625, `_build_homes`:32640, `_home_labels`:32669, `_home_door_near`:32678, `_home_origin`:32687, `_home_slot_near`:32690, `_home_exit_near`:32701, `_home_btn`:32708, `_home_interact`:32721, `_home_buy`:32740, `_home_default_layout`:32754, `_home_enter`:32762, `_home_leave`:32782, `_hm`:32790, `_home_build_room`:32809, `_home_refresh_room`:32918, `_furni_build`:32932

## 33009-33344  decorating

`_build_home_panels`:33010, `_open_homes`:33055, `_home_row_go`:33065, `_home_panel_close`:33085, `_deco_open`:33089, `_deco_pick`:33112, `_smoke_careers_homes`:33135

## 33345-33479  v0.51: home layout (living room, bedroom, bathroom)

`_home_zones`:33349, `_home_slots`:33357, `_home_ring`:33384, `_furni_cat`:33390, `_home_fix_layout`:33396, `_home_build_layout`:33424

## 33480-33913  v0.51: Chapters (a guided story across the whole map)

`_ch_jobs`:33543, `_ch_homes`:33549, `_ch_step_text`:33556, `_ch_step_done`:33567, `_ch_target`:33581, `_ch_finish_chapter`:33590, `_chapters_tick`:33612, `_hud_top_stack`:33652, `_build_chapters_ui`:33682, `_chapters_restart_ask`:33724, `_chapters_restart`:33727, `_chapters_text`:33737, `_open_chapters`:33757, `_chapters_close`:33764, `_smoke_chapters`:33768, `_step_sound`:33889

## 33914-33952  v0.51.1: join and leave messages

`_announce_join`:33921, `_announce_already_here`:33940, `_announce_leave`:33948

## 33953-34217  v0.51.2: Photo mode (clean screenshots)

`_ui3d`:33969, `_shot_tick`:33975, `_draw_shot_icon`:34007, `_shot_enter`:34016, `_shot_exit`:34030, `_shot_release_controls`:34042, `_shot_stick_zone`:34049, `_shot_input`:34052, `_smoke_photo`:34124

## 34218-34516  v0.51.3: stream joiners

`_viewer_count`:34238, `_stream_join_check`:34244, `_stream_join_start`:34251, `_sj_streamer`:34268, `_stream_join_tick`:34277, `_stream_join_land`:34301, `_sj_welcome`:34317, `_smoke_stream_join`:34351, `_career_shot`:34434

## 34517-34633  v0.52.1: streamer mode shows only what the stream needs

`_st_hide_tick`:34521, `_st_restore`:34559, `_smoke_streamer_clean`:34580, `_world_bio_passport`:34631

