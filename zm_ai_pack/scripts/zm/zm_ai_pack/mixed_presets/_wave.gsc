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

spawn_wave( type )
{
	max_in_wave = [[ level.round_manager_spawning_preset_current_variant.limit ]]();

	while ( get_all_ai_count() > ( level.zombie_ai_limit - max_in_wave ) && level.zombie_total > 0 )
	{
		wait 0.5;
	}

	count = 0;
	max_in_wave = min( level.zombie_total, max_in_wave );
	while ( ( count < max_in_wave ) && level.zombie_total > 0 )
	{
		wait_for_free_ai_slot( ::get_all_ai_count );
		ai = level [[ level.round_manager_aitype_spawning_funcs[ type ] ]]();
		if ( isdefined( ai ) )
		{
			count++;
			level.round_manager_spawn_count++;
		}
		wait( level.zombie_vars["zombie_spawn_delay"] ); 
	}
	wait( level.zombie_vars["zombie_spawn_delay"] ); 
}