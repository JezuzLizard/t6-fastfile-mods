zm_move_walk : notify move_anim
{
	ai_zombie_leaper_run_bounce
}

zm_move_run : notify move_anim
{
	ai_zombie_leaper_run_bounce
}

zm_move_sprint : notify move_anim
{
	ai_zombie_leaper_run_bounce
}

zm_walk_melee : restart notify melee_anim
{
	ai_zombie_leaper_attack_v1
	ai_zombie_leaper_attack_v2
}

zm_run_melee : restart notify melee_anim
{
	ai_zombie_leaper_attack_v1
	ai_zombie_leaper_attack_v2
}

zm_jump_melee : restart notify melee_anim
{
	ai_zombie_leaper_attack_v1
}

zm_kick_melee : restart notify melee_anim
{
	ai_zombie_leaper_attack_v2
}

zm_death : restart notify death_anim
{
	ai_zombie_leaper_death_v1
	ai_zombie_leaper_death_v2
}

zm_wall_left : restart notify wall_anim
{
	ai_zombie_leaper_wall_traverse_l
}

zm_wall_left_large : restart notify wall_anim
{
	ai_zombie_leaper_wall_traverse_l_large
}

zm_wall_right : restart notify wall_anim
{
	ai_zombie_leaper_wall_traverse_r
}

zm_wall_right_large : restart notify wall_anim
{
	ai_zombie_leaper_wall_traverse_r_large
}

zm_wall_up : restart notify wall_anim
{
	ai_zombie_leaper_ceiling_traverse
}

zm_building_leap : aliased restart notify building_leap_anim
{
	gap1_from_antenna				ai_leaper_traverse_dierise_gap1_from_antenna
	gap1_to_antenna					ai_leaper_traverse_dierise_gap1_to_antenna
	gap5b_from_conference			ai_leaper_traverse_dierise_gap5b_from_conference
	gap5b_to_conference				ai_leaper_traverse_dierise_gap5b_to_conference
	gap5a_from_conference			ai_leaper_traverse_dierise_gap5a_from_conference
	gap5a_to_conference				ai_leaper_traverse_dierise_gap5a_to_conference
	gap6_low_to_high				ai_leaper_traverse_dierise_gap6_low_to_high
	gap6_high_to_low 				ai_leaper_traverse_dierise_gap6_high_to_low
	
	gap14a_high_to_low				ai_leaper_traverse_dierise_gap14a_high_to_low
	gap14b_high_to_low				ai_leaper_traverse_dierise_gap14b_high_to_low
	gap14c_high_to_low 				ai_leaper_traverse_dierise_gap14c_high_to_low
	gap14d_low_to_high				ai_leaper_traverse_dierise_gap14d_low_to_high
	gap14e_high_to_low				ai_leaper_traverse_dierise_gap14e_high_to_low
	gap14f_high_to_low				ai_leaper_traverse_dierise_gap14f_high_to_low
	gap14g_high_to_low				ai_leaper_traverse_dierise_gap14g_high_to_low
	gap14h_low_to_high				ai_leaper_traverse_dierise_gap14h_low_to_high
	
	gap15f_high_to_low				ai_leaper_traverse_dierise_gap15f_high_to_low
	gap15c_low_to_high				ai_leaper_traverse_dierise_gap15c_low_to_high
	gap15g_high_to_low				ai_leaper_traverse_dierise_gap15g_high_to_low
	gap15a_from_girder				ai_leaper_traverse_dierise_gap15a_from_girder
	gap16a_low_to_high				ai_leaper_traverse_dierise_gap16a_low_to_high
	gap16a_high_to_low				ai_leaper_traverse_dierise_gap16a_high_to_low
	gap16b_high_to_low				ai_leaper_traverse_dierise_gap16b_high_to_low
	gap16b_low_to_high				ai_leaper_traverse_dierise_gap16b_low_to_high
	
	gap17a_low_to_high				ai_leaper_traverse_dierise_gap17a_low_to_high
	
	gap18_high_to_low				ai_leaper_traverse_dierise_gap18_high_to_low
	
	jump_down_176					ai_zombie_jump_down_176
	jump_down_184					ai_zombie_jump_down_184
	jump_down_190					ai_zombie_jump_down_190
//	jump_down_286					ai_zombie_jump_down_286	
	
	jump_down_176_vent				ai_leaper_dierise_ventfall_176
//	jump_down_184_vent				ai_leaper_dierise_ventfall_184
//	jump_down_190_vent				ai_leaper_dierise_ventfall_190
//	jump_down_286_vent				ai_leaper_dierise_ventfall_286
	
	jump_up_190_dlc1				ai_zombie_jump_up_grabbed_190_dlc1
	
	green_start_1					ai_zombie_leaper_traverse_dierise_green_ext_a
	green_start_2					ai_zombie_leaper_traverse_dierise_green_ext_b
	
	green_level1_1					ai_zombie_leaper_traverse_dierise_green_ext_c
	
	green_level2a_1					ai_zombie_leaper_traverse_dierise_bluegreen_antenna_to_escalator
	green_level2a_2					ai_zombie_leaper_traverse_dierise_green_ext_d
	
	green_level2b_1					ai_leaper_traverse_shoestore
	
	green_level3a_1					ai_zombie_leaper_traverse_dierise_green_ext_e
	green_level3a_2					ai_zombie_leaper_traverse_dierise_green_ext_g
	
	green_level3d_1					ai_zombie_leaper_traverse_dierise_green_ext_f 
	
	orange_elevator_1_down			ai_leaper_traverse_dierise_shaft1_to_bottom
	orange_elevator_1_up			ai_leaper_traverse_dierise_shaft1_from_bottom
	orange_elevator_2_down			ai_leaper_traverse_dierise_shaft2_to_bottom
	orange_elevator_2_up 			ai_leaper_traverse_dierise_shaft2_from_bottom
	
	orange_level1_1_right			ai_zombie_leaper_traverse_dierise_orange_ext_a_right
	orange_level1_1_left			ai_zombie_leaper_traverse_dierise_orange_ext_a_left
	
	orange_level3a_1_left			ai_zombie_leaper_traverse_dierise_orange_ext_b_left
	orange_level3a_1_right			ai_zombie_leaper_traverse_dierise_orange_ext_b_right
	
	orange_level3b_1				ai_leaper_traverse_dierise_restaurant_in
	orange_level3b_2				ai_zombie_leaper_traverse_dierise_orange_ext_c
	
	blue_level1_1					ai_zombie_leaper_traverse_dierise_blue_ext_a
}

