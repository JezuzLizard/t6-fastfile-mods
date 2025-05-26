#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include scripts\zm\zm_ai_pack\_utility;

main()
{
	set_dvar_if_unset( "rm_mixed_preset_wave_brutus_wave_variant_spawn_limit_min", 1 );
	set_dvar_if_unset( "rm_mixed_preset_wave_brutus_wave_variant_spawn_limit_max", 8 );
	set_dvar_if_unset( "rm_mixed_preset_wave_brutus_wave_variant_min_round", 25 );
	set_dvar_if_unset( "rm_mixed_preset_wave_brutus_wave_variant_min_cooldown", 120.0 );
	set_dvar_if_unset( "rm_mixed_preset_wave_brutus_wave_variant_max_cooldown", 240.0 );
	set_dvar_if_unset( "rm_mixed_preset_wave_brutus_wave_variant_chance_threshold", 2000 );
	set_dvar_if_unset( "rm_mixed_preset_wave_brutus_wave_variant_chance_per_spawn_min", 5 );
	set_dvar_if_unset( "rm_mixed_preset_wave_brutus_wave_variant_chance_per_spawn_max", 10 );
}

spawning_wave()
{
	level.music_round_override = 1;
	level thread maps\mp\zombies\_zm_audio::change_zombie_music( "brutus_round_start" );
	level thread maps\mp\zombies\_zm_ai_brutus::sndforcewait();
	level.round_manager_vars[ "brutus_wave_count" ]++;
	scripts\zm\zm_ai_pack\mixed_presets\_wave::spawn_wave( "brutus" );
	time = randomfloatrange( getdvarfloat( "rm_mixed_preset_wave_brutus_wave_variant_min_cooldown" ), getdvarfloat( "rm_mixed_preset_wave_brutus_wave_variant_max_cooldown" ) );
	level.round_manager_vars[ "guaranteed_brutus_wave_time" ] = int( gettime() + ( time * 1000 ) );
}

spawning_chance()
{
	return scripts\zm\zm_ai_pack\mixed_presets\_wave::spawning_chance( "brutus" );
}

spawning_limit()
{
	if ( level.players.size <= 1 )
	{
		return getdvarint( "rm_mixed_preset_wave_brutus_wave_variant_spawn_limit_min" );
	}

	spawn_amount = int( level.players.size * 0.75 ) + 1;
	max = getdvarint( "rm_mixed_preset_wave_brutus_wave_variant_spawn_limit_max" );
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
	level.round_manager_vars[ "guaranteed_brutus_wave_time" ] = level.round_start_time;
	level.round_manager_vars[ "brutus_wave_count" ] = 0;
}