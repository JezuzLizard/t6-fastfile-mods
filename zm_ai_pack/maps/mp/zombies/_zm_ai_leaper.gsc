// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\animscripts\zm_utility;
#include maps\mp\zombies\_zm_spawner;
#include maps\mp\zombies\_zm_score;
#include maps\mp\animscripts\zm_shared;
#include maps\mp\zombies\_zm_ai_basic;
#include maps\mp\zombies\_zm_zonemgr;
#include maps\mp\gametypes_zm\_globallogic_score;
#include maps\mp\zombies\_zm_powerups;
#include maps\mp\zombies\_zm_audio;
//#include maps\mp\zm_highrise_elevators;

main()
{
	precache();
	init();
}

precache()
{
	precache_fx();
}

precache_fx()
{
	level._effect["leaper_death"] = sys::loadfx( "maps/zombie/fx_zmb_leaper_death" );
	level._effect["leaper_spawn"] = sys::loadfx( "maps/zombie/fx_zmb_leaper_spawn" );
	level._effect["leaper_trail"] = sys::loadfx( "maps/zombie/fx_zmb_leaper_trail" );
	level._effect["leaper_walk"] = sys::loadfx( "maps/zombie/fx_zmb_leaper_walk" );
	level._effect["leaper_wall_impact"] = sys::loadfx( "maps/zombie/fx_zmb_leaper_wall_impact" );
}

init()
{
	leaper_spawner_init();
	level thread leaper_calc_anim_offsets();

	if ( !isdefined( level.leapers_per_player ) )
		level.leapers_per_player = 6;

	level.no_jump_triggers = sys::getentarray( "leaper_no_jump_trigger", "targetname" );
}

leaper_calc_anim_offsets()
{
	flag_wait( "initial_blackscreen_passed" );
	leaper = spawn_zombie( level.leaper_spawners[0] );

	if ( isdefined( leaper ) )
	{
		level.leaper_anim = sys::spawnstruct();
		asd = "zm_wall_up";
		anim_id = leaper getanimfromasd( asd, 0 );
		level.leaper_anim.up_mid = getmovedelta( anim_id, 0, 0.488 ) + vectorscale( ( 0, 0, 1 ), 6.0 );
		level.leaper_anim.up_end = getmovedelta( anim_id, 0, 1 );
		asd = "zm_wall_left";
		anim_id = leaper getanimfromasd( asd, 0 );
		wallhit_time = getnotetracktimes( anim_id, "wallhit" );
		level.leaper_anim.left_mid = getmovedelta( anim_id, 0, wallhit_time[0] ) + vectorscale( ( 0, 0, 1 ), 48.0 );
		level.leaper_anim.left_end = getmovedelta( anim_id, 0, 1 );
		asd = "zm_wall_left_large";
		anim_id = leaper getanimfromasd( asd, 0 );
		wallhit_time = getnotetracktimes( anim_id, "wallhit" );
		level.leaper_anim.left_large_mid = getmovedelta( anim_id, 0, wallhit_time[0] ) + vectorscale( ( 0, 0, 1 ), 48.0 );
		level.leaper_anim.left_large_end = getmovedelta( anim_id, 0, 1 );
		asd = "zm_wall_right";
		anim_id = leaper getanimfromasd( asd, 0 );
		wallhit_time = getnotetracktimes( anim_id, "wallhit" );
		level.leaper_anim.right_mid = getmovedelta( anim_id, 0, wallhit_time[0] ) + vectorscale( ( 0, 0, 1 ), 48.0 );
		level.leaper_anim.right_end = getmovedelta( anim_id, 0, 1 );
		asd = "zm_wall_right_large";
		anim_id = leaper getanimfromasd( asd, 0 );
		wallhit_time = getnotetracktimes( anim_id, "wallhit" );
		level.leaper_anim.right_large_mid = getmovedelta( anim_id, 0, wallhit_time[0] ) + vectorscale( ( 0, 0, 1 ), 48.0 );
		level.leaper_anim.right_large_end = getmovedelta( anim_id, 0, 1 );
		leaper delete();
	}
}

