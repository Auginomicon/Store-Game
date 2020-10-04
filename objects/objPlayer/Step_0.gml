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
		if (global.gamePaused or isSafe or objInventory.showInventory or instance_exists(objTextBoxes) or instance_exists(objDialogBoxes)) {state = pStates.Paused; exit; }
	
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

		//Collide with objects
		var inst = instance_place(x, y, objTransition);
		//Finds a collision id
		if (inst != noone) {
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
				var inst = collision_rectangle(x - radius, y - radius, x + radius, y + radius, ParInteractable, false, false);
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
						facing = -1;
					}
					else if (inst.isItem) {
						// Will execute if this item is able to be picked up.
						
						// Can't pick stuff up until the night starts
						if (!global.nightStarted) {
							if (!instance_exists(objTextBoxes)) {
								NewTextbox("I should clock in first.", 1);
								canMove = false;
								facing = -1;
							}
						}
						else {
							// Check for an empty inventory slot
							var i = 0;
							repeat(4) {
								if (inventory[i] == "Empty") {
									inventory[i] = inst.name;
									audio_play_sound(inst.sound, 1, false);
									// Removes the item from the game world
									instance_destroy(inst);
									break;
								}
								i++;
							}
						}
					}
					// checks if it is a door
					else if (inst.isDoor) {
						if (inst.isOpen) {
							if (!audio_is_playing(sndDoor)) { audio_play_sound(sndDoor, 1, false); }
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
						// Checks if you have the key item
						else {
							// Loop through the inventory for the key item to bypass if it is locked already
							var i = 0;
							repeat(4) {
								if (inventory[i] == "Key") {
									with(objGame) {
										if(!doTransition) {
											transportX = inst.transportX;
											transportY = inst.transportY;
											newLocation = inst.newLocation;
											playerFacingAfter = inst.playerFacingAfter;
											doTransition = true;
										}
									}
									if (!audio_is_playing(sndDoor)) { audio_play_sound(sndDoor, 1, false); }
									break;
								}
								i++;
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
		
		// Sanity sounds
		if (sanity <= 25) {
			if (audio_is_playing(sndHeartbeat01)) audio_stop_sound(sndHeartbeat01);
			if (!audio_is_playing(sndHeartbeat02)) audio_play_sound(sndHeartbeat02, 2, true);
			if (alarm[0] == -1) {
				alarm[0] = (sanity div 2) * room_speed;
			}
		}
		else if (sanity <= 50) {
			if (audio_is_playing(sndHeartbeat02)) audio_stop_sound(sndHeartbeat02);
			if (!audio_is_playing(sndHeartbeat01)) audio_play_sound(sndHeartbeat01, 2, true);
			if (alarm[0] == -1) {
				alarm[0] = (sanity div 3) * room_speed;
			}
		}
		else {
			if (audio_is_playing(sndHeartbeat02)) audio_stop_sound(sndHeartbeat02);
		}
		
		//Apply Collision before moving
		Collisions();
		
		x += moveX
		y += moveY
		
	break;
		
	case pStates.Paused:
		// Setting these to 0 will stop the player from running in place.
		moveX = 0;
		moveY = 0;
		
		// Pause the alarm
		if (alarm[0] != -1) alarm[0]++;
		
		// Checks when the pause is stopped to resume play.
		if(!global.gamePaused or !isSafe) { state = pStates.Free; }
	break;
}

// Regain energy while not moving
if (energy <= maxEnergy) {
	energy += 0.03;
}

// Job progress check
if (jobProgression >= maxJobProgression) {
	jobProgression = maxJobProgression;
}

// Sound reset
if (sound != -1) {
	if (!audio_is_playing(sound)) {
		sound = -1;
	}
}