/// @description
switch (state) {
	case enemyState.Free: // Go after fuse box
		path_speed = spd;
		
		// Get the correct sprite for movement
		if(direction >= 306 or direction <= 45) {
			sprite_index = sprTallGuyWalkRight; //right
			idleNum = 2;
		}
		if (direction >= 46 and direction <= 135) {
			sprite_index = sprTallGuyWalkUp; //up
			idleNum = 3;
		}
		if (direction >= 136 and direction <=225) {
			sprite_index = sprTallGuyWalkLeft; //left
			idleNum = 1;
		}
		if (direction >= 226 and direction <= 305) {
			sprite_index = sprTallGuyWalkDown; //down
			idleNum = 0;
		}
		
		if (objFusebox.image_index == 2) {
			// Goes to the front
			if (currentLocation != 2) {
				var ct = instance_nearest(x, y, objTransition);
				mp_grid_path(global.grid, path, x, y, ct.x, ct.y, true);
				path_start(path, spd, path_action_stop, false);
			}
			else {
				if (collision_circle(x, y, 400, objPlayer, false, true)) {
					 //Chase the player
					 state = enemyState.Chase;
				}
				else {
					// start pathing to the roam position
					mp_grid_path(global.grid, path, x, y, roamX, roamY, true);
					path_start(path, spd, path_action_stop, false);
				
					if ((floor(x) == roamX and floor(y) == roamY) or (ceil(x) == roamX and ceil(y) == roamY)) { 
						// get new roam x and y position once he completes it
						if (alarm[2] == -1) {
							alarm[2] = (irandom(9) + 1) * room_speed;
						}
						
						sprite_index = sprTallGuy;
						image_index = idleNum;
					}
				}
			}
		}
		else if (currentLocation == 2) {
			// If out front, he will go to the left transition
			if (!pathBool) {
				mp_grid_path(global.grid, path, x, y, 4130, 1221, true);
			}
			if(floor(x) == 4130 and floor(y) == 1221) {
				path_change_point(path, 1, 3988, 840, spd);
				pathBool = true;
			}
			path_start(path, spd, path_action_stop, false);
		}
		else if (currentLocation == 3) {
			// If he is outback he will head to the fusebox
			path_start(path, spd, path_action_stop, false);
			mp_grid_path(global.grid, path, x, y, 3900, 3960, true);
			
			// Once he gets to the fusebox activate the count down for alarm and go into idle
			if (floor(x) == 3900 and floor(y) == 3960) {
				if (alarm[1] == -1) {
					alarm[1] = 5 * room_speed;
				}
				
				// Change sprite to the 
				sprite_index = sprTallGuy;
				image_index = idleNum;
			}
		}
		
		if (collision_circle(x, y, 245, objPlayer, false, true) and objFusebox.image_index != 2) {
			// If the player is close then become feared
			state = enemyState.Feared;
		}
		
		// only gain courage when the fusebox is not broken
		if (objFusebox.image_index != 2) {
			if (courage <= maxCourage) {
				courage += 0.1;
			}
		}
		
	break;
	
	case enemyState.Chase: // Once power is out, he will attack the player
		
	break;
	
	case enemyState.Feared: // Go into a dormate state
		// Set the sprite
		sprite_index = sprTallGuy;
		image_index = idleNum;
		
		// Stop the pathing.
		path_speed = 0;
		
		// Reset the alarm
		alarm[1] = -1;
		
		// Checks if the player is close.
		if (collision_circle(x, y, 245, objPlayer, false, true)) {
			// Decay courage if the player stays close
			if (courage <= 0) {
				courage = 0;
			}
			else {
				courage -= 0.1;
			}
		}
		else {
			// Start ticking the alarm when the player is away
			if (alarm[0] == -1) {
				alarm[0] = 1//= (objPlayer.sanity div 4) * room_speed;
			}
		}
	break;
}

if (courage >= 100) {
	spd = runSpd;
}

if (sprite_index != sprTallGuy) {
	// Checks if we are in the same room
	if (currentLocation == objGame.location) {
		if (floor(image_index) == 2 or floor(image_index) == 5) {
			ScreenShake(irandom_range(1, 4), irandom_range(5, 15));
		}
	}
}