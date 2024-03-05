#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm_ai_leaper;

#include scripts\zm\zm_ai_pack\_round_manager;
#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_leaper_round_chance", 40 );

	set_dvar_if_unset( "rm_leaper_rush_min_round", 20 );
	set_dvar_if_unset( "rm_leaper_rush_round_chance", 10 );
	set_dvar_if_unset( "rm_leaper_rush_max_leapers_alive_per_player", 6 );
	set_dvar_if_unset( "rm_leaper_rush_max_leapers_round", 64 );
	set_dvar_if_unset( "rm_leaper_rush_max_leapers_round_per_player", 4 );
	set_dvar_if_unset( "rm_leaper_rush_max_leapers_round_base", 24 );
	set_dvar_if_unset( "rm_leaper_rush_max_leapers_round_number_multiplier", 0.1 );
	set_dvar_if_unset( "rm_leaper_rush_max_spawn_wait", 0.5 );
	set_dvar_if_unset( "rm_leaper_rush_min_spawn_wait", 0.1 );
}

round_spawning()
{
	level endon( "intermission" );
	level endon( "end_of_round" );
	level endon( "restart_round" );
/#
	level endon( "kill_round" );

	while ( getdvarint( #"zombie_cheat" ) == 2 || getdvarint( #"zombie_cheat" ) >= 4 )
		wait 1;
#/

	count = 0;
	max = level.zombie_total;
	while ( true )
	{
		while ( get_leaper_count() >= level.zombie_ai_limit || level.zombie_total <= 0 || level.intermission )
			wait 0.1;
		
		for ( num_player_valid = get_number_of_valid_players(); get_leaper_count() >= num_player_valid * 2; num_player_valid = get_number_of_valid_players() )
			wait 2;
		
		count = spawn_leaper( count );

		waiting_for_next_leaper_spawn( count, max );
	}
}

round_wait()
{
	level endon( "restart_round" );
/#
	level endon( "kill_round" );

	while ( getdvarint( #"zombie_cheat" ) == 2 || getdvarint( #"zombie_cheat" ) >= 4 )
		wait 1;
#/
	wait 7;

	while ( get_leaper_count() > 0 || level.zombie_total > 0 || level.intermission )
	{
		wait 0.5;
	}
}

round_max()
{
	players = sys::getplayers();
	if ( level.special_round_count < 3 )
		max = players.size * level.leapers_per_player;
	else
		max = players.size * level.leapers_per_player;

	level.zombie_total = max;
}

round_start()
{
	level.leaper_targets = sys::getplayers();

	for ( i = 0; i < level.leaper_targets.size; i++ )
		level.leaper_targets[i].hunted_by = 0;
	level.music_round_override = 1;
	level thread maps\mp\zombies\_zm_ai_leaper::leaper_round_start();
	level thread maps\mp\zombies\_zm_ai_leaper::leaper_round_accuracy_tracking();
	level thread leaper_round_aftermath();
	wait 1;
	prefix = "vox_zmba";
	if ( !level.sndannouncerisrich || level.script == "zm_prison" || level.script == "zm_tomb" )
	{
		prefix = "vox_zmba_sam";
	}
	playsoundatposition( prefix + "_event_dogstart_0", ( 0, 0, 0 ) );
	wait 1;
}

round_over()
{
	maps\mp\zombies\_zm_ai_leaper::leaper_round_stop();
	level.music_round_override = 0;
}

round_chance()
{
	chance = getDvarInt( "rm_leaper_round_chance" );

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
		while ( get_leaper_count() >= level.zombie_ai_limit || get_leaper_count() >= ( getdvarint( "rm_leaper_rush_max_leapers_alive_per_player" ) * level.players.size ) 
		|| level.zombie_total <= 0 || level.intermission )
			wait 0.1;

		count = spawn_leaper( count );

		waiting_for_next_leaper_spawn_rush( count, max );
	}
}

round_max_rush()
{
	players = sys::getplayers();

	leaper_max = getdvarint( "rm_leaper_rush_max_leapers_round_base" );

	leaper_max += players.size * getdvarint( "rm_leaper_rush_max_leapers_round_per_player" );

	leaper_max *= int( level.round_number * getdvarfloat( "rm_leaper_rush_max_leapers_round_number_multiplier" ) );

	max = getdvarint( "rm_leaper_rush_max_leapers_round" );
	if ( leaper_max > max )
	{
		leaper_max = max;
	}
	if ( leaper_max <= 0 )
	{
		leaper_max = 6;
	}

	leaper_max = int( leaper_max );
	level.zombie_total = leaper_max;
}

round_chance_rush()
{
	if ( level.round_number < getdvarint( "rm_leaper_rush_min_round" ) )
	{
		return false;
	}

	return randomint( 100 ) <= getdvarint( "rm_leaper_rush_round_chance" );
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

waiting_for_next_leaper_spawn_rush( count, max )
{
	default_wait = getdvarfloat( "rm_leaper_rush_max_spawn_wait" );

	default_wait = default_wait - ( ( count / max ) * 2 );
	min_wait = getdvarfloat( "rm_leaper_rush_min_spawn_wait" );
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

spawn_leaper( count )
{
	ai = spawn_single_leaper();

	if ( isdefined( ai ) )
	{
		count++;
	}

	return count;
}

spawn_single_leaper( starting_properties_struct )
{
	players = sys::getplayers();
	favorite_enemy = get_favorite_enemy();
	spawn_point = leaper_spawn_logic( level.enemy_dog_spawns, favorite_enemy );
	ai = spawn_zombie( level.leaper_spawners[0] );

	if ( isdefined( ai ) )
	{
		ai set_starting_properties_for_ai( starting_properties_struct );
		ai.favoriteenemy = favorite_enemy;
		ai.spawn_point = spawn_point;
		spawn_point thread leaper_spawn_fx( ai, spawn_point );
		level.zombie_total--;
	}

	return ai;
}

leaper_round_spawning()
{

}

leaper_spawn_logic( leaper_array, favorite_enemy )
{
	a_zones_active = level.active_zone_names;
	a_zones_occupied = [];

	foreach ( zone in a_zones_active )
	{
		if ( level.zones[zone].is_occupied )
			a_zones_occupied[a_zones_occupied.size] = zone;
	}

	a_leaper_spawn_points = [];

	foreach ( zone in a_zones_occupied )
		a_leaper_spawn_points = arraycombine( a_leaper_spawn_points, level.zones[zone].leaper_locations, 0, 0 );

	if ( a_leaper_spawn_points.size == 0 )
	{
		foreach ( zone in a_zones_active )
			a_leaper_spawn_points = arraycombine( a_leaper_spawn_points, level.zones[zone].leaper_locations, 0, 0 );
	}

	if ( a_leaper_spawn_points.size == 0 )
	{
		str_zone_list_occupied = "";
		a_keys_error = getarraykeys( a_zones_occupied );

		foreach ( key in a_zones_occupied )
			str_zone_list_occupied = str_zone_list_occupied + "  " + key;

		str_zone_list_active = "";
		a_keys_error = getarraykeys( a_zones_active );

		foreach ( key in a_zones_active )
			str_zone_list_active = str_zone_list_active + "  " + key;

/#
		assertmsg( "No leaper spawn locations were found in any of the occupied or active zones. Occupied zones: " + str_zone_list_occupied + ". Active zones: " + str_zone_list_active );
#/
	}

	s_leaper_spawn_point = select_leaper_spawn_point( a_leaper_spawn_points );
	return s_leaper_spawn_point;
}

select_leaper_spawn_point( a_spawn_points )
{
	a_valid_nodes = get_valid_spawner_array( a_spawn_points );

	if ( a_valid_nodes.size == 0 )
	{
/#
		iprintln( "All leaper spawns used...resetting" );
#/

		for ( i = 0; i < a_spawn_points.size; i++ )
			a_spawn_points[i].has_spawned_leaper_this_round = 0;

		a_valid_nodes = get_valid_spawner_array( a_spawn_points );
	}

	if ( a_valid_nodes.size > 0 )
	{
		s_spawn_point = random( a_valid_nodes );
		s_spawn_point.has_spawned_leaper_this_round = 1;
	}
	else
	{
/#
		iprintln( "DEBUG: no valid leaper spawns available" );
#/
		s_spawn_point = a_spawn_points[0];
	}

	return s_spawn_point;
}

get_valid_spawner_array( a_spawn_points )
{
	a_valid_nodes = [];

	for ( i = 0; i < a_spawn_points.size; i++ )
	{
		if ( isdefined( a_spawn_points[i].is_blocked ) && a_spawn_points[i].is_blocked || !( isdefined( a_spawn_points[i].is_enabled ) && a_spawn_points[i].is_enabled ) || isdefined( a_spawn_points[i].is_spawning ) && a_spawn_points[i].is_spawning )
			continue;

		if ( !isdefined( a_spawn_points[i].has_spawned_leaper_this_round ) )
			a_spawn_points[i].has_spawned_leaper_this_round = 0;

		if ( !a_spawn_points[i].has_spawned_leaper_this_round )
			a_valid_nodes[a_valid_nodes.size] = a_spawn_points[i];
	}

	return a_valid_nodes;
}

waiting_for_next_leaper_spawn( count, max )
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
	default_wait = clamp( default_wait, 0, 3 );
	wait( default_wait );
}