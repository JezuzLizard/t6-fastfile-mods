main()
{
	if ( getDvar( "mapname" ) == "zm_prison" )
	{
		return;
	}
	maps\mp\zombies\_zm_ai_brutus::main();
}

init()
{
}