main()
{
	if ( getDvar( "g_gametype" ) == "zstandard" )
	{
		return;
	}
	maps\mp\zombies\_zm_ai_dogs::init();
}

init()
{
	if ( getGametypeSetting( "allowDogs" ) == 1 )
	{
		return;
	}
	maps\mp\zombies\_zm_ai_dogs::enable_dog_rounds();

	wait 1;
	level.next_dog_round = 2;
}