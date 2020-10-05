/// @description
if (global.gamePaused) {
	path_speed = 0;
	exit; 
}

if (canMove) {
	if (startPathing) {
		path_speed = spd;
		//path to front door.
		mp_grid_path(global.grid, path, x, y, 2326, 1385, true);
		path_start(path, spd, path_action_stop, false);
	
		if (currentLocation == 2) {
			mp_grid_path(global.grid, path, x, y, 4588, 1501, true);
			
			var vroom = noone;
			vroom = collision_circle(x, y, 32, objCar, false, true);
			if(vroom != noone) {
				with(vroom) {
					instance_destroy();
				}
				instance_destroy();
			}
		}
		if(direction >= 306 or direction <= 45) {
			sprite_index = sprManagerWalkRight; //right
		}
		if (direction >= 46 and direction <= 135) {
			sprite_index = sprManager; //up
		}
		if (direction >= 136 and direction <=225) {
			sprite_index = sprManagerWalkLeft; //left
		}
		if (direction >= 226 and direction <= 305) {
			sprite_index = sprManagerWalkDown; //down
		}
	}
}
else {
	sprite_index = sprManager;
	path_speed = 0;
}

hitbox.x = x;
hitbox.y = y;