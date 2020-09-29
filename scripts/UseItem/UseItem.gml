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
			var dSound = -1;
			switch(item) {
				case "Energy Bar":
					dItem = sprEnergyBar;
					dSound = sndFoodPickup;
					audio_play_sound(sndFoodDrop, 1, false);
				break;
				
				case "Storage Box":
					dItem = sprBox;
					dSound = sndCardboardBox;
					audio_play_sound(sndCardboardBoxDrop, 1, false);
				break;
				
				case "Candy Bar":
					dItem = sprCandyBar;
					dSound = sndFoodPickup;
					audio_play_sound(sndFoodDrop, 1, false);
				break;
				
				case "Flashlight":
					dItem = sprFlashlight;
					dSound = sndItemPickup;
					audio_play_sound(sndItemPickup, 1, false);
				break;
				
				case "Mop":
					dItem = sprMop;
					dSound = sndMopPickup;
					audio_play_sound(sndMopDrop, 1, false);
				break;
				
				case "Sanity Soda":
					dItem = sprSanitySoda;
					dSound = sndSodaPickup;
					audio_play_sound(sndItemPickup, 1, false);
				break;
				
				case "Key":
					dItem = sprKey;
					dSound = sndItemPickup;
					audio_play_sound(sndKey, 1, false);
				break;
				
				case "Garbage":
					dItem = sprGarbage;
					dSound = sndGarbagePickup;
					audio_play_sound(sndGarbagePickup, 1, false);
				break;
				
				case "Lock":
					dItem = sprLock;
					dSound = sndItemPickup;
					audio_play_sound(sndItemPickup, 1, false);
				break;
				
				case "Notebook":
					dItem = sprNotebook;
					dSound = sndNotebookPickup;
					audio_play_sound(sndNotebookPickup, 1, false);
				break;
				
				case "Doll":
					dItem = sprDoll;
					dSound = sndSqueak;
					audio_play_sound(sndSqueak, 1, false);
				break;
			}
			
			//Drops the item at your feet
			var inst = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objItem);
			inst.name = item;
			inst.sprite_index = dItem;
			inst.currentLocation = objGame.location;
			inst.sound = dSound;
		}
	}
}
