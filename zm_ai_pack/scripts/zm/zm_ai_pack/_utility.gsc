#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

register_special_round( round_type, variant_type, round_spawning_func, round_wait_func, round_max_func, round_start_func, between_round_over_func, round_chance_func, next_instance_func )
{
	if ( !isDefined( level.round_manager_special_rounds ) )
	{
		level.round_manager_special_rounds = [];
	}

	if ( !isDefined( level.round_manager_special_rounds[ round_type ] ) )
	{
		level.round_manager_special_rounds[ round_type ] = [];
	}

	s = sys::spawnstruct();
	s.spawning_func = round_spawning_func;
	s.wait_func = round_wait_func;
	s.max_func = round_max_func;
	s.start_func = round_start_func;
	s.between_round_over_func = between_round_over_func;
	s.chance_func = round_chance_func;
	s.next_instance_func = next_instance_func;
	s.active = false;
	level.round_manager_special_rounds[ round_type ][ variant_type ] = s;
}

register_mixed_round_preset( preset_type, preset_chance_func, preset_round_start_func )
{
	if ( !isDefined( level.round_manager_mixed_round_presets ) )
	{
		level.round_manager_mixed_round_presets = [];
	}

	if ( !isDefined( level.round_manager_mixed_round_presets[ preset_type ] ) )
	{
		level.round_manager_mixed_round_presets[ preset_type ] = sys::spawnstruct();
		level.round_manager_mixed_round_presets[ preset_type ].variants = [];
	}

	level.round_manager_mixed_round_presets[ preset_type ].chance_func = preset_chance_func;
	level.round_manager_mixed_round_presets[ preset_type ].start_func = preset_round_start_func;
	level.round_manager_mixed_round_presets[ preset_type ].preset_type = preset_type;
}

register_mixed_round_preset_variant( preset_type, variant_type, spawning_func, spawning_chance_func, spawning_limit, spawning_cooldown_func, spawning_round_start_func )
{
	assert( isdefined( level.round_manager_mixed_round_presets[ preset_type ] ) );

	s = sys::spawnstruct();
	s.spawning_func = spawning_func;
	s.chance_func = spawning_chance_func;
	s.limit = spawning_limit;
	s.cooldown_func = spawning_cooldown_func;
	s.start_func = spawning_round_start_func;
	s.last_time = 0;
	s.preset_type = preset_type;
	s.variant_type = variant_type;
	level.round_manager_mixed_round_presets[ preset_type ].variants[ variant_type ] = s;
}

register_ai_spawning_func( aitype, spawning_func )
{
	if ( !isdefined( level.round_manager_aitype_spawning_funcs ) )
	{
		level.round_manager_aitype_spawning_funcs = [];
	}

	level.round_manager_aitype_spawning_funcs[ aitype ] = spawning_func;
}

get_zombie_dog_array()
{
	return getaispeciesarray( level.zombie_team, "zombie_dog" );
}

get_zombie_dog_count()
{
	return get_zombie_dog_array().size;
}

get_mechz_array()
{
	zombies = getaiarray( level.zombie_team );
	mechz = [];
	for ( i = 0; i < zombies.size; i++ )
	{
		if ( isdefined( zombies[ i ].animname ) && zombies[ i ].animname == "mechz_zombie" )
		{
			mechz[ mechz.size ] = zombies[ i ];
		}
	}

	return mechz;
}

get_mechz_count()
{
	return get_mechz_array().size;
}

get_all_ai_array()
{
	return getaispeciesarray( level.zombie_team, "all" );
}

get_all_ai_count()
{
	return get_all_ai_array().size;
}

wait_for_free_ai_slot( func )
{
	while ( level.zombie_total <= 0 || isdefined( func ) && [[ func ]]() >= level.zombie_ai_limit )
		wait 0.1;

	while ( get_current_actor_count() >= level.zombie_actor_limit )
	{
		clear_all_corpses();
		wait 0.1;
	}
}

set_starting_properties_for_ai( starting_properties_struct )
{
	if ( !isdefined( starting_properties_struct ) )
	{
		return;
	}

	if ( isdefined( starting_properties_struct.health ) )
	{
		self.custom_starting_health = starting_properties_struct.health;
	}
}