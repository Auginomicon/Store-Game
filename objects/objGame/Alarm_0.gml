/// @description Spawn in enemies
var rng = irandom(13);

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
		// Spooky Sound
		show_debug_message("Chim Chimes");
		if (!audio_is_playing(sndChimes)) audio_play_sound(sndChimes, 5, false);
	break;
	
	case 5:
		// Spooky Sound
		show_debug_message("Aaaaah");
		if (!audio_is_playing(sndExhale)) audio_play_sound(sndExhale, 5, false);
	break;
	
	case 6:
		// Spooky Sound
		show_debug_message("Aaaaah");
		if (!audio_is_playing(sndExhale)) audio_play_sound(sndExhale, 5, false);
	break;
	
	case 7:
		// Spooky Sound
		show_debug_message("Footsteps");
		if (location == 1 or location == 4 or location == 5) {
			if (!audio_is_playing(sndRunningFootstepsTile)) audio_play_sound(sndRunningFootstepsTile, 5, false);
		}
		else {
			if (!audio_is_playing(sndRunningFootstepsGrass)) audio_play_sound(sndRunningFootstepsGrass, 5, false);
		}
	break;
	
	case 8:
		// Spooky Sound
		show_debug_message("Croak");
		if (!audio_is_playing(sndCroak)) audio_play_sound(sndCroak, 5, false);
	break;
	
	case 9:
		// Turn on soda fountain
		objSodaFountain.isOn = true;
	break;
	
	case 10:
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
	
	case 11:
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
	
	case 12:
		// Spooky Sound
		show_debug_message("Knocking");
		if (!audio_is_playing(sndKnocking)) audio_play_sound(sndKnocking, 5, false);
	break;
	
	case 13:
		// Spooky Sound
		show_debug_message("Crash");
		if (!audio_is_playing(sndCrash)) audio_play_sound(sndCrash, 5, false);
	break;
	
	case 14: // Spawn a shadow figure
		if (instance_number(objShadowFigures <= 10)) {
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
}

alarm[0] = (objPlayer.sanity div 3.5) * room_speed;
