/// @description
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
		if (alarm[0] == -1) {
			alarm[0] = (room_speed * 12);
		}
		
		var cx = (objPlayer.x / 32) * 32;
		var cy = (objPlayer.y / 32) * 32;

		if (mp_grid_path(global.grid, path, x, y, cx, cy, 1)) {
			path_start(path, spd, path_action_stop, false);
			
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
		}
		
	break;
}