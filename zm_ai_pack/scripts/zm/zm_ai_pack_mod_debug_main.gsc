#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

main()
{

}

init()
{
	y = -119;
	if ( level.script == "zm_buried" )
	{
		y -= 25;
	}
	else if ( level.script == "zm_tomb" )
	{
		y -= 60;
	}
	level.zone_hud_y_offset = y;

	level thread command_thread();
	level thread on_player_connect();
	level thread draw_zombie_spawn_locations();
	level thread draw_nodes();
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
		player thread location_hud();
	}
}

new_debug_hud( x, y )
{
	hud = newClientHudElem( self );
	hud.alignx = "left";
	hud.aligny = "middle";
	hud.horzalign = "user_left";
	hud.vertalign = "user_bottom";
	hud.x += x;
	hud.y += y;
	hud.fontscale = 1.4;
	hud.alpha = 0;
	hud.color = ( 1, 1, 1 );
	hud.hidewheninmenu = 1;
	hud.foreground = 1;

	return hud;
}

zone_hud()
{
	self endon( "disconnect" );

	x = 5;
	y = level.zone_hud_y_offset;
	zone_hud = self new_debug_hud( x, y );

	zone_hud endon("death");

	zone_hud thread destroy_on_intermission();

	flag_wait( "initial_blackscreen_passed" );

	zone = self get_current_zone();
	prev_zone = zone;
	zone_hud settext( zone );
	zone_hud.alpha = 1;

	for (;;)
	{
		while ( getDvarInt( "zm_ai_pack_debug" ) <= 0 )
		{
			zone_hud.alpha = 0;
			wait 1;
		}

		zone = self get_current_zone();
		if ( !isDefined( zone ) )
		{
			wait 1;
			continue;
		}
		if ( prev_zone != zone )
		{
			prev_zone = zone;

			zone_hud fadeovertime( 0.25 );
			zone_hud.alpha = 0;
			wait 0.25;

			zone_hud settext( zone );

			zone_hud fadeovertime( 0.25 );
			zone_hud.alpha = 1;
			wait 0.25;

			continue;
		}

		wait 0.05;
	}
}

destroy_on_intermission()
{
	self endon( "death" );

	level waittill( "intermission" );

	if ( isDefined( self.elemtype ) && self.elemtype == "bar" )
	{
		self.bar destroy();
		self.barframe destroy();
	}

	self destroy();
}

location_hud()
{
	self endon( "disconnect" );

	x = 5;
	y = level.zone_hud_y_offset - 20;

	loc_hud = [];
	for ( i = 0; i < 3; i++ )
	{
		loc_hud[ i ] = self new_debug_hud( x, y );
		x += 55;
	}

	loc_hud[ 0 ].label = &"x:";
	loc_hud[ 1 ].label = &"y:";
	loc_hud[ 2 ].label = &"z:";

	flag_wait( "initial_blackscreen_passed" );

	for (;;)
	{
		while ( getDvarInt( "zm_ai_pack_debug" ) <= 0 )
		{
			for ( i = 0; i < 3; i++ )
			{
				loc_hud[ i ].alpha = 0;
			}
			wait 1;
		}
		for ( i = 0; i < 3; i++ )
		{
			loc_hud[ i ].alpha = 1;
			loc_hud[ i ] setValue( self.origin[ i ] );
		}
		wait 0.05;
	}
}

draw_zombie_spawn_location_box( origin, color, vec = ( 20, 20, 40 ) )
{
	box( origin + ( 0, 0, 20 ), vec * -1, vec, 0, color, 1.0 );
}

draw_zome_spawn_location_info_text( origin, color, zone_name, location_type_name )
{
	print3d( origin + ( 0, 0, 49 ), "ZONE:" + zone_name );
	print3d( origin + ( 0, 0, 37 ), "TYPE:" + location_type_name );
	print3d( origin + ( 0, 0, 25 ), "ORIGIN:" + origin );
}

draw_specific_zombie_spawn_locations( loc_array, zone_name, color, type )
{
	draw_type = getDvar( "zm_ai_pack_debug_spawn_loc_draw_type" );
	if ( draw_type == "" || ( draw_type != "all" && draw_type != type ) )
	{
		return;
	}

	for ( i = 0; i < loc_array.size; i++ )
	{
		draw_zome_spawn_location_info_text( loc_array[ i ].origin, color, zone_name, type );
		draw_zombie_spawn_location_box( loc_array[ i ].origin, color );
	}
}

