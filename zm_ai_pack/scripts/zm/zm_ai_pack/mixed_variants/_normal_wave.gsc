#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;

#include scripts\zm\zm_ai_pack\_utility;

main()
{
}

spawning_wave()
{
	scripts\zm\zm_ai_pack\mixed_presets\_wave::spawn_wave( "normal", undefined, false );
}

spawning_chance()
{
	return true;
}

spawning_limit()
{
	return 24;
}

spawning_cooldown()
{
	return true;
}

spawning_round_start()
{
}