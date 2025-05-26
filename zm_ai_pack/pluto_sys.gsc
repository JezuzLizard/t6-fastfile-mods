// Plutonium T6 Exclusive Builtins

// Base Types
/@
	ENT_TYPES =
	{
		"general",
		"player",
		"player_corpse",
		"item",
		"missile",
		"invisible",
		"scriptmover",
		"sound_blend",
		"fx",
		"loop_fx",
		"primary_light",
		"turret",
		"helicopter",
		"plane",
		"vehicle",
		"vehicle_corpse",
		"actor",
		"actor_spawner",
		"actor_corpse",
		"streamer_hint",
		"zbarrier"
	};

	VAR_TYPES = 
	{
		"undefined",
		"pointer",
		"string",
		"istring",
		"vector",
		"hash",
		"float",
		"int",
		"codepos",
		"precodepos",
		"function",
		"stack",
		"animation",
		"developer_codepos",
		"thread",
		"notify_thread",
		"time_thread",
		"child_thread",
		"object",
		"entity",
		"dead_entity",
		"array",
		"dead_thread"
	};
@/

/@
	[DESCRIPTION]: Returns a function pointer based on <path> and <func_name>;
	Does not trigger compilation or resolving of the script, therefore if the script isn't referenced by an include or far call by any other script at least once it will fail
	to find the function and return undefined.;
	[CALL_TYPE]: function;
	[USAGE]: func = getfunction( <path>, <func_name> );
	[PARAMS]: ARG1:<string> ARG2:<string>;
	[PARAMS_NOTES]: Path must use forward slashes.;
	[RETURNS]: <function> or <undefined>;
@/
getfunction( path, func_name )
{
	return getfunction( path, func_name );
}

/@
	[DESCRIPTION]: Returns the name of the input function pointer in <path>::<name> format.;
	[CALL_TYPE]: function;
	[USAGE]: func_name = getfunctionname( <func> );
	[PARAMS]: ARG1:<function>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: <string> or <undefined>;
@/
getfunctionname( func )
{
	return getfunctionname( func );
}

/@
	[DESCRIPTION]: Detours <from_func> to <to_func> causing subsequent calls to <from_func> to instead call <to_func>.
	Can detour any function except builtins.
	If [priority] is not specified defaults to -1 allowing for replacefunc calls with a higher [priority] value to detour already detoured
	functions.;
	[CALL_TYPE]: function;
	[USAGE]: replacefunc( <from_func>, <to_func>, [priority] );
	[PARAMS]: <function> <function> <int>;
	[PARAMS_NOTES]: ;
	[RETURNS]: Original function pointer;
@/
replacefunc( from_func, to_func, priority )
{
	if ( !isDefined( priority ) )
	{
		return replacefunc( from_func, to_func );
	}
	else
	{
		return replacefunc( from_func, to_func, priority );
	}
}

/@
	[DESCRIPTION]: Disables func's detour until func runs again.;
	[CALL_TYPE]: function;
	[USAGE]: disabledetouronce( <func> );
	[PARAMS]: NONE;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
disabledetouronce( func )
{
	disabledetouronce( func );
}

/@
	[DESCRIPTION]: Takes in <func> and returns the function pointer it was detoured to or returns undefined if <func> was not hooked
	at the time of calling getdetour.;
	[CALL_TYPE]: function;
	[USAGE]: getdetour( <func> );
	[PARAMS]: ARG1:<function>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: <function> or <undefined>;
@/
getdetour( func )
{
	return getdetour( func );
}

/@
	[DESCRIPTION]: Returns an array of pathnodes based on the caller node's path links. Returns an empty array if no links exist for caller node;
	[CALL_TYPE]: method;
	[USAGE]: self getlinkednodes();
	[PARAMS]: CALLER:<node>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: <number_indexed_array>;
@/
getlinkednodes()
{
	return self getlinkednodes();
}

/@
	[DESCRIPTION]: Sends a personal chat message to caller player. Applies ^7 and sv_sayName dvar's value to start of message unless sv_sayName dvar's value is blank
	in which case the message is not modified before being sent to the client.;
	[CALL_TYPE]: method;
	[USAGE]: self tell( <message> );
	[PARAMS]: CALLER:<entity> ARG1:<string>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
tell( message )
{
	self tell( message );
}

/@
	[DESCRIPTION]: Sends a chat message to all players. Applies ^7 and sv_sayName dvar's value to start of message unless sv_sayName dvar's value is blank
	in which case the message is not modified before being sent to the client.;
	[CALL_TYPE]: method;
	[USAGE]: self tell( <message> );
	[PARAMS]: ARG1:<string>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
say( message )
{
	say( message );
}

/@
	[DESCRIPTION]: Executes <cmd_string> as a console command using CBuf_AddText.;
	[CALL_TYPE]: function;
	[USAGE]: cmdexec( <cmd_string> );
	[PARAMS]: ARG1:<string>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
cmdexec( cmd_string )
{
	cmdexec( cmd_string );
}

// The following are bot specifc builtins
/@
	BOT_BUTTON_TYPES =
	{
		"attack",
		"sprint",
		"melee",
		"activate",
		"reload",
		"usereload",
		"gostand",
		"frag",
		"smoke",
		"holdbreath",
		"crouch",
		"prone",
		"leanleft",
		"leanright",
		"vehicleboost",
		"stance",
		"switchseat",
		"throwback",
		"throw",
		"handbrake",
		"reverse",
		"jam",
		"vehiclemovedown",
		"vehiclemoveup",
		"vehicleattacksecond",
		"vehicleattack",
		"ads",
		"actionslot 1",
		"actionslot 2",
		"actionslot 3",
		"actionslot 4"
	};
	BOT_BUTTON_VALUES =
	{
		"enable",
		"disable"
	};
