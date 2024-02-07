
main()
{
	level.script = toLower( getDvar( "mapname" ) );
	level.gametype = toLower( getDvar( "g_gametype" ) );

	level.ai_data = [];
	level.ai_data[ "avogadro" ] = spawnStruct();
	level.ai_data[ "avogadro" ].main = clientscripts\mp\zombies\_zm_ai_avogadro::main;
	level.ai_data[ "avogadro" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	level.ai_data[ "screecher" ] = spawnStruct();
	level.ai_data[ "screecher" ].main = clientscripts\mp\zombies\_zm_ai_screecher::main;
	level.ai_data[ "screecher" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	level.ai_data[ "ghost" ] = spawnStruct();
	level.ai_data[ "ghost" ].main = clientscripts\mp\zombies\_zm_ai_ghost::main;
	level.ai_data[ "ghost" ].should_execute = !( level.script == "zm_buried" && level.gametype == "zclassic" );
	level.ai_data[ "brutus" ] = spawnStruct();
	level.ai_data[ "brutus" ].main = clientscripts\mp\zombies\_zm_ai_brutus::main;
	level.ai_data[ "brutus" ].should_execute = level.script != "zm_prison";
	level.ai_data[ "mechz" ] = spawnStruct();
	level.ai_data[ "mechz" ].main = clientscripts\mp\zombies\_zm_ai_mechz::main;
	level.ai_data[ "mechz" ].should_execute = level.script != "zm_tomb";

	keys = getArrayKeys( level.ai_data );
	for ( j = 0; j < keys2.size; j++ )
	{
		if ( isDefined( level.ai_data[ keys[ j ] ].main ) && isDefined( level.ai_data[ keys[ j ] ].should_execute ) 
			&& level.ai_data[ keys[ j ] ].should_execute )
		{
			level [[ level.ai_data[ keys[ j ] ].main ]]();
		}
	}
}

init()
{

}