/// @description Spawn in enemies
var rng = irandom(10);

switch(rng) {
	case 0:
		// Knock down a shelf
		var shelfNum = instance_number(objShelf);
		var randomShelf = (irandom(shelfNum - 1)) + 1;
		var i = 1;
		repeat(shelfNum) {
			var shelfInst = instance_nth_nearest(x, y, objShelf, i);
			if (randomShelf == i) {
				with(shelfInst.id) {
					event_perform(ev_other, ev_user0);
				}
				break;
			}
			i++;
		}
	break;
	
	case 1:
		// Spawn the gown gal
		show_debug_message("Gown Gal");
		if(!instance_exists(objGownGal)) { 
			var spawn = GetSpawnLocations();
			var inst = instance_create_layer(spawn[0], spawn[1], "Instances", objGownGal);
			inst.currentLocation = spawn[2];
			var piano = choose(sndPiano02, sndPiano01);
			audio_play_sound(piano, 7, false);
		}
	break;
	
	case 2:
		// Spawn the tall guy
		show_debug_message("Tall Guy");
		if(!instance_exists(objTallGuy)) { 
			var spawnX = choose(5799, 3061, 4458);
			var spawnY = 2372;
			var inst = instance_create_layer(spawnX, spawnY, "Instances", objTallGuy);
			inst.currentLocation = 2;
			var roar = choose(sndTGRoar01, sndTGRoar02)
			audio_play_sound(roar, 7, false);
		}
	break;
	
	case 3:
		// Spawn the the little girl
		show_debug_message("Little Girl and the Doll");
		if(!instance_exists(objLittleGirlNPC) or !instance_exists(objLittleGirl)) { 
			var inst = instance_create_layer(x, y, "Instances", objLittleGirlNPC);
			inst.currentLocation = 2;
			var snd = choose(sndGiggle01,sndGiggle02, sndGiggle03, sndGiggle04);
			audio_play_sound(snd, 7, false);
		}
	break;
	
	case 4:
		// Turn on soda fountain
		show_debug_message("Turn on soda fountain");
		objSodaFountain.isOn = true;
	break;
	
	case 5:
		// Spawn the gown gal
		show_debug_message("Gown Gal");
		if(!instance_exists(objGownGal)) { 
			var spawn = GetSpawnLocations();
			var inst = instance_create_layer(spawn[0], spawn[1], "Instances", objGownGal);
			inst.currentLocation = spawn[2];
			var piano = choose(sndPiano02, sndPiano01);
			audio_play_sound(piano, 7, false);
		}
	break;
	
	case 6:
		// Spawn the gown gal
		show_debug_message("Gown Gal");
		if(!instance_exists(objGownGal)) { 
			var spawn = GetSpawnLocations();
			var inst = instance_create_layer(spawn[0], spawn[1], "Instances", objGownGal);
			inst.currentLocation = spawn[2];
			var piano = choose(sndPiano02, sndPiano01);
			audio_play_sound(piano, 7, false);
		}
	break;
	
	case 7: // Spawn a shadow figure
		if (instance_number(objShadowFigures <= 15)) {
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
	break;
	
	case 8:
		// Spawn spoop object
		show_debug_message("Spoopy Eye");
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
	break;
	
	case 9:
	case 10:
		show_debug_message("Do Nothing");
	break;
}

alarm[0] = (objPlayer.sanity div 3.5) * room_speed;
