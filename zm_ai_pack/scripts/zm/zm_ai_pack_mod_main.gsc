#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm_spawner;
#include maps\mp\zombies\_zm;

#include maps\mp\zombies\_zm_ai_avogadro;
#include maps\mp\zombies\_zm_ai_screecher;
#include maps\mp\zombies\_zm_ai_ghost;
#include maps\mp\zombies\_zm_ai_brutus;
#include maps\mp\zombies\_zm_ai_mechz;
#include maps\mp\zombies\_zm_ai_dogs;

main()
{
	pluto_sys::replacefunc( maps\mp\_visionset_mgr::init, ::visionset_mgr_init_override );
	pluto_sys::replacefunc( maps\mp\animscripts\traverse\zm_shared::dotraverse, ::dotraverse_override );

	replace_single_function( "maps/mp/zm_nuked_perks", "perk_machine_knockdown_zombie", ::perk_machine_knockdown_zombie_override );
	replace_single_function( "maps/mp/zombies/_zm_weap_slowgun", "can_be_paralyzed", ::can_be_paralyzed_override );
	replace_single_function( "maps/mp/zombies/_zm_ai_sloth", "watch_crash_trigger", ::watch_crash_trigger_override );

	pluto_sys::replacefunc( maps\mp\zombies\_zm::round_think, scripts\zm\zm_ai_pack\_round_manager::round_think_override );

	pluto_sys::replacefunc( maps\mp\animscripts\zm_dog_combat::domeleeafterwait, ::domeleeafterwait_override );
	pluto_sys::replacefunc( maps\mp\animscripts\zm_dog_combat::handlemeleebiteattacknotetracks, ::handlemeleebiteattacknotetracks_override );

	level.script = toLower( getDvar( "mapname" ) );
	level.gametype = toLower( getDvar( "g_gametype" ) );

	level.ai_data = [];
	// level.ai_data[ "avogadro" ] = sys::spawnstruct();
	// level.ai_data[ "avogadro" ].main = maps\mp\zombies\_zm_ai_avogadro::main;
	// level.ai_data[ "avogadro" ].init = maps\mp\zombies\_zm_ai_avogadro::init;
	// level.ai_data[ "avogadro" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	// level.ai_data[ "screecher" ] = sys::spawnstruct();
	// level.ai_data[ "screecher" ].main = maps\mp\zombies\_zm_ai_screecher::main;
	// level.ai_data[ "screecher" ].init = maps\mp\zombies\_zm_ai_screecher::init;
	// level.ai_data[ "screecher" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	// level.ai_data[ "ghost" ] = sys::spawnstruct();
	// level.ai_data[ "ghost" ].main = maps\mp\zombies\_zm_ai_ghost::main;
	// level.ai_data[ "ghost" ].should_execute = !( level.script == "zm_buried" && level.gametype == "zclassic" );
	// level.ai_data[ "leaper" ] = sys::spawnstruct();
	// level.ai_data[ "leaper" ].main = maps\mp\zombies\_zm_ai_leaper::main;
	// level.ai_data[ "leaper" ].should_execute = level.script != "zm_highrise";
	level.ai_data[ "brutus" ] = sys::spawnstruct();
	level.ai_data[ "brutus" ].main = maps\mp\zombies\_zm_ai_brutus::main;
	level.ai_data[ "brutus" ].should_execute = level.script != "zm_prison";
	level.ai_data[ "mechz" ] = sys::spawnstruct();
	level.ai_data[ "mechz" ].main = maps\mp\zombies\_zm_ai_mechz::main;
	level.ai_data[ "mechz" ].init = maps\mp\zombies\_zm_ai_mechz::init;
	level.ai_data[ "mechz" ].should_execute = level.script != "zm_tomb";
	level.ai_data[ "zombie_dog" ] = sys::spawnstruct();
	level.ai_data[ "zombie_dog" ].init = maps\mp\zombies\_zm_ai_dogs::init;
	level.ai_data[ "zombie_dog" ].should_execute = level.gametype != "zstandard" ;	

	keys = getArrayKeys( level.ai_data );
	for ( i = 0; i < keys.size; i++ )
	{
		if ( isDefined( level.ai_data[ keys[ i ] ].main ) && isDefined( level.ai_data[ keys[ i ] ].should_execute ) 
			&& level.ai_data[ keys[ i ] ].should_execute )
		{
			level thread [[ level.ai_data[ keys[ i ] ].main ]]();
		}
	}
	if ( level.script != "zm_tomb" && level.script != "zm_prison" )
	{
		level thread check_solo_status();
	}

	scripts\zm\zm_ai_pack\_round_manager::main();
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

	level thread add_spawn_functions_to_spawners();
}

