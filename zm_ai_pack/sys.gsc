// T6 Script Builtins
/@
	[DESCRIPTION]: Adds <fx_name> as a configstring to the fx configstring pool.
	Returns an index that can be used in many different functions and methods to play an fx.
	The fx configstring pool is limited to 195 entries before fx configstring overflow occurs.
	On Plutonium addonfx pool was added to bypass this limit so functions that add to this configstring pool
	have another 256 entries past the normal limit.;
	[CALL_TYPE]: function;
	[USAGE]: level._effect[ <effect_alias> ] = loadfx( <fx_name> );
	[PARAMS]: ARG1:<string>;
	[RETURNS]: <undefined>;
	[ERRORS]: 1. Will script error if called after the first frame of script execution.;
@/
loadfx( fx_name )
{
	loadfx( fx_name );
}

/@
	[DESCRIPTION]: Used on actor type entities.
	Unknown, does nothing in engine.;
	[CALL_TYPE]: method;
	[RETURNS]: NONE;
@/
setengagementmindist( a, b )
{
	self setengagementmindist( a, b );
}

/@
	[DESCRIPTION]: Used on actor type entities.
	Unknown, does nothing in engine.;
	[CALL_TYPE]: method;
	[RETURNS]: NONE;
@/
setengagementmaxdist( a, b )
{
	self setengagementmaxdist( a, b );
}

/@
	[DESCRIPTION]: Used on actor type entities.
	Unknown, sets bits on the s.lerp.u.actor.aiType variable in the engine.
	However, these bits are never accessed afterwards.;
	[CALL_TYPE]: method;
	[RETURNS]: NONE;
@/
setcharacterindex( index )
{
	self setcharacterindex( index );
}

/@
	[DESCRIPTION]: Used on actor spawner type entities.
	Sets the team on the actor so it can be used by getspawnerteamarray().
	This is its only purpose.;
	[CALL_TYPE]: method;
	[USAGE]: <actor_spawner> setspawnerteam( <team_str> );
	[PARAMS]: ENT:<actor_spawner> ARG1:<string>;
	[RETURNS]: NONE;
	[ERRORS]: 1. Must be called on an actor spawner type entity.;
@/
setspawnerteam( team )
{
	self setspawnerteam( team );
}

/@
	[DESCRIPTION]: Adds an animstatedef file to be parsed by the engine at a later time.
	Required for T6 actors to play anims properly.
	Should only be called in an aitype script's precache() function.;
	[CALL_TYPE]: function;
	[USAGE]: precacheanimstatedef( <ai_index>, <animtree>, <anim_state_def_name> );
	[PARAMS]: ARG1:<int> ARG2:<animtree> ARG3:<string>;
	[RETURNS]: NONE;
@/
precacheanimstatedef( ai_index, animtree, anim_state_def_name )
{
	precacheanimstatedef( ai_index, animtree, anim_state_def_name );
}

/@
	[DESCRIPTION]: Adds <shellshock_name> as a configstring to the shellshock configstring pool.
	Must be called before playing a shellshock on a player entity.
	The shellshock configstring pool is limited to 16 entries.;
	[CALL_TYPE]: function;
	[USAGE]: precacheshellshock( <shellshock_name> );
	[PARAMS]: ARG1:<string>;
	[RETURNS]: NONE;
	[ERRORS]: 1. Will script error if called after the first frame of script execution.
			  2. Will com error if called on a shellshock that does not exist and the default shellshock is missing.;
@/
precacheshellshock( shellshock_name )
{
	precacheshellshock( shellshock_name );
}

/@
	[DESCRIPTION]: Returns an array of entities on the map which could include temp entities, script spawned entities and permanent entities spawned by the engine.
	If no args are specified returns an array of every entity on the map.
	If <name> and <type> is specified then returns an array of entities whose fields match those args.
	Possible values for <type> are limited to the following:
	classname, target, targetname, script_noteworthy.;
	[CALL_TYPE]: function;
	[USAGE]: ents = getentarray( <name>, <type> );
	[PARAMS]: ARG1:[string] ARG2:[string];
	[PARAMS_NOTES]: If at least one arg is specified execution will expect at most and least one more arg.;
	[RETURNS]: <number_indexed_array>;
@/
getentarray( name, type )
{
	if ( isDefined( name ) )
	{
		if ( isDefined( type ) )
		{
			return getentarray( name, type );
		}
		else
		{
			assertMsg( "Scr_GetEntArray expects either no args to get all entities or two args to get entities with <name> and <type>" );
			return [];
		}
	}
	return getentarray();
}

