/// @description Play a random sounnd
if (sound == -1) {
	sound = choose(sndDrone01, sndDrone02, sndDrone03, sndDrone04, sndHumwHorns);

	// Play the choosen ones
	audio_play_sound(sound, 4, false);
}

// Spawn a shadow figure
if (instance_number(objShadowFigures) <= 15) {
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
				spawnX = 1209
				spawnY = 1706;
			break;
	
			case 2: // Out front
				spawnX = 4442;
				spawnY = 1339;
			break;
	
			case 3: // Out back
				spawnX = 4060;
				spawnY = 4042;
			break;
		}
		var sf = instance_create_layer(spawnX, spawnY, "Instances", objShadowFigures);
		sf.currentLocation = loc;
		sf.roamX = spawnX;
		sf.roamY = spawnY;
	}
}

// Spawn spoop object
var loc = choose(1, 2, 3);
var spawnX, spawnY;
switch (loc) {
	case 1:
		spawnX = irandom_range(1643, 2283);
		spawnY = irandom_range(3942, 4429);
	break;
	
	case 2:
		spawnX = irandom_range(3281, 5519);
		spawnY = irandom_range(984, 2442);
	break;
	
	case 3:
		spawnX = irandom_range(3287, 4883);
		spawnY = irandom_range(3942, 4429);
	break;
}

instance_create_layer(spawnX, spawnY, "Instances", objSpoops);