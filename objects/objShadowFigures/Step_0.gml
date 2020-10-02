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
		if (mp_grid_path(global.grid, path, x, y, roamX, roamY, true)) {
			path_start(path, spd, path_action_stop, false);
			if (floor(x) == roamX and floor(y) == roamY) {
				if (alarm[0] == -1) {
					alarm[0] = choose(1, 5, 10, 15, 20) * room_speed;
				}
				image_index = 0;
			}
		} 
		else {
			alarm[0] = 1;
		}
		
		if (distance_to_object(objPlayer) < 300 and !objPlayer.isSafe) {
			state = enemyState.Chase;
		}
		
	break;
	
	case enemyState.Chase:
		// Get the player's location on the grid.
		var cx = (objPlayer.x / 32) * 32;
		var cy = (objPlayer.y / 32) * 32;
		
		if (mp_grid_path(global.grid, path, x, y, cx, cy, true)) {
			path_start(path, spd, path_action_stop, false);
		}
		
		if (currentLocation != objGame.location or objPlayer.isSafe) {
			state = enemyState.Free;
		}
	break;
}