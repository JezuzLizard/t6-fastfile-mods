#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_mixed_preset_default_dog_wave_variant_spawn_limit_min", 6 );
	set_dvar_if_unset( "rm_mixed_preset_default_dog_wave_variant_spawn_limit_max", 12 );
}

spawning_dog_wave()
{
	level.round_manager_dog_wave_count++;
	players = sys::getplayers();

	max_dogs_in_wave = 12;
	if ( players.size == 1 )
	{
		max_dogs_in_wave = 6;
	}

	while ( get_all_ai_count() > ( level.zombie_ai_limit - max_dogs_in_wave ) && level.zombie_total > 0 )
	{
		wait 0.5;
	}

	spawned_dog_count = 0;
	max_dogs_in_wave = min( level.zombie_total, max_dogs_in_wave );
	while ( ( spawned_dog_count < max_dogs_in_wave ) && level.zombie_total > 0 )
	{
		wait_for_free_ai_slot( ::get_all_ai_count );
		ai = level [[ level.round_manager_aitype_spawning_funcs[ "zombie_dog" ] ]]();
		if ( ai )
		{
			spawned_dog_count++;
			level.round_manager_spawn_count++;
		}
		wait( level.zombie_vars["zombie_spawn_delay"] ); 
	}
	level.round_manager_dog_wave_count++;
	level.round_manager_guaranteed_dog_wave_time = getTime() + ( 80000 * level.round_manager_dog_wave_count );
	wait( level.zombie_vars["zombie_spawn_delay"] ); 
}

spawning_chance()
{
	chance_of_dog_wave = 0;
	chance_of_dog_wave -= ( level.round_manager_dog_wave_count * 1000 );

	chance_of_dog_wave += ( level.round_manager_spawn_count * randomintrange( 5, 10 ) );

	should_spawn_dog_wave_random = chance_of_dog_wave >= 1000;
	should_spawn_guaranteed_dog_wave = ( ( level.round_manager_guaranteed_dog_wave_time + 80000 ) <= getTime() );

	return should_spawn_dog_wave_random || should_spawn_guaranteed_dog_wave;
}

spawning_limit()
{
	return level.players.size <= 1 ? getdvarint( "rm_mixed_preset_default_dog_wave_variant_spawn_limit_min" ) : getdvarint( "rm_mixed_preset_default_dog_wave_variant_spawn_limit_max" );
}

spawning_cooldown()
{
	return true;
}

spawning_round_start()
{
	level.round_manager_guaranteed_dog_wave_time = level.round_start_time;
	level.round_manager_dog_wave_count = 0;
	level.round_manager_chance_of_dog_wave = 0;
}