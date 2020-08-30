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
			
			if (objPlayer.inventory[slot] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
				objPlayer.equipped[0] = -1;
				objPlayer.equipped[1] = -1;
			}
			
			objPlayer.inventory[slot] = "Empty";
		break;
		
		case "Flashlight": // Toggles the flashlight
			global.isOn = !global.isOn;
		break;
	}
}