draw_zombie_spawn_locations()
{
	while ( !isDefined( level.zones ) )
	{
		wait 1;
	}

	flag_wait( "initial_blackscreen_passed" );

	for (;;)
	{
		while ( getDvarInt( "zm_ai_pack_debug" ) <= 0 )
		{
			wait 1;
		}

		zkeys = getArrayKeys( level.zones );
		for ( z = 0; z < zkeys.size; z++ )
		{
			zone = level.zones[ zkeys[ z ] ];

			if ( getDvarInt( "zm_ai_pack_debug_show_only_active_spawns" ) && ( !zone.is_enabled || !zone.is_active || !zone.is_spawning_allowed ) )
			{
				continue;
			}
			draw_specific_zombie_spawn_locations( zone.spawn_locations, zkeys[ z ], ( 0.8, 0.8, 0.8 ), "zombie" );

			draw_specific_zombie_spawn_locations( zone.inert_locations, zkeys[ z ], ( 0.8, 0, 0.8 ), "inert" );

			draw_specific_zombie_spawn_locations( zone.dog_locations, zkeys[ z ], ( 0.8, 0.8, 0 ), "dog" );

			draw_specific_zombie_spawn_locations( zone.screecher_locations, zkeys[ z ], ( 0, 0.8, 0.8 ), "screecher" );

			draw_specific_zombie_spawn_locations( zone.avogadro_locations, zkeys[ z ], ( 0.3, 0.8, 0.8 ), "avogadro" );

			draw_specific_zombie_spawn_locations( zone.quad_locations, zkeys[ z ], ( 0.8, 0.3, 0.8 ), "quad" );

			draw_specific_zombie_spawn_locations( zone.leaper_locations, zkeys[ z ], ( 0.8, 0.8, 0.3 ), "leaper" );

			draw_specific_zombie_spawn_locations( zone.astro_locations, zkeys[ z ], ( 0, 0, 0.8 ), "astro" );

			draw_specific_zombie_spawn_locations( zone.napalm_locations, zkeys[ z ], ( 0.8, 0, 0 ), "napalm" );

			draw_specific_zombie_spawn_locations( zone.brutus_locations, zkeys[ z ], ( 0, 0.8, 0 ), "brutus" );

			draw_specific_zombie_spawn_locations( zone.mechz_locations, zkeys[ z ], ( 0.3, 0.3, 0.8 ), "mechz" );
		}
		wait 0.05;
	}
}

draw_node_box( origin, color, vec = ( 20, 20, 40 ) )
{
	box( origin + ( 0, 0, 20 ), vec * -1, vec, 0, color, 1.0 );
}

draw_node( origin, color, type )
{
	draw_node_box( origin, color );
}

draw_node_info( node, type )
{
	if ( !level.players[ 0 ] is_player_looking_at( node.origin, 0.9, false ) )
	{
		return;
	}
	offset = ( 0, 0, 0 );
	origin = node.origin;
	print3d( origin + ( 0, 0, 49 ), "ORIGIN:" + origin );
	if ( type == "begin" )
	{
		print3d( origin + ( 0, 0, 37 ), "ANGLES:" + node.angles );
		print3d( origin + ( 0, 0, 25 ), "ANIMSCRIPT:" + node.animscript );
		if ( isDefined( node.animation ) )
		{
			print3d( origin + ( 0, 0, 13 ), "ANIMATION:" + node.animation );
		}
		if ( isDefined( node.script_noteworthy ) )
		{
			if ( isDefined( node.animation ) )
			{
				offset = ( 0, 0, 1 );
			}
			else
			{
				offset = ( 0, 0, 13 );
			}
			print3d( origin + offset, "SCIRPT_NOTEWORTHY:" + node.script_noteworthy );
		}
	}
}

draw_node_data( node, color, type )
{
	draw_types_string = getDvar( "zm_ai_pack_debug_node_draw_type" );
	if ( draw_types_string == "" )
	{
		return;
	}

	draw_types = strTok( draw_types_string, " " );
	found_type = false;
	for ( i = 0; i < draw_types.size; i++ )
	{
		if ( draw_types[ i ] == "all" || draw_types[ i ] == type )
		{
			found_type = true;
			break;
		}
	}

	if ( !found_type )
	{
		return;
	}

	draw_node( node.origin, color, type );
	draw_node_info( node, type );
}

draw_nodes()
{
	flag_wait( "initial_blackscreen_passed" );

	for (;;)
	{
		while ( getDvarInt( "zm_ai_pack_debug" ) <= 0 )
		{
			wait 1;
		}

		/*
		draw_types_string = getDvar( "zm_ai_pack_debug_node_draw_type" );
		if ( draw_types_string == "" )
		{
			wait 1;
			continue;
		}

		nodes = undefined;
		draw_types = strTok( draw_types_string, " " );
		for ( i = 0; i < draw_types.size; i++ )
		{
			if ( draw_types[ i ] == "all" )
			{
				nodes = getAllNodes();
				break;
			}
		}
		if ( !isDefined( nodes ) )
		{
			wait 1;
			continue;
		}
		*/

		throttle_at = 400;
		throttle_count = 0;
		nodes = getAllNodes();
		for ( i = 0; i < nodes.size; i++ )
		{
			node = nodes[ i ];
			color = ( 0, 0, 0 );
			type = node.type;

			switch ( node.type )
			{
				case "Begin":
					color = ( 0, 0, 0.8 );
					type = "begin";
					break;
				case "End":
					color = ( 0, 0.8, 0 );
					type = "end";
					break;
				case "Path":
					color = ( 0.8, 0, 0 );
					type = "path";
					break;
			}

			if ( throttle_count == throttle_at )
			{
				//wait 0.05;
				throttle_count = 0;
			}

			draw_node_data( node, color, type );
			throttle_count++;
		}
		wait 0.05;
	}
}