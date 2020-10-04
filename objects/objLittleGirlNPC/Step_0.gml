/// @description 
if (global.gamePaused) { 
	spd = 0;
	path_speed = 0;
	if (alarm[2] != -1) alarm[2]++;
	if (alarm[3] != -1) alarm[3]++;
	exit;
}
else {
	spd = walkspd;
	path_speed = spd;
}

if (canMove) {
	spd = walkspd;
	path_speed = spd;
	
	// To get the correct sprite
	if(direction >= 306 or direction <= 45) {
		sprite_index = sprLittleGirlWalkRight; //right
		idleNum = 1;
	}
	if (direction >= 46 and direction <= 135) {
		sprite_index = sprLittleGirlWalkUp; //up
		idleNum = 2;
	}
	if (direction >= 136 and direction <=225) {
		sprite_index = sprLittleGirlWalkLeft; //left
		idleNum = 0;
	}
	if (direction >= 226 and direction <= 305) {
		sprite_index = sprLittleGirlWalkDown; //down
		idleNum = 3;
	}
	
	// If she was appeased
	if (leaving) {
		if (currentLocation == 1) {
			mp_grid_path(global.grid, path, x, y, 2328, 1389, true);
			path_start(path, spd, path_action_stop, false);
		}
		else {
			if(mp_grid_path(global.grid, path, x, y, 4435, 2435, true)) {
				path_start(path, spd, path_action_stop, true);
				if (floor(x) == 4435 and floor(y) == 2435) {
					instance_destroy();
					show_debug_message("Gone")
				}
			}
		}
	}
	// Once she gets insdie
	else if (path_position == 1) {
		mp_grid_path(global.grid, path, x, y, wanderX, wanderY, true);
		path_start(path, spd, path_action_stop, false);
		if (floor(x) == wanderX and floor(y) == wanderY) {
			if (alarm[1] == -1) {
				alarm[1] = (irandom(5) + 1) * room_speed;
			}
			sprite_index = sprLittleGirlIdle;
			image_index = idleNum;
		}
		// To start the alarm to get mad
		if (alarm[2] == -1 and !leaving) {
			alarm[2] = 65 * room_speed;
		}
	}
}
else {
	spd = 0;
	path_speed = 0;
	sprite_index = sprLittleGirlIdle;
	image_index = idleNum;
}

hitbox.x = x;
hitbox.y = y;