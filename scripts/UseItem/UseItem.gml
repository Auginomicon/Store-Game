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
			show_debug_message(string(item) +" dropped.");
			objPlayer.inventory[slot] = "Empty";
			//TODO: Create an instance on the ground of that item. (MAYBE DO THIS. IDK YET)
		}
	}


}
