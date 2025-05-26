zm_stop_idle : notify stop_idle
{
	zombie_dog_idle
}

zm_stop_attackidle_growl : notify attack_idle restart
{
	zombie_dog_attackidle_growl
}

zm_stop_attackidle : notify attack_idle restart restart
{
	zombie_dog_attackidle
}

zm_stop_attackidle_bark : notify attack_idle restart
{
	zombie_dog_attackidle_bark
}

zm_combat_attack_player_close_range : notify attack_combat restart
{
	zombie_dog_run_attack_low
}

zm_combat_attackidle_growl : notify attack_combat restart
{
	zombie_dog_run_attack
}

zm_combat_attackidle : notify attack_combat restart
{
	zombie_dog_run_attack
}

zm_combat_attackidle_bark : notify attack_combat restart
{
	zombie_dog_run_attack
}

zm_move_run : notify move_run
{
	zombie_dog_run
}

zm_move_stop : notify move_stop
{
	zombie_dog_run_stop
}

zm_move_walk : notify move_walk
{
	zombie_dog_trot
}

zm_move_start : notify move_start
{
	zombie_dog_run_start
}

zm_traverse_wallhop : notify traverse_wallhop
{
	zombie_dog_traverse_up_40
}

move_turn_left : notify move_turn
{
	zombie_dog_turn_90_left
}

move_run_turn_left : notify move_turn
{
	zombie_dog_run_turn_90_left
}

move_turn_right : notify move_turn 
{
	zombie_dog_turn_90_right
}

move_run_turn_right : notify move_turn
{
	zombie_dog_run_turn_90_right
}

move_turn_around_left : notify move_turn
{
	zombie_dog_turn_180_left
}

move_run_turn_around_left : notify move_turn
{
	zombie_dog_run_turn_180_left
}

move_run_turn_around_right : notify move_turn
{
	zombie_dog_run_turn_180_right
}


move_turn_around_right : notify move_turn
{
	zombie_dog_turn_180_right
}

move_run_turn_around_right2 : notify move_turnxxxxxxxxxxxxxxxxx
{
	zombie_dog_run_turn_180_right
}

death_front : notify dead_dog
{
	zombie_dog_death_front
}

death_right : notify dead_dog
{
	zombie_dog_death_hit_right
}

death_back : notify dead_dog
{
	zombie_dog_death_hit_back
}

death_left : notify dead_dog
{
	zombie_dog_death_hit_left
}

zm_traverse : aliased restart notify traverse_anim
{
	jump_down_48			zombie_dog_traverse_down_40
	jump_down_96			zombie_dog_traverse_down_96
	jump_down_127			zombie_dog_traverse_down_127
	jump_down_190			zombie_dog_traverse_down_190
	jump_down_222			zombie_dog_traverse_down_190
	jump_up_127				zombie_dog_traverse_up_127
	jump_up_222				zombie_dog_traverse_up_80
	jump_across_120			ai_zombie_dog_jump_across_120
	traverse_car			ai_zombie_dog_traverse_car
	traverse_car_sprint		ai_zombie_dog_traverse_car
	traverse_car_run		ai_zombie_dog_traverse_car
	traverse_car_reverse	ai_zombie_dog_traverse_car_pass_to_driver

}