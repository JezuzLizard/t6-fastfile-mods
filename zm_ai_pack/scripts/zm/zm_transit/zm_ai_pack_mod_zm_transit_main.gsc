#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

main()
{
	replaceFunc( maps\mp\zm_transit_power::killzombiesinpowerstation, ::killzombiesinpowerstation_override );
}

killzombiesinpowerstation_override()
{
	level endon( "power_on" );
	radiussq = 122500;

	while ( true )
	{
		zombies = getaiarray( level.zombie_team );

		foreach ( zombie in zombies )
		{
			if ( !isdefined( zombie ) )
				continue;

			if ( isdefined( zombie.is_avogadro ) && zombie.is_avogadro )
				continue;
			
			if ( is_true( zombie.is_boss ) )
			{
				continue;
			}

			if ( sys::distancesquared( ( 11344, 7590, -729 ), zombie.origin ) < radiussq )
				continue;

			if ( isdefined( zombie ) && zombie maps\mp\zombies\_zm_zonemgr::entity_in_zone( "zone_prr", 1 ) || isdefined( zombie.zone_name ) && zombie.zone_name == "zone_prr" )
			{
				if ( !( isdefined( zombie.has_been_damaged_by_player ) && zombie.has_been_damaged_by_player ) )
					level.zombie_total++;

				zombie dodamage( zombie.health + 100, zombie.origin );
				wait( randomfloatrange( 0.05, 0.15 ) );
			}
		}

		wait 1;
	}
}