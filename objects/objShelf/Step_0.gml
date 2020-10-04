/// @description

if (objGame.location != 1) exit;

// Check in front of the shelf if the player is there
if (point_in_rectangle(objPlayer.x, objPlayer.y, x - (sprite_width * 0.5), y, x + (sprite_width * 0.5), y + 32)) {
	inRange = true;
	// Checks player input and that nothing else is active.
	if (objPlayer.input_interact and objInventory.showInventory == false and objPlayer.activeTextbox == noone) {
		if (!global.nightStarted) {
			if (!instance_exists(objTextBoxes)) {
				NewTextbox("I should clock in first.", 1);
				objPlayer.facing = -1;
			}
		}
		else {
			if (image_index == 3 or image_index == 4) {
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
						inst.sound = sndTrashbag;
					}
				}
				objPlayer.jobProgression += 5;
				objPlayer.energy -= 3;
				objPlayer.sanity -= 4;
				show_debug_message("Shelf cleaned");
				audio_play_sound(sndTrashbag, 1, false);
			}
			else {
				show_debug_message("This shelf is fine");
			}
		}
	}
}
else {
	inRange = false;
}