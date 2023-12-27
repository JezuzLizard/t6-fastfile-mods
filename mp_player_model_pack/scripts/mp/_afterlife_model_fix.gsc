main()
{
	maps\mp\_utility::onfinalizeinitialization_callback( ::afterlife_fix );
	level thread on_player_connect();
}

on_player_connect()
{
	for (;;)
	{
		level waittill( "connected", player );
		player thread on_player_model_set();
	}
}

on_player_model_set()
{
	self endon( "disconnect" );
	for (;;)
	{
		self waittill( "player_model_set", team, alias, model_data );
		if ( alias == "ghost" )
		{
			self setclientfield( "player_afterlife_fx", 1 );
		}
		else
		{
			self setclientfield( "player_afterlife_fx", 0 );
		}
	}
}

afterlife_fix()
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
	registerclientfield( "allplayers", "player_afterlife_fx", 9000, 1, "int" );
}