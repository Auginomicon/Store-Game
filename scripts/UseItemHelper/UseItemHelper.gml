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
					sanity -= 3;
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
				
				message[1] = ["Introduction", "Gown Gal", "Tall Creature", "Next page.", "Leave."];
				
				message[2] = "I'm writing this for you so that you can survive. The night, this place is made on cursed grounds and terrible entities haunt the woods around you."
				message[3] = "Avoid her at all costs! She will follow you if you get too close. Hide in the the janitor's closet if she's following you. Pray that she didn't notice you get inside";
				message[4] = "Despite his large size, he is a big, shy, scaredy-cat. If you get close to him he will hunch up into a ball and wait til you're gone. If he breaks to the fusebox, he will not fear you anymore. So keep it locked tight.";
				
				message[5] = ["Previous page.", "Little Girl and The Doll.", "Shadow Figures", "Next page.", "Leave."];
				
				message[6] = "Give her a candy bar to appease her. If you don't she will open up all your trash bags in the back and leave her doll behind. Catch the doll to make her stop. After that you can either throw the doll in the dumpster or keep the doll to ward her off.";
				message[7] = "These figures roam around the property. They will try to catch you, if they do you will feel sluggish. The lower your sanity, the more there will be.";
				message[8] = "";
				
				
				scripts = -1;
				speakers = [objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer];
				portraitNums = [0, 0, 1, 2, 1, 0, 0, 0, 0];
				nextLine = [1, [2, 3, 4, 5, -1], 1, 1, 1, [1, 6, 7, -1/*Change to next page*/, -1], 5, 5, -1];
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
			if (shelf.inRange) {
				with(shelf) {
					var i = irandom(1) + 1;
					image_index = i;
					objPlayer.jobProgression += 7;
					objPlayer.energy -= 5;
					objPlayer.sanity -= 2;
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
		break;
	}
}