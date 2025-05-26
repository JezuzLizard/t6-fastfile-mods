main()
{
	level thread watch_say_notify_dvar();
	level thread command_thread();	
}

watch_say_notify_dvar()
{
	setDvar( "say_notify", "" );
	old_dvar_value = getdvar( "say_notify" );
	for (;;)
	{
		dvar_value = getdvar( "say_notify" );
		if ( dvar_value != old_dvar_value )
		{
			level notify( "say", dvar_value );
			setDvar( "say_notify", "" );
		}

		wait 0.01;
	}
}

command_thread()
{
	for (;;)
	{
		level waittill( "say", message );

		args = strTok( message, " " );

		switch ( args[ 0 ] )
		{
			case "printentities":
				level thread print_entities();
				break;
		}
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
	ents = getEntArray( 0 );

	print( "******CLIENT ENTITIES******" );
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