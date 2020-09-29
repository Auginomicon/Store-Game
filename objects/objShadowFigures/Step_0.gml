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
		if (mp_linear_path_object(path, roamX, roamY, spd, noone)) {
			path_start(path, spd, path_action_stop, false);
			image_speed = 1;
			if (floor(x) == roamX and floor(y) == roamY) {
				if (alarm[0] == -1) {
					alarm[0] = 5 * room_speed//choose(1, 5, 10, 15, 20) * room_speed;
				}
				image_index = 0;
			}
		}
		
		if ((objGame.location != currentLocation)) exit;
		//if (distance_to_object(objPlayer) < 300 and !objPlayer.isSafe) {
		//	state = enemyState.Chase;
		//}
		
	break;
	
	case enemyState.Chase:
		// Get the player's location on the grid.
		var cx = (objPlayer.x / 32) * 32;
		var cy = (objPlayer.y / 32) * 32;
		
		if (mp_linear_path_object(path, cx, cy, spd, noone)) {
			path_start(path, spd, path_action_stop, false);
		}
		
		if (currentLocation != objGame.location or objPlayer.isSafe) {
			state = enemyState.Free;
		}
	break;
}