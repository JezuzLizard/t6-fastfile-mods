#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm;

#include scripts\zm\zm_ai_pack\_utility;

round_spawning()
{
	level endon( "intermission" );
	level endon( "end_of_round" );
	level endon( "restart_round" );
/#
	level endon( "kill_round" );
#/
	
	while ( true )
	{
		while ( level.intermission )
		{
			wait 1;
		}
		wait_for_free_ai_slot( ::get_all_ai_count );
		spawning_variant = scripts\zm\zm_ai_pack\_round_manager::pick_mixed_round_preset_variant( level.round_manager_spawning_preset.variants );

		level.round_manager_spawning_preset_current_variant = spawning_variant;
		if ( isdefined( spawning_variant ) )
		{
			if ( getdvarint( "zm_ai_pack_debug" ) > 0 )
			{
				print( "Round Manager: Running mixed preset <" + spawning_variant.preset_type + "> variant <" + spawning_variant.variant_type + ">" );
			}
			level [[ spawning_variant.spawning_func ]]();
		}

		wait_network_frame();
	}
}

round_wait()
{
	level endon( "restart_round" );
/#
	level endon( "kill_round" );
#/
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
			should_wait = get_all_ai_count() > 0 || level.zombie_total > 0 || level.intermission;

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
	ai_calculate_health( level.round_number );

	if ( level.round_number < 10 || level.speed_change_max > 0 )
		level thread zombie_speed_up();
	
	level.round_manager_spawning_preset = scripts\zm\zm_ai_pack\_round_manager::determine_mixed_round_preset();

	level [[ level.round_manager_spawning_preset.start_func ]]();

	variants = level.round_manager_spawning_preset.variants;
	variant_keys = getarraykeys( level.round_manager_spawning_preset.variants );
	for ( i = 0; i < variant_keys.size; i++ )
	{
		level [[ variants[ variant_keys[ i ] ].start_func ]]();
	}
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