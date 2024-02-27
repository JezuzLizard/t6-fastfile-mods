#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm;

main()
{
	set_dvar_if_unset( "rm_min_rounds_before_special_round", 3 );
	set_dvar_if_unset( "rm_max_rounds_before_special_round", 5 );
	set_dvar_if_unset( "rm_special_round_chance", 33 );
	set_dvar_if_unset( "rm_allow_same_round_as_last_round", 1 );

	set_dvar_if_unset( "rm_allowed_special_rounds", "normal zombie_dog mechz" );
	set_dvar_if_unset( "rm_allowed_special_round_variants", "default" );
	set_dvar_if_unset( "rm_forced_special_round", "" );
	set_dvar_if_unset( "rm_forced_special_variant", "" );

	level.special_round = sys::spawnstruct();
	level.special_round.current_data = sys::spawnstruct();
	level.special_round.current_data.round_type = "";
	level.special_round.current_data.variant = "";
	level.special_round.current_data.round_number = 0;
	level.special_round.last_data = sys::spawnstruct();
	level.special_round.last_data.round_type = "";
	level.special_round.last_data.variant = "";
	level.special_round.last_data.round_number = 0;
	level.normal_round = sys::spawnstruct();
	level.normal_round.current_data = sys::spawnstruct();
	level.normal_round.current_data.round_type = "";
	level.normal_round.current_data.variant = "";

	scripts\zm\zm_ai_pack\rounds\_zombie_dog::main();
	scripts\zm\zm_ai_pack\rounds\_mechz::main();

	register_special_round( "zombie_dog", "default",
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_spawning,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_wait,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_max,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_start,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_over,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_chance,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_next );

	register_special_round( "zombie_dog", "rush",
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_spawning_rush,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_wait,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_max_rush,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_start,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_over,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_chance_rush,
										  scripts\zm\zm_ai_pack\rounds\_zombie_dog::round_next_rush );

	register_special_round( "mechz", "default",
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_spawning,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_wait,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_max,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_start,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_over,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_chance,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_next );

	register_special_round( "mechz", "rush",
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_spawning_rush,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_wait,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_max_rush,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_start,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_over,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_chance_rush,
										  scripts\zm\zm_ai_pack\rounds\_mechz::round_next_rush );

	register_special_round( "normal", "default",
										  scripts\zm\zm_ai_pack\rounds\_normal::round_spawning,
										  scripts\zm\zm_ai_pack\rounds\_normal::round_wait,
										  scripts\zm\zm_ai_pack\rounds\_normal::round_max,
										  scripts\zm\zm_ai_pack\rounds\_normal::round_start,
										  scripts\zm\zm_ai_pack\rounds\_normal::round_over,
										  scripts\zm\zm_ai_pack\rounds\_normal::round_chance,
										  scripts\zm\zm_ai_pack\rounds\_normal::round_next );

	//Future variants
	// random - random ais, true_random - random ais + random behavior and stats
	// elemental?
	// durable
	// waves for mixed round_type
	// several default presets to cycle through
}

register_special_round( round_type, variant_type, round_spawning_func, round_wait_func, round_max_func, round_start_func, between_round_over_func, round_chance_func, next_instance_func )
{
	if ( !isDefined( level.round_manager_special_rounds ) )
	{
		level.round_manager_special_rounds = [];
	}

	if ( !isDefined( level.round_manager_special_rounds[ round_type ] ) )
	{
		level.round_manager_special_rounds[ round_type ] = [];
	}

	s = sys::spawnstruct();
	s.spawning_func = round_spawning_func;
	s.wait_func = round_wait_func;
	s.max_func = round_max_func;
	s.start_func = round_start_func;
	s.between_round_over_func = between_round_over_func;
	s.chance_func = round_chance_func;
	s.next_instance_func = next_instance_func;
	s.active = false;
	level.round_manager_special_rounds[ round_type ][ variant_type ] = s;
}

