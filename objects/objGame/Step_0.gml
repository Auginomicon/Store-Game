/// @description
if (keyboard_check_pressed(vk_escape)) {
	global.gamePaused = !global.gamePaused;
	if (global.gamePaused) {
		audio_pause_all();
		instance_deactivate_all(true);
		instance_activate_object(objMenus);
	}
	else {
		audio_resume_all();
		instance_activate_all();
	}
}
if (keyboard_check_released(ord("L"))) {
	playerDead = true;
}
// add time to the alarm so it doesn't activate
if (global.gamePaused) {
	if (alarm[6] != -1) alarm[6]++;
	if (alarm[3] != -1) alarm[3]++;
}

if (playerDead or showWinScreen) {
	global.gamePaused = true;
	
	if (keyboard_check_pressed(vk_anykey) or mouse_check_button_pressed(mb_any)) {
		if (showWinScreen) {
			//global.day++;
			GoToMainMenu();
		}
		else {
			GoToMainMenu();
		}
	}
	exit;
}

// Don't do any more checks beyond this point.
if (global.gamePaused) exit;

// Shadow figure death between 1 and 2
if (objDayCycle.hours >= 6 and objDayCycle.hours <= 7) {
	if (location == 4 or location == 5) {
		if (!eventHelper) {
			event_perform(ev_other, ev_user2);
		}
	}
}

// Spawn little girl and gown gal between 2 and 3
if (objDayCycle.hours >= 7 and objDayCycle.hours <= 8) {
	if (!eventTrigger2) {
		if(!instance_exists(objLittleGirlNPC) or !instance_exists(objLittleGirl)) { 
			var inst = instance_create_layer(x, y, "Instances", objLittleGirlNPC);
			inst.currentLocation = 2;
			var snd = choose(sndGiggle01,sndGiggle02, sndGiggle03, sndGiggle04);
			audio_play_sound(snd, 7, false);
		}
	
		if(!instance_exists(objGownGal)) { 
			var spawn = GetSpawnLocations();
			var inst = instance_create_layer(spawn[0], spawn[1], "Instances", objGownGal);
			inst.currentLocation = spawn[2];
			var piano = choose(sndPiano02, sndPiano01);
			audio_play_sound(piano, 7, false);
		}
		eventTrigger2 = true;
	}
}

// Spawn tall guy at 3
if (objDayCycle.hours >= 8 and objDayCycle.hours <= 9) {
	if (!eventTrigger3) {
		if (instance_exists(objSpecialMessy)) {
			// Spawn the tall guy
			if(!instance_exists(objTallGuy)) { 
				var spawnX = choose(5799, 3061, 4458);
				var spawnY = 2372;
				var inst = instance_create_layer(spawnX, spawnY, "Instances", objTallGuy);
				inst.currentLocation = 2;
				var roar = choose(sndTGRoar01, sndTGRoar02);
				audio_play_sound(roar, 7, false);
			}
		}
		
		// Larry leaves 
		with(objLostEmployee) {
			event_perform(ev_other, ev_user1)
		}
		
		// Light flicker chance
		if (alarm[5] == -1) {
			alarm[5] = 35 * room_speed;
		}
		eventTrigger3 = true;
	}
}

// Events that occur between 4 and 5;
if (objDayCycle.hours >= 9 and objDayCycle.hours <= 10) {
	if (!eventTrigger4) {
		if (instance_exists(objTallGuy)) {
			instance_destroy(objTallGuy);
		}
		
		// begin to spawn shadow figures
		if (alarm[6] == -1) {
			alarm[6] = 30 * room_speed;
		}
		eventTrigger4 = true;
	}
}

// Event that occurs between 5 and 6
if (objDayCycle.hours >= 10 and objDayCycle.hours <= 11) {
	if (!eventTrigger5) {
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
		eventTrigger5 = true;
	}
}

// Checks if the fusebox is broken, if it is then spawn shadow figures inside the store.
if (objFusebox.sprite_index == 2) {
	if (alarm[6] == -1) {
		alarm[6] = 30 * room_speed;
	}
}
else {
	// Makes sure that it only stops before 4.
	if (objDayCycle.hours <= 9) {
		alarm[6] = -1;
	}
}

// Clock out
if (objDayCycle.hours == 11) {
	needToClockOut = true;
	with (objSign) {
		event_perform(ev_other, ev_user0);
	}
	// Text fade
	if (alarm[2] == -1) {
		alarm[2] = 5 * room_speed;
	}
}

// Checks for player Sanity
if (objPlayer.sanity <= 0) {
	playerDead = true;
}

// Sound Management
// Outside the store
if (location == 2 or location == 3) {
	if (!audio_is_playing(sndCicada)) { audio_play_sound(sndCicada, 1, true); }
}
else {
	if (audio_is_playing(sndCicada)) { audio_stop_sound(sndCicada); }
}

// Inside the store
if (location == 1) {
	if (!audio_is_playing(sndFlourescentBuzz)) { audio_play_sound(sndFlourescentBuzz, 1, true); }
	if (audio_is_playing(sndViolins) or audio_is_playing(sndSpoop01) or audio_is_playing(sndDrone01) or audio_is_playing(sndDrone02) or audio_is_playing(sndDrone03) or audio_is_playing(sndDrone04) or audio_is_playing(sndHumwHorns)) {
		audio_pause_sound(sndStoreMusic);
	}
	else if (!audio_is_playing(sndStoreMusic)) { 
		audio_play_sound(sndStoreMusic, 1, true); 
	}
	else {
		audio_resume_sound(sndStoreMusic);
	}
}
else {
	if (audio_is_playing(sndFlourescentBuzz)) { audio_stop_sound(sndFlourescentBuzz); }
	if (audio_is_playing(sndStoreMusic)) { audio_pause_sound(sndStoreMusic); }
}