#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include scripts\zm\zm_ai_pack\_utility;

main()
{

}

preset_chance()
{
	return true;
}

round_start()
{
	level.round_manager_spawn_count = 0;
}

spawn_wave( type, custom_starting_properties, wait_for_room = true )
{
	max_in_wave = [[ level.round_manager_spawning_preset_current_variant.limit ]]();

	if ( wait_for_room )
	{
		while ( get_all_ai_count() > ( level.zombie_ai_limit - max_in_wave ) && level.zombie_total > 0 )
		{
			wait 0.5;
		}
	}

	count = 0;
	max_in_wave = min( level.zombie_total, max_in_wave );
	while ( ( count < max_in_wave ) && level.zombie_total > 0 )
	{
		wait_for_free_ai_slot( ::get_all_ai_count );
		ai = level [[ level.round_manager_aitype_spawning_funcs[ type ] ]]( custom_starting_properties );
		if ( isdefined( ai ) )
		{
			count++;
			level.round_manager_spawn_count++;
		}
		wait( level.zombie_vars["zombie_spawn_delay"] ); 
	}
}

spawning_chance( type )
{
	if ( level.round_number < getdvarint( "rm_mixed_preset_wave_" + type + "_wave_variant_min_round" ) )
	{
		return false;
	}
	chance_of_wave = 0;
	chance_of_wave -= ( level.round_manager_vars[ type + "_wave_count" ] * getdvarint( "rm_mixed_preset_wave_" + type + "_wave_variant_chance_threshold" ) );

	min = getdvarint( "rm_mixed_preset_wave_" + type + "_wave_variant_chance_per_spawn_min" );
	max = getdvarint( "rm_mixed_preset_wave_" + type + "_wave_variant_chance_per_spawn_max" );
	chance_of_wave += ( level.round_manager_vars[ type + "_wave_count" ] * randomintrange( min, max ) );

	should_spawn_wave_random = chance_of_wave >= getdvarint( "rm_mixed_preset_wave_" + type + "_wave_variant_chance_threshold" );
	time = randomfloatrange( getdvarfloat( "rm_mixed_preset_wave_" + type + "_wave_variant_min_cooldown" ), getdvarfloat( "rm_mixed_preset_wave_" + type + "_wave_variant_max_cooldown" ) );
	should_spawn_guaranteed_wave = ( ( level.round_manager_vars[ "guaranteed_" + type + "_wave_time" ] + ( time * 1000 ) ) <= gettime() );

	return should_spawn_wave_random || should_spawn_guaranteed_wave;
}