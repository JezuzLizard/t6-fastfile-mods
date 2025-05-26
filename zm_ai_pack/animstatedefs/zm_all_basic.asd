zm_inert : aliased notify inert_anim
{
	inert1 ai_zombie_inert_look_v1
	inert2 ai_zombie_inert_look_v2
	inert3 ai_zombie_inert_stagger_v1
	inert4 ai_zombie_inert_stagger_v2
	inert5 ai_zombie_inert_stagger_v3
	inert6 ai_zombie_inert_stagger_v4
	inert7 ai_zombie_inert_circle_v1
}

zm_inert_trans : aliased notify inert_trans_anim
{
	inert_2_walk_1 ai_zombie_inert_2_walk_v11
	inert_2_walk_2 ai_zombie_inert_2_walk_v12
	inert_2_walk_3 ai_zombie_inert_2_walk_v13
	inert_2_walk_4 ai_zombie_inert_2_walk_v14
	inert_2_run_1 ai_zombie_inert_2_run_v1
	inert_2_run_2 ai_zombie_inert_2_run_v2
	inert_2_sprint_1 ai_zombie_inert_2_sprint_v1
	inert_2_sprint_2 ai_zombie_inert_2_sprint_v2
}

zm_inert_crawl : aliased missing_legs notify inert_anim
{
	inert1 ai_zombie_crawl_inert_v1
	inert2 ai_zombie_crawl_inert_v2
	inert3 ai_zombie_crawl_inert_v3
	inert4 ai_zombie_crawl_inert_v4
	inert5 ai_zombie_crawl_inert_v5
	inert6 ai_zombie_crawl_inert_v6
	inert7 ai_zombie_crawl_inert_v7
}

zm_inert_crawl_trans : aliased missing_legs notify inert_trans_anim
{
	inert_2_walk_1 ai_zombie_crawl_inert_2_walk_v1
	inert_2_run_1 ai_zombie_crawl_inert_2_run_v1
	inert_2_run_2 ai_zombie_crawl_inert_2_run_v2
	inert_2_sprint_1 ai_zombie_crawl_inert_2_sprint_v1
	inert_2_sprint_2 ai_zombie_crawl_inert_2_sprint_v2
}

zm_idle : notify idle_anim
{
	ai_zombie_idle_v1_delta
}

zm_idle_crawl : notify idle_anim
{
	ai_zombie_idle_crawl_delta
}

zm_move_walk : notify move_anim
{
	ai_zombie_walk_v1
	ai_zombie_walk_v2
	ai_zombie_walk_v3
	ai_zombie_walk_v4
	ai_zombie_walk_v6
	ai_zombie_walk_v7
	ai_zombie_walk_v9
	ai_zombie_walk_v9
}

zm_move_walk_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl
	ai_zombie_crawl_v1
	ai_zombie_crawl_v2
	ai_zombie_crawl_v3
	ai_zombie_crawl_v4
	ai_zombie_crawl_v5
}

zm_move_run : notify move_anim
{
	ai_zombie_walk_fast_v1
	ai_zombie_walk_fast_v2
	ai_zombie_walk_fast_v3
	ai_zombie_run_v2
	ai_zombie_run_v4
	ai_zombie_run_v3
}

zm_move_run_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl
	ai_zombie_crawl_v1
	ai_zombie_crawl_v2
	ai_zombie_crawl_v3
	ai_zombie_crawl_v4
	ai_zombie_crawl_v5
}

zm_move_sprint : notify move_anim
{
	ai_zombie_sprint_v1
	ai_zombie_sprint_v2
}

zm_move_sprint_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl_sprint
	ai_zombie_crawl_sprint_1
	ai_zombie_crawl_sprint_2
}

zm_move_super_sprint : notify move_anim
{
	ai_zombie_fast_sprint_01
	ai_zombie_fast_sprint_02
}

zm_move_super_sprint_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl_sprint
	ai_zombie_crawl_sprint_1
	ai_zombie_crawl_sprint_2
}

zm_move_stumpy : missing_legs notify move_anim
{
	ai_zombie_walk_on_hands_a
	ai_zombie_walk_on_hands_b
}

zm_move_slide_fall : restart notify slide_fall_anim
{
	ai_zombie_slipslide_collapse
}

zm_move_walk_slide : notify move_anim
{
	ai_zombie_walk_slipslide
	ai_zombie_walk_slipslide_a
}

zm_move_walk_slide_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl_slipslide_slow
}

zm_move_run_slide : notify move_anim
{
	ai_zombie_run_slipslide
	ai_zombie_run_slipslide_a
}

zm_move_run_slide_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl_slipslide_slow
}

zm_move_sprint_slide : notify move_anim
{
	ai_zombie_sprint_slipslide
	ai_zombie_sprint_slipslide_a
}

zm_move_sprint_slide_crawl : missing_legs notify move_anim
{
	ai_zombie_crawl_slipslide_fast
}

zm_move_slide_recover : restart notify slide_recover_anim
{
	ai_zombie_stand_slipslide_recover
}

zm_move_slide_recover_crawl : restart missing_legs notify slide_recover_anim
{
	ai_zombie_crawl_slipslide_recover
}

zm_step_left : restart notify step_anim
{
	ai_zombie_spets_sidestep_left_a
	ai_zombie_spets_sidestep_left_b
}

zm_step_right : restart notify step_anim
{
	ai_zombie_spets_sidestep_right_a
	ai_zombie_spets_sidestep_right_b
}

zm_roll_forward : restart notify step_anim
{
	ai_zombie_spets_roll_a
	ai_zombie_spets_roll_b
	ai_zombie_spets_roll_c
}

zm_walk_melee : restart notify melee_anim
{
	ai_zombie_attack_v2
	ai_zombie_attack_v4
	ai_zombie_attack_v6
	ai_zombie_attack_v1
	ai_zombie_attack_forward_v1
	ai_zombie_attack_forward_v2
	ai_zombie_walk_attack_v1
	ai_zombie_walk_attack_v2
	ai_zombie_walk_attack_v3
	ai_zombie_walk_attack_v4
}

zm_generator_melee : restart notify static_melee_anim
{
	ai_zombie_attack_v2
	ai_zombie_attack_v4
	ai_zombie_attack_v6
	ai_zombie_attack_v1
}

zm_walk_melee_crawl : restart missing_legs notify melee_anim
{
	ai_zombie_attack_crawl
	ai_zombie_attack_crawl_lunge
}

zm_run_melee : restart notify melee_anim
{
	ai_zombie_attack_v2
	ai_zombie_attack_v4
	ai_zombie_attack_v6
	ai_zombie_attack_v1
	ai_zombie_attack_forward_v1
	ai_zombie_attack_forward_v2
	ai_zombie_run_attack_v1
	ai_zombie_run_attack_v2
	ai_zombie_run_attack_v3
}

zm_run_melee_crawl : restart missing_legs notify melee_anim
{
	ai_zombie_attack_crawl
	ai_zombie_attack_crawl_lunge
}

zm_stumpy_melee : restart missing_legs notify melee_anim
{
	ai_zombie_walk_on_hands_shot_a
	ai_zombie_walk_on_hands_shot_b
}

zm_taunt : restart notify taunt_anim
{
	ai_zombie_taunts_4
	ai_zombie_taunts_7
	ai_zombie_taunts_9
	ai_zombie_taunts_5b
	ai_zombie_taunts_5c
	ai_zombie_taunts_5d
	ai_zombie_taunts_5e
	ai_zombie_taunts_5f
}

zm_board_tear_in : restart notify tear_anim
{
	ai_zombie_boardtear_aligned_m_1_grab
	ai_zombie_boardtear_aligned_m_2_grab
	ai_zombie_boardtear_aligned_m_3_grab
	ai_zombie_boardtear_aligned_m_4_grab
	ai_zombie_boardtear_aligned_m_5_grab
	ai_zombie_boardtear_aligned_m_6_grab
	ai_zombie_boardtear_aligned_r_1_grab
	ai_zombie_boardtear_aligned_r_2_grab
	ai_zombie_boardtear_aligned_r_3_grab
	ai_zombie_boardtear_aligned_r_4_grab
	ai_zombie_boardtear_aligned_r_5_grab
	ai_zombie_boardtear_aligned_r_6_grab
	ai_zombie_boardtear_aligned_l_1_grab
	ai_zombie_boardtear_aligned_l_2_grab
	ai_zombie_boardtear_aligned_l_3_grab
	ai_zombie_boardtear_aligned_l_4_grab
	ai_zombie_boardtear_aligned_l_5_grab
	ai_zombie_boardtear_aligned_l_6_grab
}

zm_board_tear_loop : restart notify tear_anim
{
	ai_zombie_boardtear_aligned_m_1_hold
	ai_zombie_boardtear_aligned_m_2_hold
	ai_zombie_boardtear_aligned_m_3_hold
	ai_zombie_boardtear_aligned_m_4_hold
	ai_zombie_boardtear_aligned_m_5_hold
	ai_zombie_boardtear_aligned_m_6_hold
	ai_zombie_boardtear_aligned_r_1_hold
	ai_zombie_boardtear_aligned_r_2_hold
	ai_zombie_boardtear_aligned_r_3_hold
	ai_zombie_boardtear_aligned_r_4_hold
	ai_zombie_boardtear_aligned_r_5_hold
	ai_zombie_boardtear_aligned_r_6_hold
	ai_zombie_boardtear_aligned_l_1_hold
	ai_zombie_boardtear_aligned_l_2_hold
	ai_zombie_boardtear_aligned_l_3_hold
	ai_zombie_boardtear_aligned_l_4_hold
	ai_zombie_boardtear_aligned_l_5_hold
	ai_zombie_boardtear_aligned_l_6_hold
}

zm_board_tear_out : restart notify tear_anim
{
	ai_zombie_boardtear_aligned_m_1_pull
	ai_zombie_boardtear_aligned_m_2_pull
	ai_zombie_boardtear_aligned_m_3_pull
	ai_zombie_boardtear_aligned_m_4_pull
	ai_zombie_boardtear_aligned_m_5_pull
	ai_zombie_boardtear_aligned_m_6_pull
	ai_zombie_boardtear_aligned_r_1_pull
	ai_zombie_boardtear_aligned_r_2_pull
	ai_zombie_boardtear_aligned_r_3_pull
	ai_zombie_boardtear_aligned_r_4_pull
	ai_zombie_boardtear_aligned_r_5_pull
	ai_zombie_boardtear_aligned_r_6_pull
	ai_zombie_boardtear_aligned_l_1_pull
	ai_zombie_boardtear_aligned_l_2_pull
	ai_zombie_boardtear_aligned_l_3_pull
	ai_zombie_boardtear_aligned_l_4_pull
	ai_zombie_boardtear_aligned_l_5_pull
	ai_zombie_boardtear_aligned_l_6_pull
}

zm_board_tear_in_crawl : restart missing_legs notify tear_anim
{
	ai_zombie_crawl_boardtear_aligned_m_1_grab
	ai_zombie_crawl_boardtear_aligned_m_2_grab
	ai_zombie_crawl_boardtear_aligned_m_3_grab
	ai_zombie_crawl_boardtear_aligned_m_4_grab
	ai_zombie_crawl_boardtear_aligned_m_5_grab
	ai_zombie_crawl_boardtear_aligned_m_6_grab
	ai_zombie_crawl_boardtear_aligned_r_1_grab
	ai_zombie_crawl_boardtear_aligned_r_2_grab
	ai_zombie_crawl_boardtear_aligned_r_3_grab
	ai_zombie_crawl_boardtear_aligned_r_4_grab
	ai_zombie_crawl_boardtear_aligned_r_5_grab
	ai_zombie_crawl_boardtear_aligned_r_6_grab
	ai_zombie_crawl_boardtear_aligned_l_1_grab
	ai_zombie_crawl_boardtear_aligned_l_2_grab
	ai_zombie_crawl_boardtear_aligned_l_3_grab
	ai_zombie_crawl_boardtear_aligned_l_4_grab
	ai_zombie_crawl_boardtear_aligned_l_5_grab
	ai_zombie_crawl_boardtear_aligned_l_6_grab
}