zm_traverse : aliased restart notify traverse_anim
{
	jump_down_40					ai_zombie_jump_down_40
	jump_down_48					ai_zombie_jump_down_48
	jump_up_grabbed_48				ai_zombie_jump_up_grabbed_48
	jump_up_175						ai_leaper_jump_up_175
	jump_down_96					ai_zombie_jump_down_96
	jump_down_120					ai_leaper_jump_down_120
	jump_down_176					ai_zombie_jump_down_176
	jump_down_184					ai_zombie_jump_down_184
	jump_down_190					ai_zombie_jump_down_190
	jump_up_grabbed_190				ai_zombie_jump_up_grabbed_190
	jump_down_127					ai_zombie_jump_down_127
	jump_up_127						ai_zombie_jump_up_127
//	jump_down_286					ai_zombie_jump_down_286
	
	traverse_48						ai_zombie_traverse_48
	mantle_over_40_hurdle			ai_leaper_traverse_dierise_barrier
	
	
	// zm_highrise specific traversals
	dierise_traverse_1_high_to_low	ai_leaper_traverse_dierise_1_high_to_low
	dierise_traverse_1_low_to_high	ai_leaper_traverse_dierise_1_low_to_high
	dierise_traverse_2_high_to_low	ai_leaper_traverse_dierise_2_high_to_low
	dierise_traverse_2_low_to_high	ai_leaper_traverse_dierise_2_low_to_high
	dierise_traverse_3_high_to_low	ai_leaper_traverse_dierise_3_high_to_low
	dierise_traverse_3_low_to_high	ai_leaper_traverse_dierise_3_low_to_high
	dierise_traverse_4_high_to_low	ai_leaper_traverse_dierise_4_high_to_low
	dierise_traverse_4_low_to_high	ai_leaper_traverse_dierise_4_low_to_high
	dierise_traverse_5_high_to_low	ai_leaper_traverse_dierise_chrest_elevator_high_to_low
	dierise_traverse_5_low_to_high	ai_leaper_traverse_dierise_5_low_to_high		
	
	dierise_gap1_to_antenna			ai_leaper_traverse_dierise_gap1_to_antenna
	dierise_gap1_from_antenna		ai_leaper_traverse_dierise_gap1_from_antenna

	gap2_from_roof					ai_leaper_traverse_dierise_gap2_from_roof
	gap2_to_roof					ai_leaper_traverse_dierise_gap2_to_roof

	dierise_gap4b_to_roof			ai_leaper_traverse_dierise_gap4b_to_roof
	dierise_gap4b_from_roof			ai_leaper_traverse_dierise_gap4b_from_roof
	
	dierise_gap5a_from_conference	ai_leaper_traverse_dierise_gap5a_from_conference
	dierise_gap5a_to_conference		ai_leaper_traverse_dierise_gap5a_to_conference
	dierise_gap5b_from_conference	ai_leaper_traverse_dierise_gap5b_from_conference
	dierise_gap5b_to_conference		ai_leaper_traverse_dierise_gap5b_to_conference 		
	
	dierise_gap6_high_to_low		ai_leaper_traverse_dierise_gap6_high_to_low
	dierise_gap6_low_to_high		ai_leaper_traverse_dierise_gap6_low_to_high
	
	dierise_gap7_from_top_ledge		ai_leaper_traverse_dierise_gap7_from_top_ledge
	dierise_gap7_to_top_ledge		ai_leaper_traverse_dierise_gap7_to_top_ledge
	
	dierise_gap8_high_to_low		ai_leaper_traverse_dierise_gap8_high_to_low
	dierise_gap8_low_to_high		ai_leaper_traverse_dierise_gap8_low_to_high
	
	dierise_gap9_high_to_low		ai_leaper_traverse_dierise_gap9_high_to_low
	dierise_gap9_low_to_high		ai_leaper_traverse_dierise_gap9_low_to_high
	
	dierise_gap10_high_to_low 		ai_leaper_traverse_dierise_gap10_high_to_low
	dierise_gap10_low_to_high 		ai_leaper_traverse_dierise_gap10_low_to_high
	
//	dierise_gap11_high_to_low		ai_leaper_traverse_dierise_gap11_high_to_low
//	dierise_gap11_low_to_high		ai_leaper_traverse_dierise_gap11_low_to_high

//	dierise_gap13_high_to_low		ai_leaper_traverse_dierise_gap13_high_to_low
//	dierise_gap13_low_to_high 		ai_leaper_traverse_dierise_gap13_low_to_high	
	
	dierise_gap14a_high_to_low		ai_leaper_traverse_dierise_gap14a_high_to_low
//	dierise_gap14a_low_to_high		ai_leaper_traverse_dierise_gap14a_low_to_high
	dierise_gap14b_high_to_low		ai_leaper_traverse_dierise_gap14b_high_to_low
//	dierise_gap14b_low_to_high		ai_leaper_traverse_dierise_gap14b_low_to_high
	dierise_gap14c_high_to_low		ai_leaper_traverse_dierise_gap14c_high_to_low
	dierise_gap14c_low_to_high		ai_leaper_traverse_dierise_gap14c_low_to_high
	dierise_gap14d_high_to_low		ai_leaper_traverse_dierise_gap14d_high_to_low
	dierise_gap14d_low_to_high		ai_leaper_traverse_dierise_gap14d_low_to_high
	dierise_gap14e_high_to_low		ai_leaper_traverse_dierise_gap14e_high_to_low
	dierise_gap14e_low_to_high		ai_leaper_traverse_dierise_gap14e_low_to_high
	dierise_gap14f_high_to_low		ai_leaper_traverse_dierise_gap14f_high_to_low
	dierise_gap14f_low_to_high		ai_leaper_traverse_dierise_gap14f_low_to_high
	dierise_gap14g_high_to_low		ai_leaper_traverse_dierise_gap14g_high_to_low
	dierise_gap14g_low_to_high		ai_leaper_traverse_dierise_gap14g_low_to_high
	dierise_gap14h_high_to_low		ai_leaper_traverse_dierise_gap14h_high_to_low
	dierise_gap14h_low_to_high		ai_leaper_traverse_dierise_gap14h_low_to_high	
	
	dierise_gap15a_from_girder		ai_leaper_traverse_dierise_gap15a_from_girder
	dierise_gap15b_from_girder		ai_leaper_traverse_dierise_gap15b_from_girder
	dierise_gap15f_low_to_high		ai_leaper_traverse_dierise_gap15f_low_to_high
	dierise_gap15f_high_to_low		ai_leaper_traverse_dierise_gap15f_high_to_low
	dierise_gap15g_high_to_low		ai_leaper_traverse_dierise_gap15g_high_to_low
	dierise_gap15g_low_to_high		ai_leaper_traverse_dierise_gap15g_low_to_high


}

