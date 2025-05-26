#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm_ai_dogs;

#include scripts\zm\zm_ai_pack\_round_manager;
#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_dog_round_chance", 40 );

	set_dvar_if_unset( "rm_dog_rush_min_round", 20 );
	set_dvar_if_unset( "rm_dog_rush_round_chance", 10 );
	set_dvar_if_unset( "rm_dog_rush_max_dogs_alive_per_player", 6 );
	set_dvar_if_unset( "rm_dog_rush_max_dogs_round", 64 );
	set_dvar_if_unset( "rm_dog_rush_max_dogs_round_per_player", 4 );
	set_dvar_if_unset( "rm_dog_rush_max_dogs_round_base", 24 );
	set_dvar_if_unset( "rm_dog_rush_max_dogs_round_number_multiplier", 0.1 );
	set_dvar_if_unset( "rm_dog_rush_max_spawn_wait", 0.5 );
	set_dvar_if_unset( "rm_dog_rush_min_spawn_wait", 0.1 );
}

round_spawning()
{
	level endon( "intermission" );
	level endon( "end_of_round" );
	level endon( "restart_round" );
/#
	level endon( "kill_round" );
#/

	count = 0;
	max = level.zombie_total;
	while ( true )
	{
		while ( get_zombie_dog_count() >= level.zombie_ai_limit || level.zombie_total <= 0 || level.intermission )
			wait 0.1;
		
		for ( num_player_valid = get_number_of_valid_players(); get_zombie_dog_count() >= num_player_valid * 2; num_player_valid = get_number_of_valid_players() )
			wait 2;
			
		count = spawn_zombie_dog( count );
		waiting_for_next_dog_spawn( count, max );
	}
}

round_wait()
{
	level endon( "restart_round" );
/#
	level endon( "kill_round" );
#/
	wait 7;

	while ( get_zombie_dog_count() > 0 || level.zombie_total > 0 || level.intermission )
	{
		wait 0.5;
	}

	maps\mp\zombies\_zm::increment_dog_round_stat( "finished" );

	wait 8;
}