leaper_spawner_init()
{
	level.leaper_spawners = sys::getentarray( "leaper_zombie_spawner", "script_noteworthy" );

	if ( level.leaper_spawners.size == 0 )
		return;

	for ( i = 0; i < level.leaper_spawners.size; i++ )
	{
		level.leaper_spawners[i].is_enabled = 1;
		level.leaper_spawners[i].script_forcespawn = 1;
	}

	assert( level.leaper_spawners.size > 0 );
	level.leaper_health = 100;
	array_thread( level.leaper_spawners, ::add_spawn_function, ::leaper_init );
/#
	if ( isdefined( level.leaper_rounds_enabled ) && level.leaper_rounds_enabled )
		level thread leaper_spawner_zone_check();
#/
}

leaper_spawner_zone_check()
{
	flag_wait( "zones_initialized" );
	str_zone_list = "";
	str_spawn_count_list = "";
	n_zones_missing_spawners = 0;
	a_zones = getarraykeys( level.zones );

	for ( i = 0; i < a_zones.size; i++ )
	{
		if ( level.zones[a_zones[i]].leaper_locations.size == 0 )
		{
			n_zones_missing_spawners++;
			str_zone_list = str_zone_list + "\\n " + a_zones[i];
		}

		str_spawn_count_list = str_spawn_count_list + a_zones[i] + ": " + level.zones[a_zones[i]].leaper_locations.size + "\\n";
	}

	if ( n_zones_missing_spawners != 0 )
	{
		assertmsg( "All zones require at least one leaper spawn point." + n_zones_missing_spawners + " zones are missing leaper spawners. They are: " + str_zone_list );
	}
/#
	println( "========== LEAPER SPAWN COUNT PER ZONE ===========" );
	println( str_spawn_count_list );
	println( "==================================================" );
#/
}

leaper_init()
{
	self endon( "death" );
	level endon( "intermission" );
	self.animname = "leaper_zombie";
	self.audio_type = "leaper";
	self.no_gib = true;
	self.has_legs = 1;
	self.ignore_all_poi = 1;
	self.is_leaper = 1;
	self.melee_anim_func = ::melee_anim_func;
	self.meleedamage = 30;
	self.ignore_distance_tracking = false;
	self.exclude_distance_cleanup_adding_to_total = false;
	recalc_zombie_array();

	if ( isdefined( self.spawn_point ) )
	{
		spot = self.spawn_point;

		if ( !isdefined( spot.angles ) )
			spot.angles = ( 0, 0, 0 );

		self forceteleport( spot.origin, spot.angles );
	}

	self sys::playsound( "zmb_vocals_leaper_spawn" );
	self set_zombie_run_cycle( "run" );
	self.state = "init";
	self thread leaper_think();
	self thread leaper_spawn_failsafe();
	self thread leaper_traverse_watcher();
	if ( isdefined( self.custom_starting_health ) )
	{
		self.maxhealth = self.custom_starting_health;
	}
	else
	{
		self.maxhealth = level.leaper_health;
	}
	self.health = self.maxhealth;
	self setphysparams( 15, 0, 24 );
	self.zombie_init_done = 1;
	self notify( "zombie_init_done" );
	self.allowpain = 0;
	self thread play_ambient_leaper_vocals();
	self sys::animmode( "normal" );
	self sys::orientmode( "face enemy" );
	self maps\mp\zombies\_zm_spawner::zombie_setup_attack_properties();
	self maps\mp\zombies\_zm_spawner::zombie_complete_emerging_into_playable_area();
	self sys::setfreecameralockonallowed( 0 );

	if ( isdefined( self.spawn_point.script_parameters ) && ( self.spawn_point.script_parameters == "emerge_bottom" || self.spawn_point.script_parameters == "emerge_top" ) )
		self thread do_leaper_emerge( self.spawn_point );

	self thread leaper_death();
	self thread leaper_check_zone();
	self thread leaper_check_no_jump();
	self thread leaper_watch_enemy();
	self.combat_animmode = ::leaper_combat_animmode;
	level thread maps\mp\zombies\_zm_spawner::zombie_death_event( self );
	self thread maps\mp\zombies\_zm_spawner::enemy_death_detection();
	self thread leaper_elevator_failsafe();
}