zm_traverse_elevator : aliased restart notify traverse_anim
{
//	zm_jump_down_from_elevator_bottom	ai_leaper_jump_down_from_elevator_bottom
//	zm_jump_up_to_elevator_bottom		ai_leaper_jump_up_to_elevator_bottom

	zm_jump_down_to_elevator_top		ai_leaper_jump_down_to_elevator_roof
	zm_jump_up_from_elevator_top		ai_leaper_jump_up_from_elevator_roof
	zm_zombie_climb_elevator			ai_zombie_leaper_climb_elevator	
}
zm_traverse_elevator : aliased restart notify traverse_anim
{
//	zm_jump_down_from_elevator_bottom	ai_leaper_jump_down_from_elevator_bottom
//	zm_jump_up_to_elevator_bottom		ai_leaper_jump_up_to_elevator_bottom

	zm_jump_down_to_elevator_top				ai_leaper_jump_down_to_elevator_roof
	zm_jump_up_from_elevator_top				ai_leaper_jump_up_from_elevator_roof
	zm_zombie_climb_elevator						ai_zombie_leaper_climb_elevator	
}

// TEMP: ported over zombie barrier traversals for leapers. zombie_move_speed parameter should only ever be "run" on leapers.
zm_traverse_barrier : aliased restart notify traverse_anim
{
	barrier_run		ai_leaper_traverse_dierise_barrier
	barrier_sprint	ai_leaper_traverse_dierise_barrier
}

