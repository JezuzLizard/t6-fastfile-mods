
main()
{
	level thread on_player_connecting();
}

init()
{
	keys = getarraykeys( level.clientfield_alts );
	for ( i = 0; i < keys.size; i++ )
	{
		if ( keys[ i ] == "toplayer" )
		{
			continue;
		}
		fields = level.clientfield_alts[ keys[ i ] ];
		for ( j = 0; j < fields.size; j++ )
		{
			initialize_clientfield_alt_storage_for_level( fields[ j ] );
			level thread send_clientdvar_messages_allplayers( fields[ j ] );
		}
	}
}

on_player_connecting()
{
	for (;;)
	{
		level waittill( "connecting", player );
		fields = level.clientfield_alts[ "toplayer" ];
		for ( i = 0; i < fields.size; i++ )
		{
			player initialize_clientfield_alt_storage_for_player( fields[ i ] );
			player send_clientdvar_messages_toplayer( fields[ i ] );
		}
	}
}

set_clientfield_alt_toplayer( field_name, ent, value )
{
	entnum = ent getEntityNumber();
	self.clientfield_alt_storage[ field_name ] += entnum + " " + value + "|";
}

send_clientdvar_messages_toplayer( field_name )
{
	self endon( "disconnect" );
	for (;;)
	{
		wait 0.05;

		if ( self.clientfield_alt_storage[ field_name ] == "" )
		{
			continue;
		}
		self setclientdvar( field_name, self.clientfield_alt_storage[ field_name ] );
		self.clientfield_alt_storage[ field_name ] = "";
	}
}

set_clientfield_alt_allplayers( field_name, ent, value )
{
	entnum = ent getEntityNumber();
	level.clientfield_alt_storage[ field_name ] += entnum + " " + value + "|";
}

send_clientdvar_messages_allplayers( field_name )
{
	for (;;)
	{
		wait 0.05;

		if ( level.clientfield_alt_storage[ field_name ] == "" )
		{
			continue;
		}
		for ( i = 0; i < level.players.size; i++ )
		{
			level.players[ i ] setclientdvar( field_name, level.clientfield_alt_storage[ field_name ] );
		}
		level.clientfield_alt_storage[ field_name ] = "";
	}
}

initialize_clientfield_alt_storage_for_player( field_name )
{
	if ( !isdefined( self.clientfield_alt_storage ) )
	{
		self.clientfield_alt_storage = [];
	}
	self.clientfield_alt_storage[ field_name ] = "";
}

initialize_clientfield_alt_storage_for_level( field_name )
{
	if ( !isdefined( level.clientfield_alt_storage ) )
	{
		level.clientfield_alt_storage = [];
	}
	level.clientfield_alt_storage[ field_name ] = "";
}

register_clientfield_alt( field_type, field_name )
{
	if ( !isDefined( level.clientfield_alts ) )
	{
		level.clientfield_alts = [];
	}
	if ( !isDefined( level.clientfield_alts[ field_type ] ) )
	{
		level.clientfield_alts[ field_type ] = [];
	}
	
	level.clientfield_alts[ field_type ][ level.clientfield_alts[ field_type ].size ] = field_name;
}