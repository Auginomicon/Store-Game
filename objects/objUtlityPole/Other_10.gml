/// @description Spawn enemies
if (!global.roadRitual) {
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

	if (!global.bathroomRitual) {
		// Spawn the gown gal
		show_debug_message("Gown Gal");
		if(!instance_exists(objGownGal)) { 
			var spawn = GetSpawnLocations();
			var inst = instance_create_layer(spawn[0], spawn[1], "Instances", objGownGal);
			inst.currentLocation = spawn[2];
			var piano = choose(sndPiano02, sndPiano01);
			audio_play_sound(piano, 7, false);
		}
	}

	// Spawn the the little girl
	show_debug_message("Little Girl and the Doll");
	if(!instance_exists(objLittleGirlNPC) or !instance_exists(objLittleGirl)) { 
		var inst = instance_create_layer(x, y, "Instances", objLittleGirlNPC);
		inst.currentLocation = 2;
		var snd = choose(sndGiggle01,sndGiggle02, sndGiggle03, sndGiggle04);
		audio_play_sound(snd, 7, false);
	}
}