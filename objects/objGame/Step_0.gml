/// @description
if (playerDead or showWinScreen) {
	global.gamePaused = true;
	
	if (keyboard_check_pressed(vk_anykey) or mouse_check_button_pressed(mb_any)) {
		GoToMainMenu();
	}
	exit;
}

if (objDayCycle.hours == 11) {
	needToClockOut = true;
	with (objSign) {
		event_perform(ev_other, ev_user0);
	}
}

if (keyboard_check_pressed(vk_escape)) {
	global.gamePaused = !global.gamePaused;
	if (global.gamePaused) {
		audio_pause_all();
		if (alarm[0] >= 0) alarm[0]++;
		with(objPlayer) {
			canMove = false;
			state = pStates.Paused;
		}
	}
	else {
		audio_resume_all();
		with(objPlayer) {
			canMove = true;
			state = pStates.Free;
		}
	}
}

// Checks for player Sanity
if (objPlayer.sanity <= 0) {
	playerDead = true;
}

// Sound Management
if (global.gamePaused) exit;

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