#define CHARACTER_CSV "mp/pmp_character_table.csv"

main()
{
	parse_character_table();
}

parse_character_table()
{
	game[ "characters" ] = [];

	for ( index = 0; tablelookuprownum( CHARACTER_CSV, 0, index ) != -1; index++ )
	{
		alias = tablelookup( CHARACTER_CSV, 0, index, 1);
		body_model = tablelookup( CHARACTER_CSV, 0, index, 2);
		view_model = tablelookup( CHARACTER_CSV, 0, index, 3);
		team = tablelookup( CHARACTER_CSV, 0, index, 4);
		class_name = tablelookup( CHARACTER_CSV, 0, index, 5);

		if ( !isDefined( game[ "characters" ][ team ] ) )
		{
			game[ "characters" ][ team ] = [];
		}

		game[ "characters" ][ team ][ alias ] = [];
		game[ "characters" ][ team ][ alias ][ "body_model" ] = body_model;
		game[ "characters" ][ team ][ alias ][ "view_model" ] = view_model;
		game[ "characters" ][ team ][ alias ][ "class_name" ] = class_name;

		precacheModel( body_model );
		precacheModel( view_model );
	}
}