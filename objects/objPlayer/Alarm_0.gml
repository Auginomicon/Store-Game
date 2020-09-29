/// @description Play a random sounnd
if (sound == -1) {
	sound = choose(sndDrone01, sndDrone02, sndDrone03, sndDrone04, sndHumwHorns);

	// Play the choosen ones
	audio_play_sound(sound, 4, false);
}
var rep = 1;
if (sanity <= 35) {
	rep = irandom(1) + 1;
}
repeat(rep) {
	// Spawn a shadow Figure
	var loc = choose(1, 2, 3);
	show_debug_message("Spawned Shadow Figure at " + string(loc));
	
	// Get their spawn location
	var spawnX, spawnY;
	switch(loc) {
		case 1: // Inside the store
			spawnX = irandom_range(1002, 2272);
			spawnY = irandom_range(965, 1815);
		break;
	
		case 2: // Out front
			spawnX = irandom_range(3302, 5548);
			spawnY = irandom_range(1013, 2418);
		break;
	
		case 3: // Out back
			spawnX = irandom_range(3250, 4936);
			spawnY = irandom_range(3785, 4476);
		break;
	}
	var sf = instance_create_layer(spawnX, spawnY, "Instances", objShadowFigures);
	sf.currentLocation = loc;
	sf.roamX = spawnX;
	sf.roamY = spawnY;
}