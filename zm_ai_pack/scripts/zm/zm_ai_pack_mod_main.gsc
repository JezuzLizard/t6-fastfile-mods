
main()
{
	level.script = toLower( getDvar( "mapname" ) );
	level.gametype = toLower( getDvar( "g_gametype" ) );

	level.ai_home_maps = [];
	level.ai_home_maps[ "avogadro" ] = spawnStruct();
	level.ai_home_maps[ "avogadro" ].main = maps\mp\zombies\_zm_ai_avogadro::main;
	level.ai_home_maps[ "avogadro" ].init = maps\mp\zombies\_zm_ai_avogadro::init;
	level.ai_home_maps[ "avogadro" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	level.ai_home_maps[ "screecher" ] = spawnStruct();
	level.ai_home_maps[ "screecher" ].main = maps\mp\zombies\_zm_ai_screecher::main;
	level.ai_home_maps[ "screecher" ].init = maps\mp\zombies\_zm_ai_screecher::init;
	level.ai_home_maps[ "screecher" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	level.ai_home_maps[ "ghost" ] = spawnStruct();
	level.ai_home_maps[ "ghost" ].main = maps\mp\zombies\_zm_ai_ghost::main;
	level.ai_home_maps[ "ghost" ].should_execute = !( level.script == "zm_buried" && level.gametype == "zclassic" );
	level.ai_home_maps[ "brutus" ] = spawnStruct();
	level.ai_home_maps[ "brutus" ].main = maps\mp\zombies\_zm_ai_brutus::main;
	level.ai_home_maps[ "brutus" ].should_execute = level.script != "zm_prison";
	level.ai_home_maps[ "mechz" ] = spawnStruct();
	level.ai_home_maps[ "mechz" ].main = maps\mp\zombies\_zm_ai_mechz::main;
	level.ai_home_maps[ "mechz" ].init = maps\mp\zombies\_zm_ai_mechz::init;
	level.ai_home_maps[ "mechz" ].should_execute = level.script != "zm_tomb";
	level.ai_home_maps[ "zombie_dog" ] = spawnStruct();
	level.ai_home_maps[ "zombie_dog" ].main = maps\mp\zombies\_zm_ai_dogs::init;
	level.ai_home_maps[ "zombie_dog" ].init = maps\mp\zombies\_zm_ai_dogs::enable_dog_rounds;
	level.ai_home_maps[ "zombie_dog" ].should_execute = !( level.gametype == "zstandard" && getGametypeSetting( "allowDogs" ) == 1 );	

	keys = getArrayKeys( level.ai_data );
	for ( j = 0; j < keys2.size; j++ )
	{
		if ( isDefined( level.ai_data[ keys[ j ] ].main ) && isDefined( level.ai_data[ keys[ j ] ].should_execute ) 
			&& level.ai_data[ keys[ j ] ].should_execute )
		{
			level [[ level.ai_data[ keys[ j ] ].main ]]();
		}
	}

	level thread command_thread();
	level thread on_player_connect();
}

init()
{
	keys = getArrayKeys( level.ai_data );
	for ( j = 0; j < keys2.size; j++ )
	{
		if ( isDefined( level.ai_data[ keys[ j ] ].init ) && isDefined( level.ai_data[ keys[ j ] ].should_execute ) 
			&& level.ai_data[ keys[ j ] ].should_execute )
		{
			level [[ level.ai_data[ keys[ j ] ].init ]]();
		}
	}
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