zm_board_tear_loop_crawl : restart missing_legs notify tear_anim
{
	ai_zombie_crawl_boardtear_aligned_m_1_hold
	ai_zombie_crawl_boardtear_aligned_m_2_hold
	ai_zombie_crawl_boardtear_aligned_m_3_hold
	ai_zombie_crawl_boardtear_aligned_m_4_hold
	ai_zombie_crawl_boardtear_aligned_m_5_hold
	ai_zombie_crawl_boardtear_aligned_m_6_hold
	ai_zombie_crawl_boardtear_aligned_r_1_hold
	ai_zombie_crawl_boardtear_aligned_r_2_hold
	ai_zombie_crawl_boardtear_aligned_r_3_hold
	ai_zombie_crawl_boardtear_aligned_r_4_hold
	ai_zombie_crawl_boardtear_aligned_r_5_hold
	ai_zombie_crawl_boardtear_aligned_r_6_hold
	ai_zombie_crawl_boardtear_aligned_l_1_hold
	ai_zombie_crawl_boardtear_aligned_l_2_hold
	ai_zombie_crawl_boardtear_aligned_l_3_hold
	ai_zombie_crawl_boardtear_aligned_l_4_hold
	ai_zombie_crawl_boardtear_aligned_l_5_hold
	ai_zombie_crawl_boardtear_aligned_l_6_hold
}

zm_board_tear_out_crawl : restart missing_legs notify tear_anim
{
	ai_zombie_crawl_boardtear_aligned_m_1_pull
	ai_zombie_crawl_boardtear_aligned_m_2_pull
	ai_zombie_crawl_boardtear_aligned_m_3_pull
	ai_zombie_crawl_boardtear_aligned_m_4_pull
	ai_zombie_crawl_boardtear_aligned_m_5_pull
	ai_zombie_crawl_boardtear_aligned_m_6_pull
	ai_zombie_crawl_boardtear_aligned_r_1_pull
	ai_zombie_crawl_boardtear_aligned_r_2_pull
	ai_zombie_crawl_boardtear_aligned_r_3_pull
	ai_zombie_crawl_boardtear_aligned_r_4_pull
	ai_zombie_crawl_boardtear_aligned_r_5_pull
	ai_zombie_crawl_boardtear_aligned_r_6_pull
	ai_zombie_crawl_boardtear_aligned_l_1_pull
	ai_zombie_crawl_boardtear_aligned_l_2_pull
	ai_zombie_crawl_boardtear_aligned_l_3_pull
	ai_zombie_crawl_boardtear_aligned_l_4_pull
	ai_zombie_crawl_boardtear_aligned_l_5_pull
	ai_zombie_crawl_boardtear_aligned_l_6_pull
}

zm_zbarrier_board_tear_in : aliased restart notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_boardtear_aligned_m_1_grab
	spot_0_piece_vert_1 ai_zombie_boardtear_aligned_m_2_grab
	spot_0_piece_vert_2 ai_zombie_boardtear_aligned_m_3_grab
	spot_0_piece_horz_2 ai_zombie_boardtear_aligned_m_4_grab
	spot_0_piece_horz_3 ai_zombie_boardtear_aligned_m_5_grab
	spot_0_piece_horz_4 ai_zombie_boardtear_aligned_m_6_grab
	spot_1_piece_horz_1 ai_zombie_boardtear_aligned_r_1_grab
	spot_1_piece_vert_1 ai_zombie_boardtear_aligned_r_2_grab
	spot_1_piece_vert_2 ai_zombie_boardtear_aligned_r_3_grab
	spot_1_piece_horz_2 ai_zombie_boardtear_aligned_r_4_grab
	spot_1_piece_horz_3 ai_zombie_boardtear_aligned_r_5_grab
	spot_1_piece_horz_4 ai_zombie_boardtear_aligned_r_6_grab
	spot_2_piece_horz_1 ai_zombie_boardtear_aligned_l_1_grab
	spot_2_piece_vert_1 ai_zombie_boardtear_aligned_l_2_grab
	spot_2_piece_vert_2 ai_zombie_boardtear_aligned_l_3_grab
	spot_2_piece_horz_2 ai_zombie_boardtear_aligned_l_4_grab
	spot_2_piece_horz_3 ai_zombie_boardtear_aligned_l_5_grab
	spot_2_piece_horz_4 ai_zombie_boardtear_aligned_l_6_grab
}

zm_zbarrier_board_tear_loop : aliased restart notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_boardtear_aligned_m_1_hold
	spot_0_piece_vert_1 ai_zombie_boardtear_aligned_m_2_hold
	spot_0_piece_vert_2 ai_zombie_boardtear_aligned_m_3_hold
	spot_0_piece_horz_2 ai_zombie_boardtear_aligned_m_4_hold
	spot_0_piece_horz_3 ai_zombie_boardtear_aligned_m_5_hold
	spot_0_piece_horz_4 ai_zombie_boardtear_aligned_m_6_hold
	spot_1_piece_horz_1 ai_zombie_boardtear_aligned_r_1_hold
	spot_1_piece_vert_1 ai_zombie_boardtear_aligned_r_2_hold
	spot_1_piece_vert_2 ai_zombie_boardtear_aligned_r_3_hold
	spot_1_piece_horz_2 ai_zombie_boardtear_aligned_r_4_hold
	spot_1_piece_horz_3 ai_zombie_boardtear_aligned_r_5_hold
	spot_1_piece_horz_4 ai_zombie_boardtear_aligned_r_6_hold
	spot_2_piece_horz_1 ai_zombie_boardtear_aligned_l_1_hold
	spot_2_piece_vert_1 ai_zombie_boardtear_aligned_l_2_hold
	spot_2_piece_vert_2 ai_zombie_boardtear_aligned_l_3_hold
	spot_2_piece_horz_2 ai_zombie_boardtear_aligned_l_4_hold
	spot_2_piece_horz_3 ai_zombie_boardtear_aligned_l_5_hold
	spot_2_piece_horz_4 ai_zombie_boardtear_aligned_l_6_hold
}

zm_zbarrier_board_tear_out : aliased restart notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_boardtear_aligned_m_1_pull
	spot_0_piece_vert_1 ai_zombie_boardtear_aligned_m_2_pull
	spot_0_piece_vert_2 ai_zombie_boardtear_aligned_m_3_pull
	spot_0_piece_horz_2 ai_zombie_boardtear_aligned_m_4_pull
	spot_0_piece_horz_3 ai_zombie_boardtear_aligned_m_5_pull
	spot_0_piece_horz_4 ai_zombie_boardtear_aligned_m_6_pull
	spot_1_piece_horz_1 ai_zombie_boardtear_aligned_r_1_pull
	spot_1_piece_vert_1 ai_zombie_boardtear_aligned_r_2_pull
	spot_1_piece_vert_2 ai_zombie_boardtear_aligned_r_3_pull
	spot_1_piece_horz_2 ai_zombie_boardtear_aligned_r_4_pull
	spot_1_piece_horz_3 ai_zombie_boardtear_aligned_r_5_pull
	spot_1_piece_horz_4 ai_zombie_boardtear_aligned_r_6_pull
	spot_2_piece_horz_1 ai_zombie_boardtear_aligned_l_1_pull
	spot_2_piece_vert_1 ai_zombie_boardtear_aligned_l_2_pull
	spot_2_piece_vert_2 ai_zombie_boardtear_aligned_l_3_pull
	spot_2_piece_horz_2 ai_zombie_boardtear_aligned_l_4_pull
	spot_2_piece_horz_3 ai_zombie_boardtear_aligned_l_5_pull
	spot_2_piece_horz_4 ai_zombie_boardtear_aligned_l_6_pull
}

zm_zbarrier_board_tear_in_crawl : aliased restart missing_legs notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_crawl_boardtear_aligned_m_1_grab
	spot_0_piece_vert_1 ai_zombie_crawl_boardtear_aligned_m_2_grab
	spot_0_piece_vert_2 ai_zombie_crawl_boardtear_aligned_m_3_grab
	spot_0_piece_horz_2 ai_zombie_crawl_boardtear_aligned_m_4_grab
	spot_0_piece_horz_3 ai_zombie_crawl_boardtear_aligned_m_5_grab
	spot_0_piece_horz_4 ai_zombie_crawl_boardtear_aligned_m_6_grab
	spot_1_piece_horz_1 ai_zombie_crawl_boardtear_aligned_r_1_grab
	spot_1_piece_vert_1 ai_zombie_crawl_boardtear_aligned_r_2_grab
	spot_1_piece_vert_2 ai_zombie_crawl_boardtear_aligned_r_3_grab
	spot_1_piece_horz_2 ai_zombie_crawl_boardtear_aligned_r_4_grab
	spot_1_piece_horz_3 ai_zombie_crawl_boardtear_aligned_r_5_grab
	spot_1_piece_horz_4 ai_zombie_crawl_boardtear_aligned_r_6_grab
	spot_2_piece_horz_1 ai_zombie_crawl_boardtear_aligned_l_1_grab
	spot_2_piece_vert_1 ai_zombie_crawl_boardtear_aligned_l_2_grab
	spot_2_piece_vert_2 ai_zombie_crawl_boardtear_aligned_l_3_grab
	spot_2_piece_horz_2 ai_zombie_crawl_boardtear_aligned_l_4_grab
	spot_2_piece_horz_3 ai_zombie_crawl_boardtear_aligned_l_5_grab
	spot_2_piece_horz_4 ai_zombie_crawl_boardtear_aligned_l_6_grab
}

zm_zbarrier_board_tear_loop_crawl : aliased restart missing_legs notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_crawl_boardtear_aligned_m_1_hold
	spot_0_piece_vert_1 ai_zombie_crawl_boardtear_aligned_m_2_hold
	spot_0_piece_vert_2 ai_zombie_crawl_boardtear_aligned_m_3_hold
	spot_0_piece_horz_2 ai_zombie_crawl_boardtear_aligned_m_4_hold
	spot_0_piece_horz_3 ai_zombie_crawl_boardtear_aligned_m_5_hold
	spot_0_piece_horz_4 ai_zombie_crawl_boardtear_aligned_m_6_hold
	spot_1_piece_horz_1 ai_zombie_crawl_boardtear_aligned_r_1_hold
	spot_1_piece_vert_1 ai_zombie_crawl_boardtear_aligned_r_2_hold
	spot_1_piece_vert_2 ai_zombie_crawl_boardtear_aligned_r_3_hold
	spot_1_piece_horz_2 ai_zombie_crawl_boardtear_aligned_r_4_hold
	spot_1_piece_horz_3 ai_zombie_crawl_boardtear_aligned_r_5_hold
	spot_1_piece_horz_4 ai_zombie_crawl_boardtear_aligned_r_6_hold
	spot_2_piece_horz_1 ai_zombie_crawl_boardtear_aligned_l_1_hold
	spot_2_piece_vert_1 ai_zombie_crawl_boardtear_aligned_l_2_hold
	spot_2_piece_vert_2 ai_zombie_crawl_boardtear_aligned_l_3_hold
	spot_2_piece_horz_2 ai_zombie_crawl_boardtear_aligned_l_4_hold
	spot_2_piece_horz_3 ai_zombie_crawl_boardtear_aligned_l_5_hold
	spot_2_piece_horz_4 ai_zombie_crawl_boardtear_aligned_l_6_hold
}

