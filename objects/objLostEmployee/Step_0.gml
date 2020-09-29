/// @description

if (global.gamePaused) { 
	spd = 0;
	path_speed = 0;
	exit;
}
else {
	spd = 2;
	path_speed = spd;
}

// Checks if the NPC is moving
if (canMove) {
	path_speed = spd;
	
	path = path_add();
	if (leaving) {
		if (currentLocation != 2) {
			if (mp_grid_path(global.grid, path, x, y, secondClosestTransition.x, secondClosestTransition.y, true)) {
				path_start(path, spd, path_action_stop, false);
			}
		}
		else {
			if (mp_grid_path(global.grid, path, x, y, 4822, 2452, true)) {
				path_start(path, spd, path_action_stop, false);
				if (floor(x) == 4822 and floor(y) == 2452) {
					instance_destroy()
				}
			}
		}
	}
	else if (spokeWithPlayer) {
		// go to cash register
		if (currentLocation != 1) {
			if (currentLocation == 2) {
				mp_grid_path(global.grid, path, x, y, 4456, 916, true);
			}
			if (currentLocation == 3) {
				if (objBackDoor.isOpen) {
					mp_grid_path(global.grid, path, x, y, 3821, 3955, 1);
					if (floor(x) == 3821 and floor(y) == 3955) {
						with(objBackDoor) {
							other.x = transportX;
							other.y = transportY;
							other.currentLocation = newLocation;
						}
					}
				}
				else {
					var ct = instance_nth_nearest(x, y, objTransition, 1);
					mp_grid_path(global.grid, path, x, y, ct.x, ct.y, true);
				}
			}
			if (currentLocation == 4 or currentLocation == 5) {
				var t = instance_nearest(x, y, objTransition)
				mp_grid_path(global.grid, path, x, y, t.x, t.y, true);
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
				if ((objGame.location == 2 and currentLocation == 1)) {
					// Path to the closest transition. If the enemy is in the store and the player is out front.
					var ct = instance_nearest(x, y, objTransition); 
					mp_grid_path(global.grid, path, x, y, ct.x, ct.y, 1);
				}
				else if (objGame.location == 1 and currentLocation == 3) {
					if (objBackDoor.isOpen) {
						mp_grid_path(global.grid, path, x, y, 3821, 3955, 1);
						path_start(path, spd, path_action_stop, false);
						if (floor(x) == 3821 and floor(y) == 3955) {
							with(objBackDoor) {
								other.x = transportX;
								other.y = transportY;
								other.currentLocation = newLocation;
							}
						}
					}
					else {
						var ct = instance_nearest(x, y, objTransition); 
						mp_grid_path(global.grid, path, x, y, ct.x, ct.y, 1);
					}
				}
				// Checks for the bathroom
				else if ((objGame.location >= 4 and currentLocation == 3) or objGame.location >= 5 and currentLocation == 3) {
					// Go to the male bathroom
					if (objGame.location == 4) {
						mp_grid_path(global.grid, path, x, y, 4203, 3948, 1);
						if (floor(x) == 4203 and floor(y) == 3948) {
							x = 1580;
							y = 2865;
							currentLocation = 4;
							path_clear_points(path);
							secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);
						}
					}
					else if (objGame.location == 5){
						mp_grid_path(global.grid, path, x, y, 4299, 3948, 1);
						if (floor(x) == 4299 and floor(y) == 3948) {
							x = 1198;
							y = 2865;
							currentLocation = 5;
							path_clear_points(path);
							secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);
						}
					}
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
