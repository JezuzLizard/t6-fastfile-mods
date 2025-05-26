#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_allowed_aitypes", "normal zombie_dog mechz brutus leaper" );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_wave_spawn_limit", 24 );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_wave_spawn_cooldown", 1 );

	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_mechz_spawn_chance_10000_base", 100 );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_zombie_dog_spawn_chance_10000_base", 1200 );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_brutus_spawn_chance_10000_base", 150 );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_leaper_spawn_chance_10000_base", 600 );

	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_mechz_spawn_chance_10000_increase_per_round", 2 );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_zombie_dog_spawn_chance_10000_increase_per_round", 6 );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_brutus_spawn_chance_10000_increase_per_round", 2 );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_leaper_spawn_chance_10000_increase_per_round", 5 );
}

spawning_random()
{
	count = 0;
	for (;;)
	{
		wait_for_free_ai_slot( ::get_all_ai_count );

		aitypes_string = getdvar( "rm_mixed_preset_default_random_variant_allowed_aitypes" );
		if ( aitypes_string == "" )
		{
			wait 1;
			continue;
		}
		aitypes = strtok( aitypes_string, " " );
		aitypes = array_randomize( aitypes );
		ai = undefined;
		has_normal = false;
		max_iterations = 10;
		iteration_count = 0;
		for (;;)
		{
			for ( i = 0; i < aitypes.size; i++ )
			{
				if ( aitypes[ i ] == "normal" )
				{
					has_normal = true;
					continue;
				}
				ai = attempt_random_spawn( aitypes[ i ] );
				if ( isdefined( ai ) )
				{
					break;
				} 
			}
			if ( !isdefined( ai ) && has_normal )
			{
				break;
			}

			iteration_count++;
			if ( iteration_count >= max_iterations )
			{
				break;
			}
		}

		if ( !isdefined( ai ) && has_normal )
		{
			ai = [[ level.round_manager_aitype_spawning_funcs[ "normal" ] ]]();
		}
		else
		{

		}

		if ( isdefined( ai ) )
		{
			count++;
			level.round_manager_vars[ "spawn_count" ]++;
		}

		if ( count >= spawning_limit() )
		{
			return;
		}

		wait( level.zombie_vars["zombie_spawn_delay"] );
	}
}

spawning_chance()
{
	return true;
}

spawning_limit()
{
	return getdvarint( "rm_mixed_preset_default_random_variant_wave_spawn_limit" );
}

spawning_cooldown()
{
	return ( self.last_time + ( getdvarint( "rm_mixed_preset_default_random_variant_wave_spawn_cooldown" ) * 1000 ) ) <= gettime();
}

spawning_round_start()
{
	
}

attempt_random_spawn( type )
{
	chance_base = getdvarint( "rm_mixed_preset_default_random_variant_" + type + "_spawn_chance_10000_base" );

	chance_per_round = getdvarint( "rm_mixed_preset_default_random_variant_" + type + "_spawn_chance_10000_increase_per_round" );

	chance_scaled = chance_base + ( chance_per_round * ( level.round_number - getdvarint( "rm_mixed_round_min_start_round" ) ) );

	if ( chance_scaled <= 0 )
	{
		return undefined;
	}

	random_number = randomint( 10000 );

	ai = undefined;
	if ( chance_scaled < random_number )
	{
		ai = [[ level.round_manager_aitype_spawning_funcs[ type ] ]]();
	}

	return ai;
}