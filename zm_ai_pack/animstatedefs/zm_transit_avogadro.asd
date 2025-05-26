zm_arrival : restart notify arrival_anim
{
	ai_zombie_avogadro_arrival
}

zm_chamber_idle : notify chamber_idle_anim
{
	ai_zombie_avogadro_chamber_idle
}

zm_chamber_out : notify chamber_out_anim
{
	ai_zombie_avogadro_chamber_trans_out
}

zm_exit : restart notify exit_anim
{
	ai_zombie_avogadro_exit
}

zm_bus_attack : aliased restart notify bus_attack
{
	bus_attack_back ai_zombie_avogadro_bus_attack_back 
	bus_attack_front ai_zombie_avogadro_bus_attack_front
	bus_attack_left ai_zombie_avogadro_bus_attack_left
	bus_attack_right ai_zombie_avogadro_bus_attack_right
}

zm_bus_pain : restart notify pain_anim
{
	ai_zombie_avogadro_bus_pain_long
	ai_zombie_avogadro_bus_pain_med
	ai_zombie_avogadro_bus_pain_short
}

zm_bus_back_pain : restart notify pain_anim
{
	ai_zombie_avogadro_bus_back_pain_long
	ai_zombie_avogadro_bus_back_pain_med
	ai_zombie_avogadro_bus_back_pain_short
}

zm_bus_win : restart notify bus_win_anim
{
	ai_zombie_avogadro_bus_attack_knocked_off
}

zm_melee_attack : restart notify melee_attack
{
	ai_zombie_avogadro_melee_attack_v1 
}

zm_walk_melee : restart notify melee_anim
{
	ai_zombie_avogadro_melee_attack_v1 
}

zm_run_melee : restart notify melee_anim
{
	ai_zombie_avogadro_melee_attack_v1 
}

zm_ranged_attack_in : restart notify ranged_attack
{
	ai_zombie_avogadro_ranged_attack_v1
}

zm_ranged_attack_loop : notify ranged_attack
{
	ai_zombie_avogadro_ranged_attack_v1_loop
}

zm_ranged_attack_out : restart notify ranged_attack
{
	ai_zombie_avogadro_ranged_attack_v1_end
}

zm_move_walk : notify move_anim
{
	ai_zombie_avogadro_walk_v1
	ai_zombie_avogadro_walk_v1_twitch
}

zm_move_run : notify move_anim
{
	ai_zombie_avogadro_run_v1
	ai_zombie_avogadro_run_v1_twitch
}

zm_move_sprint : notify move_anim
{
	ai_zombie_avogadro_sprint_v1
	ai_zombie_avogadro_sprint_v1_twitch
}

zm_pain : restart notify pain_anim
{
	ai_zombie_avogadro_pain_long
	ai_zombie_avogadro_pain_med
	ai_zombie_avogadro_pain_short
}

zm_teleport_forward : notify teleport_anim
{
	ai_zombie_avogadro_teleport_forward_long
	ai_zombie_avogadro_teleport_forward_med
	ai_zombie_avogadro_teleport_forward_short
}

zm_teleport_left : notify teleport_anim
{
	ai_zombie_avogadro_teleport_left_long
	ai_zombie_avogadro_teleport_left_med
	ai_zombie_avogadro_teleport_left_short
}

zm_teleport_right : notify teleport_anim
{
	ai_zombie_avogadro_teleport_right_long
	ai_zombie_avogadro_teleport_right_med
	ai_zombie_avogadro_teleport_right_short
}

zm_teleport_back : notify teleport_anim
{
	ai_zombie_avogadro_teleport_back_long
	ai_zombie_avogadro_teleport_back_med
	ai_zombie_avogadro_teleport_back_short
}

zm_traverse : aliased restart notify traverse_anim
{
	climb_down_pothole				ai_zombie_climb_down_pothole
	climb_up_pothole				ai_zombie_climb_up_pothole
	jump_down_48					ai_zombie_jump_down_48
//	jump_down_72					ai_zombie_jump_down_72
	jump_down_96					ai_zombie_jump_down_96
	jump_down_127					ai_zombie_jump_down_127
	jump_down_190					ai_zombie_jump_down_190
	jump_down_222					ai_zombie_jump_down_222
	jump_up_127						ai_zombie_jump_up_127
	jump_up_222						ai_zombie_jump_up_222
	jump_across_120					ai_zombie_avogadro_jump_across_120
	mantle_over_40_hurdle			ai_zombie_traverse_v6
	traverse_diner_roof				ai_zombie_traverse_diner_roof
	traverse_diner_roof_up			ai_zombie_jump_up_diner_roof
	traverse_diner_roof_hatch_up	ai_zombie_diner_roof_hatch_jump_up
	traverse_car					ai_zombie_traverse_car
	traverse_car_sprint				ai_zombie_traverse_car_sprint
	traverse_car_run				ai_zombie_traverse_car_run
	traverse_car_reverse			ai_zombie_traverse_car_pass_to_driver_side
	traverse_diner_counter_reverse	ai_zombie_traverse_diner_counter_from_stools
	traverse_diner_counter			ai_zombie_traverse_diner_counter_to_stools
	traverse_garage_door			ai_zombie_traverse_garage_roll	
}

zm_traverse_barrier : aliased restart notify traverse_anim
{
	barrier_walk	ai_zombie_traverse_v1
	barrier_walk	ai_zombie_traverse_v2
	barrier_run		ai_zombie_traverse_v5
	barrier_sprint	ai_zombie_traverse_v6
	barrier_sprint	ai_zombie_traverse_v7
	barrier_crawl	ai_zombie_traverse_crawl_v1
	barrier_crawl	ai_zombie_traverse_v4
}

zm_taunt : restart notify taunt_anim
{
	ai_zombie_avogadro_melee_attack_v1
}








