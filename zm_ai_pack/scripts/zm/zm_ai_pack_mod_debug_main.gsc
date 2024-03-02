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

	level.location_hud_y_offset = y - 20;

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

		args = strTok( message, " " );

		is_server = args[ 0 ] == "s";
		is_client = args[ 0 ] == "c";

		if ( is_server )
		{
			if ( !isDefined( args[ 1 ] ) )
			{
				player iPrintLn( "Missing second argument" );
				continue;
			}
			switch ( args[ 1 ] )
			{
				case "printorigin":
					player iPrintLn( player.origin );
					break;
				case "points":
					player.score = 1000000;
					break;
				case "setdoground":
					level.next_dog_round = level.round_number + 1;
					player iPrintLn( "Set next dog round to " + level.next_dog_round );
					break;
				case "spawnmechz":
					player iPrintLn( "Spawning one mechz" );
					level.mechz_left_to_spawn = 1;
					level notify( "spawn_mechz" );
					break;
				case "spawnbrutus":
					player iPrintLn( "Spawning one brutus" );
					level notify( "spawn_brutus", 1 );
					break;
				case "printentities":
					level thread print_entities();
					break;
				case "gotoround":
					goto_round( int( args[ 2 ] ) );
					break;
				default:
					player iPrintLn( "Invalid command" );
					break;
			}
		}
		else if ( is_client )
		{			
			if ( !isDefined( args[ 1 ] ) )
			{
				player iPrintLn( "Missing second argument" );
				continue;
			}
			switch ( args[ 1 ] )
			{
				case "printentities":
					player setClientDvar( "say_notify", "printentities" );
					break;
			}
		}
		else
		{
			player iPrintLn( "First argument must be s or c" );
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
		player thread zombie_counter_hud();
		if ( getdvarint( "zm_ai_pack_debug" ) > 0 )
		{
			level.zombie_vars[ "zombie_intermission_time" ] = 0.05;
		}
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

zombie_counter_hud()
{
	self endon( "disconnect" );

	x = 5;
	y = level.location_hud_y_offset - 20;

	text_hud = self new_debug_hud( x, y );
	text_hud settext( "Zombies Left: " );
	x += 75;
	current_hud = self new_debug_hud( x, y );
	x += 20;
	plus_hud = self new_debug_hud( x, y );
	plus_hud settext( " + " );
	x += 20;
	total_hud = self new_debug_hud( x, y );

	flag_wait( "initial_blackscreen_passed" );

	while ( !isdefined( level.zombie_total ) )
	{
		wait 1;
	}
	for (;;)
	{
		while ( getDvarInt( "zm_ai_pack_debug" ) <= 0 )
		{
			text_hud.alpha = 0;
			current_hud.alpha = 0;
			plus_hud.alpha = 0;
			total_hud.alpha = 0;
			wait 1;
		}

		text_hud.alpha = 1;
		current_hud.alpha = 1;
		plus_hud.alpha = 1;
		total_hud.alpha = 1;

		current_hud setvalue( get_current_zombie_count() );
		total_hud setvalue( level.zombie_total );

		wait 0.05;
	}
}

draw_zombie_spawn_location_box( origin, color, vec = ( 20, 20, 40 ) )
{
	box( origin + ( 0, 0, 20 ), vec * -1, vec, 0, color, 1.0 );
}

draw_zome_spawn_location_info_text( origin, color, zone_name, location_type_name )
{
	if ( !level.players[ 0 ] is_player_looking_at( origin, 0.9, false ) )
	{
		return;
	}
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

			if ( isDefined( zone.zombie_dog_locations ) )
			{
				draw_specific_zombie_spawn_locations( zone.zombie_dog_locations, zkeys[ z ], ( 0.3, 0.8, 0.3 ), "zombie_dog" );
			}
			
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

		nodes = undefined;
		wait 0.05;
	}
}

print_ent_field( message, field )
{
	if ( isDefined( field ) )
	{
		print( message + field );
	}
	else
	{
		print( message + "none" );
	}
}

print_entities()
{
	ents = sys::getentarray();

	print( "******SERVER ENTITIES******" );
	print( "Listing " + ents.size + " entities" );
	foreach ( ent in ents )
	{
		entnum = ent getEntityNumber();
		print( "***ENT " + entnum + "***" );
		print_ent_field( "Classname: ", ent.classname );
		print_ent_field( "Origin: ", ent.origin );
		print_ent_field( "Angles: ", ent.angles );

		print_ent_field( "Target: ", ent.target );
		print_ent_field( "Targetname: ", ent.targetname );
		print_ent_field( "Script_noteworthy: ", ent.script_noteworthy );
		print_ent_field( "Model: ", ent.model );
		print_ent_field( "Team: ", ent.team );
		print( "**************" );
	}
	print( "Listed " + ents.size + " entities" );
}

goto_round( target_round )
{
	level notify( "end_round_think" );
	level.round_number = target_round;
	level.zombie_vars["spectators_respawn"] = 1;
	level.zombie_total = 0;
	if ( level.gamedifficulty == 0 )
		level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier_easy"];
	else
		level.zombie_move_speed = level.round_number * level.zombie_vars["zombie_move_speed_multiplier"];
	level.zombie_vars["zombie_spawn_delay"] = 2;
	for ( i = 1; i <= level.round_number; i++ )
	{
		timer = level.zombie_vars["zombie_spawn_delay"];

		if ( timer > 0.08 )
		{
			level.zombie_vars["zombie_spawn_delay"] = timer * 0.95;
			continue;
		}

		if ( timer < 0.08 )
			level.zombie_vars["zombie_spawn_delay"] = 0.08;
	}

	level thread maps\mp\zombies\_zm::round_think( 1 );

	if ( getdvar( "rm_allowed_special_rounds" ) == "" )
	{
		return;
	}
	old_round_number = level.round_number;
	average = int( ( getdvarint( "rm_min_rounds_before_special_round" ) + getdvarint( "rm_max_rounds_before_special_round" ) ) / 2 );

	average_estimated_special_rounds = int( ( level.round_number - old_round_number ) / average );
	level.special_round_count += average_estimated_special_rounds;
}