zm_zbarrier_board_tear_out_crawl : aliased restart missing_legs notify tear_anim
{
	spot_0_piece_horz_1 ai_zombie_crawl_boardtear_aligned_m_1_pull
	spot_0_piece_vert_1 ai_zombie_crawl_boardtear_aligned_m_2_pull
	spot_0_piece_vert_2 ai_zombie_crawl_boardtear_aligned_m_3_pull
	spot_0_piece_horz_2 ai_zombie_crawl_boardtear_aligned_m_4_pull
	spot_0_piece_horz_3 ai_zombie_crawl_boardtear_aligned_m_5_pull
	spot_0_piece_horz_4 ai_zombie_crawl_boardtear_aligned_m_6_pull
	spot_1_piece_horz_1 ai_zombie_crawl_boardtear_aligned_r_1_pull
	spot_1_piece_vert_1 ai_zombie_crawl_boardtear_aligned_r_2_pull
	spot_1_piece_vert_2 ai_zombie_crawl_boardtear_aligned_r_3_pull
	spot_1_piece_horz_2 ai_zombie_crawl_boardtear_aligned_r_4_pull
	spot_1_piece_horz_3 ai_zombie_crawl_boardtear_aligned_r_5_pull
	spot_1_piece_horz_4 ai_zombie_crawl_boardtear_aligned_r_6_pull
	spot_2_piece_horz_1 ai_zombie_crawl_boardtear_aligned_l_1_pull
	spot_2_piece_vert_1 ai_zombie_crawl_boardtear_aligned_l_2_pull
	spot_2_piece_vert_2 ai_zombie_crawl_boardtear_aligned_l_3_pull
	spot_2_piece_horz_2 ai_zombie_crawl_boardtear_aligned_l_4_pull
	spot_2_piece_horz_3 ai_zombie_crawl_boardtear_aligned_l_5_pull
	spot_2_piece_horz_4 ai_zombie_crawl_boardtear_aligned_l_6_pull
}

zm_window_melee : restart notify window_melee_anim
{
	ai_zombie_window_attack_arm_l_out
	ai_zombie_window_attack_arm_r_out
}

zm_window_dismount : restart notify window_dismount_anim
{
	ai_zombie_bus_window_dismount_l
	ai_zombie_bus_window_dismount_r
}

zm_window_dismount_crawl : missing_legs restart notify window_dismount_anim
{
	ai_zombie_crawl_bus_window_dismount_l
	ai_zombie_crawl_bus_window_dismount_r
}

zm_front_window_dismount : restart notify window_dismount_anim
{
	ai_zombie_bus_front_window_dismount_l
	ai_zombie_bus_front_window_dismount_r
}

zm_front_window_dismount_crawl : restart notify window_dismount_anim
{
	ai_zombie_crawl_bus_front_window_dismount_l
	ai_zombie_crawl_bus_front_window_dismount_r
}

zm_window_exit : aliased restart notify window_exit_anim
{
	exit_front ai_zombie_bus_window_exit_front
	exit_back_l ai_zombie_bus_window_exit_back_l
	exit_back_r ai_zombie_bus_window_exit_back_r
}

zm_window_exit_crawl : aliased missing_legs restart notify window_exit_anim
{
	exit_front ai_zombie_crawl_bus_window_exit_front
	exit_back_l ai_zombie_crawl_bus_window_exit_back_l
	exit_back_r ai_zombie_crawl_bus_window_exit_back_r
}

zm_rise : restart notify rise_anim
{
	ai_zombie_traverse_ground_dugup
	ai_zombie_traverse_ground_dugup
	ai_zombie_traverse_ground_dugup
	ai_zombie_traverse_ground_dugup
	ai_zombie_traverse_ground_v1_walk
	ai_zombie_traverse_ground_v1_walk
	ai_zombie_traverse_ground_v1_run
	ai_zombie_traverse_ground_climbout_fast
}

zm_dug_rise : restart notify rise_anim
{
	ai_zombie_traverse_ground_dugup
}

zm_rise_death_in : restart notify death_anim
{
	ai_zombie_traverse_ground_v1_deathinside
	ai_zombie_traverse_ground_v1_deathinside_alt
}

zm_rise_death_out : restart notify death_anim
{
	ai_zombie_traverse_ground_v1_deathoutside
	ai_zombie_traverse_ground_v1_deathoutside_alt
}

zm_faller_attack : restart notify attack_anim
{
	ai_zombie_ceiling_attack_01
	ai_zombie_ceiling_attack_02
}

zm_faller_emerge : restart notify emerge_anim
{
	ai_zombie_ceiling_emerge_01
}

zm_faller_emerge_death : restart notify death_anim
{
	ai_zombie_ceiling_death
}

zm_faller_fall : restart notify fall_anim
{
	ai_zombie_ceiling_dropdown_01
}

zm_faller_fall_loop : notify fall_anim
{
	ai_zombie_ceiling_fall_loop
}

zm_faller_land : restart notify land_anim
{
	ai_zombie_ceiling_fall_land
	ai_zombie_ceiling_fall_land_02
}

zm_death : restart notify death_anim
{
	ch_dazed_a_death
	ch_dazed_b_death
	ch_dazed_c_death
	ch_dazed_d_death
}

zm_death_crawl : restart missing_legs notify death_anim
{
	ai_zombie_crawl_death_v1
	ai_zombie_crawl_death_v2
}

zm_traverse_barrier : aliased restart notify traverse_anim
{
	barrier_walk	ai_zombie_traverse_v1
	barrier_walk	ai_zombie_traverse_v2
	barrier_run		ai_zombie_traverse_v5
	barrier_sprint	ai_zombie_traverse_v6
	barrier_sprint	ai_zombie_traverse_v7

	barrier_walk_slide		ai_zombie_traverse_v1
	barrier_walk_slide		ai_zombie_traverse_v2
	barrier_run_slide		ai_zombie_traverse_v5
	barrier_sprint_slide	ai_zombie_traverse_v6
	barrier_sprint_slide	ai_zombie_traverse_v7
}

zm_traverse_barrier_no_restart : aliased notify traverse_anim
{
	barrier_walk	ai_zombie_traverse_v1
	barrier_walk	ai_zombie_traverse_v2
	barrier_run		ai_zombie_traverse_v5
	barrier_sprint	ai_zombie_traverse_v6
	barrier_sprint	ai_zombie_traverse_v7
}

zm_traverse_barrier_crawl : aliased restart missing_legs notify traverse_anim
{
	barrier_crawl	ai_zombie_traverse_crawl_v1
	barrier_crawl	ai_zombie_traverse_v4

	barrier_crawl_slide	ai_zombie_traverse_crawl_v1
	barrier_crawl_slide	ai_zombie_traverse_v4
}

zm_traverse_barrier_crawl_no_restart : aliased missing_legs notify traverse_anim
{
	barrier_crawl	ai_zombie_traverse_crawl_v1
	barrier_crawl	ai_zombie_traverse_v4
}

zm_barricade_enter : aliased restart notify barricade_enter_anim
{
	barrier_walk_m		ai_zombie_barricade_enter_m_v1
	barrier_walk_m		ai_zombie_barricade_enter_m_v2
	barrier_run_m		ai_zombie_barricade_enter_m_v5
	barrier_sprint_m	ai_zombie_barricade_enter_m_v6
	barrier_sprint_m	ai_zombie_barricade_enter_m_v7

	barrier_walk_r		ai_zombie_barricade_enter_r
	barrier_run_r		ai_zombie_barricade_enter_run_r
	barrier_sprint_r	ai_zombie_barricade_enter_sprint_r

	barrier_walk_l		ai_zombie_barricade_enter_l
	barrier_run_l		ai_zombie_barricade_enter_run_l
	barrier_sprint_l	ai_zombie_barricade_enter_sprint_l

	barrier_walk_slide_m	ai_zombie_barricade_enter_m_v1
	barrier_walk_slide_m	ai_zombie_barricade_enter_m_v2
	barrier_run_slide_m		ai_zombie_barricade_enter_m_v5
	barrier_sprint_slide_m	ai_zombie_barricade_enter_m_v6
	barrier_sprint_slide_m	ai_zombie_barricade_enter_m_v7

	barrier_walk_slide_r	ai_zombie_barricade_enter_r
	barrier_run_slide_r		ai_zombie_barricade_enter_run_r
	barrier_sprint_slide_r	ai_zombie_barricade_enter_sprint_r

	barrier_walk_slide_l	ai_zombie_barricade_enter_l
	barrier_run_slide_l		ai_zombie_barricade_enter_run_l
	barrier_sprint_slide_l	ai_zombie_barricade_enter_sprint_l
}

zm_barricade_enter_crawl : aliased restart missing_legs notify barricade_enter_anim
{
	barrier_walk_m		ai_zombie_barricade_enter_m_nolegs
	barrier_walk_m		ai_zombie_barricade_enter_m_v4
	barrier_run_m		ai_zombie_barricade_enter_m_nolegs
	barrier_sprint_m	ai_zombie_barricade_enter_m_nolegs

	barrier_walk_r		ai_zombie_crawl_barricade_enter_r
	barrier_run_r		ai_zombie_crawl_barricade_enter_run_r
	barrier_sprint_r	ai_zombie_crawl_barricade_enter_sprint_r

	barrier_walk_l		ai_zombie_crawl_barricade_enter_l
	barrier_run_l		ai_zombie_crawl_barricade_enter_run_l
	barrier_sprint_l	ai_zombie_crawl_barricade_enter_sprint_l

	barrier_walk_slide_m	ai_zombie_barricade_enter_m_nolegs
	barrier_walk_slide_m	ai_zombie_barricade_enter_m_v4
	barrier_run_slide_m		ai_zombie_barricade_enter_m_nolegs
	barrier_sprint_slide_m	ai_zombie_barricade_enter_m_nolegs

	barrier_walk_slide_r	ai_zombie_crawl_barricade_enter_r
	barrier_run_slide_r		ai_zombie_crawl_barricade_enter_run_r
	barrier_sprint_slide_r	ai_zombie_crawl_barricade_enter_sprint_r

	barrier_walk_slide_l	ai_zombie_crawl_barricade_enter_l
	barrier_run_slide_l		ai_zombie_crawl_barricade_enter_run_l
	barrier_sprint_slide_l	ai_zombie_crawl_barricade_enter_sprint_l
}

