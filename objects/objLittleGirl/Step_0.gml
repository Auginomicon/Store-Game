/// @description 
if (global.gamePaused) { 
	spd = 0;
	path_speed = 0;
	exit;
}
else {
	spd = walkspd;
	path_speed = spd;
}

switch(state) {
	case enemyState.Free:
		// checks if she is in the store
		if (currentLocation == 1) {
			if(mp_grid_path(global.grid, path, x, y, 2352, 1392, true)) {
				path_start(path, spd, path_action_stop, false);
			}
		}
		// Checks if she is out front
		else if (currentLocation == 2) {
			if(mp_grid_path(global.grid, path, x, y, secondClosestTransition.x, secondClosestTransition.y, true)) {
				path_start(path, spd, path_action_stop, false);
			}
		}
		// She is out back
		else {
			// Get target id when there is trash to find
			if (alarm[0] == -1) {
				alarm[0] = 1;
			}
			
			// Will only path to the garbage pile if it's on the map.
			if (desiredItem != noone and mp_grid_path(global.grid, path, x, y, desiredItem.x, desiredItem.y, true)) {
				path_start(path, spd, path_action_stop, false);
				
				// Once she gets to the garbage pile
				if (floor(x) == desiredItem.x and floor(y) == desiredItem.y) {
					// Begind to cut the bag
					if (alarm[1] == -1) alarm[1] = 3 * room_speed;
				}
			}
			// Will find a new target or if there is no more trash left
			else {
				itemFound = false;
				if (noMoreTrash) {
					mp_grid_path(global.grid, path, x, y, 3821, 3955, true);
					path_start(path, spd, path_action_stop, false);
					
					if (floor(x) == 3821 and floor(y) == 3955) {
						with(objBackDoor) {
							isOpen = true;
						}
						instance_destroy();
					}
				}
			}
		}
	break;
}

var i = 0;
repeat(4) {
	if (objPlayer.inventory[i] == "Doll") {
		instance_destroy();
		break;
	}
	i++;
}