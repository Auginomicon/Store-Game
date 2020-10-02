/// @description
if (global.gamePaused) { 
	spd = 0;
	path_speed = 0;
	if (alarm[2] > 0) alarm[2]++;
	if (alarm[0] > 0) alarm[0]++;
	exit;
}
else {
	spd = walkspd;
	path_speed = spd;
}
switch (state) {
	case enemyState.Free:
		// When the player is lower than 50 sanity, the gown gal's head will twitch
		if (objPlayer.sanity <= 55) {
			sprite_index = sprGownGalIdle2;
			if (alarm[1] == -1) {
				alarm[1] = choose(1, 1*room_speed);
			}
		}
		else if (objPlayer.sanity <= 75){
			sprite_index = sprGownGalIdle1;
		}
		
		// After spawning, gown gal will move to another location.
		if (alarm[2] == -1) {
			alarm[2] = 30 * room_speed;
		}
		
		//Chase player if they are in range
		if (distance_to_object(objPlayer) < range) {
			state = enemyState.Chase;
			var snd = choose(sndShriek01, sndShriek02, sndShriek03)
			if (!audio_is_playing(snd)) audio_play_sound(snd, 5, false);
		}
	break;
	
	case enemyState.Run:
		spd = runSpd;
		if (audio_is_playing(sndSpoop01)) audio_stop_sound(sndSpoop01);
		if (!audio_is_playing(sndViolins)) audio_play_sound(sndViolins, 5, true);
	case enemyState.Chase:
		//Change to running speed if the player doesn't hide in the closet soon enough.
		if (alarm[0] == -1) {
			alarm[0] = (room_speed * 12);
		}
		
		// Play a drone when chasing
		if (!audio_is_playing(sndSpoop01)) audio_play_sound(sndSpoop01, 5, true);
		
		//Stops the alarm from going off
		alarm[2] = -1;
		
		// Get the player's location on the grid.
		var cx = (objPlayer.x / 32) * 32;
		var cy = (objPlayer.y / 32) * 32;
		
		// Reset path variable
		path = path_add();
		
		// Path towards the player while they are not in the janitor's closet
		if (mp_grid_path(global.grid, path, x, y, cx, cy, 1)) {
			path_start(path, spd, path_action_stop, false);
			if(currentLocation != objGame.location) {
				// Path to the closest transition. If the enemy is in the store and the player is out front.
				if ((objGame.location == 2 and currentLocation == 1)) {
					var ct = instance_nearest(x, y, objTransition); 
					mp_grid_path(global.grid, path, x, y, ct.x, ct.y, 1);
				}
				else if ((objGame.location == 1 and currentLocation == 3)) {
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
						var ct = instance_nearest(x, y, objTransition); 
						mp_grid_path(global.grid, path, x, y, ct.x, ct.y, 1);
					}
				}
				// Checks for the bathroom
				else if (objGame.location >= 4 and currentLocation == 3) {
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
					else {
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
			
			// Get the correct sprite for movement
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
			
			// Go to the janitor's closet
			if (objPlayer.isSafe and currentLocation == 1) {
				alarm[0] = -1;
				state = enemyState.Feared;
				if (distance_to_object(objPlayer) <= 225) {
					sawPlayerHide = true;
				}
			}
		}
	break;
	
	case enemyState.Feared: // Not really feared but the player is hidding
		path = path_add();
		// Get the correct sprite for movement
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
		
		// Path to the front of the door
		if (mp_grid_path(global.grid, path, x, y, 1374, 1389, false)) {
			path_start(path, spd, path_action_stop, false);
			
			// Once they are in front of the door
			if ((floor(x) == 1374 and floor(y) == 1389)) {
				// Checks if she saw him enter
				if(sawPlayerHide) {
					if (!audio_is_playing(sndDoor)) audio_play_sound(sndDoor, 5, false);
					objPlayer.isSafe = false;
					objPlayer.y += 24;
					objPlayer.canMove = true;
				}
				
				// Checks the sanity of the player to choose what to do
				// Bangs on door but then leaves
				if (objPlayer.sanity <= 30) {
					sprite_index = sprGownGalWalkUp;
					image_index = 0;
					if (alarm[3] == -1) {
						if (!audio_is_playing(sndBang)) audio_play_sound(sndBang, 8, false);
						alarm[3] = 4 * room_speed;
					}
				}
				// Looks at the screen then goes
				else if (objPlayer.sanity <= 55) {
					sprite_index = sprGownGalIdle1;
					image_speed = 1;
					if (alarm[3] == -1) {
						alarm[3] = 5 * room_speed;
					}
				}
				// stands around for a few seconds then leaves
				else if (objPlayer.sanity <= 75) {
					image_index = 0;
					if (alarm[3] == -1) {
						alarm[3] = 3 * room_speed;
					}
				}
				// Simply leaves
				else {
					alarm[3] = 1;
				}
			}
		}
		
		// Checks if the player left prematurely
		if (!objPlayer.isSafe) {
			state = enemyState.Chase;
		}
	break;
	
	case enemyState.Leave: // Not chasing but leaving
		path = path_add();
		if (mp_grid_path(global.grid, path, x, y, 965, 1122, true)) {
			path_start(path, spd, path_action_stop, false);
			
			if (floor(x) == 965 and floor(y) == 1122) {
				if (!audio_is_playing(sndDoor)) audio_play_sound(sndDoor, 5, false);
				instance_destroy();
			}
		}
		
		// Get the correct sprite for movement
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
		
		// Checks if the player left prematurely
		if (!objPlayer.isSafe) {
			state = enemyState.Chase;
		}
	break;
}