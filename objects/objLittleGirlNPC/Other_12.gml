/// @description Spawn in angry version
show_debug_message("Now I'm ang-wy");

if (objPlayer.activeTextbox != noone) {
	if (object_exists(objDialogBoxes)) {
		if (objDialogBoxes.message[0] == "Hmm, hmmm, la la la!") {
			instance_destroy(objPlayer.activeTextbox);
			objPlayer.activeTextbox = noone;
		}
	}
}

// Replace objLittleGirlNPC with mean mode
var inst = instance_create_layer(x, y, "Instances", objLittleGirl);
inst.currentLocation = currentLocation;

// Spawn in the doll somewhere on the map
var rng = irandom(4);
var dollX = 0;
var dollY = 0;
var dollLocation = 1;
switch(rng) {
	case 0: // Inside the store
		dollX = 1670;
		dollY = 1764;
		dollLocation = 1;
	break;
	
	case 1: // Out Front
		dollX = 4699;
		dollY = 997;
		dollLocation = 2;
	break;
	
	case 2: // Parking lot
		dollX = 3846;
		dollY = 1395;
		dollLocation = 2;
	break;
	
	case 3: // Bathrooms
		dollX = 1238;
		dollY = 2901;
		dollLocation = 4
	break;
	
	case 4: // Out back
		dollX = 4031;
		dollY = 4063;
		dollLocation = 3;
	break;
}

var doll = instance_create_layer(dollX, dollY, "Instances", objItem);
doll.sprite_index = sprDoll;
doll.name = "Doll";
doll.currentLocation = dollLocation;

instance_destroy();
