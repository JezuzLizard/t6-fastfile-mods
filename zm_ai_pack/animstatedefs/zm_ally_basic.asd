idle : notify idle_anim
{
	pb_stand_alert
}

idle_crouch : notify idle_anim
{
	pb_crouch_alert
}

zm_death : notify death_anim
{
	pb_stand_alert
}

zm_move_walk : notify move_anim
{
	pb_laststand_idle
}

laststand : notify death_anim
{
	pb_laststand_idle
}

