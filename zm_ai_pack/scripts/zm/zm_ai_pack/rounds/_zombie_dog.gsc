#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm_ai_dogs;

#include scripts\zm\zm_ai_pack\_round_manager;

main()
{
	set_dvar_if_unset( "rm_dog_round_chance", 40 );
}

round_spawning()
{
	level endon( "end_of_round" );
	level endon( "intermission" );
	level.dog_targets = sys::getplayers();

	for ( i = 0; i < level.dog_targets.size; i++ )
		level.dog_targets[i].hunted_by = 0;

/#
	level endon( "kill_round" );

	if ( getdvarint( #"zombie_cheat" ) == 2 || getdvarint( #"zombie_cheat" ) >= 4 )
		return;
#/

	if ( level.intermission )
		return;

	level.music_round_override = 1;
	maps\mp\zombies\_zm_ai_dogs::dog_round_start();

	level.dog_intermission = 1;
	level thread maps\mp\zombies\_zm_ai_dogs::dog_round_aftermath();
	players = sys::getplayers();
	array_thread( players, maps\mp\zombies\_zm_ai_dogs::play_dog_round );
	wait 1;
	playsoundatposition( game["zmbdialog"]["prefix"] + "_event_dogstart_0", ( 0, 0, 0 ) );
	wait 6;

	dog_health_increase();
	count = 0;
	while ( true )
	{
		while ( get_current_zombie_count() >= level.zombie_ai_limit || level.zombie_total <= 0 )
			wait 0.1;
		
		for ( num_player_valid = get_number_of_valid_players(); get_zombie_dog_count() >= num_player_valid * 2; num_player_valid = get_number_of_valid_players() )
			wait 2;

		players = sys::getplayers();
		favorite_enemy = maps\mp\zombies\_zm_ai_dogs::get_favorite_enemy();

		if ( isdefined( level.dog_spawn_func ) )
		{
			spawn_loc = [[ level.dog_spawn_func ]]( level.dog_spawners, favorite_enemy );
			ai = spawn_zombie( level.dog_spawners[0] );

			if ( isdefined( ai ) )
			{
				ai.favoriteenemy = favorite_enemy;
				spawn_loc thread maps\mp\zombies\_zm_ai_dogs::dog_spawn_fx( ai, spawn_loc );
				level.zombie_total--;
				count++;
			}
		}
		else
		{
			spawn_point = dog_spawn_factory_logic( level.enemy_dog_spawns, favorite_enemy );
			ai = spawn_zombie( level.dog_spawners[0] );

			if ( isdefined( ai ) )
			{
				ai.favoriteenemy = favorite_enemy;
				spawn_point thread maps\mp\zombies\_zm_ai_dogs::dog_spawn_fx( ai, spawn_point );
				level.zombie_total--;
				count++;
				flag_set( "dog_clips" );
			}
		}

		waiting_for_next_dog_spawn( count, max );
	}
}

round_wait()
{
	wait 7;

	while ( get_zombie_dog_count() > 0 || level.zombie_total > 0 || level.intermission )
	{
		wait 0.5;
	}

	increment_dog_round_stat( "finished" );
}

round_max()
{
	players = sys::getplayers();
	if ( level.dog_round_count < 3 )
		max = players.size * 6;
	else
		max = players.size * 8;

/#
	if ( getdvar( #"force_dogs" ) != "" )
		max = getdvarint( #"force_dogs" );
#/
	level.zombie_total = max;
}

round_chance()
{

	chance = getDvarInt( "rm_dog_round_chance" );

	return randomInt( 100 ) <= chance;
}

round_next()
{
	return level.special_round.last_data.round_number + randomintrange( getDvarInt( "rm_min_rounds_before_special_round" ), getDvarInt( "rm_max_rounds_before_special_round" ) );
}

waiting_for_next_dog_spawn( count, max )
{
	default_wait = 1.5;

	if ( level.dog_round_count == 1 )
		default_wait = 3;
	else if ( level.dog_round_count == 2 )
		default_wait = 2.5;
	else if ( level.dog_round_count == 3 )
		default_wait = 2;
	else
		default_wait = 1.5;

	default_wait = default_wait - count / max;
	wait( default_wait );
}

round_over()
{
	if ( !isDefined( level.dog_round_count ) )
	{
		level.dog_round_count = 1;
	}

	maps\mp\zombies\_zm_ai_dogs::dog_round_stop();
	level.music_round_override = 0;
	level.dog_round_count = level.dog_round_count + 1;
	flag_clear( "dog_round" );
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