round_max()
{
	players = sys::getplayers();
	if ( level.special_round_count < 3 )
		max = players.size * 6;
	else
		max = players.size * 8;

/#
	if ( getdvar( #"force_dogs" ) != "" )
		max = getdvarint( #"force_dogs" );
#/
	level.zombie_total = max;
}

round_start()
{
	level.dog_targets = sys::getplayers();
	for ( i = 0; i < level.dog_targets.size; i++ )
		level.dog_targets[i].hunted_by = false;

	level.music_round_override = 1;
	maps\mp\zombies\_zm_ai_dogs::dog_round_start();

	level.dog_intermission = 1;
	level thread maps\mp\zombies\_zm_ai_dogs::dog_round_aftermath();
	players = sys::getplayers();
	array_thread( players, maps\mp\zombies\_zm_ai_dogs::play_dog_round );
	wait 1;
	prefix = "vox_zmba";
	if ( !level.sndannouncerisrich || level.script == "zm_prison" || level.script == "zm_tomb" )
	{
		prefix = "vox_zmba_sam";
	}
	playsoundatposition( prefix + "_event_dogstart_0", ( 0, 0, 0 ) );
	wait 6;
}

round_over()
{
	maps\mp\zombies\_zm_ai_dogs::dog_round_stop();
	level.music_round_override = 0;
	flag_clear( "dog_round" );
}

round_chance()
{
	chance = getDvarInt( "rm_dog_round_chance" );

	return randomInt( 100 ) <= chance;
}

round_next()
{
	min = getDvarInt( "rm_min_rounds_before_special_round" );
	max = getDvarInt( "rm_max_rounds_before_special_round" );
	if ( min >= max )
	{
		return level.special_round.last_data.round_number + 1;
	}
	else
	{
		return level.special_round.last_data.round_number + randomintrange( min, max );
	}
}

round_spawning_rush()
{
	level endon( "end_of_round" );
	level endon( "intermission" );
/#
	level endon( "kill_round" );
#/

	count = 0;
	max = level.zombie_total;
	while ( true )
	{
		while ( get_zombie_dog_count() >= level.zombie_ai_limit || get_zombie_dog_count() >= ( getdvarint( "rm_dog_rush_max_dogs_alive_per_player" ) * level.players.size ) 
		|| level.zombie_total <= 0 || level.intermission )
			wait 0.1;

		count = spawn_zombie_dog( count );

		waiting_for_next_dog_spawn_rush( count, max );
	}
}

round_max_rush()
{
	players = sys::getplayers();

	dog_max = getdvarint( "rm_dog_rush_max_dogs_round_base" );

	dog_max += players.size * getdvarint( "rm_dog_rush_max_dogs_round_per_player" );

	dog_max *= int( level.round_number * getdvarfloat( "rm_dog_rush_max_dogs_round_number_multiplier" ) );

	max = getdvarint( "rm_dog_rush_max_dogs_round" );
	if ( dog_max > max )
	{
		dog_max = max;
	}
	if ( dog_max <= 0 )
	{
		dog_max = 6;
	}

	dog_max = int( dog_max );
	level.zombie_total = dog_max;
}

round_chance_rush()
{
	if ( level.round_number < getdvarint( "rm_dog_rush_min_round" ) )
	{
		return false;
	}

	return randomint( 100 ) <= getdvarint( "rm_dog_rush_round_chance" );
}

round_next_rush()
{
	min = getDvarInt( "rm_min_rounds_before_special_round" );
	max = getDvarInt( "rm_max_rounds_before_special_round" );
	if ( min >= max )
	{
		return level.special_round.last_data.round_number + 1;
	}
	else
	{
		return level.special_round.last_data.round_number + randomintrange( min, max );
	}
}

waiting_for_next_dog_spawn( count, max )
{
	default_wait = 1.5;

	if ( level.special_round_count == 1 )
		default_wait = 3;
	else if ( level.special_round_count == 2 )
		default_wait = 2.5;
	else if ( level.special_round_count == 3 )
		default_wait = 2;
	else
		default_wait = 1.5;

	default_wait = default_wait - count / max;
	wait( default_wait );
}

waiting_for_next_dog_spawn_rush( count, max )
{
	default_wait = getdvarfloat( "rm_dog_rush_max_spawn_wait" );

	default_wait = default_wait - ( ( count / max ) * 2 );
	min_wait = getdvarfloat( "rm_dog_rush_min_spawn_wait" );
	if ( default_wait <= min_wait )
	{
		default_wait = min_wait;
	}
	if ( default_wait < 0.05 )
	{
		default_wait = 0.05;
	}
	wait( default_wait );
}

spawn_zombie_dog( count )
{
	ai = spawn_single_zombie_dog();

	if ( isdefined( ai ) )
	{
		count++;
	}

	return count;
}

spawn_single_zombie_dog( starting_properties_struct )
{
	favorite_enemy = maps\mp\zombies\_zm_ai_dogs::get_favorite_enemy();

	ai = undefined;

	if ( isdefined( level.dog_spawn_func ) )
	{
		spawn_loc = [[ level.dog_spawn_func ]]( level.dog_spawners, favorite_enemy );
		ai = spawn_zombie( level.dog_spawners[0] );

		if ( isdefined( ai ) )
		{
			spawn_loc thread maps\mp\zombies\_zm_ai_dogs::dog_spawn_fx( ai, spawn_loc );
		}
	}
	else
	{
		spawn_point = dog_spawn_factory_logic( level.enemy_dog_spawns, favorite_enemy );
		ai = spawn_zombie( level.dog_spawners[0] );

		if ( isdefined( ai ) )
		{
			spawn_point thread maps\mp\zombies\_zm_ai_dogs::dog_spawn_fx( ai, spawn_point );
			flag_set( "dog_clips" );
		}
	}

	if ( isdefined( ai ) )
	{
		ai set_starting_properties_for_ai( starting_properties_struct );
		ai.favoriteenemy = favorite_enemy;
		level.zombie_total--;
	}

	return ai;
}

dog_spawn_sumpf_logic( dog_array, favorite_enemy )
{
	assert( dog_array.size > 0, "Dog Spawner array is empty." );
	dog_array = array_randomize( dog_array );

	for ( i = 0; i < dog_array.size; i++ )
	{
		if ( isdefined( level.old_dog_spawn ) && level.old_dog_spawn == dog_array[i] )
			continue;

		if ( sys::distancesquared( dog_array[i].origin, favorite_enemy.origin ) > 160000 && sys::distancesquared( dog_array[i].origin, favorite_enemy.origin ) < 640000 )
		{
			if ( sys::distancesquared( ( 0, 0, dog_array[i].origin[2] ), ( 0, 0, favorite_enemy.origin[2] ) ) > 10000 )
				continue;
			else
			{
				level.old_dog_spawn = dog_array[i];
				return dog_array[i];
			}
		}
	}

	return dog_array[0];
}

dog_spawn_factory_logic( dog_array, favorite_enemy )
{
	dog_locs = array_randomize( level.zombie_dog_locations );

	for ( i = 0; i < dog_locs.size; i++ )
	{
		if ( isdefined( level.old_dog_spawn ) && level.old_dog_spawn == dog_locs[i] )
			continue;

		dist_squared = sys::distancesquared( dog_locs[i].origin, favorite_enemy.origin );

		if ( dist_squared > 160000 && dist_squared < 1000000 )
		{
			level.old_dog_spawn = dog_locs[i];
			return dog_locs[i];
		}
	}

	return dog_locs[0];
}