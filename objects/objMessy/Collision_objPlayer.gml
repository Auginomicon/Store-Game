/// @description
with(objPlayer) {
	walkSpeed = 1;
}
// Will check if the the player interacts with the trash piles
if (objPlayer.input_interact and (image_index == 0 or image_index == 1)) {
	if (!global.nightStarted) {
		if(!instance_exists(objTextBoxes)) {
			NewTextbox("Hmm maybe I should clock in first.", 1);
			objPlayer.canMove = false;
			objPlayer.facing = -1;
		}
	}
	else {
		// Loop through the inventory array
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
				inst.sound = sndGarbagePickup;
			}
		}
		instance_destroy();
		audio_play_sound(sndTrashbag, 1, false);
		objPlayer.sanity -= 3;
		objPlayer.energy -= 3;
		if (global.bonusTask == 4) {
			objPlayer.money += global.bonussMoney;
		}
		if (global.nightStarted = true) {
			objPlayer.jobProgression += 3;
		}
	}
}
else if (objPlayer.isMopping and objPlayer.sprite_index = objPlayer.sprite[5] and (image_index == 2 or image_index == 3)) {
	image_alpha -= 0.01;
	if (image_alpha <= 0) {
		with(objPlayer) {
			if (global.nightStarted = true) {
				objPlayer.jobProgression += 2;
				if (global.bonusTask == 3) {
					objPlayer.money += global.bonussMoney;
				}
			}
			sanity -= 3;
		}
		instance_destroy();
	}
}