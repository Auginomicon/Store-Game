/// @description
var rng = irandom(5);
switch (rng) {
	case 0:
		// Spooky Sound
		show_debug_message("Knocking");
		if (!audio_is_playing(sndKnocking)) audio_play_sound(sndKnocking, 5, false);
	break;
	
	case 1:
		// Spooky Sound
		show_debug_message("Crash");
		if (!audio_is_playing(sndCrash)) audio_play_sound(sndCrash, 5, false);
	break;
	
	case 2:
		// Spooky Sound
		show_debug_message("Chim Chimes");
		if (!audio_is_playing(sndChimes)) audio_play_sound(sndChimes, 5, false);
	break;
	
	case 3:
		// Spooky Sound
		show_debug_message("Footsteps");
		if (location == 1 or location == 4 or location == 5) {
			if (!audio_is_playing(sndRunningFootstepsTile)) audio_play_sound(sndRunningFootstepsTile, 5, false);
		}
		else {
			if (!audio_is_playing(sndRunningFootstepsGrass)) audio_play_sound(sndRunningFootstepsGrass, 5, false);
		}
	break;
	
	case 4:
		// Spooky Sound
		show_debug_message("Croak");
		if (!audio_is_playing(sndCroak)) audio_play_sound(sndCroak, 5, false);
	break;
	
	case 5:
		// Spooky Sound
		show_debug_message("Footsteps");
		if (location == 1 or location == 4 or location == 5) {
			if (!audio_is_playing(sndRunningFootstepsTile)) audio_play_sound(sndRunningFootstepsTile, 5, false);
		}
		else {
			if (!audio_is_playing(sndRunningFootstepsGrass)) audio_play_sound(sndRunningFootstepsGrass, 5, false);
		}
	break;
}

alarm[3] = ((irandom(4) + 1) + 45) * room_speed;