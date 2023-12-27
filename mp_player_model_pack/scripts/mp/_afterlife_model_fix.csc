#include clientscripts\mp\_utility;

main()
{
	level._effect["afterlife_ghost_fx"] = loadfx( "maps/zombie_alcatraz/fx_alcatraz_ghost_body" );
	level._effect["afterlife_ghost_h_fx"] = loadfx( "maps/zombie_alcatraz/fx_alcatraz_ghost_head" );
	level._effect["afterlife_ghost_arm_fx"] = loadfx( "maps/zombie_alcatraz/fx_alcatraz_ghost_arm" );
	level._effect["afterlife_ghost_hand_fx"] = loadfx( "maps/zombie_alcatraz/fx_alcatraz_ghost_hand" );
	level._effect["afterlife_ghost_hand_r_fx"] = loadfx( "maps/zombie_alcatraz/fx_alcatraz_ghost_hand_r" );
	level._effect["fx_alcatraz_ghost_vm_wrist"] = loadfx( "maps/zombie_alcatraz/fx_alcatraz_ghost_vm_wrist" );
	level._effect["fx_alcatraz_ghost_vm_wrist_r"] = loadfx( "maps/zombie_alcatraz/fx_alcatraz_ghost_vm_wrist_r" );
	level._effect["afterlife_pixie_dust"] = loadfx( "maps/zombie_alcatraz/fx_alcatraz_afterlife_pixies" );
	level._effect["fx_alcatraz_ghost_spectate"] = loadfx( "maps/zombie_alcatraz/fx_alcatraz_ghost_spec" );
	clientscripts\mp\_callbacks::addcallback( "on_finalize_initialization", ::afterlife_fix );

	level._customplayerconnectfuncs = ::afterlife_fix_connect;
}

afterlife_fix()
{
	registerclientfield( "allplayers", "player_afterlife_fx", 9000, 1, "int", ::toggle_player_afterlife_fx );
}

afterlife_fix_connect( player, localclientnum )
{
	//player init_filter_afterlife();
	//player thread afterlife_transition_fx();
	//player thread afterlife_watch_spectator( localclientnum );
}

afterlife_watch_spectator( localclientnum )
{
	self endon( "entityshutdown" );
	self endon( "death_or_disconnect" );
	self.camera_mode = "normal";
	self.last_camera_mode = "normal";
	//self thread track_camera_mode( localclientnum );

	while ( true )
	{
		if ( self.camera_mode != self.last_camera_mode )
		{
			switch ( self.camera_mode )
			{
				case "normal":
					self notify( "stop_player_fx" );
					self.last_camera_mode = self.camera_mode;
					break;
				case "spectating_1st_afterlife":
					//self thread player_afterlife_first_fx( localclientnum );
					self.last_camera_mode = self.camera_mode;
					break;
				case "spectating_3rd_afterlife":
					//self thread player_afterlife_spectator_fx( localclientnum );
					self.last_camera_mode = self.camera_mode;
					break;
			}
		}

		wait 0.05;
	}
}

toggle_player_afterlife_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
	if ( isspectating( localclientnum, 0 ) )
		return;

	if ( newval == 1 )
	{
		if ( self islocalplayer() && self getlocalclientnumber() == localclientnum )
			self thread player_afterlife_first_fx( localclientnum );
		else
			self thread player_afterlife_third_fx( localclientnum );
	}
	else
		self notify( "stop_player_fx" );
}

player_afterlife_first_fx( localclientnum )
{
	self notify( "stop_player_fx" );
	self endon( "stop_player_fx" );

	if ( isdemoplaying() )
		return;

	while ( true )
	{
		playviewmodelfx( localclientnum, level._effect["fx_alcatraz_ghost_vm_wrist"], "j_wrist_le" );
		playviewmodelfx( localclientnum, level._effect["fx_alcatraz_ghost_vm_wrist_r"], "j_wrist_ri" );
		wait 0.1;
		playviewmodelfx( localclientnum, level._effect["afterlife_pixie_dust"], "tag_weapon" );
		wait 0.1;
	}
}

player_afterlife_third_fx( localclientnum )
{
	self notify( "stop_player_fx" );
	self endon( "stop_player_fx" );
	self endon( "entityshutdown" );

	if ( isdemoplaying() )
		return;

	self waittill_dobj( localclientnum );
	//ent = spawn( localclientnum, self.origin, "script_origin" );
	//ent linkto( self, "tag_origin" );
	//ent playloopsound( "zmb_afterlife_ghost_loop" );
	//self thread snddeleteent( ent );

	while ( true )
	{
		playfxontag( localclientnum, level._effect["afterlife_ghost_fx"], self, "J_spine4" );
		playfxontag( localclientnum, level._effect["afterlife_ghost_h_fx"], self, "J_head" );
		playfxontag( localclientnum, level._effect["afterlife_ghost_arm_fx"], self, "J_elbow_ri" );
		wait 0.1;
		playfxontag( localclientnum, level._effect["afterlife_ghost_arm_fx"], self, "J_elbow_le" );
		playfxontag( localclientnum, level._effect["afterlife_ghost_hand_r_fx"], self, "J_wrist_ri" );
		playfxontag( localclientnum, level._effect["afterlife_ghost_hand_fx"], self, "J_wrist_le" );
		wait 0.1;
	}
}