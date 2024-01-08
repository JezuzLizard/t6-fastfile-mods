zm_idle : notify idle_anim
{
	ai_zombie_ghost_idle
}

zm_move_walk : notify move_anim
{
	ai_zombie_ghost_walk
}

zm_move_run : notify move_anim
{
	ai_zombie_ghost_supersprint
}

zm_move_sprint : notify move_anim
{
	ai_zombie_ghost_supersprint
}

zm_pain : restart notify pain_anim
{
	ai_zombie_ghost_ground_pain
}

zm_melee_attack : restart notify melee_attack
{
	ai_zombie_ghost_melee 
}

zm_walk_melee : restart notify melee_anim
{
	ai_zombie_ghost_melee 
}

zm_run_melee : restart notify melee_anim
{
	ai_zombie_ghost_melee 
}

zm_spawn : restart notify spawn_anim
{
	ai_zombie_ghost_spawn
}

zm_death : restart notify death_anim
{
	ai_zombie_ghost_float_death
	ai_zombie_ghost_float_death_b
}

zm_death_no_restart : notify death_anim
{
	ai_zombie_ghost_float_death
	ai_zombie_ghost_float_death_b
}

zm_drain : notify drain_anim
{
	ai_zombie_ghost_pointdrain
}

zm_traverse_barrier : aliased restart notify traverse_anim
{
	barrier_walk			ai_zombie_traverse_v1
	barrier_run				ai_zombie_traverse_v5
}

zm_traverse_barrier_no_restart : aliased notify traverse_anim
{
	barrier_walk			ai_zombie_traverse_v1
	barrier_run				ai_zombie_traverse_v5
}

zm_traverse : aliased restart notify traverse_anim
{
	// based on zm_buried_basic.asd
	jump_across_120					ai_zombie_ghost_jump_across_120
	jump_down_48					ai_zombie_ghost_jump_down_48
	jump_down_72					ai_zombie_ghost_jump_down_72
	jump_down_96					ai_zombie_ghost_jump_down_96
	jump_down_127					ai_zombie_ghost_jump_down_127
	jump_down_154					ai_zombie_ghost_jump_down_154
	jump_down_176					ai_zombie_ghost_jump_down_176
	jump_down_190					ai_zombie_ghost_jump_down_190
	jump_down_222					ai_zombie_ghost_jump_down_222
	jump_down_240					ai_zombie_ghost_jump_down_240
	jump_up_72						ai_zombie_ghost_jump_up_72
	jump_up_96						ai_zombie_ghost_jump_up_96
	jump_up_127						ai_zombie_ghost_jump_up_127
	jump_up_154						ai_zombie_ghost_jump_up_154
	jump_up_176						ai_zombie_ghost_jump_up_176
	jump_up_190						ai_zombie_ghost_jump_up_190
	jump_up_222						ai_zombie_ghost_jump_up_222
	jump_up_240						ai_zombie_ghost_jump_up_240
	jump_up_startrailing			ai_zombie_ghost_jump_up_startrailing
	jump_down_startrailing			ai_zombie_ghost_jump_down_startrailing
	
	jump_up_grabbed_48				ai_zombie_ghost_jump_up_48
	traverse_48						ai_zombie_ghost_jump_up_48
}

zm_traverse_no_restart : aliased notify traverse_anim
{
	// based on zm_buried_basic.asd
	jump_across_120					ai_zombie_ghost_jump_across_120
	jump_down_48					ai_zombie_ghost_jump_down_48
	jump_down_72					ai_zombie_ghost_jump_down_72
	jump_down_96					ai_zombie_ghost_jump_down_96
	jump_down_127					ai_zombie_ghost_jump_down_127
	jump_down_154					ai_zombie_ghost_jump_down_154
	jump_down_176					ai_zombie_ghost_jump_down_176
	jump_down_190					ai_zombie_ghost_jump_down_190
	jump_down_222					ai_zombie_ghost_jump_down_222
	jump_down_240					ai_zombie_ghost_jump_down_240
	jump_up_72						ai_zombie_ghost_jump_up_72
	jump_up_96						ai_zombie_ghost_jump_up_96
	jump_up_127						ai_zombie_ghost_jump_up_127
	jump_up_154						ai_zombie_ghost_jump_up_154
	jump_up_176						ai_zombie_ghost_jump_up_176
	jump_up_190						ai_zombie_ghost_jump_up_190
	jump_up_222						ai_zombie_ghost_jump_up_222
	jump_up_240						ai_zombie_ghost_jump_up_240
	jump_up_startrailing			ai_zombie_ghost_jump_up_startrailing
	jump_down_startrailing			ai_zombie_ghost_jump_down_startrailing
	
	jump_up_grabbed_48				ai_zombie_ghost_jump_up_48
	traverse_48						ai_zombie_ghost_jump_up_48
}


