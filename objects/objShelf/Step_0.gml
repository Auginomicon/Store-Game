/// @description

if (objGame.location != 1) exit;

// Check in front of the shelf if the player is there
if (point_in_rectangle(objPlayer.x, objPlayer.y, x - (sprite_width * 0.5), y, x + (sprite_width * 0.5), y + 32)) {
	// Checks player input and that nothing else is active.
	if (objPlayer.input_use_item and objInventory.showInventory == false and objPlayer.activeTextbox == noone) {
		if (!global.nightStarted) {
			if (!instance_exists(objTextBoxes)) NewTextbox("I should clock in first", 1);
		}
		else {
			switch (image_index) {
				case 0: // If the shelf is empty then it will restock
					if (objPlayer.equipped[0] == "Storage Box") {
						var i = irandom(1) + 1;
						image_index = i;
						objPlayer.jobProgression += 10;
						show_debug_message("Shelf Restocked");
			
						//Remove item from Inventory
						with(objPlayer) {
							event_perform(ev_other, ev_user0);
							if (global.bonusTask == 2) {
								money += 1.25;
							}
						}
					}
				break;
			
				case 3: // If the shelf is messy, then it will be cleaned up
				case 4:
					image_index = 0;
				
					for (var i = 0; i < 4; i++) {
						// If theres an empty spot break the loop and put a garbage item in the inventroy
						if (objPlayer.inventory[i] == "Empty") {
							objPlayer.inventory[i] = "Garbage";
							break;
						}
						// If it is full and on the final iteration, then make a garbage item instance
						else if (i == 3) {
							var inst = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objItem);
							inst.name = "Garbage";
							inst.sprite_index = sprGarbage;
						}
					}
					objPlayer.jobProgression += 5;
					show_debug_message("Shelf cleaned");
					audio_play_sound(sndTrashbag, 1, false);
				
				break;
			
				default:
					show_debug_message("This shelf is fine");
				break;
			}
		}
	}
}