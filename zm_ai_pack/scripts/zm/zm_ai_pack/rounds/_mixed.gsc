#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm;

round_spawning()
{
	level endon( "intermission" );
	level endon( "end_of_round" );
	level endon( "restart_round" );
/#
	level endon( "kill_round" );
#/

	if ( level.intermission )
		return;

/#
	if ( getdvarint( #"zombie_cheat" ) == 2 || getdvarint( #"zombie_cheat" ) >= 4 )
		return;
#/

	if ( level.zombie_spawn_locations.size < 1 )
	{
/#
		assertmsg( "No active spawners in the map.  Check to see if the zone is active and if it's pointing to spawners." );
#/
		return;
	}

	ai_calculate_health( level.round_number );

	if ( level.round_number < 10 || level.speed_change_max > 0 )
		level thread zombie_speed_up();

	mixed_spawns = 0;
	old_spawn = undefined;

	spawning_preset = scripts\zm\zm_ai_pack\_round_manager::determine_mixed_round_preset();

	while ( true )
	{
		while ( get_current_zombie_count() >= level.zombie_ai_limit || level.zombie_total <= 0 )
			wait 0.1;

		while ( get_current_actor_count() >= level.zombie_actor_limit )
		{
			clear_all_corpses();
			wait 0.1;
		}

		flag_wait( "spawn_zombies" );

		while ( level.zombie_spawn_locations.size <= 0 )
			wait 0.1;

		run_custom_ai_spawn_checks();

		ai = scripts\zm\zm_ai_pack\rounds\_normal::spawn_single_normal_zombie();

		wait( level.zombie_vars["zombie_spawn_delay"] );
		wait_network_frame();
	}
}

round_wait()
{
	level endon( "restart_round" );
/#
	if ( getdvarint( #"zombie_rise_test" ) )
		level waittill( "forever" );
#/
/#
	while ( getdvarint( #"zombie_cheat" ) == 2 || getdvarint( #"zombie_cheat" ) >= 4 )
		wait 1;
#/
	wait 1;

	while ( true )
	{
		should_wait = 0;

		if ( isdefined( level.is_ghost_round_started ) && [[ level.is_ghost_round_started ]]() )
			should_wait = 1;
		else
			should_wait = get_current_zombie_count() > 0 || level.zombie_total > 0 || level.intermission;

		if ( !should_wait )
			return;

		if ( flag( "end_round_wait" ) )
			return;

		wait 1.0;
	}
}

round_max()
{
	players = sys::getplayers();

	for ( i = 0; i < players.size; i++ )
		players[i].zombification_time = 0;

	max = level.zombie_vars["zombie_max_ai"];
	multiplier = level.round_number / 5;

	if ( multiplier < 1 )
		multiplier = 1;

	if ( level.round_number >= 10 )
		multiplier = multiplier * ( level.round_number * 0.15 );

	player_num = get_players().size;

	if ( player_num == 1 )
		max = max + int( 0.5 * level.zombie_vars["zombie_ai_per_player"] * multiplier );
	else
		max = max + int( ( player_num - 1 ) * level.zombie_vars["zombie_ai_per_player"] * multiplier );

	if ( !isdefined( level.max_zombie_func ) )
		level.max_zombie_func = ::default_max_zombie_func;

	level.zombie_total = [[ level.max_zombie_func ]]( max );
	level notify( "zombie_total_set" );

	if ( isdefined( level.zombie_total_set_func ) )
		level thread [[ level.zombie_total_set_func ]]();
}

round_start()
{
	
}

round_over()
{

}

round_chance()
{
	return false;
}

round_next()
{
	return level.round_number + 1;
}

special_dog_spawn( spawners, num_to_spawn )
{
	dogs = getaispeciesarray( "all", "zombie_dog" );

	if ( isdefined( dogs ) && dogs.size >= 9 )
		return false;

	if ( !isdefined( num_to_spawn ) )
		num_to_spawn = 1;

	spawn_point = undefined;
	count = 0;

	while ( count < num_to_spawn )
	{
		players = sys::getplayers();
		favorite_enemy = get_favorite_enemy();

		if ( isdefined( spawners ) )
		{
			spawn_point = spawners[randomint( spawners.size )];
			ai = spawn_zombie( spawn_point );

			if ( isdefined( ai ) )
			{
				ai.favoriteenemy = favorite_enemy;
				spawn_point thread dog_spawn_fx( ai );
				count++;
				flag_set( "dog_clips" );
			}
		}
		else if ( isdefined( level.dog_spawn_func ) )
		{
			spawn_loc = [[ level.dog_spawn_func ]]( level.dog_spawners, favorite_enemy );
			ai = spawn_zombie( level.dog_spawners[0] );

			if ( isdefined( ai ) )
			{
				ai.favoriteenemy = favorite_enemy;
				spawn_loc thread dog_spawn_fx( ai, spawn_loc );
				count++;
				flag_set( "dog_clips" );
			}
		}
		else
		{
			spawn_point = dog_spawn_factory_logic( level.enemy_dog_spawns, favorite_enemy );
			ai = spawn_zombie( level.dog_spawners[0] );

			if ( isdefined( ai ) )
			{
				ai.favoriteenemy = favorite_enemy;
				spawn_point thread dog_spawn_fx( ai, spawn_point );
				count++;
				flag_set( "dog_clips" );
			}
		}

		waiting_for_next_dog_spawn( count, num_to_spawn );
	}

	return true;
}