play_ambient_leaper_vocals()
{
	self endon( "death" );
	wait( randomintrange( 2, 4 ) );

	while ( true )
	{
		if ( isdefined( self ) )
		{
			if ( isdefined( self.favoriteenemy ) && distance( self.origin, self.favoriteenemy.origin ) <= 150 )
			{

			}
			else
				self sys::playsound( "zmb_vocals_leaper_ambience" );
		}

		wait( randomfloatrange( 1, 1.5 ) );
	}
}

leaper_death()
{
	self endon( "leaper_cleanup" );
	self waittill( "death" );
	self leaper_stop_trail_fx();
	self sys::playsound( "zmb_vocals_leaper_death" );
	playfx( level._effect["leaper_death"], self.origin );

	if ( get_current_zombie_count() == 0 && level.zombie_total == 0 )
	{
		level.last_leaper_origin = self.origin;
		level notify( "last_leaper_down" );
	}

	if ( isplayer( self.attacker ) )
	{
		event = "death";

		if ( issubstr( self.damageweapon, "knife_ballistic_" ) )
			event = "ballistic_knife_death";

		self.attacker thread do_player_general_vox( "general", "leaper_killed", 20, 20 );
		self.attacker maps\mp\zombies\_zm_score::player_add_points( event, self.damagemod, self.damagelocation, 1 );
	}
}

leaper_think()
{
	self endon( "death" );

	while ( true )
	{
		switch ( self.state )
		{
			case "init":
				leaper_building_jump();
				break;
			case "chasing":
				leaper_check_wall();
				break;
			case "leaping":
				break;
		}

		wait 0.1;
	}
}

