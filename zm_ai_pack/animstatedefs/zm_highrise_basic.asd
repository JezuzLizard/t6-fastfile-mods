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

zm_rise : restart notify rise_anim
{
	ai_zombie_traverse_ground_v1_walk
	ai_zombie_traverse_ground_v2_walk_altA
	ai_zombie_traverse_ground_v1_run
	ai_zombie_traverse_ground_climbout_fast
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

zm_traverse_barrier_crawl : aliased restart missing_legs notify traverse_anim
{
	barrier_crawl	ai_zombie_traverse_crawl_v1
	barrier_crawl	ai_zombie_traverse_v4

	barrier_crawl_slide	ai_zombie_traverse_crawl_v1
	barrier_crawl_slide	ai_zombie_traverse_v4
}

zm_barricade_enter : aliased restart notify barricade_enter_anim
{
	barrier_walk_m			ai_zombie_barricade_enter_m_v1
	barrier_walk_m			ai_zombie_barricade_enter_m_v2
	barrier_run_m			ai_zombie_barricade_enter_m_v5
	barrier_sprint_m		ai_zombie_barricade_enter_m_v6
	barrier_sprint_m		ai_zombie_barricade_enter_m_v7

	barrier_walk_r			ai_zombie_barricade_enter_r
	barrier_run_r			ai_zombie_barricade_enter_run_r
	barrier_sprint_r		ai_zombie_barricade_enter_sprint_r

	barrier_walk_l			ai_zombie_barricade_enter_l
	barrier_run_l			ai_zombie_barricade_enter_run_l
	barrier_sprint_l		ai_zombie_barricade_enter_sprint_l

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
	jump_down_40					ai_zombie_jump_down_40
	jump_down_48					ai_zombie_jump_down_48
//	jump_down_72					ai_zombie_jump_down_72
	jump_down_96					ai_zombie_jump_down_96
	jump_down_120					ai_zombie_jump_down_120
	jump_down_127					ai_zombie_jump_down_127
	jump_down_184					ai_zombie_jump_down_184
	jump_down_176					ai_zombie_jump_down_176
	jump_down_190					ai_zombie_jump_down_190
//	jump_down_222					ai_zombie_jump_down_222
//	jump_down_240					ai_zombie_jump_down_240
//	jump_down_286					ai_zombie_jump_down_286
//	jump_down_386					ai_zombie_jump_down_386
  	jump_up_127						ai_zombie_jump_up_127
  	jump_up_175						ai_zombie_jump_up_175
//	jump_up_222						ai_zombie_jump_up_222
	jump_up_grabbed_48				ai_zombie_jump_up_grabbed_48
	jump_up_grabbed_190				ai_zombie_jump_up_grabbed_190
//	jump_up_to_climb				ai_zombie_jump_up_2_climb
//	jump_up_to_climb_coast			ai_zombie_jump_up_2_climb_coast
	mantle_over_40_hurdle			ai_zombie_traverse_v6
	traverse_48						ai_zombie_traverse_48
	
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
}



//

////traverse anims, not all necessarily used on every level
zm_traverse_crawl : aliased restart missing_legs notify traverse_anim
{
	jump_down_40					ai_zombie_crawl_jump_down_40
	jump_down_48_crawl				ai_zombie_crawl_jump_down_48
//	jump_down_72					ai_zombie_crawl_jump_down_72
	jump_down_96_crawl				ai_zombie_crawl_jump_down_96
	jump_down_120_crawl				ai_zombie_crawl_jump_down_120 
	jump_down_127_crawl				ai_zombie_crawl_jump_down_127
	jump_down_176_crawl				ai_zombie_crawl_jump_down_176
	jump_down_184_crawl				ai_zombie_crawl_jump_down_184
	jump_down_190_crawl				ai_zombie_crawl_jump_down_189
//	jump_down_222					ai_zombie_crawl_jump_down_222
//	jump_down_240					ai_zombie_crawl_jump_down_240
//	jump_down_286					ai_zombie_crawl_jump_down_286
//	jump_down_386					ai_zombie_crawl_jump_down_386
	jump_up_127_crawl				ai_zombie_crawl_jump_up_127
	jump_up_175_crawl				ai_zombie_crawl_jump_up_175
//	jump_up_222						ai_zombie_crawl_jump_up_222
	jump_up_grabbed_48_crawl		ai_zombie_crawl_jump_up_grabbed_48
	jump_up_grabbed_190_crawl		ai_zombie_crawl_jump_up_grabbed_190
//	jump_up_to_climb				ai_zombie_crawl_jump_up_2_climb
//	jump_up_to_climb_coast			ai_zombie_crawl_jump_up_2_climb_coast
	mantle_over_40_hurdle_crawl		ai_zombie_traverse_crawl_v1
	traverse_48_crawl				ai_zombie_crawl_traverse_48
	
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

