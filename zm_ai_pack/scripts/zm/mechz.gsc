#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

main()
{
	level thread on_player_connect();
	level thread command_thread();
	if ( getDvar( "mapname" ) == "zm_tomb" )
	{
		return;
	}
	maps\mp\zombies\_zm_ai_mechz::precache();
	maps\mp\_utility::onfinalizeinitialization_callback( ::register_clientfields );
}

init()
{
	if ( getDvar( "mapname" ) == "zm_tomb" )
	{
		return;
	}
	maps\mp\zombies\_zm_ai_mechz::init();
}

register_clientfields()
{
	registerclientfield( "actor", "mechz_fx", 14000, 12, "int" );
	registerclientfield( "toplayer", "mechz_grab", 14000, 1, "int" );
	registerclientfield( "actor", "anim_rate", 14000, 2, "float" );
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
		else if ( message == "zone" )
		{
			player iPrintLn( player maps\mp\zombies\_zm_zonemgr::get_player_zone() );
		}
		else if (  message == "points" )
		{
			player.score = 1000000;
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