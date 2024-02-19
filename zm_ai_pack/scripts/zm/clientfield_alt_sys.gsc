
set_clientfield_alt_toplayer( field_name, ent, value )
{
	entnum = ent getEntityNumber();
	self setClientDvar( field_name, entnum + " " + value );
}

set_clientfield_alt_allplayers(field_name, ent, value )
{
	foreach ( player in level.players )
	{
		entnum = ent getEntityNumber();
		player setClientDvar( field_name, entnum + " " + value );
	}
}