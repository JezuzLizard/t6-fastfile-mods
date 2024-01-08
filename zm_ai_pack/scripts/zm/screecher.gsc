
main()
{
	maps\mp\zombies\_zm_ai_screecher::precache();
	maps\mp\_utility::onfinalizeinitialization_callback( ::register_clientfields );
}

init()
{
	maps\mp\zombies\_zm_ai_screecher::init();
}

register_clientfields()
{
	maps\mp\_visionset_mgr::vsmgr_register_info( "overlay", "zm_ai_screecher_blur", 1, level.vsmgr_prio_overlay_zm_ai_screecher_blur, 1, 1, maps\mp\_visionset_mgr::vsmgr_timeout_lerp_thread_per_player, 0 );
	registerclientfield( "actor", "render_third_person", 1, 1, "int" );
}