register_mixed_round_spawning_behavior( spawning_type, variant_type, spawning_func, spawning_portion_of_zombie_total_func, spawning_chance_func, spawning_limit_per_round_func, spawning_cooldown_func )
{
	if ( !isDefined( level.round_manager_normal_round_spawning_behaviors ) )
	{
		level.round_manager_normal_round_spawning_behaviors = [];
	}

	if ( !isDefined( level.round_manager_normal_round_spawning_behaviors[ spawning_type ] ) )
	{
		level.round_manager_normal_round_spawning_behaviors[ spawning_type ] = [];
	}
	s = sys::spawnstruct();
	s.spawning_func = spawning_func;
	s.portion_of_zombie_total_func = spawning_portion_of_zombie_total_func;
	s.chance_func = spawning_chance_func;
	s.limit_per_round_func = spawning_limit_per_round_func;
	s.cooldown_func = spawning_cooldown_func;
	level.round_manager_normal_round_spawning_behaviors[ spawning_type ][ variant_type ] = s;
}

should_do_special_round()
{
	if ( getDvar( "rm_forced_special_round" ) != "" && getdvar( "rm_forced_special_variant" ) )
	{
		return true;
	}

	special_round_string = getDvar( "rm_allowed_special_rounds" );

	if ( special_round_string == "" || special_round_string == "normal" )
	{
		return false;
	}

	normal_exists = false;
	special_round_types = strTok( special_round_string, " " );
	for ( i = 0; i < special_round_types.size; i++ )
	{
		if ( special_round_types[ i ] == "normal" )
		{
			normal_exists = true;
		}
	}

	if ( !normal_exists )
	{
		return true;
	}

	min_round = getDvarInt( "rm_min_rounds_before_special_round" );
	max_round = getDvarInt( "rm_max_rounds_before_special_round" );

	chance = getDvarInt( "rm_special_round_chance" );

	special_round_diff = level.round_number - level.special_round.last_data.round_number;

	if ( special_round_diff >= max_round )
	{
		return true;
	}

	if ( special_round_diff >= min_round )
	{
		return randomInt( 100 ) <= chance;
	}

	return false;
}

