special_dog_spawn( spawners, num_to_spawn )
{
	dogs = getaispeciesarray( "all", "zombie_dog" );

	if ( isdefined( dogs ) && dogs.size >= 9 )
		return false;

	if ( !isdefined( num_to_spawn ) )
		num_to_spawn = 1;

	spawn_point = undefined;
	count = 0;

	while ( count < num_to_spawn )
	{
		players = sys::getplayers();
		favorite_enemy = get_favorite_enemy();

		if ( isdefined( spawners ) )
		{
			spawn_point = spawners[randomint( spawners.size )];
			ai = spawn_zombie( spawn_point );

			if ( isdefined( ai ) )
			{
				ai.favoriteenemy = favorite_enemy;
				spawn_point thread dog_spawn_fx( ai );
				count++;
				flag_set( "dog_clips" );
			}
		}
		else if ( isdefined( level.dog_spawn_func ) )
		{
			spawn_loc = [[ level.dog_spawn_func ]]( level.dog_spawners, favorite_enemy );
			ai = spawn_zombie( level.dog_spawners[0] );

			if ( isdefined( ai ) )
			{
				ai.favoriteenemy = favorite_enemy;
				spawn_loc thread dog_spawn_fx( ai, spawn_loc );
				count++;
				flag_set( "dog_clips" );
			}
		}
		else
		{
			spawn_point = dog_spawn_factory_logic( level.enemy_dog_spawns, favorite_enemy );
			ai = spawn_zombie( level.dog_spawners[0] );

			if ( isdefined( ai ) )
			{
				ai.favoriteenemy = favorite_enemy;
				spawn_point thread dog_spawn_fx( ai, spawn_point );
				count++;
				flag_set( "dog_clips" );
			}
		}

		waiting_for_next_dog_spawn( count, num_to_spawn );
	}

	return true;
}