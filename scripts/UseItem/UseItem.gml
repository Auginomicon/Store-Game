///@description UseItem
///@arg Slot_Number
function UseItem() {

	var slot = argument[0];
	var item = objPlayer.inventory[slot];

	//Use the item
	if (mouse_check_button_pressed(mb_left)) {
		show_debug_message("Slot "+ string(slot) +" use clicked");
		switch(item) {
			case "Energy Bar":
				with(objPlayer) {
					var tempEnergy = energy + 20;
					if (tempEnergy > maxEnergy) {
						energy = maxEnergy;
					}
					else {
						energy += 20;
					}
				}
				objPlayer.inventory[slot] = "Empty";
			break;
		
		}
	}

	//Equip the item to your quick use slot
	if (mouse_check_button_pressed(mb_right)) {
		show_debug_message("Slot "+ string(slot) +" equipped clicked");
		with (objPlayer) {
			if (item != "Empty") {
				equipped[0] = item;
				equipped[1] = slot;
				show_debug_message(item +" equipped");
			}
		}
	}

	//Drop the item
	if (keyboard_check_pressed(ord("R"))) {
		if(item != "Empty") {
			show_debug_message(string(item) +" dropped.");
			objPlayer.inventory[slot] = "Empty";
			//TODO: Create an instance on the ground of that item. (MAYBE DO THIS. IDK YET)
		}
	}


}
