//Player Inputs. Set up here because they can change due to settings.
input_left =	 keyboard_check(ord("A"));
input_right =	 keyboard_check(ord("D"));
input_up =		 keyboard_check(ord("W"));
input_down =	 keyboard_check(ord("S"));
input_run =		 keyboard_check(vk_shift);
input_interact = keyboard_check_pressed(ord("E"));
input_open_inv = keyboard_check_pressed(vk_tab);
input_use_item = mouse_check_button_pressed(mb_left);

switch(state) {
	case pStates.Free:
		if (global.gamePaused or isSafe or objInventory.showInventory or instance_exists(objTextBoxes)) {state = pStates.Paused; }
	
		// Reset the variables once there is no more input.
		moveX = 0;
		moveY = 0;
		
		//Movement
		if (canMove) {
			moveY = (input_down - input_up) * walkSpeed;
			moveX = (input_right - input_left) * walkSpeed;
		}
		
		// Will allow the player to 'run'
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
		}

		// Set the correct facing variable to the player for transition 
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
		//Finds a collision id
		if (inst != noone && facing == inst.playerFacingBefore) {
			//Passes the collided object's id to the objGame to properly transition rooms.
			with(objGame) {
				if (!doTransition) {
					transportX = inst.transportX;
					transportY = inst.transportY;
					newLocation = inst.newLocation;
					playerFacingAfter = inst.playerFacingAfter;
					doTransition = true;
				}
			}
		}
		
		//Use an equipped item
		if (input_use_item) {
			if (equipped[0] != "Storage Box" || equipped[0] != -1) {
				UseItemHelper(equipped[0], equipped[1]);
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
							var tbox = CreateDialogbox(message, speakers, nextLine, scripts, portraitNums);
							canMove = false;
							moveX = 0;
							moveY = 0;
						}
						activeTextbox = tbox;
					}
					else if (inst.isItem) {
						// Will execute if this item is able to be picked up.
						
						// Can't pick stuff up until the night starts
						if (!global.nightStarted) {
							if (!instance_exists(objTextBoxes)) {
								NewTextbox("I should clock in first", 1);
								canMove = false;
							}
						}
						else {
							// Check for an empty inventory slot
							var i = 0;
							repeat(4) {
								if (inventory[i] == "Empty") {
									inventory[i] = inst.name; 
									// Removes the item from the game world
									instance_destroy(inst);
									break;
								}
								i++;
							}
						}
					}
					else if (inst.isDoor) {
						with(objGame) {
							if (!doTransition) {
								transportX = inst.transportX;
								transportY = inst.transportY;
								newLocation = inst.newLocation;
								playerFacingAfter = inst.playerFacingAfter;
								doTransition = true;
							}
						}
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
		// Setting these to 0 will stop the player from running in place.
		moveX = 0;
		moveY = 0;
		
		// Checks when the pause is stopped to resume play.
		if(!global.gamePaused or !isSafe) { state = pStates.Free; }
	break;
}

if (energy <= maxEnergy) {
	energy += 0.03;
}

if (jobProgression >= maxJobProgression) {
	jobProgression = maxJobProgression;
}