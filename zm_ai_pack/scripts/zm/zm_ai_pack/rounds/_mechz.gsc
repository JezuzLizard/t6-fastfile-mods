#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm_ai_mechz;

#include scripts\zm\zm_ai_pack\_round_manager;
#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_mechz_round_chance", 10 );
	set_dvar_if_unset( "rm_mechz_min_round", 8 );
	set_dvar_if_unset( "rm_mechz_initial_round_wait", 5.0 );
	set_dvar_if_unset( "rm_mechz_max_mechz_alive", 3 );

	set_dvar_if_unset( "rm_mechz_rush_round_chance", 6 );
	set_dvar_if_unset( "rm_mechz_rush_min_round", 45 );
	set_dvar_if_unset( "rm_mechz_rush_min_spawn_wait", 1.5 );
	set_dvar_if_unset( "rm_mechz_rush_max_spawn_wait", 2.5 );
	set_dvar_if_unset( "rm_mechz_rush_max_mechz_alive", 12 );
	set_dvar_if_unset( "rm_mechz_rush_max_mechz_round", 12 );
	set_dvar_if_unset( "rm_mechz_rush_max_health_multiplier", 0.5 );
}

round_spawning_common()
{

	while ( !isdefined( level.zombie_mechz_locations ) )
		wait 0.05;

	initial_wait = getdvarint( "rm_mechz_initial_round_wait" );
	wait( randomfloatrange( initial_wait, initial_wait + 5.0 ) );

	level.mechz_should_drop_powerup = true;
}

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
	
	round_spawning_common();

	for (;;)
	{
		while ( get_mechz_count() >= level.zombie_ai_limit || get_mechz_count() >= getdvarint( "rm_mechz_max_mechz_alive" ) || level.zombie_total <= 0 )
			wait 0.1;

		while ( get_current_actor_count() >= level.zombie_actor_limit )
		{
			clear_all_corpses();
			wait 0.1;
		}

		flag_wait( "spawn_zombies" );

		while ( level.zombie_mechz_locations.size < 1 )
			wait( randomfloatrange( 5.0, 10.0 ) );

		ai = spawn_single_mechz();

		if ( level.mechz_left_to_spawn == 0 )
			level thread maps\mp\zombies\_zm_ai_mechz::response_to_air_raid_siren_vo();

		ai thread maps\mp\zombies\_zm_ai_mechz::mechz_hint_vo();
		wait( randomfloatrange( 3.0, 6.0 ) );
	}
}

round_wait()
{
	level endon( "restart_round" );
/#
	while ( getdvarint( #"zombie_cheat" ) == 2 || getdvarint( #"zombie_cheat" ) >= 4 )
		wait 1;
#/
	wait 1;

	while ( true )
	{
		should_wait = get_mechz_count() > 0 || level.zombie_total > 0 || level.intermission;

		if ( !should_wait )
			return;

		wait 1.0;
	}
}

round_max()
{
	if ( isdefined( level.is_forever_solo_game ) && level.is_forever_solo_game )
		level.mechz_zombie_per_round = 1;
	else if ( level.mechz_round_count < 2 )
		level.mechz_zombie_per_round = 1;
	else if ( level.mechz_round_count < 5 )
		level.mechz_zombie_per_round = 2;
	else
		level.mechz_zombie_per_round = 3;

	level.zombie_total = level.mechz_zombie_per_round;
	level.mechz_left_to_spawn = level.zombie_total;
}

round_start()
{
	
}

round_over()
{
	maps\mp\zombies\_zm_ai_mechz::mechz_health_increases();
	level.mechz_round_count++;
	maps\mp\zombies\_zm_ai_mechz::mechz_clear_spawns();
}

round_chance()
{
	if ( flag_exists( "activate_zone_nml" ) && !flag( "activate_zone_nml" ) )
	{
		return false;
	}

	if ( level.round_number < getdvarint( "rm_mechz_min_round" ) )
	{
		return false;
	}

	return randomint( 100 ) <= getdvarint( "rm_mechz_round_chance" );
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
	round_spawning_common();

	for (;;)
	{
		while ( get_mechz_count() >= level.zombie_ai_limit || get_mechz_count() >= getdvarint( "rm_mechz_rush_max_mechz_alive" ) || level.zombie_total <= 0 )
			wait 0.1;

		while ( get_current_actor_count() >= level.zombie_actor_limit )
		{
			clear_all_corpses();
			wait 0.1;
		}

		flag_wait( "spawn_zombies" );

		while ( level.zombie_mechz_locations.size < 1 )
			wait( randomfloatrange( 5.0, 10.0 ) );

		starting_properties = sys::spawnstruct();
		starting_properties.health = int( level.mechz_health * getdvarfloat( "rm_mechz_rush_max_health_multiplier" ) );
		ai = spawn_single_mechz( starting_properties );

		if ( level.mechz_left_to_spawn == 0 )
			level thread maps\mp\zombies\_zm_ai_mechz::response_to_air_raid_siren_vo();

		ai thread maps\mp\zombies\_zm_ai_mechz::mechz_hint_vo();
		wait( randomfloatrange( getdvarfloat( "rm_mechz_rush_min_spawn_wait" ), getdvarfloat( "rm_mechz_rush_min_spawn_wait" ) + 0.05 ) );
	}
}

round_max_rush()
{
	level.zombie_total = getdvarint( "rm_mechz_rush_max_mechz_round" );
	level.mechz_left_to_spawn = level.zombie_total;
}

round_chance_rush()
{
	if ( flag_exists( "activate_zone_nml" ) && !flag( "activate_zone_nml" ) )
	{
		return false;
	}

	if ( level.round_number < getdvarint( "rm_mechz_rush_min_round" ) )
	{
		return false;
	}

	return randomint( 100 ) <= getdvarint( "rm_mechz_rush_round_chance" );
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

spawn_single_mechz( starting_properties )
{
	ai = spawn_zombie( level.mechz_spawners[0] );

	ai scripts\zm\zm_ai_pack\_round_manager::set_starting_properties_for_ai( starting_properties );

	ai thread maps\mp\zombies\_zm_ai_mechz::mechz_spawn();
	if ( isdefined( ai ) )
	{
		level.mechz_left_to_spawn--;
		level.zombie_total--;
	}

	return ai;
}