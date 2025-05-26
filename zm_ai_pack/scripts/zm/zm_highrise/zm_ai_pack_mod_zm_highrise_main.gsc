#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zm_highrise_classic;

#include scripts\zm\zm_ai_pack_mod_main;

main()
{
	pluto_sys::replacefunc( maps\mp\zm_highrise_classic::squashed_death_init, ::squashed_death_init_override );
	pluto_sys::replacefunc( maps\mp\zm_highrise::elevator_traverse_watcher, ::elevator_traverse_watcher_override );
}

squashed_death_init_override( kill_if_falling )
{
	while ( true )
	{
		self waittill( "trigger", who );

		if ( !is_true( who.insta_killed ) )
		{
			continue;
		}
		if ( isplayer( who ) )
		{
			who thread elevator_black_screen_squash_check();
			who thread insta_kill_player( 1, kill_if_falling );
		}
		else if ( isai( who ) )
		{
			if ( is_true( who.in_the_ceiling ) )
			{
				continue;
			}

			if ( is_true( who.is_avogadro ) )
			{
				continue;
			}
			who dodamage( who.health + 100, who.origin );
			who.insta_killed = 1;

			increment_enemy_count( who );
		}
	}
}

elevator_traverse_watcher_override()
{
	self endon( "death" );

	while ( true )
	{
		wait 0.2;

		if ( !is_true( self.is_traversing ) )
		{
			continue;
		}

		self.elevator_parent = undefined;

		if ( !is_true( self maps\mp\zm_highrise_elevators::object_is_on_elevator() ) )
		{
			continue;
		}

		if ( !isdefined( self.elevator_parent ) )
		{
			continue;
		}
		if ( !is_true( self.elevator_parent.is_moving ) )
		{
			continue;
		}

		playfx( level._effect["zomb_gib"], self.origin );

		increment_enemy_count( self );

		self delete();
		return;
	}
}