////traverse anims, not all necessarily used on every level
zm_traverse : aliased restart notify traverse_anim
{
	jump_across_120					ai_zombie_jump_across_120
	jump_down_40					ai_zombie_jump_down_40
	jump_down_fast_40				ai_zombie_jump_down_fast_40
	jump_down_48					ai_zombie_jump_down_48
	jump_down_72					ai_zombie_jump_down_72
	jump_down_96					ai_zombie_jump_down_96
	jump_down_120					ai_zombie_jump_down_120
	jump_down_127					ai_zombie_jump_down_127
	jump_down_176					ai_zombie_jump_down_176
	jump_down_190					ai_zombie_jump_down_190
	jump_down_222					ai_zombie_jump_down_222
	jump_down_240					ai_zombie_jump_down_240
//	jump_down_286					ai_zombie_jump_down_286
//	jump_down_386					ai_zombie_jump_down_386
	jump_up_72						ai_zombie_jump_up_72
	jump_up_96						ai_zombie_jump_up_96
	jump_up_154						ai_zombie_jump_up_154
	jump_up_127						ai_zombie_jump_up_127
	jump_up_222						ai_zombie_jump_up_222
	jump_up_to_climb				ai_zombie_jump_up_2_climb
//	jump_up_to_climb_coast			ai_zombie_jump_up_2_climb_coast
	mantle_over_40_hurdle			ai_zombie_traverse_v6
/*
	traverse_diner_roof	ai_zombie_traverse_diner_roof
	traverse_diner_roof_up	ai_zombie_jump_up_diner_roof
	traverse_diner_roof_hatch_up	ai_zombie_diner_roof_hatch_jump_up
	traverse_car							ai_zombie_traverse_car
	traverse_car_sprint				ai_zombie_traverse_car_sprint
	traverse_car_run				ai_zombie_traverse_car_run
	traverse_car_reverse	ai_zombie_traverse_car_pass_to_driver_side
	traverse_diner_counter_reverse	ai_zombie_traverse_diner_counter_from_stools
	traverse_diner_counter	ai_zombie_traverse_diner_counter_to_stools
*/
	traverse_garage_door	ai_zombie_traverse_garage_roll	
	jump_up_startrailing						ai_zombie_jump_up_startrailing
	jump_down_startrailing						ai_zombie_jump_down_startrailing

	jump_up_grabbed_48				ai_zombie_jump_up_grabbed_48
	traverse_48						ai_zombie_traverse_48
	
/*
	jump_down_cellblock			ai_zombie_sprint_jump_down_cellblock
	jump_up_cellblock			ai_zombie_sprint_jump_up_cellblock
	climb_over_dock_fence			ai_zombie_climb_over_dock_fence
	golden_gate_jump_up			ai_zombie_jump_up_goldengate
	dock_water_climb_up			ai_zombie_jump_up_dock
	baseball_to_first_floor_climb		ai_zombie_climb_up_ext_low
	baseball_to_second_floor_climb		ai_zombie_climb_up_ext_mid
	baseball_to_roof_climb			ai_zombie_climb_up_ext_roof
	jump_down_cellblock_norailing		ai_zombie_jump_down_cellblock_basic
	cellblock_jump_up_climb			ai_zombie_jump_up_2_climb
	dock_mid_way_jump_up_climb		ai_zombie_jump_up_dock_middle
	dock_tommygun_dropdown			ai_zombie_jump_down_dock_tommygun
*/

	// zm_highrise specific traversals
	dierise_traverse_1_high_to_low	ai_zombie_traverse_dierise_1_high_to_low
//	dierise_traverse_1_low_to_high	ai_zombie_traverse_dierise_1_low_to_high
	dierise_traverse_2_high_to_low	ai_zombie_traverse_dierise_2_high_to_low
	dierise_traverse_2_low_to_high	ai_zombie_traverse_dierise_2_low_to_high
	dierise_traverse_3_high_to_low	ai_zombie_traverse_dierise_3_high_to_low
	dierise_traverse_3_low_to_high	ai_zombie_traverse_dierise_3_low_to_high
	dierise_traverse_4_high_to_low	ai_zombie_traverse_dierise_4_high_to_low
	dierise_traverse_4_low_to_high	ai_zombie_traverse_dierise_4_low_to_high
	dierise_traverse_5_high_to_low	ai_zombie_traverse_dierise_5_high_to_low
	dierise_traverse_5_low_to_high	ai_zombie_traverse_dierise_5_low_to_high		
	
//	dierise_gap1_to_antenna			ai_zombie_traverse_dierise_gap1_to_antenna
	dierise_gap1_from_antenna		ai_zombie_traverse_dierise_gap1_from_antenna

//	gap2_from_roof					ai_zombie_traverse_dierise_gap2_from_roof
//	gap2_to_roof					ai_zombie_traverse_dierise_gap2_to_roof

	dierise_gap4a_slide_down_beam	ai_zombie_traverse_dierise_gap4a_slide_down_beam
//	dierise_gap4b_to_roof			ai_zombie_traverse_dierise_gap4b_to_roof
	dierise_gap4b_from_roof			ai_zombie_traverse_dierise_gap4b_from_roof
	
//	dierise_gap5a_from_conference	ai_zombie_traverse_dierise_gap5a_from_conference
//	dierise_gap5a_to_conference		ai_zombie_traverse_dierise_gap5a_to_conference
//	dierise_gap5b_from_conference	ai_zombie_traverse_dierise_gap5b_from_conference
//	dierise_gap5b_to_conference		ai_zombie_traverse_dierise_gap5b_to_conference 		
	
	dierise_gap6_high_to_low		ai_zombie_traverse_dierise_gap6_high_to_low
	dierise_gap6_low_to_high		ai_zombie_traverse_dierise_gap6_low_to_high
	
	dierise_gap7_from_top_ledge		ai_zombie_traverse_dierise_gap7_from_top_ledge
	dierise_gap7_to_top_ledge		ai_zombie_traverse_dierise_gap7_to_top_ledge
	
	dierise_gap8_high_to_low		ai_zombie_traverse_dierise_gap8_high_to_low
//	dierise_gap8_low_to_high		ai_zombie_traverse_dierise_gap8_low_to_high
	
//	dierise_gap9_high_to_low		ai_zombie_traverse_dierise_gap9_high_to_low
//	dierise_gap9_low_to_high		ai_zombie_traverse_dierise_gap9_low_to_high
	
//	dierise_gap10_high_to_low 		ai_zombie_traverse_dierise_gap10_high_to_low
//	dierise_gap10_low_to_high 		ai_zombie_traverse_dierise_gap10_low_to_high
	
//	dierise_gap11_high_to_low		ai_zombie_traverse_dierise_gap11_high_to_low
//	dierise_gap11_low_to_high		ai_zombie_traverse_dierise_gap11_low_to_high

//	dierise_gap13_high_to_low		ai_zombie_traverse_dierise_gap13_high_to_low
//	dierise_gap13_low_to_high 		ai_zombie_traverse_dierise_gap13_low_to_high	
	
//	dierise_gap14a_high_to_low		ai_zombie_traverse_dierise_gap14a_high_to_low
//	dierise_gap14a_low_to_high		ai_zombie_traverse_dierise_gap14a_low_to_high
//	dierise_gap14b_high_to_low		ai_zombie_traverse_dierise_gap14b_high_to_low
//	dierise_gap14b_low_to_high		ai_zombie_traverse_dierise_gap14b_low_to_high
//	dierise_gap14c_high_to_low		ai_zombie_traverse_dierise_gap14c_high_to_low
//	dierise_gap14c_low_to_high		ai_zombie_traverse_dierise_gap14c_low_to_high
//	dierise_gap14d_high_to_low		ai_zombie_traverse_dierise_gap14d_high_to_low
//	dierise_gap14d_low_to_high		ai_zombie_traverse_dierise_gap14d_low_to_high
//	dierise_gap14e_high_to_low		ai_zombie_traverse_dierise_gap14e_high_to_low
//	dierise_gap14e_low_to_high		ai_zombie_traverse_dierise_gap14e_low_to_high
//	dierise_gap14f_high_to_low		ai_zombie_traverse_dierise_gap14f_high_to_low
//	dierise_gap14f_low_to_high		ai_zombie_traverse_dierise_gap14f_low_to_high
//	dierise_gap14g_high_to_low		ai_zombie_traverse_dierise_gap14g_high_to_low
//	dierise_gap14g_low_to_high		ai_zombie_traverse_dierise_gap14g_low_to_high
//	dierise_gap14h_high_to_low		ai_zombie_traverse_dierise_gap14h_high_to_low
//	dierise_gap14h_low_to_high		ai_zombie_traverse_dierise_gap14h_low_to_high	
	
	dierise_gap15a_from_girder		ai_zombie_traverse_dierise_gap15a_from_girder
	dierise_gap15b_from_girder		ai_zombie_traverse_dierise_gap15b_from_girder
	dierise_gap15f_low_to_high		ai_zombie_traverse_dierise_gap15f_low_to_high
//	dierise_gap15f_high_to_low		ai_zombie_traverse_dierise_gap15f_high_to_low
	dierise_gap15g_high_to_low		ai_zombie_traverse_dierise_gap15g_high_to_low
//	dierise_gap15g_low_to_high		ai_zombie_traverse_dierise_gap15g_low_to_high	

	alcove_40				ai_zombie_traverse_alcove_40
	alcove_56				ai_zombie_traverse_alcove_56
	alcove_96				ai_zombie_traverse_alcove_96
	scaffold_72				ai_zombie_traverse_scaffold_72
	scaffold_84				ai_zombie_traverse_scaffold_84
	scaffold_100			ai_zombie_traverse_scaffold_100
	jump_down_dlc4_96		ai_zombie_jump_down_dlc4_trench_wall_96
	jump_down_dlc4_112		ai_zombie_jump_down_dlc4_trench_wall_112
	jump_down_dlc4_120		ai_zombie_jump_down_dlc4_trench_wall_120
//	jump_up_dlc4_96			ai_zombie_jump_up_dlc4_trench_wall_96
//	jump_up_dlc4_112		ai_zombie_jump_up_dlc4_trench_wall_112
//	jump_up_dlc4_120		ai_zombie_jump_up_dlc4_trench_wall_120
	jump_up_dlc4_140		ai_zombie_jump_up_dlc4_trench_wall_140
	vault_barbedwire_48		ai_zombie_vaultover_barbedwire
	vault_barbedwire_24		ai_zombie_vaultover_barbedwire_24
	jump_down_church		ai_zombie_jump_down_church
}

