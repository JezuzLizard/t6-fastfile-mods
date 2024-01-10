main()
{
	if ( getDvar( "mapname" ) == "zm_transit" && getDvar( "g_gametype" ) == "zclassic" )
	{
		return;
	}
	maps\mp\zombies\_zm_ai_avogadro::precache();
}

init()
{
	if ( getDvar( "mapname" ) == "zm_transit" && getDvar( "g_gametype" ) == "zclassic" )
	{
		return;
	}
	maps\mp\zombies\_zm_ai_avogadro::init();
}