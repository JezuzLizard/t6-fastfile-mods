#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_mixed_preset_wave_dog_wave_variant_spawn_limit_min", 6 );
	set_dvar_if_unset( "rm_mixed_preset_wave_dog_wave_variant_spawn_limit_max", 12 );
	set_dvar_if_unset( "rm_mixed_preset_wave_dog_wave_variant_min_round", 15 );
	set_dvar_if_unset( "rm_mixed_preset_wave_dog_wave_variant_min_cooldown", 80.0 );
	set_dvar_if_unset( "rm_mixed_preset_wave_dog_wave_variant_max_cooldown", 240.0 );
	set_dvar_if_unset( "rm_mixed_preset_wave_dog_wave_variant_chance_threshold", 1000 );
	set_dvar_if_unset( "rm_mixed_preset_wave_dog_wave_variant_chance_per_spawn_min", 5 );
	set_dvar_if_unset( "rm_mixed_preset_wave_dog_wave_variant_chance_per_spawn_max", 10 );
}

spawning_wave()
{
	level.round_manager_dog_wave_count++;
	scripts\zm\zm_ai_pack\mixed_presets\_wave::spawn_wave( "zombie_dog" );
	time = randomfloatrange( getdvarfloat( "rm_mixed_preset_wave_dog_wave_variant_min_cooldown" ), getdvarfloat( "rm_mixed_preset_wave_dog_wave_variant_max_cooldown" ) );
	level.round_manager_guaranteed_dog_wave_time = gettime() + ( time * level.round_manager_dog_wave_count );
}

spawning_chance()
{
	if ( level.round_number < getdvarint( "rm_mixed_preset_wave_dog_wave_variant_min_round" ) )
	{
		return false;
	}
	chance_of_dog_wave = 0;
	chance_of_dog_wave -= ( level.round_manager_dog_wave_count * getdvarint( "rm_mixed_preset_wave_dog_wave_variant_chance_threshold" ) );

	min = getdvarint( "rm_mixed_preset_wave_dog_wave_variant_chance_per_spawn_min" );
	max = getdvarint( "rm_mixed_preset_wave_dog_wave_variant_chance_per_spawn_max" );
	chance_of_dog_wave += ( level.round_manager_spawn_count * randomintrange( min, max ) );

	should_spawn_dog_wave_random = chance_of_dog_wave >= getdvarint( "rm_mixed_preset_wave_dog_wave_variant_chance_threshold" );
	time = randomfloatrange( getdvarfloat( "rm_mixed_preset_wave_dog_wave_variant_min_cooldown" ), getdvarfloat( "rm_mixed_preset_wave_dog_wave_variant_max_cooldown" ) );
	should_spawn_guaranteed_dog_wave = ( ( level.round_manager_guaranteed_dog_wave_time + ( time * 1000 ) ) <= getTime() );

	return should_spawn_dog_wave_random || should_spawn_guaranteed_dog_wave;
}

spawning_limit()
{
	if ( level.players.size <= 1 )
	{
		return getdvarint( "rm_mixed_preset_wave_dog_wave_variant_spawn_limit_min" );
	}
	else
	{
		return getdvarint( "rm_mixed_preset_wave_dog_wave_variant_spawn_limit_max" );
	}
}

spawning_cooldown()
{
	return true;
}

spawning_round_start()
{
	level.round_manager_guaranteed_dog_wave_time = level.round_start_time;
	level.round_manager_dog_wave_count = 0;
}