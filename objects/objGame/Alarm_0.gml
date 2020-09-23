/// @description Spawn in enemies
var rng = irandom(10) +1;

switch(rng) {
	case 1:
		// Spawn the gown gal
		show_debug_message("Gown Gal");
		if(!instance_exists(objGownGal)) { 
			var spawn = GetSpawnLocations();
			var inst = instance_create_layer(spawn[0], spawn[1], "Instances", objGownGal);
			inst.currentLocation = spawn[2];
			var piano = choose(sndPiano02, sndPiano01);
			if (!audio_is_playing(piano)) audio_play_sound(piano, 5, false);
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
			if (!audio_is_playing(roar)) audio_play_sound(roar, 5, false);
		}
	break;
	
	case 3:
		// Spawn the the little girl
		show_debug_message("Little Girl and the Doll");
		if(!instance_exists(objLittleGirlNPC)) { 
			var inst = instance_create_layer(x, y, "Instances", objLittleGirlNPC);
			inst.currentLocation = 2;
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
		show_debug_message("Drone");
		if (!audio_is_playing(sndDrone01)) audio_play_sound(sndDrone01, 5, false);
	break;
	
	case 8:
		// Spooky Sound
		show_debug_message("Hum");
		if (!audio_is_playing(sndHumwHorns)) audio_play_sound(sndHumwHorns, 5, false);
	break;
	
	case 9:
		// Turn on soda fountain
		
	break;
	
	case 10:
		// Spawn the gown gal
		show_debug_message("Gown Gal");
		if(!instance_exists(objGownGal)) { 
			var spawn = GetSpawnLocations();
			var inst = instance_create_layer(spawn[0], spawn[1], "Instances", objGownGal);
			inst.currentLocation = spawn[2];
			var piano = choose(sndPiano02, sndPiano01);
			if (!audio_is_playing(piano)) audio_play_sound(piano, 5, false);
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
			if (!audio_is_playing(piano)) audio_play_sound(piano, 5, false);
		}
	break;
}

alarm[0] = 35 * room_speed;
