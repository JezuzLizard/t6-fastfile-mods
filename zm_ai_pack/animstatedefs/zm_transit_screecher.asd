zm_burrow : restart notify burrow_anim
{
	ai_zombie_screecher_burrow_into_ground
}

zm_death : restart notify death_anim
{
	ai_zombie_screecher_death_v1
}

zm_headpull : restart
{
	ai_zombie_screecher_headpull
}

zm_headpull_fail : restart
{
	ai_zombie_screecher_headpull_fail
}

zm_headpull_success : restart notify headpull_success_anim
{
	ai_zombie_screecher_headpull_success
}

zm_jump_up : restart notify jump_up_anim
{
	ai_zombie_screecher_jump_up
}

zm_jump_land_success_fromback : restart notify jump_land_success_anim
{
	ai_zombie_screecher_jump_land_success_fromback
}

zm_jump_land_success_fromfront : restart notify jump_land_success_anim
{
	ai_zombie_screecher_jump_land_success_fromfront
}

zm_jump_loop
{
	ai_zombie_screecher_jump_loop
}

zm_move_super_sprint : notify move_anim
{
	ai_zombie_screecher_run
	ai_zombie_screecher_run_bounce
	ai_zombie_screecher_run_hop
	ai_zombie_screecher_run_zigzag
}

zm_rise : restart notify rise_anim
{
	ai_zombie_screecher_traverse_ground_v1
}

zm_rise_death_in : restart notify death_anim
{
	ai_zombie_screecher_death_v1
}

zm_rise_death_out : restart notify death_anim
{
	ai_zombie_screecher_death_v1
}

zm_run_melee : restart notify melee_anim
{
	ai_zombie_screecher_jump_up
}

zm_traverse : aliased restart notify traverse_anim
{
	climb_down_pothole				ai_zombie_screecher_climb_down_pothole
	climb_up_pothole				ai_zombie_screecher_climb_up_pothole
	traverse_car					ai_zombie_screecher_traverse_car
	traverse_car_sprint				ai_zombie_screecher_traverse_car
	traverse_car_reverse			ai_zombie_screecher_traverse_car_pass_to_driver_side
	traverse_diner_roof_hatch_up	ai_zombie_screecher_diner_roof_hatch_jump_up
	jump_down_96					ai_zombie_screecher_jump_down_96
	jump_down_127					ai_zombie_screecher_jump_down_127
	jump_up_127						ai_zombie_screecher_jump_up_127
}

zm_traverse_barrier : aliased restart notify traverse_anim
{
	barrier_sprint	ai_zombie_screecher_tunnel_traversal
}






