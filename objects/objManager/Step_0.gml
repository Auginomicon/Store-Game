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
	}
}
else {
	path_speed = 0;
}