zm_traverse_no_restart : aliased notify traverse_anim
{
	jump_across_120					ai_zombie_jump_across_120
//	jump_down_40					ai_zombie_jump_down_40
	jump_down_48					ai_zombie_jump_down_48
	jump_down_72					ai_zombie_jump_down_72
	jump_down_96					ai_zombie_jump_down_96
	jump_down_120					ai_zombie_jump_down_120 
	jump_down_127					ai_zombie_jump_down_127
	jump_down_176					ai_zombie_jump_down_176
	jump_down_184					ai_zombie_jump_down_184
	jump_down_190					ai_zombie_jump_down_190
	jump_down_222					ai_zombie_jump_down_222
	jump_down_240					ai_zombie_jump_down_240
//	jump_down_286					ai_zombie_jump_down_286
//	jump_down_386					ai_zombie_jump_down_386
	jump_up_96						ai_zombie_jump_up_96
	jump_up_127						ai_zombie_jump_up_127
	jump_up_154						ai_zombie_jump_up_154
	jump_up_222						ai_zombie_jump_up_222
//	jump_up_to_climb				ai_zombie_jump_up_2_climb
//	jump_up_to_climb_coast			ai_zombie_jump_up_2_climb_coast
//	mantle_over_40_hurdle	ai_zombie_traverse_v6
	jump_up_startrailing						ai_zombie_jump_up_startrailing
	jump_down_startrailing						ai_zombie_jump_down_startrailing

	jump_up_grabbed_48				ai_zombie_jump_up_grabbed_48
	traverse_48						ai_zombie_traverse_48
	
}
//
////traverse anims, not all necessarily used on every level
zm_traverse_crawl : aliased restart missing_legs notify traverse_anim
{
	jump_down_40_crawl				ai_zombie_crawl_jump_down_40
	jump_down_fast_40_crawl			ai_zombie_crawl_jump_down_40
	climb_down_pothole_crawl	ai_zombie_crawl_climb_down_pothole
	climb_up_pothole_crawl		ai_zombie_crawl_climb_up_pothole
	jump_down_48_crawl				ai_zombie_crawl_jump_down_48
	jump_down_72_crawl				ai_zombie_crawl_jump_down_72
	jump_down_96_crawl				ai_zombie_crawl_jump_down_96
	jump_down_120_crawl				ai_zombie_crawl_jump_down_120
	jump_down_127_crawl				ai_zombie_crawl_jump_down_127
	jump_down_176_crawl				ai_zombie_crawl_jump_down_176
	jump_down_184_crawl				ai_zombie_crawl_jump_down_184
	jump_down_190_crawl				ai_zombie_crawl_jump_down_189
	jump_down_222_crawl				ai_zombie_crawl_jump_down_222
	jump_up_48_grabbed_crawl			ai_zombie_crawl_jump_up_grabbed_48
	jump_down_240_crawl				ai_zombie_crawl_jump_down_240
//	jump_down_286_crawl				ai_zombie_crawl_jump_down_286
//	jump_down_386_crawl				ai_zombie_crawl_jump_down_386
	jump_up_72_crawl				ai_zombie_crawl_jump_up_72
	jump_up_96_crawl				ai_zombie_crawl_jump_up_96
	jump_up_154_crawl				ai_zombie_crawl_jump_up_154
	jump_up_127_crawl				ai_zombie_crawl_jump_up_127

	jump_up_127_grabbed_crawl			ai_zombie_crawl_jump_up_grabbed_127
	jump_up_190_grabbed_crawl			ai_zombie_crawl_jump_up_grabbed_190
	jump_up_222_crawl				ai_zombie_crawl_jump_up_222
	jump_up_222_grabbed_crawl			ai_zombie_crawl_jump_up_grabbed_222
	jump_across_120_crawl				ai_zombie_crawl_jump_across_120
	mantle_over_40_hurdle_crawl			ai_zombie_traverse_crawl_v1
	traverse_diner_roof_crawl	ai_zombie_crawl_traverse_diner_roof
	traverse_diner_roof_up_crawl	ai_zombie_crawl_jump_up_diner_roof
	traverse_diner_roof_hatch_up_crawl	ai_zombie_crawl_diner_roof_hatch_jump_up
	traverse_car_crawl				ai_zombie_crawl_traverse_car
	traverse_car_sprint_crawl				ai_zombie_crawl_traverse_car_sprint
	traverse_car_run_crawl				ai_zombie_crawl_traverse_car_run
	traverse_car_reverse_crawl	ai_zombie_crawl_traverse_car_pass_to_driver_side
	traverse_car_reverse_sprint_crawl	ai_zombie_crawl_traverse_car_pass_to_driver_side_sprint	
	traverse_diner_counter_reverse_crawl	ai_zombie_crawl_traverse_diner_counter_from_stools
	traverse_diner_counter_crawl	ai_zombie_crawl_traverse_diner_counter_to_stools
	traverse_garage_door_crawl	ai_zombie_crawl
	jump_down_cellblock_crawl			ai_zombie_crawl_sprint_jump_down_cellblock 
	jump_up_cellblock_crawl 			ai_zombie_crawl_sprint_jump_up_cellblock
	climb_over_dock_fence_crawl			ai_zombie_crawl_climb_over_dock_fence
	golden_gate_jump_up_crawl			ai_zombie_jump_up_goldengate
	dock_water_climb_up_crawl			ai_zombie_jump_up_dock
	baseball_to_first_floor_climb_crawl		ai_zombie_climb_up_ext_low
	baseball_to_second_floor_climb_crawl		ai_zombie_climb_up_ext_mid
	baseball_to_roof_climb_crawl			ai_zombie_climb_up_ext_roof 
 	jump_down_cellblock_norailing_crawl		ai_zombie_crawl_jump_down_cellblock_basic
	prison_gondola_traversal_crawl			ai_zombie_traverse_lower_gondola 
	cellblock_jump_up_climb_crawl			ai_zombie_crawl_jump_up_2_climb
	dock_mid_way_jump_up_climb_crawl		ai_zombie_crawl_jump_up_dock_middle
	dock_tommygun_dropdown_crawl			ai_zombie_jump_down_dock_tommygun	
	jump_up_to_climb_crawl			ai_zombie_crawl_jump_up_2_climb
//	jump_up_to_climb_coast_crawl	ai_zombie_crawl_jump_up_2_climb_coast
//	mantle_over_40_hurdle_crawl		ai_zombie_traverse_crawl_v1
	jump_up_startrailing_crawl						ai_zombie_crawl_jump_up_startrailing
	jump_down_startrailing_crawl						ai_zombie_crawl_jump_down_startrailing

	jump_up_grabbed_48_crawl					ai_zombie_crawl_jump_up_grabbed_48
	traverse_48_crawl				ai_zombie_crawl_traverse_48
	traverse_garage_door_crawl		ai_zombie_crawl
/*
	// zm_highrise specific traversals
	dierise_traverse_1_high_to_low_crawl	ai_zombie_crawl_traverse_dierise_1_high_to_low
//	dierise_traverse_1_low_to_high_crawl	ai_zombie_crawl_traverse_dierise_1_low_to_high
	dierise_traverse_2_high_to_low_crawl	ai_zombie_crawl_traverse_dierise_2_high_to_low
	dierise_traverse_2_low_to_high_crawl	ai_zombie_crawl_traverse_dierise_2_low_to_high
	dierise_traverse_3_high_to_low_crawl	ai_zombie_crawl_traverse_dierise_3_high_to_low
	dierise_traverse_3_low_to_high_crawl	ai_zombie_crawl_traverse_dierise_3_low_to_high
	dierise_traverse_4_high_to_low_crawl	ai_zombie_crawl_traverse_dierise_4_high_to_low
	dierise_traverse_4_low_to_high_crawl	ai_zombie_crawl_traverse_dierise_4_low_to_high
	dierise_traverse_5_high_to_low_crawl	ai_zombie_crawl_traverse_dierise_5_high_to_low
	dierise_traverse_5_low_to_high_crawl	ai_zombie_crawl_traverse_dierise_5_low_to_high		
	
//	dierise_gap1_to_antenna_crawl			ai_zombie_crawl_traverse_dierise_gap1_to_antenna
	dierise_gap1_from_antenna_crawl			ai_zombie_crawl_traverse_dierise_gap1_from_antenna

//	gap2_from_roof_crawl					ai_zombie_crawl_traverse_dierise_gap2_from_roof
//	gap2_to_roof_crawl						ai_zombie_crawl_traverse_dierise_gap2_to_roof

	dierise_gap4a_slide_down_beam_crawl		ai_zombie_crawl_traverse_dierise_gap4a_slide_down_beam
//	dierise_gap4b_to_roof_crawl				ai_zombie_crawl_traverse_dierise_gap4b_to_roof
	dierise_gap4b_from_roof_crawl			ai_zombie_crawl_traverse_dierise_gap4b_from_roof
	
//	dierise_gap5a_from_conference_crawl		ai_zombie_crawl_traverse_dierise_gap5a_from_conference
//	dierise_gap5a_to_conference_crawl		ai_zombie_crawl_traverse_dierise_gap5a_to_conference
//	dierise_gap5b_from_conference_crawl		ai_zombie_crawl_traverse_dierise_gap5b_from_conference
//	dierise_gap5b_to_conference_crawl		ai_zombie_crawl_traverse_dierise_gap5b_to_conference 	
	
	dierise_gap6_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap6_high_to_low
	dierise_gap6_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap6_low_to_high
	
	dierise_gap7_from_top_ledge_crawl		ai_zombie_crawl_traverse_dierise_gap7_from_top_ledge
	dierise_gap7_to_top_ledge_crawl		ai_zombie_crawl_traverse_dierise_gap7_to_top_ledge
	
	dierise_gap8_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap8_high_to_low
//	dierise_gap8_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap8_low_to_high
	
//	dierise_gap9_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap9_high_to_low
//	dierise_gap9_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap9_low_to_high
	
//	dierise_gap10_high_to_low_crawl 		ai_zombie_crawl_traverse_dierise_gap10_high_to_low
//	dierise_gap10_low_to_high_crawl 		ai_zombie_crawl_traverse_dierise_gap10_low_to_high
	
//	dierise_gap11_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap11_high_to_low
//	dierise_gap11_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap11_low_to_high

//	dierise_gap13_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap13_high_to_low
//	dierise_gap13_low_to_high_crawl 		ai_zombie_crawl_traverse_dierise_gap13_low_to_high	
	
//	dierise_gap14a_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap14a_high_to_low
//	dierise_gap14a_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap14a_low_to_high
//	dierise_gap14b_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap14b_high_to_low
//	dierise_gap14b_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap14b_low_to_high
//	dierise_gap14c_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap14c_high_to_low
//	dierise_gap14c_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap14c_low_to_high
//	dierise_gap14d_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap14d_high_to_low
//	dierise_gap14d_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap14d_low_to_high
//	dierise_gap14e_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap14e_high_to_low
//	dierise_gap14e_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap14e_low_to_high
//	dierise_gap14f_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap14f_high_to_low
//	dierise_gap14f_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap14f_low_to_high
//	dierise_gap14g_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap14g_high_to_low
//	dierise_gap14g_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap14g_low_to_high
//	dierise_gap14h_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap14h_high_to_low
//	dierise_gap14h_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap14h_low_to_high	
	
	dierise_gap15a_from_girder_crawl		ai_zombie_crawl_traverse_dierise_gap15a_from_girder
	dierise_gap15b_from_girder_crawl		ai_zombie_crawl_traverse_dierise_gap15b_from_girder
	dierise_gap15f_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap15f_low_to_high
	dierise_gap15f_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap15f_high_to_low
	dierise_gap15g_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap15g_high_to_low
	dierise_gap15g_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap15g_low_to_high

	alcove_40_crawl					ai_zombie_traverse_alcove_40
	alcove_56_crawl					ai_zombie_traverse_alcove_56
	alcove_96_crawl					ai_zombie_traverse_alcove_96
	scaffold_72_crawl				ai_zombie_crawler_traverse_scaffold_72
	scaffold_84_crawl				ai_zombie_crawler_traverse_scaffold_84
	scaffold_100_crawl				ai_zombie_crawler_traverse_scaffold_100
	jump_down_dlc4_96_crawl			ai_zombie_crawl_jump_down_dlc4_trench_wall_96
	jump_down_dlc4_112_crawl		ai_zombie_crawl_jump_down_dlc4_trench_wall_112
	jump_down_dlc4_120_crawl		ai_zombie_crawl_jump_down_dlc4_trench_wall_120
//	jump_up_dlc4_96_crawl			ai_zombie_crawl_jump_up_dlc4_trench_wall_96
//	jump_up_dlc4_112_crawl			ai_zombie_crawl_jump_up_dlc4_trench_wall_112
//	jump_up_dlc4_120_crawl			ai_zombie_crawl_jump_up_dlc4_trench_wall_120
	jump_up_dlc4_140_crawl			ai_zombie_crawl_jump_up_dlc4_trench_wall_140
	vault_barbedwire_48_crawl		ai_zombie_crawl_vaultover_barbedwire
	vault_barbedwire_24_crawl		ai_zombie_crawl_vaultover_barbedwire_24
	jump_down_church_crawl			ai_zombie_crawl_jump_down_church
*/
}

//traverse anims, not all necessarily used on every level
zm_traverse_crawl_no_restart : aliased missing_legs notify traverse_anim
{
	jump_across_120_crawl			ai_zombie_crawl_jump_across_120
//	jump_down_40_crawl				ai_zombie_crawl_jump_down_40
	jump_down_48_crawl				ai_zombie_crawl_jump_down_48
	jump_down_72_crawl				ai_zombie_crawl_jump_down_72
	jump_down_96_crawl				ai_zombie_crawl_jump_down_96
//	jump_down_120_crawl				ai_zombie_crawl_jump_down_120
	jump_down_127_crawl				ai_zombie_crawl_jump_down_127
	jump_down_176_crawl				ai_zombie_crawl_jump_down_176
//	jump_down_184_crawl				ai_zombie_crawl_jump_down_184
	jump_down_190_crawl				ai_zombie_crawl_jump_down_189
	jump_down_222_crawl				ai_zombie_crawl_jump_down_222
	jump_down_240_crawl				ai_zombie_crawl_jump_down_240
//	jump_down_286_crawl				ai_zombie_crawl_jump_down_286
//	jump_down_386_crawl				ai_zombie_crawl_jump_down_386
	jump_up_96_crawl				ai_zombie_crawl_jump_up_96
	jump_up_127_crawl				ai_zombie_crawl_jump_up_127
	jump_up_154_crawl				ai_zombie_crawl_jump_up_154
	jump_up_222_crawl				ai_zombie_crawl_jump_up_222
//	jump_up_to_climb_crawl			ai_zombie_crawl_jump_up_2_climb
//	jump_up_to_climb_coast_crawl	ai_zombie_crawl_jump_up_2_climb_coast
//	mantle_over_40_hurdle_crawl		ai_zombie_traverse_crawl_v1
	jump_up_startrailing_crawl						ai_zombie_crawl_jump_up_startrailing
	jump_down_startrailing_crawl						ai_zombie_crawl_jump_down_startrailing

	jump_up_grabbed_48_crawl					ai_zombie_crawl_jump_up_grabbed_48
	traverse_48_crawl				ai_zombie_crawl_traverse_48
}

