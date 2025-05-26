#include common_scripts\utility;
#include maps\mp\_utility;

main()
{
	pluto_sys::replacefunc( maps\mp\teams\_teams::set_player_model, ::set_player_model_override );
}

set_player_model_override( team, weapon )
{
	weaponclass = getweaponclass( weapon );
	bodytype = "default";

	switch ( weaponclass )
	{
		case "weapon_sniper":
			bodytype = "rifle";
			break;
		case "weapon_cqb":
			bodytype = "spread";
			break;
		case "weapon_lmg":
			bodytype = "mg";
			break;
		case "weapon_smg":
			bodytype = "smg";
			break;
	}

	self detachall();
	self setmovespeedscale( 1 );
	self setsprintduration( 4 );
	self setsprintcooldown( 0 );

	possible_models = [];

	if ( !level.teambased || level.multiteam )
	{
		possible_models = arrayCombine( game[ "characters" ][ "allies" ], game[ "characters" ][ "axis" ], false, true );
	}
	else
	{
		possible_models = game[ "characters" ][ team ];
	}

	if ( isDefined( possible_models ) && possible_models.size > 0 )
	{
		model = random( possible_models );
		self setModel( model[ "body_model" ] );
		self setViewModel( model[ "view_model" ] );
	} 
	else 
	{
		self [[ game["set_player_model"][team][bodytype] ]]();
	}
}