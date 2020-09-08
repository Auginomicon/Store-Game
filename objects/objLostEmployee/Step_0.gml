/// @description

if (global.gamePaused) { exit; }

// Checks if the NPC is moving
if (canMove) {
	path_speed = spd;
	
	path = path_add();
	
	if (spokeWithPlayer) {
		// go to cash register
		if (currentLocation != 1) {
			if (currentLocation == 2) {
				mp_grid_path(global.grid, path, x, y, 4456, 916, true);
			}
			if (currentLocation == 3) {
				var ct = instance_nth_nearest(x, y, objTransition, 1);
				mp_grid_path(global.grid, path, x, y, ct.x, ct.y, true);
			}
		}
		else {
			mp_grid_path(global.grid, path, x, y, 1656, 1252, true);
		}
		path_start(path, spd, path_action_stop, false);
	} 
	else {
		if (path_position == 1) {
			// find the player
			spd = 2;
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
			else {
				if (collision_circle(x, y, 95, objPlayer, false, true)) {
					path_end();
				}
				else {
					mp_grid_path(global.grid, path, x, y, objPlayer.x, objPlayer.y, 1);
				}
			}
			path_start(path, spd, path_action_stop, false);
		}
	}
	
	if(direction >= 306 or direction <= 45) {
		sprite_index = sprLostEmployeeNormieWalkRight; //right
		idleNum = 1;
	}
	if (direction >= 46 and direction <= 135) {
		sprite_index = sprLostEmployeeNormieWalkUp; //up
		idleNum = 2;
	}
	if (direction >= 136 and direction <=225) {
		sprite_index = sprLostEmployeeNormieWalkLeft; //left
		idleNum = 0;
	}
	if (direction >= 226 and direction <= 305) {
		sprite_index = sprLostEmployeeNormieWalkDown; //down
		idleNum = 3;
	}
	
	if (path_position == 1) {
		sprite_index = sprLostEmployeeNormieIdle;
		idleNum = 0;
		image_index = idleNum;
	}
}
else {
	// Stops the movement action
	sprite_index = sprLostEmployeeNormieIdle;
	image_index = idleNum;
	path_speed = 0;
}
