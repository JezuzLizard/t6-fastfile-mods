#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm;

main()
{
	scripts\zm\zm_ai_pack\rounds\_dog_rounds::main();
	register_special_round( "zombie_dog", scripts\zm\zm_ai_pack\rounds\_dog_rounds::round_spawning,
										  scripts\zm\zm_ai_pack\rounds\_dog_rounds::round_wait,
										  scripts\zm\zm_ai_pack\rounds\_dog_rounds::round_max,
										  scripts\zm\zm_ai_pack\rounds\_dog_rounds::round_chance,
										  scripts\zm\zm_ai_pack\rounds\_dog_rounds::round_next );
}

register_special_round( round_type, round_difficulty_type, round_spawning_func, round_wait_func, round_max_func, round_chance_func, next_instance_func )
{
	if ( !isDefined( level.round_manager_special_rounds ) )
	{
		level.round_manager_special_rounds = [];
	}

	s = sys::spawnstruct();
	s.difficulty = round_difficulty_type;
	s.spawning_func = round_spawning_func;
	s.wait_func = round_wait_func;
	s.max_func = round_max_func;
	s.chance_func = round_chance_func;
	s.next_instance_func = next_instance_func;
	level.round_manager_special_rounds[ round_type ] = s;
}

register_special_spawning_during_normal_rounds_func( spawning_type, round_difficulty_type, spawning_func, spawning_portion_of_zombie_total_func, spawning_chance_func, spawning_limit_per_round_func, spawning_cooldown_func )
{
	if ( !isDefined( level.round_manager_normal_round_spawning_behaviors ) )
	{
		level.round_manager_normal_round_spawning_behaviors = [];
	}
	s = sys::spawnstruct();
	s.difficulty = round_difficulty_type;
	s.spawning_func = spawning_func;
	s.portion_of_zombie_total_func = spawning_portion_of_zombie_total_func;
	s.chance_func = spawning_chance_func;
	s.limit_per_round_func = spawning_limit_per_round_func;
	s.cooldown_func = spawning_cooldown_func;
	level.round_manager_normal_round_spawning_behaviors[ spawning_type ] = s;
}

get_zombie_dog_array()
{
	return getaispeciesarray( level.zombie_team, "zombie_dog" );
}

get_zombie_dog_count()
{
	return get_zombie_dog_array().size;
}

round_wait_override()
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

	if ( flag( "dog_round" ) )
	{
		wait 7;

		while ( get_zombie_dog_count() > 0 || level.zombie_total > 0 || level.intermission )
		{
			wait 0.5;
		}

		increment_dog_round_stat( "finished" );
	}
	else
	{
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
}

round_spawning_override()
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
	count = 0;
	players = get_players();

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

	if ( !( isdefined( level.kill_counter_hud ) && level.zombie_total > 0 ) )
	{
		level.zombie_total = [[ level.max_zombie_func ]]( max );
		level notify( "zombie_total_set" );
	}

	if ( isdefined( level.zombie_total_set_func ) )
		level thread [[ level.zombie_total_set_func ]]();

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
		spawn_point = level.zombie_spawn_locations[randomint( level.zombie_spawn_locations.size )];

		if ( !isdefined( old_spawn ) )
			old_spawn = spawn_point;
		else if ( spawn_point == old_spawn )
			spawn_point = level.zombie_spawn_locations[randomint( level.zombie_spawn_locations.size )];

		old_spawn = spawn_point;

		if ( isdefined( level.mixed_rounds_enabled ) && level.mixed_rounds_enabled == 1 )
		{
			spawn_dog = 0;

			if ( level.round_number > 30 )
			{
				if ( randomint( 100 ) < 3 )
					spawn_dog = 1;
			}
			else if ( level.round_number > 25 && mixed_spawns < 3 )
			{
				if ( randomint( 100 ) < 2 )
					spawn_dog = 1;
			}
			else if ( level.round_number > 20 && mixed_spawns < 2 )
			{
				if ( randomint( 100 ) < 2 )
					spawn_dog = 1;
			}
			else if ( level.round_number > 15 && mixed_spawns < 1 )
			{
				if ( randomint( 100 ) < 1 )
					spawn_dog = 1;
			}

			if ( spawn_dog )
			{
				keys = getarraykeys( level.zones );

				for ( i = 0; i < keys.size; i++ )
				{
					if ( level.zones[keys[i]].is_occupied )
					{
						akeys = getarraykeys( level.zones[keys[i]].adjacent_zones );

						for ( k = 0; k < akeys.size; k++ )
						{
							if ( level.zones[akeys[k]].is_active && !level.zones[akeys[k]].is_occupied && level.zones[akeys[k]].zombie_dog_locations.size > 0 )
							{
								maps\mp\zombies\_zm_ai_dogs::special_dog_spawn( undefined, 1 );
								level.zombie_total--;
								wait_network_frame();
							}
						}
					}
				}
			}
		}

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
			count++;
		}

		wait( level.zombie_vars["zombie_spawn_delay"] );
		wait_network_frame();
	}
}