// zombies coming from elevator door openings
//zm_traverse_elevator_shaft : notify move_anim
//{
//	ai_zombie_riser_elevator_from_floor
//	ai_zombie_riser_elevator_from_ceiling
//}

zm_subwoofer_fall_front : restart notify subwoofer_fall_anim
{
	ai_zombie_thundergun_hit_deadfallknee
	ai_zombie_thundergun_hit_faceplant
	ai_zombie_thundergun_hit_forwardtoface
	ai_zombie_thundergun_hit_jackiespin_left
	ai_zombie_thundergun_hit_jackiespin_right
}

zm_subwoofer_fall_left : restart notify subwoofer_fall_anim
{
	ai_zombie_thundergun_hit_legsout_right
}

zm_subwoofer_fall_right : restart notify subwoofer_fall_anim
{
	ai_zombie_thundergun_hit_legsout_left
}
	
zm_subwoofer_fall_back : restart notify subwoofer_fall_anim
{
	ai_zombie_thundergun_hit
	ai_zombie_thundergun_hit_armslegsforward
	ai_zombie_thundergun_hit_doublebounce
	ai_zombie_thundergun_hit_flatonback
	ai_zombie_thundergun_hit_jackiespin_vertical
	ai_zombie_thundergun_hit_stumblefall
	ai_zombie_thundergun_hit_upontoback
}

zm_subwoofer_getup_back_default : restart notify subwoofer_getup_anim
{
	ai_zombie_thundergun_getup
}

zm_subwoofer_getup_back_early : restart notify subwoofer_getup_anim
{
	ai_zombie_thundergun_getup_quick_b
	ai_zombie_thundergun_getup_quick_c
}
	
zm_subwoofer_getup_back_late : restart notify subwoofer_getup_anim
{
	ai_zombie_thundergun_getup
	ai_zombie_thundergun_getup_b
	ai_zombie_thundergun_getup_c
}

zm_subwoofer_getup_belly_default : restart notify subwoofer_getup_anim
{
	ai_zombie_thundergun_getup_a
}

zm_subwoofer_getup_belly_early : restart notify subwoofer_getup_anim
{
	ai_zombie_thundergun_getup_quick_a
}
	
zm_subwoofer_getup_belly_late : restart notify subwoofer_getup_anim
{
	ai_zombie_thundergun_getup_a
}

zm_rise_hedge : restart notify rise_anim
{
	ai_zombie_hedgemaze_emerge_slow
	ai_zombie_hedgemaze_emerge_fast
}

zm_crawler_crawlerhold_idle : notify crawler_crawlerhold_idle_anim
{
	ai_zombie_crawler_crawlerhold_idle
}

zm_crawler_crawlerhold_walk : notify crawler_crawlerhold_walk_anim
{
	ai_zombie_crawler_crawlerhold_walk
}

zm_crawler_pickup_by_sloth : notify crawler_pickup_by_sloth_anim
{
	ai_zombie_crawler_pickup_by_sloth
}

zm_crawler_putdown_by_sloth : notify crawler_putdown_by_sloth_anim
{
	ai_zombie_crawler_putdown_by_sloth
}

zm_crawler_slothkill_stomp : notify crawler_slothkill_stomp_anim
{
	ai_zombie_crawler_slothkill_stomp
}

zm_crawler_slothkill_suplex : notify crawler_slothkill_suplex_anim
{
	ai_zombie_crawler_slothkill_suplex
}

zm_crawler_sloth_crawlerhold_sling : notify crawler_sloth_crawlerhold_sling_anim
{
	ai_zombie_crawler_sloth_crawlerhold_sling
}

zm_crawler_sloth_crawlerhold_slung_idle : notify crawler_sloth_crawlerhold_slung_idle_anim
{
	ai_zombie_crawler_sloth_crawlerhold_slung_idle
}

zm_crawler_sloth_crawlerhold_unsling : notify crawler_sloth_crawlerhold_unsling_anim
{
	ai_zombie_crawler_sloth_crawlerhold_unsling
}

zm_crawler_crawlerhold_idle_hunched : notify crawler_crawlerhold_idle_anim
{
	ai_zombie_crawler_crawlerhold_idle_hunched
}

zm_crawler_crawlerhold_walk_hunched : notify crawler_crawlerhold_walk_anim
{
	ai_zombie_crawler_crawlerhold_walk_hunched
}

zm_crawler_pickup_by_sloth_hunched : notify crawler_pickup_by_sloth_anim
{
	ai_zombie_crawler_pickup_by_sloth_hunched
}

zm_crawler_putdown_by_sloth_hunched : notify crawler_putdown_by_sloth_anim
{
	ai_zombie_crawler_putdown_by_sloth_hunched
}

zm_crawler_slothkill_stomp_hunched : notify crawler_slothkill_stomp_anim
{
	ai_zombie_crawler_slothkill_stomp_hunched
}

zm_crawler_slothkill_suplex_hunched : notify crawler_slothkill_suplex_anim
{
	ai_zombie_crawler_slothkill_suplex_hunched
}

zm_crawler_sloth_crawlerhold_sling_hunched : notify crawler_sloth_crawlerhold_sling_anim
{
	ai_zombie_crawler_sloth_crawlerhold_sling_hunched
}

zm_crawler_sloth_crawlerhold_unsling_hunched : notify crawler_sloth_crawlerhold_unsling_anim
{
	ai_zombie_crawler_sloth_crawlerhold_unsling_hunched
}

zm_crawler_crawlerhold_walk_turn_180 : restart notify crawler_turn_180_anim
{
	ai_zombie_crawler_crawlerhold_walk_turn_180
}

zm_crawler_crawlerhold_walk_hunched_turn_180 : restart notify crawler_turn_180_anim
{
	ai_zombie_crawler_crawlerhold_walk_hunched_turn_180
}

zm_traverse_elevator : aliased restart notify traverse_anim
{
//	zm_jump_down_from_elevator_bottom			ai_zombie_jump_down_from_elevator_bottom
//	zm_jump_up_to_elevator_bottom				ai_zombie_jump_up_to_elevator_bottom
	zm_jump_down_to_elevator_top				ai_zombie_jump_down_to_elevator_roof
	zm_jump_up_from_elevator_top				ai_zombie_jump_up_from_elevator_roof
	zm_zombie_climb_elevator						ai_zombie_climb_elevator	
}

zm_traverse_elevator_crawl : aliased restart notify traverse_anim
{
//	zm_jump_down_from_elevator_bottom_crawl	ai_zombie_crawl_jump_down_from_elevator_bottom
//	zm_jump_up_to_elevator_bottom_crawl		ai_zombie_crawl_jump_up_to_elevator_bottom
	zm_jump_down_to_elevator_top_crawl		ai_zombie_crawl_jump_down_to_elevator_roof
	zm_jump_up_from_elevator_top_crawl		ai_zombie_crawl_jump_up_from_elevator_roof
	zm_zombie_climb_elevator_crawl				ai_zombie_climb_elevator	
}

// traversal anims that are DieRise specific. **REQUIRES CUSTOM TRAVERSE STATE
zm_traverse_dierise : aliased restart notify traverse_anim
{
	dierise_round_counter_from_stools		ai_zombie_traverse_round_counter_from_stools
	dierise_round_counter_to_stools			ai_zombie_traverse_round_counter_to_stools

	dierise_chrest_interior_high_to_low		ai_zombie_traverse_dierise_chrest_interior_high_to_low
	dierise_chrest_interior_low_to_high		ai_zombie_traverse_dierise_chrest_interior_low_to_high
	
	dierise_chrest_interior_alt_down		ai_zombie_traverse_dierise_chrest_interior_alt_high_to_low
	dierise_chrest_interior_alt_up			ai_zombie_traverse_dierise_chrest_interior_alt_low_to_high		
	dierise_chrest_gap						ai_zombie_traverse_dierise_chrest_gap

	jump_up_antenna							ai_zombie_jump_up_grabbed_antenna
	jump_up_sewing							ai_zombie_jump_up_sewing
	
	dierise_escape_elevator_hallway			ai_zombie_traverse_dierise_escape_corridor

	dierise_traverse_6_low_to_high			ai_zombie_traverse_dierise_6_low_to_high
	dierise_traverse_6_high_to_low			ai_zombie_traverse_dierise_6_high_to_low 
	
	dierise_traverse_7_low_to_high			ai_zombie_traverse_dierise_7_low_to_high
	dierise_traverse_7_high_to_low			ai_zombie_traverse_dierise_7_high_to_low 

	dierise_gap16a_high_to_low				ai_zombie_traverse_dierise_gap16a_high_to_low
	dierise_gap16a_low_to_high				ai_zombie_traverse_dierise_gap16a_low_to_high
	dierise_gap16b_high_to_low				ai_zombie_traverse_dierise_gap16b_high_to_low
	dierise_gap16b_low_to_high				ai_zombie_traverse_dierise_gap16b_low_to_high

	dierise_gap17a_high_to_low				ai_zombie_traverse_dierise_gap17a_high_to_low
//	dierise_gap17a_low_to_high				ai_zombie_traverse_dierise_gap17a_low_to_high	
	dierise_gap17c_high_to_low				ai_zombie_traverse_dierise_gap17c_high_to_low
//	dierise_gap17c_low_to_high				ai_zombie_traverse_dierise_gap17c_low_to_high	
	
	dierise_gap18_high_to_low				ai_zombie_traverse_dierise_gap18_high_to_low
	
//	dierise_gap19_from_railing				ai_zombie_traverse_dierise_gap19_from_railing 
//	dierise_gap19_to_railing				ai_zombie_traverse_dierise_gap19_to_railing 	
}

// crawler traversal anims that are DieRise specific
zm_traverse_dierise_crawl : aliased restart missing_legs notify traverse_anim
{
	dierise_round_counter_from_stools_crawl	ai_zombie_crawl_traverse_round_counter_from_stools
	dierise_round_counter_to_stools_crawl	ai_zombie_crawl_traverse_round_counter_to_stools
	
	dierise_chrest_interior_high_to_low_crawl	ai_zombie_crawl_traverse_dierise_chrest_interior_high_to_low
	dierise_chrest_interior_low_to_high_crawl	ai_zombie_crawl_traverse_dierise_chrest_interior_low_to_high	
	
	dierise_chrest_interior_alt_down_crawl	ai_zombie_traverse_dierise_chrest_interior_alt_high_to_low
	dierise_chrest_interior_alt_up_crawl	ai_zombie_traverse_dierise_chrest_interior_alt_low_to_high		
	
	jump_up_antenna_crawl					ai_zombie_crawl_jump_up_grabbed_antenna
	jump_up_sewing_crawl					ai_zombie_crawl_jump_up_sewing
	
	dierise_chrest_gap_crawl				ai_zombie_crawl_traverse_dierise_chrest_gap
	
	dierise_escape_elevator_hallway_crawl	ai_zombie_traverse_dierise_escape_corridor

	dierise_traverse_6_low_to_high_crawl	ai_zombie_crawl_traverse_dierise_6_low_to_high
	dierise_traverse_6_high_to_low_crawl	ai_zombie_crawl_traverse_dierise_6_high_to_low 

	dierise_traverse_7_low_to_high_crawl	ai_zombie_crawl_traverse_dierise_7_low_to_high
	dierise_traverse_7_high_to_low_crawl	ai_zombie_crawl_traverse_dierise_7_high_to_low 

	dierise_gap16a_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap16a_high_to_low
	dierise_gap16a_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap16a_low_to_high
	dierise_gap16b_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap16b_high_to_low
	dierise_gap16b_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap16b_low_to_high

	dierise_gap17a_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap17a_high_to_low
//	dierise_gap17a_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap17a_low_to_high
	dierise_gap17c_high_to_low_crawl		ai_zombie_crawl_traverse_dierise_gap17c_high_to_low
//	dierise_gap17c_low_to_high_crawl		ai_zombie_crawl_traverse_dierise_gap17c_low_to_high	
	
	dierise_gap18_high_to_low_crawl			ai_zombie_traverse_dierise_gap18_high_to_low
	
//	dierise_gap19_from_railing_crawl		ai_zombie_crawl_traverse_dierise_gap19_from_railing
//	dierise_gap19_to_railing_crawl			ai_zombie_crawl_traverse_dierise_gap19_to_railing
}


