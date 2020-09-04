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
			// TODO: Should this be needed?
			//else {
			//	// Toggle the inventory if needed
			//	if (objInventory.showInventory) {
			//		objInventory.showInventory = false;
			//	}
			//	script_execute(NewTextbox, "I need to throw this out in the dumpster.", 1);
			//}
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
	}
}