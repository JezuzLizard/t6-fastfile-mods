#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_mixed_preset_wave_mechz_wave_variant_spawn_limit_min", 1 );
	set_dvar_if_unset( "rm_mixed_preset_wave_mechz_wave_variant_spawn_limit_max", 8 );
	set_dvar_if_unset( "rm_mixed_preset_wave_mechz_wave_variant_min_round", 25 );
	set_dvar_if_unset( "rm_mixed_preset_wave_mechz_wave_variant_min_cooldown", 120.0 );
	set_dvar_if_unset( "rm_mixed_preset_wave_mechz_wave_variant_max_cooldown", 240.0 );
	set_dvar_if_unset( "rm_mixed_preset_wave_mechz_wave_variant_chance_threshold", 2000 );
	set_dvar_if_unset( "rm_mixed_preset_wave_mechz_wave_variant_chance_per_spawn_min", 5 );
	set_dvar_if_unset( "rm_mixed_preset_wave_mechz_wave_variant_chance_per_spawn_max", 10 );
}

spawning_wave()
{
	level.round_manager_mechz_wave_count++;
	scripts\zm\zm_ai_pack\mixed_presets\_wave::spawn_wave( "mechz" );
	time = randomfloatrange( getdvarfloat( "rm_mixed_preset_wave_mechz_wave_variant_min_cooldown" ), getdvarfloat( "rm_mixed_preset_wave_mechz_wave_variant_max_cooldown" ) );
	level.round_manager_guaranteed_mechz_wave_time = gettime() + ( time * level.round_manager_mechz_wave_count );
}

spawning_chance()
{
	if ( level.round_number < getdvarint( "rm_mixed_preset_wave_mechz_wave_variant_min_round" ) )
	{
		return false;
	}
	chance_of_wave = 0;
	chance_of_wave -= ( level.round_manager_mechz_wave_count * getdvarint( "rm_mixed_preset_wave_mechz_wave_variant_chance_threshold" ) );

	min = getdvarint( "rm_mixed_preset_wave_mechz_wave_variant_chance_per_spawn_min" );
	max = getdvarint( "rm_mixed_preset_wave_mechz_wave_variant_chance_per_spawn_max" );
	chance_of_wave += ( level.round_manager_spawn_count * randomintrange( min , max ) );

	should_spawn_wave_random = chance_of_wave >= getdvarint( "rm_mixed_preset_wave_mechz_wave_variant_chance_threshold" );
	time = randomfloatrange( getdvarfloat( "rm_mixed_preset_wave_mechz_wave_variant_min_cooldown" ), getdvarfloat( "rm_mixed_preset_wave_mechz_wave_variant_max_cooldown" ) );
	should_spawn_guaranteed_wave = ( ( level.round_manager_guaranteed_mechz_wave_time + ( time * 1000 ) ) <= getTime() );

	return should_spawn_wave_random || should_spawn_guaranteed_wave;
}

spawning_limit()
{
	if ( level.players.size <= 1 )
	{
		return getdvarint( "rm_mixed_preset_wave_mechz_wave_variant_spawn_limit_min" );
	}

	spawn_amount = int( level.players.size * 0.5 ) + 1;
	max = getdvarint( "rm_mixed_preset_wave_mechz_wave_variant_spawn_limit_max" );
	if ( spawn_amount > max )
	{
		spawn_amount = max;
	}
	return spawn_amount;
}

spawning_cooldown()
{
	return true;
}

spawning_round_start()
{
	level.round_manager_guaranteed_mechz_wave_time = level.round_start_time;
	level.round_manager_mechz_wave_count = 0;
}