// zombies coming from elevator door openings
zombie_riser_elevator_from_floor : notify rise_anim
{
	ai_zombie_riser_elevator_from_floor
	
}

// zombies coming from elevator door openings
zombie_riser_elevator_from_ceiling : notify rise_anim
{
	ai_zombie_riser_elevator_from_ceiling
}

zm_move_chase_bus : notify move_anim
{
	ai_zombie_sprint_v6
	ai_zombie_sprint_v7
	ai_zombie_sprint_v8
	ai_zombie_sprint_v9 
	ai_zombie_sprint_v10
	ai_zombie_sprint_v11
	ai_zombie_sprint_v12
}

zm_riotshield_melee : notify riotshield_melee_anim
{
	ai_zombie_riotshield_loop_v1
	//ai_zombie_riotshield_loop_v2
}

zm_riotshield_breakthrough : notify riotshield_breakthrough_anim
{
	ai_zombie_riotshield_breakthrough_v1
	//ai_zombie_riotshield_breakthrough_v2
}

zm_riotshield_melee_crawl : missing_legs notify riotshield_melee_anim
{
	ai_zombie_crawl_riotshield_loop_v1
	//ai_zombie_crawl_riotshield_loop_v2
	//ai_zombie_crawl_riotshield_loop_v5
	//ai_zombie_crawl_riotshield_loop_v6
	//ai_zombie_crawl_riotshield_loop_v7
	//ai_zombie_crawl_riotshield_loop_v8
}

zm_riotshield_breakthrough_crawl : missing_legs notify riotshield_breakthrough_anim
{
	ai_zombie_crawl_riotshield_breakthrough_v1
	//ai_zombie_crawl_riotshield_breakthrough_v2
}

zm_death_shrink : restart notify death_shrink
{
	ai_zombie_dreamcatch_shrink_a
}

zm_portal_rise : restart notify zm_portal_rise
{
	 ai_zombie_dreamcatch_rise
}

zm_portal_death : restart notify portal_death
{
	 ai_zombie_dreamcatch_impact
}

zm_afterlife_stun : restart notify stunned
{
	ai_zombie_afterlife_stun_a
	ai_zombie_afterlife_stun_b
	ai_zombie_afterlife_stun_c
	ai_zombie_afterlife_stun_d
	ai_zombie_afterlife_stun_e
}

zm_blundersplat_stun : aliased restart notify blundersplat_stunned_anim
{
	acid_stun_a		ai_zombie_acid_stun_a
	acid_stun_b		ai_zombie_acid_stun_b
	acid_stun_c		ai_zombie_acid_stun_c
	acid_stun_d		ai_zombie_acid_stun_d
	acid_stun_e		ai_zombie_acid_stun_e
}

zm_blundersplat_stun_crawl : aliased restart missing_legs notify blundersplat_stunned_anim
{
	acid_stun_a ai_zombie_crawl_death_v1
	acid_stun_b ai_zombie_crawl_death_v2
}

zm_move_burned : notify move_anim
{
	ai_zombie_firestaff_death_walking_a
	ai_zombie_firestaff_death_walking_b
	ai_zombie_firestaff_death_walking_c
}

zm_tank_jump_up : aliased restart notify tank_jump_up
{
	window_right_front_jmp_jnt	ai_zombie_jump_up_markiv_front
	window_left_1_jmp_jnt		ai_zombie_jump_up_markiv_leftfront
	window_left_2_jmp_jnt		ai_zombie_jump_up_markiv_leftmid
	window_left_3_jmp_jnt		ai_zombie_jump_up_markiv_leftrear
	window_left_rear_jmp_jnt	ai_zombie_jump_up_markiv_rear
	window_right_1_jmp_jnt		ai_zombie_jump_up_markiv_rightfront
	window_right_2_jmp_jnt		ai_zombie_jump_up_markiv_rightmid
	window_right_3_jmp_jnt		ai_zombie_jump_up_markiv_rightrear
	window_rear_long_jmp_jnt	ai_zombie_jump_up_onto_markiv_rear
	
	window_right_front_jmp_jnt_crawler	ai_zombie_crawl_jump_up_markiv_front
	window_left_1_jmp_jnt_crawler		ai_zombie_crawl_jump_up_markiv_leftfront
	window_left_2_jmp_jnt_crawler		ai_zombie_crawl_jump_up_markiv_leftmid
	window_left_3_jmp_jnt_crawler		ai_zombie_crawl_jump_up_markiv_leftrear
	window_left_rear_jmp_jnt_crawler	ai_zombie_crawl_jump_up_markiv_rear
	window_right_1_jmp_jnt_crawler		ai_zombie_crawl_jump_up_markiv_rightfront
	window_right_2_jmp_jnt_crawler		ai_zombie_crawl_jump_up_markiv_rightmid
	window_right_3_jmp_jnt_crawler		ai_zombie_crawl_jump_up_markiv_rightrear
	window_rear_long_jmp_jnt_crawler	ai_zombie_crawl_jump_up_onto_markiv_rear
}

zm_tank_jump_down : aliased restart notify tank_jump_down
{
	window_right_front_jmp_jnt	ai_zombie_jump_down_markiv_front
	window_left_1_jmp_jnt		ai_zombie_jump_down_markiv_leftfront
	window_left_2_jmp_jnt		ai_zombie_jump_down_markiv_leftmid
	window_left_3_jmp_jnt		ai_zombie_jump_down_markiv_leftrear
	window_left_rear_jmp_jnt	ai_zombie_jump_down_markiv_rear
	window_right_1_jmp_jnt		ai_zombie_jump_down_markiv_rightfront
	window_right_2_jmp_jnt		ai_zombie_jump_down_markiv_rightmid
	window_right_3_jmp_jnt		ai_zombie_jump_down_markiv_rightrear
	
	window_right_front_jmp_jnt_crawler	ai_zombie_crawl_jump_down_markiv_front
	window_left_1_jmp_jnt_crawler		ai_zombie_crawl_jump_down_markiv_leftfront
	window_left_2_jmp_jnt_crawler		ai_zombie_crawl_jump_down_markiv_leftmid
	window_left_3_jmp_jnt_crawler		ai_zombie_crawl_jump_down_markiv_leftrear
	window_left_rear_jmp_jnt_crawler	ai_zombie_crawl_jump_down_markiv_rear
	window_right_1_jmp_jnt_crawler		ai_zombie_crawl_jump_down_markiv_rightfront
	window_right_2_jmp_jnt_crawler		ai_zombie_crawl_jump_down_markiv_rightmid
	window_right_3_jmp_jnt_crawler		ai_zombie_crawl_jump_down_markiv_rightrear
}

zm_punch_fall_front : restart notify punch_fall_anim
{
	ai_zombie_thundergun_hit_faceplant
	ai_zombie_thundergun_hit_deadfallknee
	ai_zombie_thundergun_hit_forwardtoface
}

zm_punch_fall_front_crawl : restart notify punch_fall_anim
{
	ai_zombie_thundergun_hit_armslegsforward
	ai_zombie_thundergun_hit_doublebounce
	ai_zombie_thundergun_hit_forwardtoface	
}

zm_punch_fall_left : restart notify punch_fall_anim
{
	ai_zombie_thundergun_hit_legsout_right
}

zm_punch_fall_right : restart notify punch_fall_anim
{
	ai_zombie_thundergun_hit_legsout_left
}
	
zm_punch_fall_back : restart notify punch_fall_anim
{
	ai_zombie_thundergun_hit_upontoback
	ai_zombie_thundergun_hit_doublebounce
	ai_zombie_thundergun_hit_flatonback
	ai_zombie_thundergun_hit_armslegsforward
}

zm_punch_getup_back_default : restart notify punch_getup_anim
{
	ai_zombie_thundergun_getup
}

zm_punch_getup_back_early : restart notify punch_getup_anim
{
	ai_zombie_thundergun_sprinter_getup_b
	ai_zombie_thundergun_sprinter_getup_c
}
	
zm_punch_getup_back_late : restart notify punch_getup_anim
{
	ai_zombie_thundergun_getup_quick_b
	ai_zombie_thundergun_getup_quick_c
}

zm_punch_getup_belly_default : restart notify punch_getup_anim
{
	ai_zombie_thundergun_getup
}

zm_punch_getup_belly_early : restart notify punch_getup_anim
{
	ai_zombie_thundergun_getup_quick_a
}
	
zm_punch_getup_belly_late : restart notify punch_getup_anim
{
	ai_zombie_thundergun_sprinter_getup_a
}

zm_death_tesla : restart notify death_anim
{
	ai_zombie_dlc4_tesla_death_a
	ai_zombie_dlc4_tesla_death_b
	ai_zombie_dlc4_tesla_death_c
	ai_zombie_dlc4_tesla_death_d
	//ai_zombie_dlc4_tesla_death_e
}

zm_death_fire : restart notify death_anim
{
	ai_zombie_firestaff_death_collapse_a
	ai_zombie_firestaff_death_collapse_b
}

zm_death_tesla_crawl : restart missing_legs notify death_anim
{
	ai_zombie_dlc4_tesla_crawl_death_a
	ai_zombie_dlc4_tesla_crawl_death_b
}

zm_death_freeze : restart notify death_anim
{
	ai_zombie_death_icestaff_a
	ai_zombie_death_icestaff_b
	ai_zombie_death_icestaff_c
	ai_zombie_death_icestaff_d
	ai_zombie_death_icestaff_e
}

zm_death_freeze_crawl : restart missing_legs notify death_anim
{
	ai_zombie_dlc4_crawl_freeze_death_01
	ai_zombie_dlc4_crawl_freeze_death_02
}

zm_electric_stun : restart notify stunned
{
	ai_zombie_afterlife_stun_a
	ai_zombie_afterlife_stun_b
	ai_zombie_afterlife_stun_c
	ai_zombie_afterlife_stun_d
	ai_zombie_afterlife_stun_e
}

zm_afterlife_stun : restart notify stunned
{
	ai_zombie_afterlife_stun_a
	ai_zombie_afterlife_stun_b
	ai_zombie_afterlife_stun_c
	ai_zombie_afterlife_stun_d
	ai_zombie_afterlife_stun_e
}


zm_move_whirlwind : notify move_anim
{
	ai_zombie_airstaff_death_vacuumed_a
	ai_zombie_airstaff_death_vacuumed_b
	ai_zombie_airstaff_death_vacuumed_c
}

zm_move_whirlwind_fast : notify move_anim
{
	ai_zombie_airstaff_death_vacuumed_midair_a
	ai_zombie_airstaff_death_vacuumed_midair_b
	ai_zombie_airstaff_death_vacuumed_midair_c
	ai_zombie_airstaff_death_vacuumed_midair_d
}

zm_move_whirlwind_crawl : notify move_anim
{
	ai_zombie_airstaff_death_vacuumed_midair_a
	ai_zombie_airstaff_death_vacuumed_midair_b
	ai_zombie_airstaff_death_vacuumed_midair_c
	ai_zombie_airstaff_death_vacuumed_midair_d
}

zm_move_whirlwind_fast_crawl : notify move_anim
{
	ai_zombie_airstaff_death_vacuumed_midair_a
	ai_zombie_airstaff_death_vacuumed_midair_b
	ai_zombie_airstaff_death_vacuumed_midair_c
	ai_zombie_airstaff_death_vacuumed_midair_d
}

zm_grabbed_by_mech : notify mechz_grabbed
{
	ai_zombie_grabbed_by_mech 
}

