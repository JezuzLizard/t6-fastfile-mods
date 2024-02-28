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

		ai = spawn_single_normal_zombie();

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

default_max_zombie_func( max_num )
{
/#
	count = getdvarint( #"zombie_default_max" );

	if ( count > -1 )
		return count;
#/
	max = max_num;

	if ( level.round_number < 2 )
		max = int( max_num * 0.25 );
	else if ( level.round_number < 3 )
		max = int( max_num * 0.3 );
	else if ( level.round_number < 4 )
		max = int( max_num * 0.5 );
	else if ( level.round_number < 5 )
		max = int( max_num * 0.7 );
	else if ( level.round_number < 6 )
		max = int( max_num * 0.9 );

	return max;
}

spawn_single_normal_zombie()
{
	ai = undefined;

	spawn_point = level.zombie_spawn_locations[randomint( level.zombie_spawn_locations.size )];

	if ( !isdefined( old_spawn ) )
		old_spawn = spawn_point;
	else if ( spawn_point == old_spawn )
		spawn_point = level.zombie_spawn_locations[randomint( level.zombie_spawn_locations.size )];

	old_spawn = spawn_point;

	if ( isdefined( level.zombie_spawners ) )
	{
		if ( isdefined( level.use_multiple_spawns ) && level.use_multiple_spawns )
		{
			if ( isdefined( spawn_point.script_int ) )
			{
				if ( isdefined( level.zombie_spawn[spawn_point.script_int] ) && level.zombie_spawn[spawn_point.script_int].size )
					spawner = random( level.zombie_spawn[spawn_point.script_int] );
				else
				{
/#
					assertmsg( "Wanting to spawn from zombie group " + spawn_point.script_int + "but it doens't exist" );
#/
				}
			}
			else if ( isdefined( level.zones[spawn_point.zone_name].script_int ) && level.zones[spawn_point.zone_name].script_int )
				spawner = random( level.zombie_spawn[level.zones[spawn_point.zone_name].script_int] );
			else if ( isdefined( level.spawner_int ) && ( isdefined( level.zombie_spawn[level.spawner_int].size ) && level.zombie_spawn[level.spawner_int].size ) )
				spawner = random( level.zombie_spawn[level.spawner_int] );
			else
				spawner = random( level.zombie_spawners );
		}
		else
			spawner = random( level.zombie_spawners );

		ai = spawn_zombie( spawner, spawner.targetname, spawn_point );
	}

	if ( isdefined( ai ) )
	{
		level.zombie_total--;
		ai thread round_spawn_failsafe();
	}

	return ai;
}