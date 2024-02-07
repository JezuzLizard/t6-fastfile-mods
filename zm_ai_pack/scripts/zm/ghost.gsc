#include maps\mp\zombies\_zm_ai_ghost;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\_utility;
#include common_scripts\utility;

main()
{
	if ( getDvar( "mapname" ) == "zm_buried" && getDvar( "g_gametype" ) == "zclassic" )
	{
		return;
	}
	//maps\mp\zombies\_zm_ai_ghost::precache_fx();
	//maps\mp\zombies\_zm_ai_ghost::init();
}

init()
{
	if ( getDvar( "mapname" ) == "zm_buried" && getDvar( "g_gametype" ) == "zclassic" )
	{
		return;
	}
	//level thread ghost_zone_spawning_think();
}

ghost_zone_spawning_think()
{
	level endon( "intermission" );

	if ( isdefined( level.intermission ) && level.intermission )
		return;

	if ( !isdefined( level.female_ghost_spawner ) )
	{
/#
		assertmsg( "No female ghost spawner in the map.  Check to see if the zone is active and if it's pointing to spawners." );
#/
	}

	while ( true )
	{
		if ( level.zombie_ghost_count >= level.zombie_ai_limit_ghost )
		{
			wait 0.1;
			continue;
		}

		if ( level.zombie_spawn_locations.size <= 0 )
		{
			wait 0.1;
			continue;
		}

		spawn_point = random( level.zombie_spawn_locations );

		if ( !isdefined( spawn_point ) )
		{
			print( "No spawn point" );
			wait 0.1;
			continue;
		}

/#
		if ( isdefined( level.force_no_ghost ) && level.force_no_ghost )
		{
			wait 0.1;
			continue;
		}
#/
		ghost_ai = undefined;

		if ( isdefined( level.female_ghost_spawner ) )
			ghost_ai = spawn_zombie( level.female_ghost_spawner, level.female_ghost_spawner.targetname, spawn_point );
		else
		{
			print( "No spawner" );
/#
			assertmsg( "No female ghost spawner in the map." );
#/
		}

		if ( isdefined( ghost_ai ) )
		{
			ghost_ai setclientfield( "ghost_fx", 3 );
			ghost_ai.spawn_point = spawn_point;
			ghost_ai.is_ghost = 1;
			ghost_ai.is_spawned_in_ghost_zone = 1;
			ghost_ai.find_target = 1;
			level.zombie_ghost_count++;
/#
			ghost_print( "ghost total " + level.zombie_ghost_count );
#/
		}
		else
		{
/#
			assertmsg( "Female ghost: failed spawn" );
#/
		}

		wait 0.1;
	}
}