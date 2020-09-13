///@description UseItem
///@arg Item_Name
///@arg Slot_Number

function UseItemHelper() {
	var item = argument[0];
	var slot = argument[1];
	
	switch(item) {
		case "Energy Bar": // Restores energy
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
			with(objPlayer) {
				var tempSanity = sanity + 25;
				if (tempSanity > maxSanity) {
					sanity = maxSanity;
				}
				else {
					sanity += 25;
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
			with(objPlayer) {
				var tempSanity = sanity + 20;
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
				with(objPlayer) {
					jobProgression += 7;
					sanity -= 5;
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
				message[4] = "Despite his large size, he is a big, shy, scaredy-cat. If you get close to him he will hunch up into a ball and wait til you're gone. If he gets to the fusebox, he will not fear you anymore. At this point, just don't go out front.";
				
				message[5] = ["Previous page.", "Little Girl and The Doll.", "The Hounds", "Next page.", "Leave."];
				
				message[6] = "Give her a candy bar to appease her. If you don't she will mess up the store and steal items.";
				message[7] = "Staying outside too long will draw hounds to your location. Avoid being out for extended durations";
				message[8] = ""
				
				
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
	}
}