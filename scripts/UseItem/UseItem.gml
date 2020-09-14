///@description UseItem
///@arg Slot_Number
function UseItem() {

	var slot = argument[0];
	var item = objPlayer.inventory[slot];

	//Use the item
	if (mouse_check_button_pressed(mb_left)) {
		show_debug_message("Slot "+ string(slot) +" use clicked");
		UseItemHelper(item, slot);
	}

	//Equip the item to your quick use slot
	if (mouse_check_button_pressed(mb_right)) {
		show_debug_message("Slot "+ string(slot) +" equipped clicked");
		with (objPlayer) {
			if (slot == equipped[1]) {
				equipped[0] = -1;
				equipped[1] = -1;
				show_debug_message(item +" unequipped");
			}
			else if (item != "Empty") {
				equipped[0] = item;
				equipped[1] = slot;
				show_debug_message(item +" equipped");
			}
		}
	}

	//Drop the item
	if (keyboard_check_pressed(ord("R"))) {
		if(item != "Empty") {
			
			// If the equipped item was the one dropped it will be removed from the equipped array
			if (objPlayer.inventory[slot] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
				objPlayer.equipped[0] = -1;
				objPlayer.equipped[1] = -1;
			}
			
			show_debug_message(string(item) +" dropped.");
			objPlayer.inventory[slot] = "Empty";
			var dItem = -1;
			switch(item) {
				case "Energy Bar":
					dItem = sprEnergyBar;
				break;
				
				case "Storage Box":
					dItem = sprBox;
				break;
				
				case "Candy Bar":
					dItem = sprCandyBar;
				break;
				
				case "Flashlight":
					dItem = sprFlashlight;
				break;
				
				case "Mop":
					dItem = sprMop;
				break;
				
				case "Sanity Soda":
					dItem = sprSanitySoda;
				break;
				
				case "Key":
					dItem = sprKey;
				break;
				
				case "Garbage":
					dItem = sprGarbage;
				break;
				
				case "Lock":
					dItem = sprLock;
				break;
				
				case "Notebook":
					dItem = sprNotebook;
				break;
				
				case "Doll":
					dItem = sprDoll;
				break;
			}
			
			//Drops the item at your feet
			var inst = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objItem);
			inst.name = item;
			inst.sprite_index = dItem;
			inst.currentLocation = objGame.location;
		}
	}
}
