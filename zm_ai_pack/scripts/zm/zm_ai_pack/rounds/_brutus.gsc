#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm_ai_mechz;

#include scripts\zm\zm_ai_pack\_round_manager;
#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_brutus_round_chance", 10 );
	set_dvar_if_unset( "rm_brutus_min_round", 8 );
	set_dvar_if_unset( "rm_brutus_initial_round_wait_min", 10.0 );
	set_dvar_if_unset( "rm_brutus_initial_round_wait_max", 60.0 );
	set_dvar_if_unset( "rm_brutus_max_brutus_alive", 6 );

	set_dvar_if_unset( "rm_brutus_rush_round_chance", 6 );
	set_dvar_if_unset( "rm_brutus_rush_min_round", 30 );
	set_dvar_if_unset( "rm_brutus_rush_min_spawn_wait", 1.5 );
	set_dvar_if_unset( "rm_brutus_rush_max_spawn_wait", 2.5 );
	set_dvar_if_unset( "rm_brutus_rush_max_brutus_alive", 12 );
	set_dvar_if_unset( "rm_brutus_rush_max_brutus_round", 12 );
	set_dvar_if_unset( "rm_brutus_rush_max_health_multiplier", 0.5 );
}

round_spawning_common()
{
	initial_wait = getdvarint( "rm_brutus_initial_round_wait" );
	wait( randomfloatrange( initial_wait, initial_wait + 5.0 ) );
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
		while ( get_brutus_count() >= level.zombie_ai_limit || get_brutus_count() >= getdvarint( "rm_brutus_max_brutus_alive" ) || level.zombie_total <= 0 )
			wait 0.1;

		while ( get_current_actor_count() >= level.zombie_actor_limit )
		{
			clear_all_corpses();
			wait 0.1;
		}

		flag_wait( "spawn_zombies" );

		ai = spawn_single_brutus();

		wait( randomfloatrange( 3.0, 6.0 ) );
	}
}

round_wait()
{
	level endon( "restart_round" );
/#
	level endon( "kill_round" );
#/
/#
	while ( getdvarint( #"zombie_cheat" ) == 2 || getdvarint( #"zombie_cheat" ) >= 4 )
		wait 1;
#/
	wait 1;

	while ( true )
	{
		should_wait = get_brutus_count() > 0 || level.zombie_total > 0 || level.intermission;

		if ( !should_wait )
			return;

		wait 1.0;
	}
}

round_max()
{
	level.zombie_total = getdvarint( "rm_brutus_max_brutus_alive" );
}

round_start()
{
	
}

round_over()
{
}

round_chance()
{
	if ( level.round_number < getdvarint( "rm_brutus_min_round" ) )
	{
		return false;
	}

	return randomint( 100 ) <= getdvarint( "rm_brutus_round_chance" );
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
		while ( get_brutus_count() >= level.zombie_ai_limit || get_brutus_count() >= getdvarint( "rm_brutus_rush_max_brutus_alive" ) || level.zombie_total <= 0 )
			wait 0.1;

		while ( get_current_actor_count() >= level.zombie_actor_limit )
		{
			clear_all_corpses();
			wait 0.1;
		}

		flag_wait( "spawn_zombies" );

		starting_properties = sys::spawnstruct();
		starting_properties.health = int( level.brutus_health * getdvarfloat( "rm_brutus_rush_max_health_multiplier" ) );
		ai = spawn_single_brutus( starting_properties );

		wait( randomfloatrange( getdvarfloat( "rm_brutus_rush_min_spawn_wait" ), getdvarfloat( "rm_brutus_rush_min_spawn_wait" ) + 0.05 ) );
	}
}

round_max_rush()
{
	level.zombie_total = getdvarint( "rm_brutus_rush_max_brutus_round" );
}

round_chance_rush()
{
	if ( level.round_number < getdvarint( "rm_brutus_rush_min_round" ) )
	{
		return false;
	}

	return randomint( 100 ) <= getdvarint( "rm_brutus_rush_round_chance" );
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

spawn_single_brutus( starting_properties )
{
	ai = spawn_zombie( level.brutus_spawners[ 0 ] );

	if ( isdefined( ai ) )
	{
		level.zombie_total--;
		
		ai set_starting_properties_for_ai( starting_properties );
		ai sys::playsound( "zmb_ai_brutus_spawn_2d" );
		ai thread maps\mp\zombies\_zm_ai_brutus::brutus_spawn();
	}

	return ai;
}