// T6 Script Builtins
/@
	Adds <fx_name> as a configstring to the fx configstring pool.
	Returns an index that can be used in many different functions and methods to play an fx.
	The fx configstring pool is limited to 195 entries before fx configstring overflow occurs.
	On Plutonium addonfx pool was added to bypass this limit so functions add to this configstring pool
	have another 256 entries. 
	USAGE: level._effect[ effect_alias ] = loadfx( <fx_name> );
	PARAMS: <string>
@/
loadfx( fx_name )
{
	loadfx( fx_name );
}