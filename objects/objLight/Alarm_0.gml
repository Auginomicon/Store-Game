/// @description 
working = !working;
repeater--;

// Spawn gown gal at the last flicker
if (repeater == 0) {
	if(!instance_exists(objGownGal)) { 
		var inst = instance_create_layer(2274, 1383, "Instances", objGownGal);
		inst.currentLocation = 1;
		inst.freeRoam = false;
		inst.fourthEvent = true;
		inst.roamX = 1081;
		inst.roamY = 1076;
	}
	else {
		objGownGal.currentLocation = 1;
		objGownGal.x = 2274;
		objGownGal.y = 1383;
		objGownGal.freeRoam = false;
		objGownGal.roamX = 1081;
		objGownGal.roamY = 1076;
	}
}
if (repeater != 0) {
	alarm[0] = choose(.5, .1, .35) * room_speed;
}
else {
	working = true;
}