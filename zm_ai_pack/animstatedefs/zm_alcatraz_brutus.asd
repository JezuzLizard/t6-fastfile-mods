zm_idle : notify idle_anim
{
	ai_zombie_cellbreaker_idle_a
	ai_zombie_cellbreaker_idle_b
}

zm_move_walk : notify move_anim
{
	ai_zombie_cellbreaker_walk_a
}

zm_move_run : notify move_anim
{
	ai_zombie_cellbreaker_run_a
	ai_zombie_cellbreaker_run_b
	ai_zombie_cellbreaker_run_c
	ai_zombie_cellbreaker_run_d
}

zm_move_sprint : notify move_anim
{
	ai_zombie_cellbreaker_sprint_a
	ai_zombie_cellbreaker_sprint_b
}

zm_walk_melee : restart notify melee_anim
{
	ai_zombie_cellbreaker_attack_swingleft
	ai_zombie_cellbreaker_attack_swingright_a
	ai_zombie_cellbreaker_attack_swingright_b

}

zm_run_melee : restart notify melee_anim
{	
	ai_zombie_cellbreaker_attack_swingleft
	ai_zombie_cellbreaker_attack_swingright_a
	ai_zombie_cellbreaker_attack_swingright_b
}

zm_taunt : restart notify taunt_anim
{
	ai_zombie_cellbreaker_enrage_start
}

zm_death : restart notify death_anim
{
	ai_zombie_cellbreaker_death
	ai_zombie_cellbreaker_death_a
}

zm_lock_magicbox : notify box_lock_anim
{
	ai_zombie_cellbreaker_lock_magicbox
}

zm_lock_perk_machine : notify perk_lock_anim
{
	ai_zombie_cellbreaker_lock_perkmachine
}

zm_smash_craftable_table : notify table_smash_anim
{
	ai_zombie_cellbreaker_boardsmash_a
	ai_zombie_cellbreaker_boardsmash_b
	ai_zombie_cellbreaker_boardsmash_c
}

zm_smash_trap : notify trap_smash_anim
{
	ai_zombie_cellbreaker_boardsmash_a
	ai_zombie_cellbreaker_boardsmash_b
	ai_zombie_cellbreaker_boardsmash_c
}

zm_lock_plane_ramp : notify plane_lock_anim
{
	ai_zombie_cellbreaker_lock_planeramp
}

zm_smash_blocker : notify board_smash_anim
{
	ai_zombie_cellbreaker_boardsmash_a
	ai_zombie_cellbreaker_boardsmash_b
	ai_zombie_cellbreaker_boardsmash_c
}

zm_teargas_attack : notify teargas_anim
{
	ai_zombie_cellbreaker_gasattack
}

zm_pain : notify pain_anim
{
	ai_zombie_cellbreaker_headpain
}

zm_summon : notify summon_anim
{
	ai_zombie_cellbreaker_summondogs
}

zm_spawn : notify spawn_anim
{
	ai_zombie_cellbreaker_spawn
}
zm_window_melee : restart notify window_melee_anim
{
	ai_zombie_cellbreaker_attack_swingleft
	ai_zombie_cellbreaker_attack_swingright_a
	ai_zombie_cellbreaker_attack_swingright_b
}