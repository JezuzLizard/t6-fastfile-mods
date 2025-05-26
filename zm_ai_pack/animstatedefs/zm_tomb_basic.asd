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
	ai_zombie_traverse_ground_dugup
	ai_zombie_traverse_ground_dugup
	ai_zombie_traverse_ground_dugup
	ai_zombie_traverse_ground_dugup
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
}

zm_traverse_barrier_crawl : aliased restart missing_legs notify traverse_anim
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

//traverse anims, not all necessarily used on every level
zm_traverse : aliased restart notify traverse_anim
{
	jump_across_120			ai_zombie_jump_across_120
//	jump_down_40			ai_zombie_jump_down_40
	jump_down_48			ai_zombie_jump_down_48
	jump_down_72			ai_zombie_jump_down_72
	jump_down_96			ai_zombie_jump_down_96
//	jump_down_120			ai_zombie_jump_down_120
	jump_down_127			ai_zombie_jump_down_127
//	jump_down_184			ai_zombie_jump_down_184
//	jump_down_190			ai_zombie_jump_down_190
//	jump_down_222			ai_zombie_jump_down_222
//	jump_down_240			ai_zombie_jump_down_240
//	jump_down_286			ai_zombie_jump_down_286
//	jump_down_386			ai_zombie_jump_down_386
	jump_up_48				ai_zombie_jump_up_48
//	jump_up_72				ai_zombie_jump_up_72
	jump_up_96				ai_zombie_jump_up_96
	jump_up_127				ai_zombie_jump_up_127
//	jump_up_154				ai_zombie_jump_up_154
//	jump_up_222				ai_zombie_jump_up_222
//	jump_up_to_climb		ai_zombie_jump_up_2_climb
//	jump_up_to_climb_coast	ai_zombie_jump_up_2_climb_coast
	mantle_over_40_hurdle	ai_zombie_traverse_v6
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

//traverse anims, not all necessarily used on every level
zm_traverse_crawl : aliased restart missing_legs notify traverse_anim
{
	jump_across_120_crawl			ai_zombie_crawl_jump_across_120
//	jump_down_40_crawl				ai_zombie_crawl_jump_down_40
	jump_down_48_crawl				ai_zombie_crawl_jump_down_48
	jump_down_72_crawl				ai_zombie_crawl_jump_down_72
	jump_down_96_crawl				ai_zombie_crawl_jump_down_96
//	jump_down_120_crawl				ai_zombie_crawl_jump_down_120
	jump_down_127_crawl				ai_zombie_crawl_jump_down_127
//	jump_down_184_crawl				ai_zombie_crawl_jump_down_184
//	jump_down_190_crawl				ai_zombie_crawl_jump_down_189
//	jump_down_222_crawl				ai_zombie_crawl_jump_down_222
//	jump_down_240_crawl				ai_zombie_crawl_jump_down_240
//	jump_down_286_crawl				ai_zombie_crawl_jump_down_286
//	jump_down_386_crawl				ai_zombie_crawl_jump_down_386
	jump_up_48_crawl				ai_zombie_crawl_jump_up_48
//	jump_up_72_crawl				ai_zombie_crawl_jump_up_72
	jump_up_96_crawl				ai_zombie_crawl_jump_up_96
	jump_up_127_crawl				ai_zombie_crawl_jump_up_127
//	jump_up_154_crawl				ai_zombie_crawl_jump_up_154
//	jump_up_222_crawl				ai_zombie_crawl_jump_up_222
//	jump_up_to_climb_crawl			ai_zombie_crawl_jump_up_2_climb
//	jump_up_to_climb_coast_crawl	ai_zombie_crawl_jump_up_2_climb_coast
	mantle_over_40_hurdle_crawl		ai_zombie_traverse_crawl_v1
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

