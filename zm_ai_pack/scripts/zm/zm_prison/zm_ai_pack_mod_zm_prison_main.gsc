#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include maps\mp\zm_alcatraz_traps;

main()
{
	level.custom_fan_trap_damage_func = ::fan_trap_damage_override;
	level.custom_acid_trap_damage_func = ::acid_trap_damage_override;
}

zombie_fan_trap_death()
{
	self endon( "death" );

	if ( !is_true( self.no_gib ) )
	{
		self.a.gib_ref = random( array( "guts", "right_arm", "left_arm", "head" ) );
		self thread maps\mp\animscripts\zm_death::do_gib();
	}

	self setclientfield( "fan_trap_blood_fx", 1 );
	self thread stop_fan_trap_blood_fx();
	self dodamage( self.health + 1000, self.origin );
}

fan_trap_damage_override( parent )
{
	self endon( "fan_trap_finished" );

	for (;;)
	{
		self waittill( "trigger", ent );

		if ( isplayer( ent ) )
			ent thread player_fan_trap_damage();
		else
		{
			if ( is_true( ent.is_boss ) )
			{
				ent maps\mp\zombies\_zm_ai_brutus::trap_damage_callback( self );
				return;
			}

			if ( !isdefined( ent.marked_for_death ) )
			{
				ent.marked_for_death = 1;
				ent thread zombie_fan_trap_death();
			}
		}
	}
}

zombie_acid_damage()
{
	self endon( "death" );
	self setclientfield( "acid_trap_death_fx", 1 );
	wait( randomfloatrange( 0.25, 2.0 ) );

	if ( !is_true( self.no_gib ) )
	{
		self.a.gib_ref = random( array( "right_arm", "left_arm", "head", "right_leg", "left_leg", "no_legs" ) );
		self thread maps\mp\animscripts\zm_death::do_gib();
	}

	self dodamage( self.health + 1000, self.origin );
}

acid_trap_damage_override()
{
	self endon( "acid_trap_finished" );

	for (;;)
	{
		self waittill( "trigger", ent );

		if ( isplayer( ent ) )
			ent thread player_acid_damage( self );
		else
		{
			if ( is_true( ent.is_boss ) )
			{
				ent maps\mp\zombies\_zm_ai_brutus::trap_damage_callback( self );
				return;
			}

			if ( !isdefined( ent.marked_for_death ) )
			{
				ent.marked_for_death = 1;
				ent thread zombie_acid_damage();
			}
		}
	}
}