zm_move_bus_walk : notify move_anim
{
	ai_zombie_walk_bus_v1
	ai_zombie_walk_bus_v2
	ai_zombie_walk_bus_v3
	ai_zombie_walk_bus_v4
}

zm_move_chase_bus : notify move_anim
{
	ai_zombie_sprint_v6
	ai_zombie_sprint_v7
	ai_zombie_sprint_v8
	ai_zombie_sprint_v9 
	ai_zombie_sprint_v10
	ai_zombie_sprint_v11
	ai_zombie_sprint_v12
}

zm_jump_on_bus : restart notify jump_on_bus_anim
{
	ai_zombie_bus_jump_door
}

zm_jump_off_bus : restart notify jump_off_bus_anim
{
	ai_zombie_bus_jump_door_exit
}

zm_zbarrier_jump_on_bus : aliased restart notify jump_on_bus_anim
{
	jump_window_l ai_zombie_bus_jump_window_to_l
	jump_window_r ai_zombie_bus_jump_window_to_r
}

zm_zbarrier_jump_on_bus_crawl : missing_legs aliased restart notify jump_on_bus_anim
{
	jump_window_l ai_zombie_crawl_bus_jump_window_to_l
	jump_window_r ai_zombie_crawl_bus_jump_window_to_r
}

zm_zbarrier_jump_on_bus_front : aliased restart notify jump_on_bus_anim
{
	jump_window_l ai_zombie_bus_jump_front_window_to_l
	jump_window_r ai_zombie_bus_jump_front_window_to_r
}

zm_zbarrier_jump_on_bus_front_crawl : aliased restart notify jump_on_bus_anim
{
	jump_window_l ai_zombie_crawl_bus_jump_front_window_to_l
	jump_window_r ai_zombie_crawl_bus_jump_front_window_to_r
}

zm_zbarrier_bus_board_tear_in : aliased restart notify board_tear_bus_anim
{
	spot_0_l_piece_horz_1 ai_zombie_bus_boardtear_l_1_grab
	spot_0_r_piece_horz_1 ai_zombie_bus_boardtear_r_1_grab
	spot_0_l_piece_vert_1 ai_zombie_bus_boardtear_l_2_grab
	spot_0_r_piece_vert_1 ai_zombie_bus_boardtear_r_2_grab
	spot_0_l_piece_vert_2 ai_zombie_bus_boardtear_l_3_grab
	spot_0_r_piece_vert_2 ai_zombie_bus_boardtear_r_3_grab
	spot_0_l_piece_horz_3 ai_zombie_bus_boardtear_l_4_grab
	spot_0_r_piece_horz_3 ai_zombie_bus_boardtear_r_4_grab
	spot_0_l_piece_horz_4 ai_zombie_bus_boardtear_l_5_grab
	spot_0_r_piece_horz_4 ai_zombie_bus_boardtear_r_5_grab
}

zm_zbarrier_bus_board_tear_loop : aliased restart notify board_tear_bus_anim
{
	spot_0_l_piece_horz_1 ai_zombie_bus_boardtear_l_1_hold
	spot_0_r_piece_horz_1 ai_zombie_bus_boardtear_r_1_hold
	spot_0_l_piece_vert_1 ai_zombie_bus_boardtear_l_2_hold
	spot_0_r_piece_vert_1 ai_zombie_bus_boardtear_r_2_hold
	spot_0_l_piece_vert_2 ai_zombie_bus_boardtear_l_3_hold
	spot_0_r_piece_vert_2 ai_zombie_bus_boardtear_r_3_hold
	spot_0_l_piece_horz_3 ai_zombie_bus_boardtear_l_4_hold
	spot_0_r_piece_horz_3 ai_zombie_bus_boardtear_r_4_hold
	spot_0_l_piece_horz_4 ai_zombie_bus_boardtear_l_5_hold
	spot_0_r_piece_horz_4 ai_zombie_bus_boardtear_r_5_hold
}

zm_zbarrier_bus_board_tear_out : aliased restart notify board_tear_bus_anim
{
	spot_0_l_piece_horz_1 ai_zombie_bus_boardtear_l_1_pull
	spot_0_r_piece_horz_1 ai_zombie_bus_boardtear_r_1_pull
	spot_0_l_piece_vert_1 ai_zombie_bus_boardtear_l_2_pull
	spot_0_r_piece_vert_1 ai_zombie_bus_boardtear_r_2_pull
	spot_0_l_piece_vert_2 ai_zombie_bus_boardtear_l_3_pull
	spot_0_r_piece_vert_2 ai_zombie_bus_boardtear_r_3_pull
	spot_0_l_piece_horz_3 ai_zombie_bus_boardtear_l_4_pull
	spot_0_r_piece_horz_3 ai_zombie_bus_boardtear_r_4_pull
	spot_0_l_piece_horz_4 ai_zombie_bus_boardtear_l_5_pull
	spot_0_r_piece_horz_4 ai_zombie_bus_boardtear_r_5_pull
}

zm_zbarrier_window_attack : aliased restart notify bus_window_attack
{
	window_attack_l ai_zombie_bus_window_attack_l
	window_attack_r ai_zombie_bus_window_attack_r
}

zm_zbarrier_front_window_attack : aliased restart notify bus_window_attack
{
	window_attack_l ai_zombie_bus_front_window_attack_l
	window_attack_r ai_zombie_bus_front_window_attack_r
}

zm_zbarrier_window_idle : aliased restart notify bus_window_idle
{
	window_idle_l	ai_zombie_bus_window_idle_l
	window_idle_r	ai_zombie_bus_window_idle_r
}

zm_zbarrier_front_window_idle : aliased restart notify bus_window_idle
{
	window_idle_l	ai_zombie_bus_front_window_idle_l
	window_idle_r	ai_zombie_bus_front_window_idle_r
}

zm_zbarrier_window_climbup : aliased restart notify bus_window_climbup
{
	window_climbup_l	ai_zombie_bus_window_climbup_from_l
	window_climbup_r	ai_zombie_bus_window_climbup_from_r
}

zm_zbarrier_climbin_bus : aliased restart notify climbin_bus_anim
{
	window_climbin_l 			ai_zombie_bus_side_window_enter_l_v1
	window_climbin_l_fast 		ai_zombie_bus_side_window_enter_l_v1_fast
	window_climbin_r 			ai_zombie_bus_side_window_enter_r_v1
	window_climbin_r_fast 		ai_zombie_bus_side_window_enter_r_v1_fast
	window_climbin_front_l 		ai_zombie_bus_front_window_enter_l_v1
	window_climbin_front_l_fast	ai_zombie_bus_front_window_enter_l_v1_fast
	window_climbin_front_r 		ai_zombie_bus_front_window_enter_r_v1
	window_climbin_front_r_fast	ai_zombie_bus_front_window_enter_r_v1_fast
	window_climbin_back 		ai_zombie_bus_rear_window_traverse_v1
	window_climbin_back_fast 	ai_zombie_bus_rear_window_traverse_fast_v1
}

zm_bus_attached : aliased restart notify bus_attached_anim
{
	jump_down_127		ai_zombie_jump_down_127
	bus_hatch_tear		ai_zombie_bus_hatch_tear
	bus_hatch_tear_b	ai_zombie_bus_hatch_tear_fromback
	bus_hatch_jump_down	ai_zombie_bus_hatch_jump_down
}

zm_bus_hatch_jump_up : restart notify bus_hatch_jump_anim
{
	ai_zombie_jump_up_bus_hatch_to_b
	ai_zombie_jump_up_bus_hatch_to_f
}

zm_bus_hatch_jump_up_crawl : restart notify bus_hatch_jump_anim
{
	ai_zombie_crawl_jump_up_bus_hatch_to_b
	ai_zombie_crawl_jump_up_bus_hatch_to_f
}

zm_bus_hatch_jump_down : restart notify bus_hatch_jump_anim
{
	ai_zombie_jump_down_bus_hatch_from_b
	ai_zombie_jump_down_bus_hatch_from_f
}

zm_bus_hatch_jump_down_crawl : restart notify bus_hatch_jump_anim
{
	ai_zombie_crawl_jump_down_bus_hatch_from_b
	ai_zombie_crawl_jump_down_bus_hatch_from_f
}

zm_bus_window2roof : restart notify window_exit_anim
{
	ai_zombie_bus_front_window_climbup_from_inside
	ai_zombie_bus_rear_window_climbup_from_inside
}

zm_barricade_enter : aliased restart notify barricade_enter_anim
{
	barrier_walk_m		ai_zombie_barricade_enter_m_v1
	barrier_walk_m		ai_zombie_barricade_enter_m_v2
	barrier_run_m		ai_zombie_barricade_enter_m_v5
	barrier_sprint_m	ai_zombie_barricade_enter_m_v6
	barrier_sprint_m	ai_zombie_barricade_enter_m_v7

	barrier_walk_r		ai_zombie_barricade_enter_r
	barrier_run_r		ai_zombie_barricade_enter_run_r
	barrier_sprint_r	ai_zombie_barricade_enter_sprint_r

	barrier_walk_l		ai_zombie_barricade_enter_l
	barrier_run_l		ai_zombie_barricade_enter_run_l
	barrier_sprint_l	ai_zombie_barricade_enter_sprint_l
}

zm_barricade_enter_crawl : aliased restart missing_legs notify barricade_enter_anim
{
	barrier_walk_m		ai_zombie_barricade_enter_m_nolegs
	barrier_walk_m		ai_zombie_barricade_enter_m_v4
	barrier_run_m		ai_zombie_barricade_enter_m_nolegs
	barrier_sprint_m	ai_zombie_barricade_enter_m_nolegs

	barrier_walk_r		ai_zombie_crawl_barricade_enter_r
	barrier_run_r		ai_zombie_crawl_barricade_enter_run_r
	barrier_sprint_r	ai_zombie_crawl_barricade_enter_sprint_r

	barrier_walk_l		ai_zombie_crawl_barricade_enter_l
	barrier_run_l		ai_zombie_crawl_barricade_enter_run_l
	barrier_sprint_l	ai_zombie_crawl_barricade_enter_sprint_l
}

zm_jetgun_death : restart notify death_anim
{
	ai_zombie_jetgun_death_v1
	ai_zombie_jetgun_death_v2
	ai_zombie_jetgun_death_v3
}

zm_jetgun_death_crawl : restart missing_legs notify death_anim
{
	ai_zombie_jetgun_crawl_death_v1
	ai_zombie_jetgun_crawl_death_v2
}

zm_move_jetgun_walk : notify move_anim
{
	ai_zombie_jetgun_walk_v1
	ai_zombie_jetgun_walk_v2
	ai_zombie_jetgun_walk_v3
}

zm_move_jetgun_walk_slow : notify move_anim
{
	ai_zombie_jetgun_walk_slow_v1
	ai_zombie_jetgun_walk_slow_v2
	ai_zombie_jetgun_walk_slow_v3
}

zm_move_jetgun_walk_fast : notify move_anim
{
	ai_zombie_jetgun_walk_fast_v1
	ai_zombie_jetgun_walk_fast_v2
	ai_zombie_jetgun_walk_fast_v3
}

zm_move_jetgun_walk_slow_crawl : missing_legs notify move_anim
{
	ai_zombie_jetgun_crawl_slow_v1
	ai_zombie_jetgun_crawl_slow_v2
}

zm_move_jetgun_walk_fast_crawl : missing_legs notify move_anim
{
	ai_zombie_jetgun_crawl_fast_v1
	ai_zombie_jetgun_crawl_fast_v2
	ai_zombie_jetgun_crawl_fast_v3
}

zm_move_jetgun_sprint : notify move_anim
{
	ai_zombie_jetgun_sprint_v1
	ai_zombie_jetgun_sprint_v2
	ai_zombie_jetgun_sprint_v3
}

zm_jetgun_sprint_death : restart notify death_anim
{
	ai_zombie_jetgun_sprint_death_v1
	ai_zombie_jetgun_sprint_death_v2
	ai_zombie_jetgun_sprint_death_v3
}