leaper_can_use_anim( local_mid, local_end, dir )
{
	start = self.origin;
	mid = self localtoworldcoords( local_mid );
	end = self localtoworldcoords( local_end );
	real_mid = mid;
	forward_dist = length( end - start ) * 0.5;
	forward_vec = sys::vectornormalize( end - start );
	temp_org = start + vectorscale( forward_vec, forward_dist );
	forward_org = ( temp_org[0], temp_org[1], real_mid[2] );
	end_top = end + vectorscale( ( 0, 0, 1 ), 24.0 );
	end_bottom = end + vectorscale( ( 0, 0, -1 ), 60.0 );
	trace = bullettrace( start, mid, 1, self );

	if ( isdefined( trace["entity"] ) )
		return false;

	if ( isdefined( trace["fraction"] ) && trace["fraction"] < 1 )
	{
		if ( trace["fraction"] < 0.2 )
		{
/#
			if ( getdvarint( #"_id_5B4FE0B3" ) == 1 )
				line( start, mid, ( 1, 0, 0 ), 1, 0, 100 );
#/
			return false;
		}

		if ( dir == "up" )
		{
			if ( trace["fraction"] < 0.9 )
				return false;
		}

		mid = trace["position"];
/#
		if ( getdvarint( #"_id_5B4FE0B3" ) >= 1 )
			line( start, mid, ( 0, 1, 0 ), 1, 0, 100 );
#/

		if ( dir != "up" )
		{
			trace = bullettrace( forward_org, real_mid, 1, self );

			if ( isdefined( trace["entity"] ) )
				return false;

			if ( isdefined( trace["fraction"] ) && trace["fraction"] < 1 )
			{
/#
				if ( getdvarint( #"_id_5B4FE0B3" ) == 1 )
					line( forward_org, real_mid, ( 1, 0, 0 ), 1, 0, 100 );
#/
			}
			else
			{
/#
				if ( getdvarint( #"_id_5B4FE0B3" ) == 1 )
					line( forward_org, real_mid, ( 0, 1, 0 ), 1, 0, 100 );
#/
				return false;
			}
		}
	}
	else
	{
/#
		if ( getdvarint( #"_id_5B4FE0B3" ) == 1 )
			line( start, mid, ( 1, 0, 0 ), 1, 0, 100 );
#/
		return false;
	}

	trace = bullettrace( mid, end, 1, self );

	if ( isdefined( trace["fraction"] ) && trace["fraction"] < 1 )
	{
/#
		if ( getdvarint( #"_id_5B4FE0B3" ) == 1 )
			line( mid, end, ( 1, 0, 0 ), 1, 0, 100 );
#/
		return false;
	}
	else
	{
/#
		if ( getdvarint( #"_id_5B4FE0B3" ) >= 1 )
			line( mid, end, ( 0, 1, 0 ), 1, 0, 100 );
#/
	}

	trace = bullettrace( end_top, end_bottom, 1, self );

	if ( isdefined( trace["fraction"] ) && trace["fraction"] >= 1 )
	{
/#
		if ( getdvarint( #"_id_5B4FE0B3" ) == 1 )
			line( end_top, end_bottom, ( 1, 0, 0 ), 1, 0, 100 );
#/
		return false;
	}
	else
	{
/#
		if ( getdvarint( #"_id_5B4FE0B3" ) >= 1 )
			line( end_top, end_bottom, ( 0, 1, 0 ), 1, 0, 100 );
#/
	}

	return true;
}

leaper_building_jump()
{
	self endon( "death" );

	if ( isdefined( self.spawn_point.script_string ) && self.spawn_point.script_string != "find_flesh" )
	{
		self sys::animscripted( self.spawn_point.origin, self.spawn_point.angles, "zm_building_leap", self.spawn_point.script_string );
		self maps\mp\animscripts\zm_shared::donotetracks( "building_leap_anim" );
	}

	self thread leaper_playable_area_failsafe();
	self thread maps\mp\zombies\_zm_ai_basic::find_flesh();
	self.state = "chasing";
}

leaper_check_wall()
{
	self endon( "death" );

	if ( !isdefined( self.next_leap_time ) )
		self.next_leap_time = gettime() + 500;

	if ( is_true( self.sliding_on_goo ) || is_true( self.is_leaping ) )
		return;

	if ( gettime() > self.next_leap_time && !is_true( self.no_jump ) )
	{
		wall_anim = [];

		if ( self leaper_can_use_anim( level.leaper_anim.up_mid, level.leaper_anim.up_end, "up" ) )
			wall_anim[wall_anim.size] = "zm_wall_up";

		if ( self leaper_can_use_anim( level.leaper_anim.left_mid, level.leaper_anim.left_end, "left" ) )
			wall_anim[wall_anim.size] = "zm_wall_left";
		else if ( self leaper_can_use_anim( level.leaper_anim.left_large_mid, level.leaper_anim.left_large_end, "left_large" ) )
			wall_anim[wall_anim.size] = "zm_wall_left_large";

		if ( self leaper_can_use_anim( level.leaper_anim.right_mid, level.leaper_anim.right_end, "right" ) )
			wall_anim[wall_anim.size] = "zm_wall_right";
		else if ( self leaper_can_use_anim( level.leaper_anim.right_large_mid, level.leaper_anim.right_large_end, "right_large" ) )
			wall_anim[wall_anim.size] = "zm_wall_right_large";

		b_should_play_wall_jump_anim = !self isinscriptedstate() && wall_anim.size > 0;

		if ( b_should_play_wall_jump_anim && isdefined( self.enemy ) && ( self cansee( self.enemy ) || is_true( self.in_player_zone ) ) )
		{
			wall_anim = array_randomize( wall_anim );
			self.leap_anim = wall_anim[0];
			self leaper_start_trail_fx();
			self.ignoreall = 1;
			self.is_leaping = 1;
			self notify( "stop_find_flesh" );
			self notify( "zombie_acquire_enemy" );
			self sys::animcustom( ::leaper_play_anim );
			self waittill( "leap_anim_done" );
			self leaper_stop_trail_fx();
			self.ignoreall = 0;
			self.is_leaping = 0;
			self thread maps\mp\zombies\_zm_ai_basic::find_flesh();
			self.next_leap_time = gettime() + 500;
		}
	}
}

leaper_check_zone()
{
	self endon( "death" );
	self.in_player_zone = 0;

	while ( true )
	{
		self.in_player_zone = 0;

		foreach ( zone in level.zones )
		{
			if ( !isdefined( zone.volumes ) || zone.volumes.size == 0 )
				continue;

			zone_name = zone.volumes[0].targetname;

			if ( self maps\mp\zombies\_zm_zonemgr::entity_in_zone( zone_name ) )
			{
				if ( is_true( zone.is_occupied ) )
				{
					self.in_player_zone = 1;
					break;
				}
			}
		}

		wait 0.2;
	}
}

leaper_check_no_jump()
{
	self endon( "death" );

	while ( true )
	{
		self.no_jump = 0;

		foreach ( trigger in level.no_jump_triggers )
		{
			if ( self sys::istouching( trigger ) )
			{
				self.no_jump = 1;
				break;
			}
		}

		wait 0.2;
	}
}

melee_anim_func()
{
	self.next_leap_time = gettime() + 1500;
	self sys::animmode( "gravity" );
}

leaper_start_trail_fx()
{
	self endon( "death" );
	self leaper_stop_trail_fx();
	self.trail_fx = sys::spawn( "script_model", self.origin );
	self.trail_fx setmodel( "tag_origin" );
	self.trail_fx sys::linkto( self );
	wait 0.1;
	playfxontag( level._effect["leaper_trail"], self.trail_fx, "tag_origin" );
}

leaper_stop_trail_fx()
{
	if ( isdefined( self.trail_fx ) )
		self.trail_fx delete();
}

leaper_play_anim()
{
	self endon( "death" );
	self sys::animmode( "nogravity" );
	self sys::setanimstatefromasd( self.leap_anim );
	self thread leaper_handle_fx_notetracks( "wall_anim" );
	maps\mp\animscripts\zm_shared::donotetracks( "wall_anim" );
	self sys::animmode( "normal" );
	self notify( "leap_anim_done" );
}

leaper_handle_fx_notetracks( animname )
{
	self endon( "death" );
	self endon( "leap_anim_done" );

	if ( isdefined( self.leap_anim ) && self getanimhasnotetrackfromasd( "wallhit" ) )
	{
		self waittillmatch( animname, "wallhit" );
		playfx( level._effect["leaper_wall_impact"], self.origin );
	}
}

leaper_notetracks( animname )
{
	self endon( "death" );
	self endon( "leap_anim_done" );
	self waittillmatch( animname, "gravity on" );
	self sys::animmode( "normal" );
}

enable_leaper_rounds()
{
}

leaper_health_increase()
{
	if ( level.special_round_count == 1 )
		level.leaper_health = 400;
	else if ( level.special_round_count == 2 )
		level.leaper_health = 900;
	else if ( level.special_round_count == 3 )
		level.leaper_health = 1300;
	else if ( level.special_round_count == 4 )
		level.leaper_health = 1600;

	if ( level.leaper_health > 1600 )
		level.leaper_health = 1600;
}

get_favorite_enemy()
{
	leaper_targets = sys::getplayers();
	least_hunted = leaper_targets[0];

	for ( i = 0; i < leaper_targets.size; i++ )
	{
		if ( !isdefined( leaper_targets[i].hunted_by ) )
			leaper_targets[i].hunted_by = 0;

		if ( !is_player_valid( leaper_targets[i] ) )
			continue;

		if ( !is_player_valid( least_hunted ) )
			least_hunted = leaper_targets[i];

		if ( leaper_targets[i].hunted_by < least_hunted.hunted_by )
			least_hunted = leaper_targets[i];
	}

	least_hunted.hunted_by = least_hunted.hunted_by + 1;
	return least_hunted;
}

leaper_watch_enemy()
{
	self endon( "death" );

	while ( true )
	{
		if ( !is_player_valid( self.favoriteenemy ) )
			self.favoriteenemy = get_favorite_enemy();

		wait 0.2;
	}
}

leaper_combat_animmode()
{
	self sys::animmode( "gravity", 0 );
}

leaper_spawn_fx( ai, ent )
{
	ai sys::setfreecameralockonallowed( 0 );
	ai sys::show();
	ai sys::setfreecameralockonallowed( 1 );
	v_fx_origin = ai.spawn_point.origin;

	if ( isdefined( ai.spawn_point.script_string ) && ai.spawn_point.script_string != "find_flesh" )
	{
		wait 0.1;
		v_fx_origin = ai sys::gettagorigin( "J_SpineLower" );
	}

	playfx( level._effect["leaper_spawn"], v_fx_origin );
	playsoundatposition( "zmb_leaper_spawn_fx", v_fx_origin );
}

leaper_round_accuracy_tracking()
{
	players = sys::getplayers();
	level.leaper_round_accurate_players = 0;

	for ( i = 0; i < players.size; i++ )
	{
		players[i].total_shots_start_leaper_round = players[i] maps\mp\gametypes_zm\_globallogic_score::getpersstat( "total_shots" );
		players[i].total_hits_start_leaper_round = players[i] maps\mp\gametypes_zm\_globallogic_score::getpersstat( "hits" );
	}

	level waittill( "last_leaper_down" );
	players = sys::getplayers();

	for ( i = 0; i < players.size; i++ )
	{
		total_shots_end_leaper_round = players[i] maps\mp\gametypes_zm\_globallogic_score::getpersstat( "total_shots" ) - players[i].total_shots_start_leaper_round;
		total_hits_end_leaper_round = players[i] maps\mp\gametypes_zm\_globallogic_score::getpersstat( "hits" ) - players[i].total_hits_start_leaper_round;

		if ( total_shots_end_leaper_round == total_hits_end_leaper_round )
			level.leaper_round_accurate_players++;
	}

	if ( level.leaper_round_accurate_players == players.size )
	{
		for ( i = 0; i < players.size; i++ )
			players[i] maps\mp\zombies\_zm_score::add_to_player_score( 2000 );

		if ( isdefined( level.last_leaper_origin ) )
		{
			trace = groundtrace( level.last_leaper_origin + vectorscale( ( 0, 0, 1 ), 10.0 ), level.last_leaper_origin + vectorscale( ( 0, 0, -1 ), 150.0 ), 0, undefined, 1 );
			power_up_origin = trace["position"];
			//level thread maps\mp\zombies\_zm_powerups::specific_powerup_drop( "free_perk", power_up_origin + vectorscale( ( 1, 1, 0 ), 30.0 ) );
		}
	}
}

leaper_round_aftermath()
{
	level waittill( "last_leaper_down" );
	level thread maps\mp\zombies\_zm_audio::change_zombie_music( "dog_end" );
	power_up_origin = undefined;

	if ( isdefined( level.last_leaper_origin ) )
	{
		trace = groundtrace( level.last_leaper_origin + vectorscale( ( 0, 0, 1 ), 10.0 ), level.last_leaper_origin + vectorscale( ( 0, 0, -1 ), 150.0 ), 0, undefined, 1 );
		power_up_origin = trace["position"];
	}

	if ( isdefined( power_up_origin ) )
		level thread maps\mp\zombies\_zm_powerups::specific_powerup_drop( "full_ammo", power_up_origin );

	wait 2;
	clientnotify( "leaper_stop" );
	wait 6;
}

leaper_round_start()
{
	level thread maps\mp\zombies\_zm_audio::change_zombie_music( "dog_start" );
	level thread leaper_round_start_audio();
	level notify( "leaper_round_starting" );
	clientnotify( "leaper_start" );
}

leaper_round_stop()
{
	level notify( "leaper_round_ending" );
	clientnotify( "leaper_stop" );
}

leaper_traverse_watcher()
{
	self endon( "death" );

	while ( true )
	{
		if ( is_true( self.is_traversing ) )
		{
			self.elevator_parent = undefined;

			object_is_on_elevator_func = pluto_sys::getfunction( "maps\mp\zm_highrise_elevators", "object_is_on_elevator" );
			if ( isDefined( object_is_on_elevator_func ) && is_true( self [[ object_is_on_elevator_func ]]() ) )
			{
				if ( isdefined( self.elevator_parent ) )
				{
					if ( is_true( self.elevator_parent.is_moving ) )
					{
						playfx( level._effect["zomb_gib"], self.origin );
						self leaper_cleanup();
						self delete();
						return;
					}
				}
			}
		}

		wait 0.2;
	}
}

leaper_playable_area_failsafe()
{
	self endon( "death" );
	self.leaper_failsafe_start_time = gettime();
	playable_area = sys::getentarray( "player_volume", "script_noteworthy" );
	b_outside_playable_space_this_frame = 0;
	self.leaper_outside_playable_space_time = -2;

	while ( true )
	{
		b_outside_playable_last_check = b_outside_playable_space_this_frame;
		b_outside_playable_space_this_frame = is_leaper_outside_playable_space( playable_area );
		n_current_time = gettime();

		if ( b_outside_playable_space_this_frame && !b_outside_playable_last_check )
			self.leaper_outside_playable_space_time = n_current_time;
		else if ( !b_outside_playable_space_this_frame )
			self.leaper_outside_playable_space = -1;

		b_leaper_has_been_alive_long_enough = n_current_time - self.leaper_failsafe_start_time > 3000;
		b_leaper_is_in_scripted_state = self isinscriptedstate();
		b_leaper_has_been_out_of_playable_space_long_enough_to_delete = b_outside_playable_space_this_frame && n_current_time - self.leaper_outside_playable_space_time > 2000;
		b_can_delete = b_leaper_has_been_alive_long_enough && !b_leaper_is_in_scripted_state && b_leaper_has_been_out_of_playable_space_long_enough_to_delete;

		if ( b_can_delete )
		{
			playsoundatposition( "zmb_vocals_leaper_fall", self.origin );
			self leaper_cleanup();
/#
			str_traversal_data = "";

			if ( isdefined( self.traversestartnode ) )
				str_traversal_data = " Last traversal used = " + self.traversestartnode.animscript + " at " + self.traversestartnode.origin;

			iprintln( "leaper at " + self.origin + " with spawn point " + self.spawn_point.origin + " out of play space. DELETING!" + str_traversal_data );
#/
			self delete();
			return;
		}

		wait 1;
	}
}

is_leaper_outside_playable_space( playable_area )
{
	b_outside_play_space = 1;

	foreach ( area in playable_area )
	{
		if ( self sys::istouching( area ) )
		{
			b_outside_play_space = 0;
			break;
		}
	}

	return b_outside_play_space;
}

leaper_cleanup()
{
	self leaper_stop_trail_fx();
	self notify( "leaper_cleanup" );
	wait 0.05;
	level.zombie_total++;
}

leaper_spawn_failsafe()
{
	self endon( "death" );

	while ( true )
	{
		prevorigin = self.origin;
		dist_sq = 0;

		for ( i = 0; i < 3; i++ )
		{
			if ( is_true( self.sliding_on_goo ) )
				dist_sq = dist_sq + 576;

			wait 1;
			dist_sq = dist_sq + sys::distancesquared( self.origin, prevorigin );
			prevorigin = self.origin;
		}

		if ( dist_sq < 576 )
		{
			if ( !is_true( self.melee_attack ) )
			{
				self leaper_cleanup();
/#
				str_traversal_data = "";

				if ( isdefined( self.traversestartnode ) )
					str_traversal_data = " Last traversal used = " + self.traversestartnode.animscript + " at " + self.traversestartnode.origin;

				iprintln( "leaper_spawn_failsafe() killing leaper at " + self.origin + " with spawn point " + self.spawn_point.origin + "!\\n" + str_traversal_data );
#/
				self dodamage( self.health + 100, ( 0, 0, 0 ) );
				break;
			}
			else
			{
/#
				if ( getdvarint( #"_id_5A273E4B" ) == 1 )
					iprintln( "leaper tried melee" );
#/
				self.melee_attack = 0;
			}
		}
	}
}

do_leaper_emerge( spot )
{
	self endon( "death" );
	self.deathfunction = ::leaper_death_ragdoll;
	self.no_powerups = 1;
	self.in_the_ceiling = 1;
	spot.is_spawning = 1;
	anim_org = spot.origin;
	anim_ang = spot.angles;
	self sys::ghost();
	self thread maps\mp\zombies\_zm_spawner::hide_pop();
	self thread leaper_death_wait( "spawn_anim" );

	if ( isdefined( level.custom_faller_entrance_logic ) )
		self thread [[ level.custom_faller_entrance_logic ]]();

	self leaper_emerge();
	wait 0.1;
	self notify( "spawn_anim_finished" );
	spot.is_spawning = 0;
}

leaper_death_ragdoll()
{
	self startragdoll();
	self launchragdoll( ( 0, 0, -1 ) );
	return self maps\mp\zombies\_zm_spawner::zombie_death_animscript();
}

leaper_death_wait( endon_notify )
{
	self endon( "spawn_anim_finished" );
	self waittill( "death" );
	self.spawn_point.is_spawning = 0;
}

leaper_emerge()
{
	self endon( "death" );

	if ( self.spawn_point.script_parameters == "emerge_bottom" )
		self sys::animscripted( self.spawn_point.origin, self.spawn_point.angles, "zm_spawn_elevator_from_floor" );
	else
		self sys::animscripted( self.spawn_point.origin, self.spawn_point.angles, "zm_spawn_elevator_from_ceiling" );

	self maps\mp\animscripts\zm_shared::donotetracks( "spawn_anim" );
	self.deathfunction = maps\mp\zombies\_zm_spawner::zombie_death_animscript;
	self.in_the_ceiling = 0;
}

leaper_round_start_audio()
{
	wait 2.5;
	players = sys::getplayers();
	num = randomintrange( 0, players.size );
	players[num] maps\mp\zombies\_zm_audio::create_and_play_dialog( "general", "leaper_round" );
	array_thread( players, ::wait_for_player_to_see_leaper );
	array_thread( players, ::wait_for_leaper_attack );
}

wait_for_player_to_see_leaper()
{
	self endon( "disconnect" );
	level endon( "leaper_round_ending" );

	while ( true )
	{
		leapers = getaiarray( level.zombie_team );

		foreach ( leaper in leapers )
		{
			player_vec = sys::vectornormalize( anglestoforward( self.angles ) );
			player_leaper = sys::vectornormalize( leaper.origin - self.origin );
			dot = sys::vectordot( player_vec, player_leaper );

			if ( dot > 0.707 )
			{
				if ( sighttracepassed( self.origin + vectorscale( ( 0, 0, 1 ), 40.0 ), leaper.origin + vectorscale( ( 0, 0, 1 ), 10.0 ), 0, self ) )
				{
					self maps\mp\zombies\_zm_audio::create_and_play_dialog( "general", "leaper_seen" );
					return;
				}
			}
		}

		wait 0.25;
	}
}

wait_for_leaper_attack()
{
	self endon( "disconnect" );
	level endon( "leaper_round_ending" );

	while ( true )
	{
		self waittill( "melee_swipe", enemy );

		if ( isdefined( enemy.is_leaper ) && enemy.is_leaper )
		{
			self thread do_player_general_vox( "general", "leaper_attack", 10, 5 );
			wait 5;
		}
	}
}

leaper_elevator_failsafe()
{
	self endon( "death" );
	free_pos = ( 3780, 1750, 1887 );

	while ( true )
	{
		if ( self maps\mp\zombies\_zm_zonemgr::entity_in_zone( "zone_orange_elevator_shaft_bottom" ) )
		{
			if ( self check_traverse_height() )
			{
				wait 3;

				if ( self check_traverse_height() )
				{
					self forceteleport( free_pos );
					wait 3;
				}
			}
		}

		wait 0.2;
	}
}

check_traverse_height()
{
	if ( isdefined( self.traversestartnode ) )
	{
		traverse_height = self.traversestartnode.origin[2] - self.origin[2];

		if ( traverse_height > 300 )
			return true;
	}

	return false;
}
