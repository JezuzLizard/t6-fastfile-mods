#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_mixed_preset_wave_leaper_wave_variant_spawn_limit_min", 6 );
	set_dvar_if_unset( "rm_mixed_preset_wave_leaper_wave_variant_spawn_limit_max", 12 );
	set_dvar_if_unset( "rm_mixed_preset_wave_leaper_wave_variant_min_round", 15 );
	set_dvar_if_unset( "rm_mixed_preset_wave_leaper_wave_variant_min_cooldown", 80.0 );
	set_dvar_if_unset( "rm_mixed_preset_wave_leaper_wave_variant_max_cooldown", 240.0 );
	set_dvar_if_unset( "rm_mixed_preset_wave_leaper_wave_variant_chance_threshold", 1000 );
	set_dvar_if_unset( "rm_mixed_preset_wave_leaper_wave_variant_chance_per_spawn_min", 5 );
	set_dvar_if_unset( "rm_mixed_preset_wave_leaper_wave_variant_chance_per_spawn_max", 10 );
}

spawning_wave()
{
	level.round_manager_vars[ "leaper_wave_count" ]++;
	custom_starting_properties = sys::spawnstruct();
	health = int( ( level.round_number / 5 ) * 400 );
	if ( health > 1600 )
	{
		health = 1600;
	}
	custom_starting_properties.health = health;
	scripts\zm\zm_ai_pack\mixed_presets\_wave::spawn_wave( "leaper", custom_starting_properties );
	time = randomfloatrange( getdvarfloat( "rm_mixed_preset_wave_leaper_wave_variant_min_cooldown" ), getdvarfloat( "rm_mixed_preset_wave_leaper_wave_variant_max_cooldown" ) );
	level.round_manager_vars[ "guaranteed_leaper_wave_time" ] = int( gettime() + ( time * 1000 ) );
}

spawning_chance()
{
	return scripts\zm\zm_ai_pack\mixed_presets\_wave::spawning_chance( "leaper" );
}

spawning_limit()
{
	if ( level.players.size <= 1 )
	{
		return getdvarint( "rm_mixed_preset_wave_leaper_wave_variant_spawn_limit_min" );
	}
	else
	{
		return getdvarint( "rm_mixed_preset_wave_leaper_wave_variant_spawn_limit_max" );
	}
}

spawning_cooldown()
{
	return true;
}

spawning_round_start()
{
	level.round_manager_vars[ "guaranteed_leaper_wave_time" ] = level.round_start_time;
	level.round_manager_vars[ "leaper_wave_count" ] = 0;
}