/// @description Spawn shadow figures
if (location == 5) {
	var s1 = instance_create_layer(1114, 2979, "Instances", objShadowFigures);
	s1.image_alpha = 0;
	s1.freeRoam = false;
	s1.bathroomEvent = true;
	var s2 = instance_create_layer(1284, 2893, "Instances", objShadowFigures);
	s2.image_alpha = 0;
	s2.freeRoam = false;
	s2.bathroomEvent = true;
}
else if (location == 4) {
	var s1 = instance_create_layer(1511, 2982, "Instances", objShadowFigures);
	s1.image_alpha = 0;
	s1.freeRoam = false;
	s1.bathroomEvent = true;
	var s2 = instance_create_layer(1625, 2866, "Instances", objShadowFigures);
	s2.image_alpha = 0;
	s2.freeRoam = false;
	s2.bathroomEvent = true;
}