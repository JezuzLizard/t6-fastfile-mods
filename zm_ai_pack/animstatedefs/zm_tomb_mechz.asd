
zm_spawn : restart notify jump_anim
{
	ai_zombie_mech_intro_jump_in
}

zm_idle : notify idle_anim
{
	ai_zombie_mech_idle
}	

zm_move_patrol : notify move_anim
{
	ai_zombie_mech_walk_patrol
}

zm_move_walk : notify move_anim
{
	ai_zombie_mech_run
}

zm_move_run : notify move_anim
{
	ai_zombie_mech_sprint
}

zm_sprint_intro : notify jump_anim
{
	ai_zombie_mech_sprint_booster_liftoff
}

zm_move_sprint : notify move_anim
{
	ai_zombie_mech_sprint_booster_loop
}

zm_sprint_outro : notify jump_anim
{
	ai_zombie_mech_sprint_booster_touchdown
}

zm_move_chase_bus : notify move_anim
{
// Do we need a chase_bus anim?
	ai_zombie_mech_run
}

zm_melee_stand : restart notify melee_anim
{
	ai_zombie_mech_melee_a
	ai_zombie_mech_melee_b
}

zm_walk_melee : restart notify melee_anim
{
// Need moving melees
	ai_zombie_mech_run_melee
}

zm_run_melee : restart notify melee_anim
{
// Need moving melee
	ai_zombie_mech_sprint_melee
}

zm_window_melee : restart notify window_melee_anim
{
	ai_zombie_mech_melee_a
	ai_zombie_mech_melee_b
}

zm_pain : restart notify pain_anim
{
	ai_zombie_mech_pain
}	

zm_pain_powercore : restart notify pain_anim_powercore
{
	ai_zombie_mech_powercore_pain
}

zm_pain_faceplate : restart notify pain_anim_faceplate
{
	ai_zombie_mech_faceplate_pain
}

zm_tank_hit_in : notify pain_anim
{
	ai_zombie_mech_injury_hit_by_tank
}
zm_tank_hit_loop : notify pain_anim
{
	ai_zombie_mech_injury_down_by_tank_loop
}
zm_tank_hit_out : notify pain_anim
{
	ai_zombie_mech_injury_recover_from_tank
}
zm_robot_hit_in : notify pain_anim
{
	ai_zombie_mech_injury_hit_by_footstep
}
zm_robot_hit_loop : notify pain_anim
{
	ai_zombie_mech_injury_down_by_footstep_loop
}
zm_robot_hit_out : notify jump_anim
{
	ai_zombie_mech_injury_recover_from_footstep
}
zm_stun : restart notify stun_anim
{
	ai_zombie_mech_stunned
}

zm_head_pain : restart notify head_pain_anim
{
	ai_zombie_mech_head_pain
}

zm_taunt : restart notify taunt_anim
{
	ai_zombie_mech_melee_a
}

zm_death : restart notify death_anim
{
	ai_zombie_mech_death
}

zm_death_explode : restart notify death_anim
{
	ai_zombie_mech_death_explode
}

// Grapple
zm_grapple_aim_1 : restart notify grapple_anim
{
	ai_zombie_mech_grapple_aim_1
}
zm_grapple_aim_2 : restart notify grapple_anim
{
	ai_zombie_mech_grapple_aim_2
}
zm_grapple_aim_3 : restart notify grapple_anim
{
	ai_zombie_mech_grapple_aim_3
}
zm_grapple_aim_4 : restart notify grapple_anim
{
	ai_zombie_mech_grapple_aim_4
}
zm_grapple_aim_5 : restart notify grapple_anim
{
	ai_zombie_mech_grapple_aim_5
}
zm_grapple_aim_6 : restart notify grapple_anim
{
	ai_zombie_mech_grapple_aim_6
}
zm_grapple_aim_7 : restart notify grapple_anim
{
	ai_zombie_mech_grapple_aim_7
}
zm_grapple_aim_8 : restart notify grapple_anim
{
	ai_zombie_mech_grapple_aim_8
}
zm_grapple_aim_9 : restart notify grapple_anim
{
	ai_zombie_mech_grapple_aim_9
}
zm_grapple_aim_start : restart notify grapple_anim
{
	ai_zombie_mech_grapple_intro_sprint_to_aim_5
}


//	Claw ONLY anims
zm_claw_close_idle : notify idle_anim
{
	ai_zombie_mech_grapple_arm_closed_idle
}

zm_claw_open_idle : notify idle_anim
{
	ai_zombie_mech_grapple_arm_open_idle
}

// Flamethrower
zm_flamethrower_sweep : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_sweep
}

zm_flamethrower_sweep_up : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_sweep_up
}

zm_flamethrower_claw_victim : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_burn_player
}

zm_flamethrower_aim_start : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_intro_sprint_to_aim_5
}

zm_flamethrower_aim_1 : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_aim_1
}

zm_flamethrower_aim_2 : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_aim_2
}

zm_flamethrower_aim_3 : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_aim_3
}

zm_flamethrower_aim_4 : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_aim_4
}

zm_flamethrower_aim_5 : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_aim_5
}

zm_flamethrower_aim_6 : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_aim_6
}

zm_flamethrower_aim_7 : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_aim_7
}

zm_flamethrower_aim_8 : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_aim_8
}

zm_flamethrower_aim_9 : restart notify flamethrower_anim
{
	ai_zombie_mech_ft_aim_9
}

// Entrance/exit
zm_fly_out : restart notify jump_anim
{
	ai_zombie_mech_exit	
}

zm_fly_hover : notify hover_anim
{
	ai_zombie_mech_exit_hover
}

zm_fly_in : restart notify jump_anim
{
	ai_zombie_mech_arrive	
}

// Traversals
zm_traverse : aliased restart notify traverse_anim
{
	jump_down_48			ai_zombie_mech_jump_down_48
	jump_down_72			ai_zombie_mech_jump_down_72
	jump_down_96			ai_zombie_mech_jump_down_96
	jump_down_127			ai_zombie_mech_jump_down_127
	jump_up_48				ai_zombie_mech_jump_up_48
//	jump_up_72				ai_zombie_mech_jump_up_72
	jump_up_96				ai_zombie_mech_jump_up_96
	jump_up_127				ai_zombie_mech_jump_up_127
	mantle_over_40_hurdle	ai_zombie_mech_traverse_hurdle_40
	jump_across_120			ai_zombie_mech_jump_across_120
	jump_down_dlc4_96		ai_zombie_mech_jump_down_127
	jump_down_dlc4_112		ai_zombie_mech_jump_down_dlc4_trench_wall_112
	jump_down_dlc4_120		ai_zombie_mech_jump_down_dlc4_trench_wall_120
//	jump_up_dlc4_96			ai_zombie_mech_jump_up_dlc4_trench_wall_96
//	jump_up_dlc4_112		ai_zombie_mech_jump_up_dlc4_trench_wall_112
//	jump_up_dlc4_120		ai_zombie_mech_jump_up_dlc4_trench_wall_120
	jump_up_dlc4_140		ai_zombie_mech_jump_up_dlc4_trench_wall_140
	jump_down_church		ai_zombie_mech_jump_down_church
}