@/

/@
	[DESCRIPTION]: Allows bot to melee lunge at entity with <ent_num> and <dist> to control the lunge distance when bot activates melee.
	<dist> is hard capped to values between 0 and 255.;
	[CALL_TYPE]: method;
	[USAGE]: self botmeleeparams( <ent_num>, <dist> );
	[PARAMS]: CALLER:<entity> ARG1:<int> ARG2:<float>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botmeleeparams( ent_num, dist )
{
	self botmeleeparams( ent_num, dist );
}

/@
	[DESCRIPTION]: Toggles off melee lunging for bot and clears the current dist and ent_num set by botmeleeparams.;
	[CALL_TYPE]: method;
	[USAGE]: self botclearmeleeparams();
	[PARAMS]: CALLER:<entity>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botclearmeleeparams()
{
	self botclearmeleeparams();
}

/@
	[DESCRIPTION]: Overrides caller bot's forward and right movement until botclearmoveoverride is called on caller bot. Values are between -127 for fully backwards and left, and fully 128 for forwards and right.
	Bot effectively simulates analog movement where max absolute values mean maximum speed and 0 no movement in that direction at all.;
	[CALL_TYPE]: method;
	[USAGE]: self botmovementoverride( <forward>, <right> );
	[PARAMS]: CALLER:<entity> ARG1:<int> ARG2:<int>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botmovementoverride( forward, right )
{
	self botmovementoverride( forward, right );
}

/@
	[DESCRIPTION]: Toggles off a movement override and resets forward and right values for caller bot.;
	[CALL_TYPE]: method;
	[USAGE]: self botclearmovementoverride();
	[PARAMS]: CALLER:<entity>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botclearmovementoverride()
{
	self botclearmovementoverride();
}

/@
	[DESCRIPTION]: Causes caller bot to press and hold <button> if <toggle> is "enable", 
	otherwise if <toggle> is "disable" will not be able to use <button> automatically.;
	[CALL_TYPE]: method;
	[USAGE]: self botbuttonoverride( <button>, <toggle> );
	[PARAMS]: CALLER:<entity> ARG1:<string> ARG2:<string>;
	[PARAMS_NOTES]: <button> must be one of BOT_BUTTON_TYPES and toggle must be one of BOT_BUTTON_VALUES;
	[RETURNS]: NONE;
@/
botbuttonoverride( button, toggle )
{
	self botbuttonoverride( button, toggle );
}

/@
	[DESCRIPTION]: Toggles off a button override for caller bot.;
	[CALL_TYPE]: method;
	[USAGE]: self botclearbuttonoverride();
	[PARAMS]: CALLER:<entity>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botclearbuttonoverride( button )
{
	self botclearbuttonoverride( button );
}

/@
	[DESCRIPTION]: If [toggle] is truthy all bot overrides set by the other Plutonium bot builtins will be cleared.
	Otherwise if [toggle] is falsy or not specified all bot overrides will be enabled and all buttons disabled.;
	[CALL_TYPE]: method;
	[USAGE]: self botclearoverrides();
	[PARAMS]: CALLER:<entity> ARG1:[int];
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botclearoverrides( toggle )
{
	if ( !isDefined( toggle ) )
	{
		//self botclearoverrides(); //Needs to be fixed in Plutonium
	}
	else
	{
		self botclearoverrides( toggle );
	}
}

/@
	[DESCRIPTION]: Forces caller bot to use <weapon> from their inventory until botclearweaponoverride is called on caller bot.;
	[CALL_TYPE]: method;
	[USAGE]: self botweaponoverride( <weapon> );
	[PARAMS]: CALLER:<entity> ARG1:<string>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botweaponoverride( weapon )
{
	self botweaponoverride( weapon );
}

/@
	[DESCRIPTION]: Toggles off the weapon override applied by botweaponoverride;
	[CALL_TYPE]: method;
	[USAGE]: self botclearweaponoverride();
	[PARAMS]: CALLER:<entity>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botclearweaponoverride()
{
	self botclearweaponoverride();
}

/@
	[DESCRIPTION]: Clears all button overrides applied to caller bot.;
	[CALL_TYPE]: method;
	[USAGE]: self botclearbuttonoverrides();
	[PARAMS]: CALLER:<entity>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botclearbuttonoverrides()
{
	self botclearbuttonoverrides();
}

/@
	[DESCRIPTION]: Toggles off caller bot's ability to automatically aim until botclearaimoverride is called on caller bot.
	This allows for setplayerangles to used on caller bot to control their aiming.;
	[CALL_TYPE]: method;
	[USAGE]: self botclearbuttonoverrides();
	[PARAMS]: CALLER:<entity>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botaimoverride()
{
	self botaimoverride();
}

/@
	[DESCRIPTION]: Clears the aim override applied by botaimoverride for caller bot.;
	[CALL_TYPE]: method;
	[USAGE]: self botclearaimoverride();
	[PARAMS]: CALLER:<entity>;
	[PARAMS_NOTES]: NONE;
	[RETURNS]: NONE;
@/
botclearaimoverride()
{
	self botclearaimoverride();
}