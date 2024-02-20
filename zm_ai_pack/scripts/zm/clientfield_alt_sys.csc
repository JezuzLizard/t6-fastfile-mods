execute_clientfield_alt_callback_internal( data, last_data, field_type, field_name )
{
	entnum = data.entnum;
	ent = undefined;
	field_data = level.clientfield_alts[ field_type ][ field_name ];
	ent = getEntByNum( 0, entnum );

	assert( isDefined( ent ) );

	ent thread [[ field_data.callback ]]( data.value, last_data.value );
}

get_data_from_payload( payload )
{
	struct = spawnStruct();
	tokens = strTok( payload, " " );
	
	struct.entnum = int( tokens[ 0 ] );
	struct.value = tokens[ 1 ];

	return struct;
}

execute_clientfield_alt_callback( payload, last_payload, field_type, field_name )
{
	data = get_data_from_payload( payload );
	last_data = get_data_from_payload( last_payload );

	execute_clientfield_alt_callback_internal( data, last_data, field_type, field_name );
}

handle_clientfield_alt_callbacks( dvar_name, field_type, field_name )
{
	level endon( "disconnect" );

	old_dvar_value = getDvar( dvar_name );
	for (;;)
	{
		dvar_value = getDvar( dvar_name );
		if ( dvar_value != old_dvar_value )
		{
			level execute_clientfield_alt_callback( dvar_value, old_dvar_value, field_type, field_name );
			old_dvar_value = dvar_value;			
		}

		wait 0.01;
	}
}

register_clientfield_alt( field_type, field_name, field_value_type, field_callback )
{
	if ( !isDefined( level.clientfield_alts ) )
	{
		level.clientfield_alts = [];
	}
	if ( !isDefined( level.clientfield_alts[ field_type ] ) )
	{
		level.clientfield_alts[ field_type ] = [];
	}
	
	struct = spawnStruct();
	struct.value_type = field_value_type;
	struct.callback = field_callback;
	level.clientfield_alts[ field_type ][ field_name ] = struct;

	dvar_name = field_name;
	setDvar( dvar_name, "" );

	level thread handle_clientfield_alt_callbacks( dvar_name, field_type, field_name );
}