/// @description Spawn in angry version
show_debug_message("Now I'm ang-wy");

if (objPlayer.activeTextbox != noone) {
	if (object_exists(objDialogBoxes)) {
		if (objDialogBoxes.message[0] == "Teeheehee! I like to look at all the sheleves for candy!") {
			instance_destroy(objPlayer.activeTextbox);
			objPlayer.activeTextbox = noone;
		}
	}
}

// Replace objLittleGirlNPC with mean mode
var inst = instance_create_layer(x, y, "Instances", objLittleGirl);
inst.currentLocation = currentLocation;

instance_destroy();