/@
	[DESCRIPTION]: Creates a script struct and returns which can then be used like an entity for things like fields and function calls.
	Allocates to the parent variables which is limited to 32768 maximum structs/arrays/threads.
	[CALL_TYPE]: function;
	[USAGE]: struct = spawnstruct();
	[PARAMS]: NONE;
	[RETURNS]: <struct>;
@/
spawnstruct()
{
	return spawnstruct();
}

/@

@/
animmode( mode, clear_path )
{
	if ( !isDefined( clear_path ) )
	{
		self animmode( mode );
	}
	else
	{
		self animmode( mode, clear_path );
	}
}

/@

@/
orientmode( mode, special )
{
	if ( !isDefined( special ) )
	{
		self orientmode( mode );
	}
	else
	{
		self orientmode( mode, special );
	}
}

/@

@/
setfreecameralockonallowed( enabled )
{
	self setfreecameralockonallowed( enabled );
}

/@

@/
spawn( classname, origin, spawnflags, spawnvar1, spawnvar2, spawnvar3 )
{
	if ( !isDefined( spawnflags ) )
	{
		return spawn( classname, origin );
	}
	else if ( !isDefined( spawnvar1 ) )
	{
		return spawn( classname, origin, spawnflags );
	}
	else if ( !isDefined( spawnvar2 ) )
	{
		return spawn( classname, origin, spawnflags, spawnvar1 );
	}
	else if ( !isDefined( spawnvar3 ) )
	{
		return spawn( classname, origin, spawnflags, spawnvar1, spawnvar2 );
	}
	else
	{
		return spawn( classname, origin, spawnflags, spawnvar1, spawnvar2, spawnvar3 );
	}
}

/@

@/
linkto( parent, tag_name, origin_offset, angles_offset )
{
	if ( !isDefined( tag_name ) )
	{
		self linkto( parent );
	}
	else if ( !isDefined( origin_offset ) )
	{
		self linkto( parent, tag_name );
	}
	else if ( !isDefined( angles_offset ) )
	{
		self linkto( parent, tag_name, origin_offset );
	}
	else
	{
		self linkto( parent, tag_name, origin_offset, angles_offset );
	}
}

/@

@/
gettime()
{
	return gettime();
}

/@

@/
getent( name, type )
{
	return getent( name, type );
}

/@

@/
setanimstatefromasd( animstate, substate_value )
{
	if ( !isDefined( substate_value ) )
	{
		self setanimstatefromasd( animstate );
	}
	else
	{
		self setanimstatefromasd( animstate, substate_value );
	}
}

/@

@/
istouching( other, extra_boundary )
{
	if ( !isDefined( extra_boundary ) )
	{
		return self istouching( other );
	}
	else
	{
		return self istouching( other, extra_boundary );
	}
}

/@

@/
getnode( name, type )
{
	return getnode( name, type );
}

/@

@/
ghost()
{
	self ghost();
}

/@

@/
notsolid()
{
	self notsolid();
}

/@

@/
show()
{
	self show();
}

/@

@/
solid()
{
	self solid();
}

/@

@/
unlink()
{
	self unlink();
}

/@

@/
getplayers( team )
{
	if ( !isDefined( team ) )
	{
		return getplayers();
	}
	else
	{
		return getplayers( team );
	}
}

/@

@/
vectornormalize( vector )
{
	return vectornormalize( vector );
}

/@

@/
vectordot( a, b )
{
	return vectordot( a, b );
}

/@

@/
distancesquared( a, b )
{
	return distancesquared( a, b );
}

/@

@/
distance2dsquared( a, b )
{
	return distance2dsquared( a, b );
}

/@

@/
gettagorigin( tag_name )
{
	return self gettagorigin( tag_name );
}

/@

@/
gettagangles( tag_name )
{
	return self gettagangles( tag_name );
}

/@

@/
setgoalpos( origin, angles )
{
	if ( !isDefined( angles ) )
	{
		self setgoalpos( origin );
	}
	else
	{
		self setgoalpos( origin, angles );
	}
}

/@

@/
getspeedmph()
{
	return self getspeedmph();
}

/@

@/
animcustom( func, end_func )
{
	if ( !isDefined( end_func ) )
	{
		return self animcustom( func );
	}
	else
	{
		return self animcustom( func, end_func );
	}
}

/@

@/
animscripted( origin, angles, statename, substate_value, mode )
{
	if ( !isDefined( substate_value ) )
	{
		self animscripted( origin, angles, statename );
	}
	else if ( !isDefined( mode ) )
	{
		self animscripted( origin, angles, statename, substate_value );
	}
	else
	{
		self animscripted( origin, angles, statename, substate_value, mode );
	}
}