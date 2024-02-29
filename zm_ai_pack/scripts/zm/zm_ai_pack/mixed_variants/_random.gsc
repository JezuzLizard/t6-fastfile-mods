#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_allowed_aitypes", "normal zombie_dog mechz" );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_wave_spawn_limit", 24 );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_wave_spawn_cooldown", 1 );

	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_mechz_spawn_chance_1000", 5 );
	set_dvar_if_unset( "rm_mixed_preset_default_random_variant_zombie_dog_spawn_chance_1000", 200 );
}

spawning_random()
{
	level endon( "intermission" );
	level endon( "end_of_round" );
	level endon( "restart_round" );
/#
	level endon( "kill_round" );
#/
	mechz_spawn_chance = getdvarint( "rm_mixed_preset_default_random_variant_mechz_spawn_chance_1000" );
	zombie_dog_chance = getdvarint( "rm_mixed_preset_default_random_variant_zombie_dog_spawn_chance_1000" );

	count = 0;
	for (;;)
	{
		wait_for_free_ai_slot( ::get_all_ai_count );
		ai = undefined;
		random_number = randomint( 1000 );
		if ( random_number < mechz_spawn_chance )
		{
			ai = [[ level.round_manager_aitype_spawning_funcs[ "mechz" ] ]]();
		}
		else if ( random_number < zombie_dog_chance )
		{
			ai = [[ level.round_manager_aitype_spawning_funcs[ "zombie_dog" ] ]]();
		}
		else
		{
			ai = [[ level.round_manager_aitype_spawning_funcs[ "normal" ] ]]();
		}

		if ( isdefined( ai ) )
		{
			count++;
			level.round_manager_spawn_count++;
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