// traversal anims that are DieRise specific. **REQUIRES CUSTOM TRAVERSE STATE
zm_traverse_dierise : aliased restart notify traverse_anim
{
	dierise_round_counter_from_stools		ai_leaper_crawl_traverse_round_counter_from_stools
	dierise_round_counter_to_stools			ai_leaper_crawl_traverse_round_counter_to_stools

	dierise_chrest_interior_high_to_low		ai_leaper_traverse_dierise_chrest_interior_high_to_low
	dierise_chrest_interior_low_to_high		ai_leaper_traverse_dierise_chrest_interior_low_to_high
	dierise_chrest_interior_alt_down		ai_leaper_traverse_dierise_chrest_interior_alt_high_to_low
	dierise_chrest_interior_alt_up			ai_leaper_traverse_dierise_chrest_interior_alt_low_to_high	

	jump_up_antenna							ai_zombie_jump_up_grabbed_antenna
	jump_up_sewing							ai_leaper_jump_up_sewing

	dierise_blue_ac_unit					ai_leaper_traverse_dierise_ac_unit
	
	dierise_chrest_gap						ai_leaper_traverse_dierise_chrest_gap
	
	dierise_escape_elevator_hallway			ai_leaper_traverse_dierise_barrier

	dierise_traverse_6_low_to_high			ai_leaper_traverse_dierise_6_low_to_high 
	dierise_traverse_6_high_to_low			ai_leaper_traverse_dierise_6_high_to_low 
	
	dierise_traverse_7_low_to_high			ai_leaper_traverse_dierise_7_low_to_high 
	dierise_traverse_7_high_to_low			ai_leaper_traverse_dierise_7_high_to_low 	

	dierise_gap16a_high_to_low				ai_leaper_traverse_dierise_gap16a_high_to_low
	dierise_gap16a_low_to_high				ai_leaper_traverse_dierise_gap16a_low_to_high
	dierise_gap16b_high_to_low				ai_leaper_traverse_dierise_gap16b_high_to_low
	dierise_gap16b_low_to_high				ai_leaper_traverse_dierise_gap16b_low_to_high

	dierise_gap17a_high_to_low				ai_leaper_traverse_dierise_gap17a_high_to_low
	dierise_gap17a_low_to_high				ai_leaper_traverse_dierise_gap17a_low_to_high
	dierise_gap17c_high_to_low				ai_leaper_traverse_dierise_gap17c_high_to_low
	dierise_gap17c_low_to_high				ai_leaper_traverse_dierise_gap17c_low_to_high

	dierise_gap18_high_to_low				ai_leaper_traverse_dierise_gap18_high_to_low

	dierise_gap19_from_railing				ai_leaper_traverse_dierise_gap19_from_railing 
	dierise_gap19_to_railing				ai_leaper_traverse_dierise_gap19_to_railing 		
}

zm_move_walk_slide : notify move_anim
{
	ai_zombie_crawl_slipslide_slow
}

zm_move_run_slide : notify move_anim
{
	ai_zombie_crawl_slipslide_slow
}

zm_move_sprint_slide : notify move_anim
{
	ai_zombie_crawl_slipslide_fast
}

zm_move_slide_recover : restart notify slide_recover_anim
{
	ai_zombie_crawl_slipslide_recover
}

zm_spawn_elevator_from_ceiling : notify spawn_anim
{
	ai_zombie_leaper_elevator_from_ceiling
}

zm_spawn_elevator_from_floor : notify spawn_anim
{
	ai_zombie_leaper_elevator_from_floor
}
	