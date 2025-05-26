#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zm_buried_classic;

#include scripts\zm\zm_ai_pack_mod_main;

main()
{

}

squashed_death_init( kill_if_falling )
{
	while ( true )
	{
		self waittill( "trigger", who );

		if ( !( isdefined( who.insta_killed ) && who.insta_killed ) )
		{
			if ( isplayer( who ) )
				who thread insta_kill_player( 1, kill_if_falling );
			else if ( isai( who ) )
			{
				who dodamage( who.health + 100, who.origin );
				who.insta_killed = 1;

				increment_enemy_count( who );
			}
		}
	}
}