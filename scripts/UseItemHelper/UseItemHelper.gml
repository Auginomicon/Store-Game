///@description UseItem
///@arg Item_Name
///@arg Slot_Number

function UseItemHelper() {
	var item = argument[0];
	var slot = argument[1];
	
	switch(item) {
		case "Energy Bar": // Restores energy
			if (!audio_is_playing(sndMunch)) { audio_play_sound(sndMunch, 1, false); }
			else { 
				audio_stop_sound(sndMunch);
				audio_play_sound(sndMunch, 1, false);
			}
			with(objPlayer) {
				var tempEnergy = energy + 20;
				if (tempEnergy > maxEnergy) {
					energy = maxEnergy;
				}
				else {
					energy += 20;
				}
			}
			
			//Checks if the equipped was used. If it has been then resets the equipped array
			if (objPlayer.inventory[slot] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
				objPlayer.equipped[0] = -1;
				objPlayer.equipped[1] = -1;
			}
			
			objPlayer.inventory[slot] = "Empty";
		break;
			
		case "Sanity Soda": // Restores sanity
			if (!audio_is_playing(sndSlurp)) { audio_play_sound(sndSlurp, 1, false); }
			else { 
				audio_stop_sound(sndSlurp);
				audio_play_sound(sndSlurp, 1, false);
			}
			with(objPlayer) {
				var tempSanity = sanity + 35;
				if (tempSanity > maxSanity) {
					sanity = maxSanity;
				}
				else {
					sanity += 35;
				}
			}
			
			//Checks if the equipped was used. If it has been then resets the equipped array
			if (objPlayer.inventory[slot] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
				objPlayer.equipped[0] = -1;
				objPlayer.equipped[1] = -1;
			}
			
			objPlayer.inventory[slot] = "Empty";
		break;
			
		case "Candy Bar": //Restores lots of energy and some sanity
			if (!audio_is_playing(sndMunch)) { audio_play_sound(sndMunch, 1, false); }
			else { 
				audio_stop_sound(sndMunch);
				audio_play_sound(sndMunch, 1, false);
			}
			with(objPlayer) {
				var tempSanity = sanity + 25;
				if (tempSanity > maxSanity) {
					sanity = maxSanity;
				}
				else {
					sanity += 25;
				}
					
				var tempEnergy = energy + 45;
				if (tempEnergy > maxEnergy) {
					energy = maxEnergy;
				}
				else {
					energy += 45;
				}
			}
			
			//Checks if the equipped was used. If it has been then resets the equipped array
			if (objPlayer.inventory[slot] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
				objPlayer.equipped[0] = -1;
				objPlayer.equipped[1] = -1;
			}
			
			objPlayer.inventory[slot] = "Empty";
		break;
		
		case "Flashlight": // Toggles the flashlight
			global.isOn = !global.isOn;
			audio_play_sound(sndFlashlight, 1, false);
		break;
		
		case "Garbage": // Trash
			if (collision_circle(objPlayer.x, objPlayer.y, objPlayer.radius, objDumpster, false, true)) {
				//Checks if the equipped was used. If it has been then resets the equipped array
				if (objPlayer.inventory[slot] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
					objPlayer.equipped[0] = -1;
					objPlayer.equipped[1] = -1;
				}
			
				objPlayer.inventory[slot] = "Empty";
				show_debug_message("Garbage thrown away");
				audio_play_sound(sndGarbageThrow, 1, false);
				
				with(objPlayer) {
					jobProgression += 5;
					sanity -= 4;
					energy -= 4;
					if (global.bonusTask == 1) {
						money += global.bonussMoney;
					}
				}
			}
		break;
		
		case "Lock":
			if (point_in_rectangle(objPlayer.x, objPlayer.y, objFusebox.x - 16, objFusebox.y, objFusebox.x + 16, objFusebox.y + 32)) {
				objFusebox.image_index = 1;
				
				//Checks if the equipped was used. If it has been then resets the equipped array
				if (objPlayer.inventory[slot] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
					objPlayer.equipped[0] = -1;
					objPlayer.equipped[1] = -1;
				}
			
				objPlayer.inventory[slot] = "Empty";
				audio_play_sound(sndLock, 1, false);
			}
		break;
		
		case "Mop": //Clean up liquid messes
			show_debug_message("Mopping Toggled");
			with(objPlayer) {
				isMopping = !isMopping;
			}
		break;
		
		case "Notebook":
			if(objInventory.showInventory) {
				objInventory.showInventory = false;
			}
			with (objGame) {
				message[0] = "This is the last employee's notebook.";
				
				message[1] = ["Introduction", "1:00 AM", "2:00 AM", "Next page.", "Leave."];
				
				message[2] = "If you're reading this that means I died. I wrote down what I figured out during my shift here, hopefully my notes will help you survive better than I did. Things happen hourly here so be sure to keep up with everything."
				message[3] = "-Avoid going into the bathrooms between 1 and 2. \n-Restock the shelves in the front of the store for the little girl. She comes to the store at 2.";
				message[4] = "-A woman in a gown will appear around the establishment. Avoid her at all costs! Hide in the closet if she finds you. \n-Clean up the front of the store and the forest around it before 3! \n-Restock the shelves in the store to appease the little girl.";
				
				message[5] = ["Previous page.", "3:00 AM", "4:00 AM", "Next page.", "Leave."];
				
				message[6] = "-If the giant monster is out front, keep him from getting the the fusebox out back. It will leave at 4. \n-If the lights begin to flicker leave the store and stay outside for like 20 minutes or so. The gowned woman is inside the store. Hiding will not work.";
				message[7] = "-Shadowy figures will begin to manifest outside, be sure to not let them touch you. With every touch you will feel slower until you pass away from exhaustion.";
				
				message[8] = ["Previous page.", "5:00 AM", "6:00 AM", "Notes", "Leave."];
				
				message[9] = "-All three entites will come at this time, follow the previous rules to handle them.";
				message[10] = "-Clock out as soon as possible, disregard the progression app. They truly don't care about that.";
				message[11] = "-Between 3 and 5 you can do a special ritual. To do this, you need to turn off the soda fountain, keep both bathroom sinks on, have your phone on slient, and have only the doll on your person. Go to the middle telephone pole and place the doll nearby. You will be rewarded with the goods the little girl stole.";
				message[12] = "-To get rid of the gowned woman, turn on the soda fountain, turn on the both bathroom sinks and flush the female's toilet 3 times. It will only work between 4 and 5.";
				message[13] = "";
				
				scripts = -1;
				speakers = [objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer];
				portraitNums = [0, 0, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
				nextLine = [1, [2, 3, 4, 5, -1], 1, 1, 12, [1, 6, 7, 8, -1], 5, 5, [5, 9, 10, 11, -1], 8, 8, 8, 1, -1];
				if (!instance_exists(objDialogBoxes)) {
					var vBox = CreateDialogbox(message, speakers, nextLine, scripts, portraitNums);
					with(objPlayer) {
						activeTextbox = vBox;
						canMove = false;
					}
				}
			}
		break;
		
		case "Key":
			if (collision_circle(objPlayer.x, objPlayer.y, 42, objBackDoor, false, true)) {
				with(objBackDoor) {
					isOpen = !isOpen;
					if (isOpen) {
						audio_play_sound(sndDoorOpen, 1, false);
					}
					else {
						audio_play_sound(sndDoorClose, 1, false);
					}
				}
			}
		break;
		
		case "Doll":
			audio_play_sound(sndSqueak, 1, false);
			if (collision_circle(objPlayer.x, objPlayer.y, objPlayer.radius, objDumpster, false, true)) {
				//Checks if the equipped was used. If it has been then resets the equipped array
				if (objPlayer.inventory[slot] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
					objPlayer.equipped[0] = -1;
					objPlayer.equipped[1] = -1;
				}
				objPlayer.inventory[slot] = "Empty";
			}
		break;
		
		case "Storage Box":
			var shelf = collision_circle(objPlayer.x, objPlayer.y, objPlayer.radius, objShelf, false, true);
			if (shelf != noone) {
				if (shelf.inRange) {
					with(shelf) {
						var i = irandom(1) + 1;
						image_index = i;
						objPlayer.jobProgression += 8;
						objPlayer.energy -= 5;
						objPlayer.sanity -= 5;
						show_debug_message("Shelf Restocked");
			
						//Remove item from Inventory
						with(objPlayer) {
							if (global.bonusTask == 2) {
								money += global.bonussMoney;
							}
						}
			
						//Checks if the equipped was used. If it has been then resets the equipped array
						if (objPlayer.inventory[slot] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
							objPlayer.equipped[0] = -1;
							objPlayer.equipped[1] = -1;
						}
						objPlayer.inventory[slot] = "Empty";
					}
				}
			}
		break;
	}
}