/// @description
if (global.gamePaused) { exit; }
if (objGame.doTransition) { spd = 0; }
switch (state) {
	case enemyState.Free:
		//Chase player if they are in range
		if (distance_to_object(objPlayer) < range) {
			state = enemyState.Chase;
		}
		
		//TODO: Change this to the idle sprite.
		sprite_index = sprGownGal;
		
	break;
	
	case enemyState.Run:
		spd = runSpd;
		//TODO: Change sprite to running
		
	case enemyState.Chase:
		//Change to running speed if the player doesn't hide in the closet soon enough.
		//if (alarm[0] == -1) {
		//	alarm[0] = (room_speed * 12);
		//}
		
		// Get the player's location on the grid.
		var cx = (objPlayer.x / 32) * 32;
		var cy = (objPlayer.y / 32) * 32;

		// Path towards the player
		if (mp_grid_path(global.grid, path, x, y, cx, cy, 1)) {
			path_start(path, spd, path_action_stop, false);
			if(currentLocation != objGame.location) {
				if ((objGame.location == 2 and currentLocation == 1) or (objGame.location == 2 and currentLocation == 3)) {
					// Path to the closest transition. If the enemy is in the store and the player is out front.
					var ct = instance_nearest(x, y, objTransition); 
					mp_grid_path(global.grid, path, x, y, ct.x, ct.y, 1);
				}
				else if ((objGame.location == 1 and currentLocation == 2)) {
					// Path to the front door if the player is inside the store and the enemy is out front
					mp_grid_path(global.grid, path, x, y, 4446, 937, 1);
				}
				else if (objGame.location = 3 and currentLocation == 2) {
					// Pathing to the back area. Checks which one is closer.
					if (point_distance(4933, 827, x, y) < point_distance(3989, 827, x, y)) {
						mp_grid_path(global.grid, path, x, y, 4933, 827, 1);
					}
					else {
						mp_grid_path(global.grid, path, x, y, 3989, 827, 1);
					}
				}
				else {
					// Will head to the second closest transition from the initial transition
					mp_grid_path(global.grid, path, x, y, secondClosestTransition.x, secondClosestTransition.y, 1);
				}
				
			}
			
			// When the player is safe in the janitors
			if (objPlayer.isSafe) {
				instance_destroy();
			}
		}
	break;
}

// Get the correct sprite for movement
if(direction >= 306 or direction <= 45) {
	sprite_index = sprGownGalWalkRight; //right
}
if (direction >= 46 and direction <= 135) {
	sprite_index = sprGownGalWalkUp; //up
}
if (direction >= 136 and direction <=225) {
	sprite_index = sprGownGalWalkLeft; //left
}
if (direction >= 226 and direction <= 305) {
	sprite_index = sprGownGalWalkDown; //down
}