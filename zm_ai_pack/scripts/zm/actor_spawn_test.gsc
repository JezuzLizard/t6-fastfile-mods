#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\zombies\_zm_ai_mechz;
#include maps\mp\zombies\_zm_ai_screecher;
/*
{
"classname" "actor_zm_buried_sloth"
"model" "c_zom_dunk_fb"
"export" "14"
"spawnflags" "3"
"origin" "-117 472 16"
"script_noteworthy" "sloth_zombie_spawner"
"script_forcespawn" "1"
"count" "9999"
"guid" "AAE258C6"
}
{
"script_forcespawn" "1"
"spawnflags" "3"
"export" "9"
"model" "c_zom_zombie_buried_ghost_woman_fb"
"classname" "actor_zm_buried_ghost_female"
"targetname" "female_ghost"
"script_noteworthy" "ghost_zombie_spawner"
"count" "9999"
"origin" "-168 473 16"
"guid" "B6A85D0D"
}
{
"origin" "-64 0 0"
"script_disable_bleeder" "1"
"script_noteworthy" "screecher_zombie_spawner"
"spawnflags" "3"
"export" "135"
"model" "c_zom_screecher_fb"
"classname" "actor_zm_transit_screecher"
"script_forcespawn" "1"
"count" "9999"
"guid" "FC2F54CC"
}
{
"classname" "actor_zm_transit_avogadro"
"model" "c_zom_electrician_fb"
"export" "138"
"origin" "120 1 39"
"count" "9999"
"spawnflags" "3"
"script_disable_bleeder" "1"
"script_forcespawn" "1"
"script_noteworthy" "avogadro_zombie_spawner"
"guid" "EB278249"
}
{
"classname" "actor_zombie_dog"
"model" "zombie_wolf"
"export" "1"
"spawnflags" "17"
"origin" "0 0 0"
"script_noteworthy" "zombie_dog_spawner"
"guid" "10894F27"
}
{
"classname" "actor_zm_highrise_leaper"
"model" "c_zom_quad_body"
"export" "5"
"spawnflags" "3"
"script_disable_bleeder" "1"
"script_forcespawn" "1"
"script_noteworthy" "leaper_zombie_spawner"
"count" "9999"
"origin" "1184 1264 3408"
"guid" "26D0C557"
}
{
"origin" "-6 194 4088"
"export" "1"
"model" "veh_t6_dlc_zm_mech"
"classname" "actor_zm_tomb_mech_zombie"
"script_noteworthy" "mechz_spawner"
"spawnflags" "1"
"guid" "8115A178"
}
{
"classname" "actor_zm_tomb_giant_robot_0"
"model" "veh_t6_dlc_zm_robot"
"export" "4"
"spawnflags" "23"
"origin" "-2784 5600 -4480"
"targetname" "ai_giant_robot_0"
"guid" "87C1A304"
}
{
"classname" "actor_zm_tomb_giant_robot_1"
"model" "veh_t6_dlc_zm_robot"
"export" "6"
"spawnflags" "23"
"origin" "-2784 7776 -4480"
"targetname" "ai_giant_robot_1"
"guid" "DB9B4302"
}
{
"classname" "actor_zm_tomb_giant_robot_2"
"model" "veh_t6_dlc_zm_robot"
"export" "8"
"spawnflags" "23"
"origin" "-2784 10240 -4480"
"targetname" "ai_giant_robot_2"
"guid" "CE9DDEC4"
}
{
"classname" "actor_zm_alcatraz_brutus"
"model" "c_zom_cellbreaker_fb"
"export" "2"
"angles" "0 180 0"
"spawnflags" "3"
"script_noteworthy" "brutus_zombie_spawner"
"origin" "1824 10968 1352"
"guid" "6B553A99"
}
*/

init()
{
	level.player_out_of_playable_area_monitor = false;
	flag_wait( "initial_blackscreen_passed" );

	//brutus_spawners = getEntArray( "brutus_zombie_spawner", "script_noteworthy" );
	//giant_robot0_spawners = getEntArray( "ai_giant_robot_0", "targetname" );
	//giant_robot1_spawners = getEntArray( "ai_giant_robot_1", "targetname" );
	//giant_robot2_spawners = getEntArray( "ai_giant_robot_2", "targetname" );
	//leaper_spawners = getEntArray( "leaper_zombie_spawner", "script_noteworthy" );
	//mechz_spawners = getEntArray( "mechz_spawner", "script_noteworthy" );
	//zombie_dog_spawners = getEntArray( "zombie_dog_spawner", "script_noteworthy" );
	//avogadro_spawners = getEntArray( "avogadro_zombie_spawner", "script_noteworthy" );
	//screecher_spawners = getEntArray( "screecher_zombie_spawner", "script_noteworthy" );
	//ghost_spawners = getEntArray( "ghost_zombie_spawner", "script_noteworthy" );
	//sloth_spawners = getEntArray( "sloth_zombie_spawner", "script_noteworthy" );

	origin = level.players[ 0 ].origin;

	//spawn_guy( brutus_spawners, origin );
	//spawn_guy( giant_robot0_spawners, origin );
	//spawn_guy( mechz_spawners, origin );
	//spawn_guy( zombie_dog_spawners, origin );
	//spawn_guy( avogadro_spawners, origin );
	//spawn_guy( screecher_spawners, origin );
	//spawn_guy( ghost_spawners, origin );
	//spawn_guy( sloth_spawners, origin );
}

spawn_guy( spawners, origin )
{
	if ( !isDefined( spawners ) )
	{
		return;
	}
	guy = spawners[ 0 ] spawnactor();
	guy forceteleport( spawners[ 0 ].origin );
	guy.origin = origin;
}