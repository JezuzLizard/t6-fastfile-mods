#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zombies\_zm_ai_avogadro;
#include maps\mp\zombies\_zm_ai_screecher;
#include maps\mp\zombies\_zm_ai_ghost;
#include maps\mp\zombies\_zm_ai_brutus;
#include maps\mp\zombies\_zm_ai_mechz;
#include maps\mp\zombies\_zm_ai_dogs;

main()
{
	replaceFunc( maps\mp\_visionset_mgr::init, ::visionset_mgr_init_override );
	level.script = toLower( getDvar( "mapname" ) );
	level.gametype = toLower( getDvar( "g_gametype" ) );

	level.ai_data = [];
	// level.ai_data[ "avogadro" ] = spawnStruct();
	// level.ai_data[ "avogadro" ].main = maps\mp\zombies\_zm_ai_avogadro::main;
	// level.ai_data[ "avogadro" ].init = maps\mp\zombies\_zm_ai_avogadro::init;
	// level.ai_data[ "avogadro" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	// level.ai_data[ "screecher" ] = spawnStruct();
	// level.ai_data[ "screecher" ].main = maps\mp\zombies\_zm_ai_screecher::main;
	// level.ai_data[ "screecher" ].init = maps\mp\zombies\_zm_ai_screecher::init;
	// level.ai_data[ "screecher" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	// level.ai_data[ "ghost" ] = spawnStruct();
	// level.ai_data[ "ghost" ].main = maps\mp\zombies\_zm_ai_ghost::main;
	// level.ai_data[ "ghost" ].should_execute = !( level.script == "zm_buried" && level.gametype == "zclassic" );
	level.ai_data[ "brutus" ] = spawnStruct();
	level.ai_data[ "brutus" ].main = maps\mp\zombies\_zm_ai_brutus::main;
	level.ai_data[ "brutus" ].should_execute = level.script != "zm_prison";
	level.ai_data[ "mechz" ] = spawnStruct();
	level.ai_data[ "mechz" ].main = maps\mp\zombies\_zm_ai_mechz::main;
	level.ai_data[ "mechz" ].init = maps\mp\zombies\_zm_ai_mechz::init;
	level.ai_data[ "mechz" ].should_execute = level.script != "zm_tomb";
	// level.ai_data[ "zombie_dog" ] = spawnStruct();
	// level.ai_data[ "zombie_dog" ].main = maps\mp\zombies\_zm_ai_dogs::init;
	// level.ai_data[ "zombie_dog" ].init = maps\mp\zombies\_zm_ai_dogs::enable_dog_rounds;
	// level.ai_data[ "zombie_dog" ].should_execute = !( level.gametype == "zstandard" && getGametypeSetting( "allowDogs" ) == 1 );	

	

	keys = getArrayKeys( level.ai_data );
	for ( i = 0; i < keys.size; i++ )
	{
		if ( isDefined( level.ai_data[ keys[ i ] ].main ) && isDefined( level.ai_data[ keys[ i ] ].should_execute ) 
			&& level.ai_data[ keys[ i ] ].should_execute )
		{
			level [[ level.ai_data[ keys[ i ] ].main ]]();
		}
	}
	level thread command_thread();
	level thread on_player_connect();
}

init()
{
	keys = getArrayKeys( level.ai_data );
	for ( i = 0; i < keys.size; i++ )
	{
		if ( isDefined( level.ai_data[ keys[ i ] ].init ) && isDefined( level.ai_data[ keys[ i ] ].should_execute ) 
			&& level.ai_data[ keys[ i ] ].should_execute )
		{
			level [[ level.ai_data[ keys[ i ] ].init ]]();
		}
	}
}

add_visionset_callback( func )
{
	if ( !isDefined( level.visionset_mgr_callbacks ) )
	{
		level.visionset_mgr_callbacks = [];
	}
	level.visionset_mgr_callbacks[ level.visionset_mgr_callbacks.size ] = func;
}

run_visionset_callbacks()
{
	if ( !isDefined( level.visionset_mgr_callbacks ) )
	{
		return;
	}
	for ( i = 0; i < level.visionset_mgr_callbacks.size; i++ )
	{
		[[ level.visionset_mgr_callbacks[ i ] ]]();
	}
}

visionset_mgr_init_override()
{
	if ( isDefined( level.createfx_enabled ) && level.createfx_enabled )
		return;

	level.vsmgr_initializing = 1;
	level.vsmgr_default_info_name = "none";
	level.vsmgr = [];
	level thread register_type( "visionset" );
	level thread register_type( "overlay" );
	onfinalizeinitialization_callback( ::finalize_clientfields );
	level thread monitor();
	level thread onplayerconnect();
	run_visionset_callbacks();
}

command_thread()
{
	for (;;)
	{
		level waittill( "say", message, player, is_hidden );

		if ( message == "print" )
		{
			player iPrintLn( player.origin );
		}
		else if (  message == "points" )
		{
			player.score = 1000000;
		}
		else if ( message == "setdoground" )
		{
			level.next_dog_round = level.round_number + 1;
		}
		else if ( message == "spawnmechz" )
		{
			level.mechz_left_to_spawn = 1;
			level notify( "spawn_mechz" );
		}
		else if ( message == "spawnbrutus" )
		{
			level notify( "spawn_brutus", 1 );
		}
	}
}

on_player_connect()
{
	while ( true )
	{
		level waittill( "connected", player );
		player thread zone_hud();
	}
}

zone_hud()
{
	self endon("disconnect");

	x = 5;
	y = -119;
	if (level.script == "zm_buried")
	{
		y -= 25;
	}
	else if (level.script == "zm_tomb")
	{
		y -= 60;
	}

	zone_hud = newClientHudElem(self);
	zone_hud.alignx = "left";
	zone_hud.aligny = "middle";
	zone_hud.horzalign = "user_left";
	zone_hud.vertalign = "user_bottom";
	zone_hud.x += x;
	zone_hud.y += y;
	zone_hud.fontscale = 1.4;
	zone_hud.alpha = 0;
	zone_hud.color = ( 1, 1, 1 );
	zone_hud.hidewheninmenu = 1;
	zone_hud.foreground = 1;

	zone_hud endon("death");

	zone_hud thread destroy_on_intermission();

	flag_wait( "initial_blackscreen_passed" );

	zone = self get_current_zone();
	prev_zone = zone;
	zone_hud settext(zone);
	zone_hud.alpha = 1;

	while (1)
	{
		zone = self get_current_zone();

		if(prev_zone != zone)
		{
			prev_zone = zone;

			zone_hud fadeovertime(0.25);
			zone_hud.alpha = 0;
			wait 0.25;

			zone_hud settext(zone);

			zone_hud fadeovertime(0.25);
			zone_hud.alpha = 1;
			wait 0.25;

			continue;
		}

		wait 0.05;
	}
}

destroy_on_intermission()
{
	self endon("death");

	level waittill("intermission");

	if(isDefined(self.elemtype) && self.elemtype == "bar")
	{
		self.bar destroy();
		self.barframe destroy();
	}

	self destroy();
}