determine_current_round_type()
{
	return_value = sys::spawnstruct();
	return_value.round_number = level.round_number;

	level.special_round.last_data = level.special_round.current_data;

	forced_special_round = getdvar( "rm_forced_special_round" );
	forced_variant = getdvar( "rm_forced_special_variant" );
	if ( forced_special_round != "" && forced_variant != "" )
	{
		if ( !isDefined( level.round_manager_special_rounds[ forced_special_round ] ) || !isDefined( level.round_manager_special_rounds[ forced_special_round ][ forced_variant ] ) )
		{
			print( "Round Manager ERROR: Can't set special round and variant to " + forced_special_round + " and " + forced_variant + " because it wasn't registered" );
			assert( false );
		}
		else
		{
			return_value.round_type = forced_special_round;
			return_value.variant = forced_variant;
			level.special_round.current_data = return_value;
			return level.special_round.current_data;
		}
	}

	should_do_special_round = should_do_special_round();

	if ( !should_do_special_round || !isDefined( level.round_manager_special_rounds ) || level.round_manager_special_rounds.size <= 0 )
	{
		return_value.round_type = "normal";
		return_value.variant = "default";
		level.normal_round.current_data = return_value;
		return level.normal_round.current_data;
	}

	allowed_round_string = getDvar( "rm_allowed_special_rounds" );

	variant_string = getdvar( "rm_allowed_special_round_variants" );
	pick_default_variant = variant_string == "" || variant_string == "default";
	possible_round_types_keys = strTok( allowed_round_string, " " );
	if ( !pick_default_variant )
	{
		possible_variants_keys = strTok( variant_string, " " );
	}
	else
	{
		possible_variants_keys = [];
		possible_variants_keys[ 0 ] = "default";
	}
	
	max_iterations = 50;
	current_iterations = 0;

	allow_repeats = getDvarInt( "rm_allow_same_round_as_last_round" ) != 0;
	for (;;)
	{
		possible_round_types = array_randomize( possible_round_types_keys );
		for ( i = 0; i < possible_round_types.size; i++ )
		{
			assert( isDefined( level.round_manager_special_rounds[ possible_round_types[ i ] ] ) );
			possible_variants = array_randomize( possible_variants_keys );

			if ( !allow_repeats && possible_round_types.size > 1 && possible_round_types[ i ] == level.special_round.last_data.round_type )
			{
				continue;
			}

			assert( possible_variants.size > 0 );

			for ( j = 0; j < possible_variants.size; j++ )
			{
				assert( isDefined( level.round_manager_special_rounds[ possible_round_types[ i ] ][ possible_variants[ j ] ] ) );

				if ( possible_round_types.size <= 1 || [[ level.round_manager_special_rounds[ possible_round_types[ i ] ][ possible_variants[ j ] ].chance_func ]]()
					&& [[ level.round_manager_special_rounds[ possible_round_types[ i ] ][ possible_variants[ j ] ].next_instance_func ]]() <= level.round_number )
				{
					return_value.round_type = possible_round_types[ i ];
					return_value.variant = possible_variants[ j ];
					level.special_round.current_data = return_value;
					return level.special_round.current_data;
				}
			}
		}

		current_iterations++;

		if ( current_iterations >= max_iterations )
		{
			assertmsg( "Round Manager ERROR: Reached max iterations for picking round type" );
			return_value.round_type = possible_round_types[ 0 ];
			return_value.variant = "default";
			level.special_round.current_data = return_value;
			return level.special_round.current_data;
		}
	}
}

get_zombie_dog_array()
{
	return getaispeciesarray( level.zombie_team, "zombie_dog" );
}

get_zombie_dog_count()
{
	return get_zombie_dog_array().size;
}

get_mechz_array()
{
	zombies = getaiarray( level.zombie_team );
	mechz = [];
	for ( i = 0; i < zombies.size; i++ )
	{
		if ( isdefined( zombies[ i ].animname ) && zombies[ i ].animname == "mechz_zombie" )
		{
			mechz[ mechz.size ] = zombies[ i ];
		}
	}

	return mechz;
}

get_mechz_count()
{
	return get_mechz_array().size;
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
		current_round_data = determine_current_round_type();

		round_manager_inst = level.round_manager_special_rounds[ current_round_data.round_type ][ current_round_data.variant ];

		level [[ round_manager_inst.start_func ]]();

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
		players = sys::getplayers();
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

		level.round_manager_special_rounds[ current_round_data.round_type ][ current_round_data.variant ].active = true;
		level [[ round_manager_inst.max_func ]]();
		level thread [[ round_manager_inst.spawning_func ]]();
		//level thread [[ level.round_spawn_func ]]();
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

		level [[ round_manager_inst.wait_func ]]();
		//[[ level.round_wait_func ]]();
		level.first_round = 0;
		level notify( "end_of_round" );
		level thread maps\mp\zombies\_zm_audio::change_zombie_music( "round_end" );
		uploadstats();

		if ( isdefined( level.round_end_custom_logic ) )
			[[ level.round_end_custom_logic ]]();

		players = sys::getplayers();

		if ( isdefined( level.no_end_game_check ) && level.no_end_game_check )
		{
			level thread last_stand_revive();
			level thread spectators_respawn();
		}
		else if ( 1 != players.size )
			level thread spectators_respawn();

		players = sys::getplayers();
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
		players = sys::getplayers();

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
		level.round_manager_special_rounds[ current_round_data.round_type ][ current_round_data.variant ].active = false;
		level [[ round_manager_inst.between_round_over_func ]]();
		restart = 0;
	}
}