watch_for_damage_from_players()
{
	self endon( "death" );

	for (;;)
	{
		self waittill( "damage", amount, attacker, direction_vec, point, type );

		if ( !isdefined( amount ) )
			continue;

		if ( !isalive( self ) || self.delayeddeath )
			return;

		if ( !player_attacker( attacker ) )
			continue;

		self.has_been_damaged_by_player = true;

		if ( is_true( self.is_ghost ) )
		{
			continue;
		}
		self player_attacks_enemy( attacker, amount, type, point );
	}
}

add_spawn_functions_to_spawners()
{
	flag_wait( "initial_blackscreen_passed" );

	if ( isDefined( level.ghost_spawners ) )
	{
		array_thread( level.ghost_spawners, ::add_spawn_function, ::watch_for_damage_from_players );
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
	level thread maps\mp\_visionset_mgr::register_type( "visionset" );
	level thread maps\mp\_visionset_mgr::register_type( "overlay" );
	onfinalizeinitialization_callback( maps\mp\_visionset_mgr::finalize_clientfields );
	level thread maps\mp\_visionset_mgr::monitor();
	level thread maps\mp\_visionset_mgr::onplayerconnect();
	run_visionset_callbacks();
}

stop_basic_find_flesh()
{
	if ( isdefined( self.ai_state ) && self.ai_state == "find_flesh" )
	{
		self.ai_state = undefined;
		self notify( "stop_find_flesh" );
		self notify( "zombie_acquire_enemy" );
	}
}

dotraverse_teleport( no_powerups )
{
	if ( isDefined( self.is_traversing ) && self.is_traversing )
	{
		return;
	}

	self endon( "death" );

	endnode = self getnegotiationendnode();
	startnode = self getnegotiationstartnode();
	if ( !isdefined( endnode ) || !isdefined( startnode ) )
	{
		assertmsg( "dotraverse_teleport() missing endnode or startnode" );
		return;
	}

	units_per_frame = 2.5;
	original_origin = self.origin;
	steps = int( distance( original_origin, endnode.origin ) / units_per_frame );

	forward = vectorNormalize( endnode.origin - original_origin );
	forward *= units_per_frame;
	for ( i = 1; i < steps; i++ )
	{
		self.is_traversing = true;
		self stop_basic_find_flesh();
		self.ai_state = "idle";
		//self sys::setanimstatefromasd( "zm_idle" );
		self sys::animmode( "noclip" );
		self sys::orientmode( "face angle", startnode.angles[1] );
		self.origin = original_origin + ( forward * i );
		self setGoalPos( self.origin );
		wait 0.05;
		if ( distanceSquared( self.origin, endnode.origin ) <= units_per_frame * units_per_frame )
		{
			break;
		}
	}

	self.origin = endnode.origin;

	self sys::animmode( "none" );
	self.is_traversing = false;
}

dotraverse_override( traversestate, traversealias, no_powerups )
{
	if ( !self HasAnimStateFromASD( traversestate ) || self getanimsubstatefromasd( traversestate, traversealias ) == -1 )
	{
		self thread dotraverse_teleport( no_powerups );
		return;
	}
	self endon( "killanimscript" );
	self traversemode( "nogravity" );
	self traversemode( "noclip" );
	old_powerups = 0;

	if ( isdefined( no_powerups ) && no_powerups )
	{
		old_powerups = self.no_powerups;
		self.no_powerups = 1;
	}

	self.is_traversing = 1;
	self notify( "zombie_start_traverse" );
	self.traversestartnode = self getnegotiationstartnode();
	assert( isdefined( self.traversestartnode ) );
	self sys::orientmode( "face angle", self.traversestartnode.angles[1] );
	self.traversestartz = self.origin[2];

	if ( isdefined( self.pre_traverse ) )
		self [[ self.pre_traverse ]]();

	self sys::setanimstatefromasd( traversestate, traversealias );
	self maps\mp\animscripts\zm_shared::donotetracks( "traverse_anim" );
	self traversemode( "gravity" );
	self.a.nodeath = 0;

	if ( isdefined( self.post_traverse ) )
		self [[ self.post_traverse ]]();

	self maps\mp\animscripts\zm_run::needsupdate();

	if ( !self.isdog )
		self maps\mp\animscripts\zm_run::moverun();

	self.is_traversing = 0;
	self notify( "zombie_end_traverse" );

	if ( isdefined( no_powerups ) && no_powerups )
		self.no_powerups = old_powerups;
}

perk_machine_knockdown_zombie_override( origin )
{
	damage = int( self.health * 0.25 );
	if ( !is_true( self.no_gib )  )
	{
		self.a.gib_ref = random( array( "guts", "right_arm", "left_arm" ) );
		self thread maps\mp\animscripts\zm_death::do_gib();
		level.zombie_total++;
		level.zombie_total_subtract++;
		damage = self.health + 100;
	}

	self dodamage( damage, origin );
}

get_idle_anim()
{
	idle_anim = "";
	if ( isDefined( self.animname ) )
	{
		switch ( self.animname )
		{
			case "zombie_dog":
				idle_anim = "zm_stop_idle";
				break;
			case "mechz_zombie":
			case "brutus_zombie":
			case "ghost_zombie":
			case "zombie":
				if ( isDefined( self.has_legs ) && !self.has_legs )
				{
					idle_anim = "zm_idle_crawl";
				}
				else 
				{
					idle_anim = "zm_idle";
				}
				break;
			case "screecher":
			case "leaper_zombie":
				break;
			
		}
	}
	else if ( isDefined( self.is_avogadro ) && self.is_avogadro )
	{
		idle_anim = "zm_chamber_idle";
	}

	return idle_anim;
}

replace_single_function( path, func_name, func_override )
{
	func = pluto_sys::getfunction( path, func_name );

	if ( isDefined( func ) )
	{
		pluto_sys::replacefunc( func, func_override );
	}	
}

can_be_paralyzed_override( zombie )
{
	if ( is_true( zombie.immune_to_slowgun ) )
	{
		return false;
	}

	if ( is_true( zombie.is_ghost ) )
	{
		return false;
	}

	if ( is_true( zombie.guts_explosion ) )
	{
		return false;
	}

	if ( isdefined( zombie ) && zombie.health > 0 )
	{
		return true;
	}

	return false;
}

watch_crash_trigger_override()
{
	sloth_set_state_func = pluto_sys::getfunction( "maps/mp/zombies/_zm_ai_sloth", "sloth_set_state" );
	while ( true )
	{
		self waittill( "trigger", who );

		if ( isDefined( who ) && isDefined( level.sloth ) && who == level.sloth && who.state == "berserk" )
		{
			who setclientfield( "sloth_berserk", 0 );
			who [[ sloth_set_state_func ]]( "crash", 0 );
		}
	}
}

check_solo_status()
{
	if ( getnumexpectedplayers() == 1 && ( !sessionmodeisonlinegame() || !sessionmodeisprivate() ) && !isDedicated() )
	{
		level.is_forever_solo_game = 1;
	}
	else
	{
		level.is_forever_solo_game = 0;
	}
}

increment_enemy_count( who )
{
	if ( !is_true( who.has_been_damaged_by_player ) )
	{
		return;
	}

	if ( is_true( who.is_leaper ) )
	{
		who thread maps\mp\zombies\_zm_ai_leaper::leaper_cleanup();
	}
	else if ( is_true( who.is_mechz ) )
	{
		level.mechz_left_to_spawn++;
	}
	else if ( is_true( who.is_brutus ) )
	{
		level.brutus_count++;
	}
	//Maybe add dog increment here when possible
	else
	{
		level.zombie_total++;
	}
}

domeleeafterwait_override( time )
{
	self endon( "death" );
	wait( time );
	hitent = self melee();

	if ( isdefined( hitent ) )
	{
		if ( isplayer( hitent ) )
			hitent shellshock( "dog_bite", 0.35 );
	}
}

handlemeleebiteattacknotetracks_override( note, player )
{
	switch ( note )
	{
		case "dog_melee":
			if ( !isdefined( level.dogmeleebiteattacktime ) )
			{
				level.dogmeleebiteattacktime = gettime() - level.dogmeleebiteattacktimestart;
				level.dogmeleebiteattacktime = level.dogmeleebiteattacktime + 50;
			}

			hitent = self melee( anglestoforward( self.angles ) );

			if ( isdefined( hitent ) )
			{
				if ( isplayer( hitent ) )
					hitent shellshock( "dog_bite", 0.35 );
			}
			else if ( isdefined( level.dog_melee_miss ) )
				self [[ level.dog_melee_miss ]]( player );

			break;
		case "stop_tracking":
			melee_time = 200;

			if ( !isdefined( level.dogmeleebiteattacktime ) )
				level.dogmeleebiteattacktimestart = gettime();
			else
				melee_time = level.dogmeleebiteattacktime;

			self thread maps\mp\animscripts\zm_dog_combat::orienttoplayerdeadreckoning( player, melee_time );
			break;
	}
}