round_tracker()
{
	level.dog_round_count = 1;
	level.next_dog_round = level.round_number + randomintrange( 4, 7 );
	old_spawn_func = level.round_spawn_func;
	old_wait_func = level.round_wait_func;

	while ( true )
	{
		level waittill( "between_round_over" );
/#
		if ( getdvarint( #"force_dogs" ) > 0 )
			level.next_dog_round = level.round_number;
#/

		if ( level.round_number == level.next_dog_round )
		{
			level.music_round_override = 1;
			old_spawn_func = level.round_spawn_func;
			old_wait_func = level.round_wait_func;
			dog_round_start();
			level.round_spawn_func = ::dog_round_spawning;
			level.next_dog_round = level.round_number + randomintrange( 4, 6 );
/#
			sys::getplayers()[0] iprintln( "Next dog round: " + level.next_dog_round );
#/
		}
		else if ( flag( "dog_round" ) )
		{
			dog_round_stop();
			level.round_spawn_func = old_spawn_func;
			level.round_wait_func = old_wait_func;
			level.music_round_override = 0;
			level.dog_round_count = level.dog_round_count + 1;
		}
	}
}

round_think_override( restart )
{
	if ( !isdefined( restart ) )
		restart = 0;

/#
	println( "ZM >> round_think start" );
#/
	level endon( "end_round_think" );

	if ( !( isdefined( restart ) && restart ) )
	{
		if ( isdefined( level.initial_round_wait_func ) )
			[[ level.initial_round_wait_func ]]();

		if ( !( isdefined( level.host_ended_game ) && level.host_ended_game ) )
		{
			players = get_players();

			foreach ( player in players )
			{
				if ( !( isdefined( player.hostmigrationcontrolsfrozen ) && player.hostmigrationcontrolsfrozen ) )
				{
					player freezecontrols( 0 );
/#
					println( " Unfreeze controls 8" );
#/
				}

				player maps\mp\zombies\_zm_stats::set_global_stat( "rounds", level.round_number );
			}
		}
	}

	setroundsplayed( level.round_number );

	for (;;)
	{
		maxreward = 50 * level.round_number;

		if ( maxreward > 500 )
			maxreward = 500;

		level.zombie_vars["rebuild_barrier_cap_per_round"] = maxreward;
		level.pro_tips_start_time = gettime();
		level.zombie_last_run_time = gettime();

		if ( isdefined( level.zombie_round_change_custom ) )
			[[ level.zombie_round_change_custom ]]();
		else
		{
			level thread maps\mp\zombies\_zm_audio::change_zombie_music( "round_start" );
			round_one_up();
		}

		maps\mp\zombies\_zm_powerups::powerup_round_start();
		players = get_players();
		array_thread( players, maps\mp\zombies\_zm_blockers::rebuild_barrier_reward_reset );

		if ( !( isdefined( level.headshots_only ) && level.headshots_only ) && !restart )
			level thread award_grenades_for_survivors();

		bbprint( "zombie_rounds", "round %d player_count %d", level.round_number, players.size );
/#
		println( "ZM >> round_think, round=" + level.round_number + ", player_count=" + players.size );
#/
		level.round_start_time = gettime();

		while ( level.zombie_spawn_locations.size <= 0 )
			wait 0.1;

		level thread [[ level.round_spawn_func ]]();
		level notify( "start_of_round" );
		recordzombieroundstart();
		players = getplayers();

		for ( index = 0; index < players.size; index++ )
		{
			zonename = players[index] get_current_zone();

			if ( isdefined( zonename ) )
				players[index] recordzombiezone( "startingZone", zonename );
		}

		if ( isdefined( level.round_start_custom_func ) )
			[[ level.round_start_custom_func ]]();

		[[ level.round_wait_func ]]();
		level.first_round = 0;
		level notify( "end_of_round" );
		level thread maps\mp\zombies\_zm_audio::change_zombie_music( "round_end" );
		uploadstats();

		if ( isdefined( level.round_end_custom_logic ) )
			[[ level.round_end_custom_logic ]]();

		players = get_players();

		if ( isdefined( level.no_end_game_check ) && level.no_end_game_check )
		{
			level thread last_stand_revive();
			level thread spectators_respawn();
		}
		else if ( 1 != players.size )
			level thread spectators_respawn();

		players = get_players();
		array_thread( players, maps\mp\zombies\_zm_pers_upgrades_system::round_end );
		timer = level.zombie_vars["zombie_spawn_delay"];

		if ( timer > 0.08 )
			level.zombie_vars["zombie_spawn_delay"] = timer * 0.95;
		else if ( timer < 0.08 )
			level.zombie_vars["zombie_spawn_delay"] = 0.08;

		if ( level.gamedifficulty == 0 )
			level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier_easy"];
		else
			level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier"];

		level.round_number++;

		if ( 255 < level.round_number )
			level.round_number = 255;

		setroundsplayed( level.round_number );
		matchutctime = getutc();
		players = get_players();

		foreach ( player in players )
		{
			if ( level.curr_gametype_affects_rank && level.round_number > 3 + level.start_round )
				player maps\mp\zombies\_zm_stats::add_client_stat( "weighted_rounds_played", level.round_number );

			player maps\mp\zombies\_zm_stats::set_global_stat( "rounds", level.round_number );
			player maps\mp\zombies\_zm_stats::update_playing_utc_time( matchutctime );
		}

		check_quickrevive_for_hotjoin();
		level round_over();
		level notify( "between_round_over" );
		restart = 0;
	}
}