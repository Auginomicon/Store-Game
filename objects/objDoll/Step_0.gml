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

// Get the correct sprite for walking
if (direction >= 5 and direction <= 175) {
	sprite_index = sprDollWalkUp; // UP
	idleNum = 1;
}
else {
	sprite_index = sprDollWalkDown; // down
	idleNum = 0;
}

switch(state) {
	case enemyState.Free: // Roam around and find items
		spd = walkspd;
		// Will find an item to steal.
		if (holding == "Empty") {
			// Will path to the front
			if (currentLocation != 2) {
				mp_grid_path(global.grid, path, x, y, secondClosestTransition.x, secondClosestTransition.y, true);
				path_start(path, spd, path_action_stop, false);
			}
			// Will go inside the store
			else {
				if(mp_grid_path(global.grid, path, x, y, 4446, 917, true)) {
					path_start(path, spd, path_action_stop, false);
				}
				else {
					alarm[1] = 1;
				}
			}
			// Once inside
			if (currentLocation == 1 and desiredItem != noone) {
				// Path to the desired item
				mp_grid_path(global.grid, path, x, y, desiredItem.x, desiredItem.y, true);
				path_start(path, spd, path_action_stop, false);
				// Once ontop of the item start to take the item.
				if (floor(x) == desiredItem.x and floor(y) == desiredItem.y) {
					sprite_index = sprDollIdle;
					image_index = idleNum;
					if(alarm[0] == -1) {
						alarm[0] = 3 * room_speed;
					}
				}
			}
			else {
				alarm[1] = 1;
			}
		}
		// When holding something they will run to the woods
		else {
			if(alarm[2] == -1) {
				alarm[2] = 1;
			}
			state = enemyState.Chase;
		}
		// run away from the player
		if (collision_circle(x, y, 120, objPlayer, false, true)) {
			state = enemyState.Feared;
			// Reset alarm
			alarm[0] = -1;
		}
		
	break;
	
	case enemyState.Feared: // run to a different area
		spd = runspd;
		if (objGame.location == currentLocation) {
			mp_grid_path(global.grid, path, x, y, secondClosestTransition.x, secondClosestTransition.y, true);
			path_start(path, spd, path_action_stop, false);
		}
		else {
			state = enemyState.Free;
		}
	break;
	
	case enemyState.Chase: // (reusing code should technically be hiding) Used for when the doll finds an object		
		// If they are inside the store
		if (currentLocation == 1) {
			var ct = instance_nearest(x, y, objTransition);
			mp_grid_path(global.grid, path, x, y, ct.x, ct.y, true);
			path_start(path, spd, path_action_stop, false);
		}
		// Once outside
		else {
			// out back
			if (currentLocation == 3) {
				mp_grid_path(global.grid, path, x, y, secondClosestTransition.x, secondClosestTransition.y, true);
				path_start(path, spd, path_action_stop, false);
			}
			// Out front
			else {
				mp_grid_path(global.grid, path, x, y, hideX, hideY, true);
				path_start(path, spd, path_action_stop, false);
				if (floor(x) == hideX and floor(y) == hideY) {
					var inst = instance_create_layer(x, y, "Instances", objItem);
					inst.name = holding;
					
					var spr = -1;
					// Get the correct sprite
					switch(holding) {
						case "Energy Bar":	spr = sprEnergyBar; break;
						case "Sanity Soda": spr = sprSanitySoda; break;
						case "Mop":			spr = sprMop; break;
						case "Storage Box": spr = sprBox; break;
						case "Candy Bar":	spr = sprCandyBar;; break;
						case "Flashlight":	spr = sprFlashlight; break;
						case "Key":			spr = sprKey;break;
						case "Lock":		spr = sprLock; break;
						case "Notebook":	spr = sprNotebook; break;
					}
					
					inst.sprite_index = spr;
					// Reset variables
					holding = "Empty";
					desiredItem = noone;
					setItem = false;
					
					state = enemyState.Free;
					snatchedItems++;
					
					// destroy self if it has snatched too many items
					if (snatchedItems > 3) instance_destroy();
				}
			}
		}
		// Run away from the plauer
		if (collision_circle(x, y, 120, objPlayer, false, true)) {
			state = enemyState.Feared;
		}
	break;
}

if (objGame.location != currentLocation) exit;

if (collision_circle(x, y, 32, objPlayer, false, true)) {
	if (objPlayer.input_interact) {
		// Check for an empty inventory slot
		var i = 0;
		repeat(4) {
			if (objPlayer.inventory[i] == "Empty") {
				objPlayer.inventory[i] = "Doll";
				
				// Removes the doll from the game world
				instance_destroy();
				
				break;
			}
			i++;
		}
	}
}