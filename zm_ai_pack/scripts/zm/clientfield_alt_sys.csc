execute_clientfield_alt_callback_internal( data, field_type, field_name )
{
	foreach ( item in data )
	{
		entnum = item.entnum;
		field_data = level.clientfield_alts[ field_type ][ field_name ];
		ent = getEntByNum( 0, entnum );

		assert( isDefined( ent ) );

		ent thread [[ field_data.callback ]]( item.value );
	}
}

get_data_from_payload( payload )
{
	data = [];
	keys = strtok( payload, "|" );
	foreach ( key in keys )
	{
		struct = spawnStruct();
		tokens = strTok( key, " " );
		
		struct.entnum = int( tokens[ 0 ] );
		struct.value = tokens[ 1 ];
		data[ data.size ] = struct;
	}

	return data;
}

execute_clientfield_alt_callback( payload, field_type, field_name )
{
	data = get_data_from_payload( payload );

	execute_clientfield_alt_callback_internal( data, field_type, field_name );
}

handle_clientfield_alt_callbacks( dvar_name, field_type, field_name )
{
	level endon( "disconnect" );

	for (;;)
	{
		dvar_value = getDvar( dvar_name );
		if ( dvar_value != "" )
		{
			if ( getDvarInt( "clientfield_alt_debug" ) )
			{
				print( "handle_clientfield_alt_callbacks( " + dvar_name + ", " + field_type + ", " + field_name + " )" );
				print( "handle_clientfield_alt_callbacks() dvar_value: \"" + dvar_value + "\"" );
			}

			level execute_clientfield_alt_callback( dvar_value, field_type, field_name );
			setdvar( dvar_name, "" );
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