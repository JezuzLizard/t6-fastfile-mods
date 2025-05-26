zm_robot_walka : notify scripted_walk
{
	ai_zombie_giant_robot_walk_a
}

zm_robot_walkb : notify scripted_walk
{
	ai_zombie_giant_robot_walk_b
}

zm_robot_walk_nml : notify scripted_walk
{
	//ai_zombie_giant_robot_walk_nml
	ai_zombie_giant_robot_walk_nml_intro
	ai_zombie_giant_robot_walk_nml
	ai_zombie_giant_robot_walk_nml_outtro

}

zm_robot_walk_trenches : notify scripted_walk
{
	ai_zombie_giant_robot_walk_trenches_intro
	ai_zombie_giant_robot_walk_trenches
	ai_zombie_giant_robot_walk_trenches_outtro

}

zm_robot_walk_village : restart notify scripted_walk
{
	ai_zombie_giant_robot_walk_village_intro
	ai_zombie_giant_robot_walk_village
	ai_zombie_giant_robot_walk_village_outtro

}

zm_robot_walk_intro : notify scripted_walk
{
	ai_zombie_giant_robot_bunker_intro
}