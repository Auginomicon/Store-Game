/// @description
// Spawn a shadow figure
if (instance_number(objShadowFigures) <= 15) {
	// Spawns the sf's outside past 4
	if (eventTrigger4) {
		var loc = choose(2, 3);
	}
	// Will spawn the sf's inside whent he fusebox breaks
	else {
		var loc = 1;
	}
	var rep = 1;
	if (objPlayer.sanity <= 35) {
		rep = irandom(1) + 1;
	}
	repeat(rep) {
		// Spawn a shadow Figure
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

alarm[6] = (objPlayer.sanity div 3.5) * room_speed;