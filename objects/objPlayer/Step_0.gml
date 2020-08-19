//Player Inputs. Set up here because they can change due to settings.
input_left =	 keyboard_check(ord("A"));
input_right =	 keyboard_check(ord("D"));
input_up =		 keyboard_check(ord("W"));
input_down =	 keyboard_check(ord("S"));
input_run =		 keyboard_check(vk_shift);
input_interact = keyboard_check_pressed(ord("E"));
input_open_inv = keyboard_check_pressed(vk_tab);
if(keyboard_check_pressed(ord("G"))) {game_restart()}

switch(state) {
	case pStates.Free:
		if (global.gamePaused) {state = pStates.Paused; }
	
		//Reset the variables once there is no more input.
		moveX = 0;
		moveY = 0;
		
		//Movement
		if (canMove) {
			moveY = (input_down - input_up) * walkSpeed;
			moveX = (input_right - input_left) * walkSpeed;
		}
		
		//Will allow the player to 'run'
		if (input_run) {
			if (energy >= 0 and (moveX != 0 or moveY != 0)) {
				energy -= 0.3;
				walkSpeed = 5;
			}
			else {
				walkSpeed = 3;
			}
		}
		else {
			walkSpeed = 3;
			if (energy <= maxEnergy) {
				energy += 0.01;
			}
		}

		//Set the correct facing variable to the player for transition 
		//	TODO: Check if this can be implemented into the NPC's this can be used for backstabs as a rogue perk.
		if (moveX != 0) {
			switch(sign(moveX)) {
				case 1: facing = dir.right; break;
				case -1: facing = dir.left; break;
			}
		}
		else if (moveY != 0) {
			switch(sign(moveY)) {
				case 1: facing = dir.down; break;
				case -1: facing = dir.up; break;
			}
		} 
		else {
			facing = -1;
		}
		
		//Apply Collision before moving
		Collisions();

		//Collide with objects
		var inst = instance_place(x, y, objTransition);

		//TODO: To transiton into houses you will have to press the interact_key to go into them but not do this if going to another outdoors map.
		//	^perhaps set up a variable to in the transition and set it up in the creation code and add another condiotn to the first if below this commet.
		//Finds a collision id
		if (inst != noone && facing == inst.playerFacingBefore) {
			//Passes the collided object's id to the objGame to properly transition rooms.
			with(objGame) {
				if (!doTransition) {
					spawnRoom = inst.targetRoom;
					spawnX = inst.targetX;
					spawnY = inst.targetY;
					doTransition = true;
				}
			}
		}

		//Dialog Boxes for NPCs
		if (input_interact) {
			if (activeTextbox == noone) {
				var inst = collision_rectangle(x - radius, y - radius, x + radius, y + radius, ParEntity, false, false);
				//Checks if it is an npc you interacted with.
				if(inst != noone) {
					if (inst.isNPC) {
						canMove = false;
						with(inst) {
							var tbox = CreateDialogbox(message, speakers, nextLine, scripts);
							canMove = false;
							moveX = 0;
							moveY = 0;
						}
						activeTextbox = tbox;
					}
					else if (inst.isSign) {
						//Will execute if it was a signpost
						with(inst) {
							var tbox = script_execute(func, message, display);
						}
						activeTextbox = tbox;
					}
					else {
						//Run if it is something else
						show_debug_message("Interact sucessful")
					}
				}
			}
			else {
				if (!instance_exists(activeTextbox)) {
					activeTextbox = noone;
				}
			}
		}

		//Move the actual player
		x += moveX;
		y += moveY;
		
		break;
		
	case pStates.Paused:
		//Setting these to 0 will stop the player from running in place.
		moveX = 0;
		moveY = 0;
		
		//Checks when the pause is stopped to resume play.
		if(!global.gamePaused) { state = pStates.Free; }
	break;
}
