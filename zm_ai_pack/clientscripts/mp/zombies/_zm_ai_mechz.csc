// T6 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool
#include clientscripts\mp\_utility;
#include clientscripts\mp\zombies\_zm_utility;

#include scripts\zm\zm_ai_pack_mod_main;
#include scripts\zm\clientfield_alt_sys;

precache()
{

}

#using_animtree("mechz_claw");

init_animtree()
{
	if ( getDvar( "mapname" ) != "zm_tomb" )
	{
		wait 0.05;
	}

	scriptmodelsuseanimtree( #animtree );
}

add_fx_element( index, fx_element, tag_name, min_freq, max_freq )
{
	if ( !isdefined( level.mechz_clientside_fx ) )
		level.mechz_clientside_fx = [];

	if ( !isdefined( level.mechz_clientside_fx_inst ) )
		level.mechz_clientside_fx_inst = [];

	if ( !isdefined( level.mechz_clientside_fx[index] ) )
		level.mechz_clientside_fx[index] = [];

	if ( !isdefined( level.mechz_clientside_fx_inst[index] ) )
		level.mechz_clientside_fx_inst[index] = [];

	new_fx_struct = spawnstruct();
	new_fx_struct.fx_element = loadfx( fx_element );
	new_fx_struct.tag_name = tag_name;
	new_fx_struct.min_freq = min_freq;
	new_fx_struct.max_freq = max_freq;
	curr_size = level.mechz_clientside_fx[index].size;
	level.mechz_clientside_fx[index][curr_size] = new_fx_struct;
}

main()
{
	register_clientfield_alt( "toplayer", "mechz_grab", "int", ::mechz_claw_callback_alt );
	register_clientfield_alt( "actor", "mechz_fx", "int", ::mechz_handle_fx_alt );
	//registerclientfield( "actor", "mechz_fx", 14000, 12, "int", ::mechz_handle_fx );
	//registerclientfield( "toplayer", "mechz_grab", 14000, 1, "int", ::mechz_claw_callback );
	if ( getDvar( "mapname" ) != "zm_buried" || getDvar( "g_gametype" ) != "zclassic" )
	{
		registerclientfield( "actor", "anim_rate", 14000, 2, "float", undefined, 0 );
		setupclientfieldanimspeedcallbacks( "actor", 1, "anim_rate" );
	}
	add_fx_element( 0, "maps/zombie_tomb/fx_tomb_mech_dmg_armor", "J_Knee_Attach_LE" );
	add_fx_element( 0, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_Knee_Attach_LE", 0.25, 0.75 );
	add_fx_element( 0, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_Knee_Attach_LE", 0.1, 0.3 );
	add_fx_element( 1, "maps/zombie_tomb/fx_tomb_mech_dmg_armor", "J_Knee_Attach_RI" );
	add_fx_element( 1, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_Knee_Attach_RI", 0.25, 0.75 );
	add_fx_element( 1, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_Knee_Attach_RI", 0.1, 0.3 );
	add_fx_element( 2, "maps/zombie_tomb/fx_tomb_mech_dmg_armor", "J_ShoulderArmor_LE" );
	add_fx_element( 2, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_ShoulderArmor_LE", 0.25, 0.75 );
	add_fx_element( 2, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_ShoulderArmor_LE", 0.1, 0.3 );
	add_fx_element( 3, "maps/zombie_tomb/fx_tomb_mech_dmg_armor", "J_ShoulderArmor_RI" );
	add_fx_element( 3, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_ShoulderArmor_RI", 0.25, 0.75 );
	add_fx_element( 3, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_ShoulderArmor_RI", 0.1, 0.3 );
	add_fx_element( 4, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_Root_Attach_RI", 0.25, 0.75 );
	add_fx_element( 4, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_Root_Attach_RI", 0.1, 0.3 );
	add_fx_element( 5, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_Root_Attach_LE", 0.25, 0.75 );
	add_fx_element( 5, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_Root_Attach_LE", 0.1, 0.3 );
	add_fx_element( 6, "maps/zombie_tomb/fx_tomb_mech_wpn_flamethrower", "tag_flamethrower_FX", 0.25 );
	add_fx_element( 7, "maps/zombie_tomb/fx_tomb_mech_jump_booster", "tag_booster_LE_FX", 0.25 );
	add_fx_element( 7, "maps/zombie_tomb/fx_tomb_mech_jump_booster", "tag_booster_RI_FX", 0.25 );
	add_fx_element( 7, "maps/zombie_tomb/fx_tomb_mech_jump_booster_sm", "tag_leg_booster_LE_FX", 0.25 );
	add_fx_element( 7, "maps/zombie_tomb/fx_tomb_mech_jump_booster_sm", "tag_leg_booster_RI_FX", 0.25 );
	add_fx_element( 8, "maps/zombie_tomb/fx_tomb_mech_wpn_source", "tag_claw", 0.5 );
	add_fx_element( 9, "maps/zombie_tomb/fx_tomb_mech_jump_landing", "tag_origin" );
	add_fx_element( 10, "maps/zombie_tomb/fx_tomb_mech_dmg_armor_face", "J_Helmet" );
	add_fx_element( 11, "maps/zombie_tomb/fx_tomb_mech_head_light", "tag_headlamp_FX" );
	registermechzfootstepcb( "zm_tomb_mech_zombie", ::mechzfootstepcbfunc );
	level._effect["mech_footstep_steam"] = loadfx( "maps/zombie_tomb/fx_tomb_mech_foot_step_steam" );
	level._effect["mech_exhaust_smoke"] = loadfx( "maps/zombie_tomb/fx_tomb_mech_exhaust_smoke" );
	level thread init_animtree();
	scripts\zm\zm_ai_pack_mod_main::add_visionset_callback( ::register_burn_overlay );
}

register_burn_overlay()
{
	if ( getDvar( "mapname" ) == "zm_transit" || getDvar( "mapname" ) == "zm_tomb" )
	{
		return;
	}
	clientscripts\mp\_visionset_mgr::vsmgr_register_overlay_info_style_burn( "zm_transit_burn", 14000, 15, 2 );
}

init()
{
	registerclientfield( "actor", "mechz_fx", 14000, 12, "int", ::mechz_handle_fx );
	add_fx_element( 0, "maps/zombie_tomb/fx_tomb_mech_dmg_armor", "J_Knee_Attach_LE" );
	add_fx_element( 0, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_Knee_Attach_LE", 0.25, 0.75 );
	add_fx_element( 0, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_Knee_Attach_LE", 0.1, 0.3 );
	add_fx_element( 1, "maps/zombie_tomb/fx_tomb_mech_dmg_armor", "J_Knee_Attach_RI" );
	add_fx_element( 1, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_Knee_Attach_RI", 0.25, 0.75 );
	add_fx_element( 1, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_Knee_Attach_RI", 0.1, 0.3 );
	add_fx_element( 2, "maps/zombie_tomb/fx_tomb_mech_dmg_armor", "J_ShoulderArmor_LE" );
	add_fx_element( 2, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_ShoulderArmor_LE", 0.25, 0.75 );
	add_fx_element( 2, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_ShoulderArmor_LE", 0.1, 0.3 );
	add_fx_element( 3, "maps/zombie_tomb/fx_tomb_mech_dmg_armor", "J_ShoulderArmor_RI" );
	add_fx_element( 3, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_ShoulderArmor_RI", 0.25, 0.75 );
	add_fx_element( 3, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_ShoulderArmor_RI", 0.1, 0.3 );
	add_fx_element( 4, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_Root_Attach_RI", 0.25, 0.75 );
	add_fx_element( 4, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_Root_Attach_RI", 0.1, 0.3 );
	add_fx_element( 5, "maps/zombie_tomb/fx_tomb_mech_dmg_sparks", "J_Root_Attach_LE", 0.25, 0.75 );
	add_fx_element( 5, "maps/zombie_tomb/fx_tomb_mech_dmg_steam", "J_Root_Attach_LE", 0.1, 0.3 );
	add_fx_element( 6, "maps/zombie_tomb/fx_tomb_mech_wpn_flamethrower", "tag_flamethrower_FX", 0.25 );
	add_fx_element( 7, "maps/zombie_tomb/fx_tomb_mech_jump_booster", "tag_booster_LE_FX", 0.25 );
	add_fx_element( 7, "maps/zombie_tomb/fx_tomb_mech_jump_booster", "tag_booster_RI_FX", 0.25 );
	add_fx_element( 7, "maps/zombie_tomb/fx_tomb_mech_jump_booster_sm", "tag_leg_booster_LE_FX", 0.25 );
	add_fx_element( 7, "maps/zombie_tomb/fx_tomb_mech_jump_booster_sm", "tag_leg_booster_RI_FX", 0.25 );
	add_fx_element( 8, "maps/zombie_tomb/fx_tomb_mech_wpn_source", "tag_claw", 0.5 );
	add_fx_element( 9, "maps/zombie_tomb/fx_tomb_mech_jump_landing", "tag_origin" );
	add_fx_element( 10, "maps/zombie_tomb/fx_tomb_mech_dmg_armor_face", "J_Helmet" );
	add_fx_element( 11, "maps/zombie_tomb/fx_tomb_mech_head_light", "tag_headlamp_FX" );
	registerclientfield( "toplayer", "mechz_grab", 14000, 1, "int", ::mechz_claw_callback );
	registermechzfootstepcb( "zm_tomb_mech_zombie", ::mechzfootstepcbfunc );
	level._effect["mech_footstep_steam"] = loadfx( "maps/zombie_tomb/fx_tomb_mech_foot_step_steam" );
	level._effect["mech_exhaust_smoke"] = loadfx( "maps/zombie_tomb/fx_tomb_mech_exhaust_smoke" );
	init_animtree();
}

setup_fx_alt( index )
{
	if ( !is_true( self.fx_initialized ) )
	{
		self.fx_initialized = 1;
		self.smoke_fx = playfxontag( 0, level._effect["mech_exhaust_smoke"], self, "tag_back_exhaust_FX" );
		self setsoundentcontext( "f35", "interior" );
	}

	if ( index == 10 )
		self setsoundentcontext( "f35", "exterior" );

	for ( i = 0; i < level.mechz_clientside_fx[index].size; i++ )
	{
		fx_struct = level.mechz_clientside_fx[index][i];
		unique_script_id = "kill_fx_" + index + "_" + self getentitynumber();
		self thread sndplayfxloops( 0, index, fx_struct.tag_name );

		if ( isdefined( fx_struct.min_freq ) )
		{
			self thread mechz_do_manual_looping_fx( 0, unique_script_id, fx_struct.tag_name, fx_struct.fx_element, fx_struct.min_freq, fx_struct.max_freq );
			continue;
		}

		self thread mechz_do_auto_looping_fx( 0, index, fx_struct.tag_name, fx_struct.fx_element );
	}
}

setup_fx( localclientnum, index, bnewent, binitialsnap, fieldname, bwasdemojump )
{
	if ( !is_true( self.fx_initialized ) )
	{
		self.fx_initialized = 1;
		self.smoke_fx = playfxontag( localclientnum, level._effect["mech_exhaust_smoke"], self, "tag_back_exhaust_FX" );
		self setsoundentcontext( "f35", "interior" );
	}

	if ( index == 10 )
		self setsoundentcontext( "f35", "exterior" );

	for ( i = 0; i < level.mechz_clientside_fx[index].size; i++ )
	{
		fx_struct = level.mechz_clientside_fx[index][i];
		unique_script_id = "kill_fx_" + index + "_" + self getentitynumber();
		self thread sndplayfxloops( localclientnum, index, fx_struct.tag_name );

		if ( isdefined( fx_struct.min_freq ) )
		{
			self thread mechz_do_manual_looping_fx( localclientnum, unique_script_id, fx_struct.tag_name, fx_struct.fx_element, fx_struct.min_freq, fx_struct.max_freq );
			continue;
		}

		self thread mechz_do_auto_looping_fx( localclientnum, index, fx_struct.tag_name, fx_struct.fx_element );
	}
}

cleanup_fx_alt( index )
{
	unique_script_id = "kill_fx_" + index + "_" + self getentitynumber();
	fx_array = level.mechz_clientside_fx_inst[index];

	if ( isdefined( fx_array ) && fx_array.size > 0 )
	{
		for ( i = fx_array.size - 1; i >= 0; i-- )
		{
			stopfx( 0, fx_array[i] );
			fx_array[i] = undefined;
		}
	}

	if ( getDvarInt( "clientfield_alt_mechz_debug" ) )
	{
		print( "cleanup_fx_alt( " + unique_script_id + " )" );
	}
	self notify( unique_script_id );
}

cleanup_fx( localclientnum, index, bnewent, binitialsnap, fieldname, bwasdemojump )
{
	unique_script_id = "kill_fx_" + index + "_" + self getentitynumber();
	fx_array = level.mechz_clientside_fx_inst[index];

	if ( isdefined( fx_array ) && fx_array.size > 0 )
	{
		for ( i = fx_array.size - 1; i >= 0; i-- )
		{
			stopfx( localclientnum, fx_array[i] );
			fx_array[i] = undefined;
		}
	}

	self notify( unique_script_id );
}

mechz_handle_fx_alt( new_val )
{
	if ( !isdefined( self.mechz_handle_fx_alt_old_val ) )
	{
		self.mechz_handle_fx_alt_old_val = 0;
	}
	newval = int( new_val );
	oldval = self.mechz_handle_fx_alt_old_val;
	if ( getDvarInt( "clientfield_alt_mechz_debug" ) )
	{
		print( "mechz_handle_fx_alt( " + oldval + ", " + newval + " )" );
	}
	for ( i = 0; i < level.mechz_clientside_fx.size; i++ )
	{
		set_in_new = ( newval & ( 1 << i ) ) != 0;
		set_in_old = ( oldval & ( 1 << i ) ) != 0;

		if ( getDvarInt( "clientfield_alt_mechz_debug" ) )
		{
			print( "mechz_handle_fx_alt( checked bits: " + set_in_new + ", " + set_in_old + " )" );
		}

		if ( set_in_new && !set_in_old )
		{
			self thread setup_fx_alt( i );
			continue;
		}

		if ( !set_in_new && set_in_old )
			self thread cleanup_fx_alt( i );
	}

	if ( !newval && is_true( self.fx_initialized ) )
	{
		self.fx_initialized = 0;

		if ( isdefined( self.smoke_fx ) )
			deletefx( 0, self.smoke_fx );
	}

	self.mechz_handle_fx_alt_old_val = newval;
}

mechz_handle_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
	for ( i = 0; i < level.mechz_clientside_fx.size; i++ )
	{
		set_in_new = ( newval & 1 << i ) != 0;
		set_in_old = ( oldval & 1 << i ) != 0;

		if ( set_in_new && !set_in_old )
		{
			self thread setup_fx( localclientnum, i, bnewent, binitialsnap, fieldname, bwasdemojump );
			continue;
		}

		if ( !set_in_new && set_in_old )
			self thread cleanup_fx( localclientnum, i, bnewent, binitialsnap, fieldname, bwasdemojump );
	}

	if ( !newval && is_true( self.fx_initialized ) )
	{
		self.fx_initialized = 0;

		if ( isdefined( self.smoke_fx ) )
			deletefx( localclientnum, self.smoke_fx );
	}
}

mechz_do_manual_looping_fx( localclientnum, script_id, tag_name, fx_element, min_wait, max_wait )
{
	self endon( script_id );
	self endon( "death" );

	if ( !isdefined( min_wait ) )
	{
		playfxontag( localclientnum, fx_element, self, tag_name );
		return;
	}

	if ( !isdefined( max_wait ) )
		max_wait = min_wait;

	while ( true )
	{
		if ( !isdefined( self ) )
			return;

		playfxontag( localclientnum, fx_element, self, tag_name );
		waitrealtime( randomfloatrange( min_wait, max_wait ) );
		wait randomfloatrange( min_wait, max_wait );
	}
}

mechz_do_auto_looping_fx( localclientnum, index, tag_name, fx_element )
{
	curr_size = level.mechz_clientside_fx_inst[index].size;
	level.mechz_clientside_fx_inst[index][curr_size] = playfxontag( localclientnum, fx_element, self, tag_name );
}

mechz_screen_shake_loop( localclientnum )
{
	self endon( "death" );
	self endon( "disconnect" );
	self endon( "kill_screen_shake" );

	while ( true )
	{
		self playrumbleonentity( localclientnum, "mechz_footsteps" );
		waitrealtime( 0.1 );
		wait 0.1;
	}
}

mechz_claw_callback_alt( new_val )
{
	if ( !isdefined( self.mechz_claw_callback_alt_old_val ) )
	{
		self.mechz_claw_callback_alt_old_val = 0;
	}
	oldval = self.mechz_claw_callback_alt_old_val;
	newval = int( new_val );
	if ( oldval == 1 && newval == 0 )
	{
		self stoprumble( 0, "mechz_footsteps" );
		self notify( "kill_screen_shake" );
	}
	else if ( newval == 1 )
		self thread mechz_screen_shake_loop( 0 );
	self.mechz_claw_callback_alt_old_val = newval;
}

mechz_claw_callback( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
	if ( oldval == 1 && newval == 0 )
	{
		self stoprumble( localclientnum, "mechz_footsteps" );
		self notify( "kill_screen_shake" );
	}
	else if ( newval == 1 )
		self thread mechz_screen_shake_loop( localclientnum );
}

mechzfootstepcbfunc( localclientnum, pos, surface, notetrack, bone )
{
	players = getlocalplayers();

	for ( i = 0; i < players.size; i++ )
	{
		if ( !players[i] isplayer() )
			continue;

		if ( abs( self.origin[2] - players[i].origin[2] ) < 100 )
		{
			n_distance = distance2d( self.origin, players[i].origin );

			if ( n_distance < 1500 && n_distance > 750 )
			{
				if ( !is_true( players[i].mechz_camshake ) )
				{
					players[i] earthquake( 0.25, 0.1, self.origin, 1500 );
					players[i] thread prevent_camshake_stacking();
				}

				playerlocalclientnum = players[i] getlocalclientnumber();

				if ( isdefined( playerlocalclientnum ) )
					playrumbleonposition( playerlocalclientnum, "shotgun_fire", self.origin );

				continue;
			}

			if ( n_distance < 750 )
			{
				if ( !is_true( players[i].mechz_camshake ) )
				{
					players[i] earthquake( 0.35, 0.1, self.origin, 750 );
					players[i] thread prevent_camshake_stacking();
				}

				playerlocalclientnum = players[i] getlocalclientnumber();

				if ( isdefined( playerlocalclientnum ) )
					playrumbleonposition( playerlocalclientnum, "mechz_footsteps", self.origin );
			}
		}
	}

	if ( bone == "j_ball_ri" )
		playfxontag( localclientnum, level._effect["mech_footstep_steam"], self, "tag_foot_steam_RI" );
	else if ( bone == "j_ball_le" )
		playfxontag( localclientnum, level._effect["mech_footstep_steam"], self, "tag_foot_steam_LE" );

	footstepdoeverything();
}

prevent_camshake_stacking()
{
	self.mechz_camshake = 1;
	wait 0.1;
	self.mechz_camshake = 0;
}

registermechzfootstepcb( aitype, func )
{
	if ( !isdefined( level._footstepcbfuncs ) )
		level._footstepcbfuncs = [];

	if ( isdefined( level._footstepcbfuncs[aitype] ) )
	{
/#
		println( "Attempting to register footstep callback function for ai type " + aitype + " multiple times." );
#/
		return;
	}

	level._footstepcbfuncs[aitype] = func;
}

sndplayfxloops( localclientnum, index, tag_name )
{
	if ( index == 6 )
		self thread sndflamethrower_start( localclientnum, index, tag_name );
}

sndflamethrower_start( localclientnum, index, tag_name )
{
	self endon( "stop_flamethrower" );
	sndorigin = self gettagorigin( tag_name );
	sndent = spawn( 0, sndorigin, "script_origin" );
	sndent linkto( self, tag_name );
	sndent playsound( 0, "zmb_ai_mechz_flame_start" );
	sndent playloopsound( "zmb_ai_mechz_flame_loop", 0.6 );
	sndflamethrower_stop( sndent, index );
}

sndflamethrower_stop( ent, index )
{
	notify_name = "kill_fx_" + index + "_" + self getentitynumber();
	self waittill( notify_name );
	ent playsound( 0, "zmb_ai_mechz_flame_stop" );
	ent stoploopsound( 0.25 );
	wait 1;
	ent delete();
}
