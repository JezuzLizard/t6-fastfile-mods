#include clientscripts\mp\zombies\_zm_ai_avogadro;
#include clientscripts\mp\zombies\_zm_ai_screecher;
#include clientscripts\mp\zombies\_zm_ai_ghost;
#include clientscripts\mp\zombies\_zm_ai_brutus;
#include clientscripts\mp\zombies\_zm_ai_mechz;

main()
{
	replaceFunc( clientscripts\mp\_visionset_mgr::init, ::visionset_mgr_init_override );
	level.script = toLower( getDvar( "mapname" ) );
	level.gametype = toLower( getDvar( "g_gametype" ) );

	level.ai_data = [];
	// level.ai_data[ "avogadro" ] = spawnStruct();
	// level.ai_data[ "avogadro" ].main = clientscripts\mp\zombies\_zm_ai_avogadro::main;
	// level.ai_data[ "avogadro" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	// level.ai_data[ "screecher" ] = spawnStruct();
	// level.ai_data[ "screecher" ].main = clientscripts\mp\zombies\_zm_ai_screecher::main;
	// level.ai_data[ "screecher" ].should_execute = !( level.script == "zm_transit" && level.gametype == "zclassic" );
	// level.ai_data[ "ghost" ] = spawnStruct();
	// level.ai_data[ "ghost" ].main = clientscripts\mp\zombies\_zm_ai_ghost::main;
	// level.ai_data[ "ghost" ].should_execute = !( level.script == "zm_buried" && level.gametype == "zclassic" );
	level.ai_data[ "brutus" ] = spawnStruct();
	level.ai_data[ "brutus" ].main = clientscripts\mp\zombies\_zm_ai_brutus::main;
	level.ai_data[ "brutus" ].should_execute = level.script != "zm_prison";
	level.ai_data[ "mechz" ] = spawnStruct();
	level.ai_data[ "mechz" ].main = clientscripts\mp\zombies\_zm_ai_mechz::main;
	level.ai_data[ "mechz" ].should_execute = level.script != "zm_tomb";

	keys = getArrayKeys( level.ai_data );
	for ( i = 0; i < keys.size; i++ )
	{
		if ( isDefined( level.ai_data[ keys[ i ] ].main ) && isDefined( level.ai_data[ keys[ i ] ].should_execute ) 
			&& level.ai_data[ keys[ i ] ].should_execute )
		{
			level [[ level.ai_data[ keys[ i ] ].main ]]();
		}
	}
}

init()
{

}

add_visionset_callback( func )
{
	if ( !isDefined( level.visionset_mgr_callbacks ) )
	{
		level.visionset_mgr_callbacks = [];
	}
	level.visionset_mgr_callbacks[ level.visionset_mgr_callbacks.size ] = func;
}

run_visionset_callbacks()
{
	if ( !isDefined( level.visionset_mgr_callbacks ) )
	{
		return;
	}
	for ( i = 0; i < level.visionset_mgr_callbacks.size; i++ )
	{
		[[ level.visionset_mgr_callbacks[ i ] ]]();
	}
}

visionset_mgr_init_override()
{
	if ( isDefined( level.createfx_enabled ) && level.createfx_enabled )
		return;

	level.vsmgr_initializing = 1;
	level.vsmgr_default_info_name = "none";
	level.vsmgr = [];
	level.vsmgr_states_inited = [];
	level.vsmgr_filter_custom_enable = [];
	level thread register_type( "visionset", ::visionset_slot_cb, ::visionset_lerp_cb, ::visionset_update_cb );
	vsmgr_register_visionset_info( level.vsmgr_default_info_name, 1, 1, "undefined", "undefined" );
	level thread register_type( "overlay", ::overlay_slot_cb, ::overlay_lerp_cb, ::overlay_update_cb );
	vsmgr_register_overlay_info_style_none( level.vsmgr_default_info_name, 1, 1 );
	level.vsmgr_is_type_currently_default_func = ::vsmgr_is_type_currently_default;
	[[ level.on_finalize_initialization_callback ]]( ::finalize_clientfields );
	level thread monitor();
	run_visionset_callbacks();
}