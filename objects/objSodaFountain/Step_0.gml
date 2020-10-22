/// @description
// Rest puddle variable if it is destroyed
if (!instance_exists(puddle)) {
	puddle = -1;
}

// Check if on or not
if (isOn) {
	sprite_index = sprSodaFountainOn;
	// Play sound
	if (objGame.location == 1 and distance_to_object(objPlayer) < 200) {
		if (!audio_is_playing(sndSodaFountain)) audio_play_sound(sndSodaFountain, 5, false);
	}
	else {
		if (audio_is_playing(sndSodaFountain)) audio_stop_sound(sndSodaFountain);
	}
	
	// Ready the alarm
	if (alarm[0] == -1) {
		alarm[0] = 8 * room_speed;
	}
}
else {
	sprite_index = sprSodaFountain;
	if (alarm[0] != -1) {
		alarm[0] = -1;
	}
	
	if (audio_is_playing(sndSodaFountain)) audio_stop_sound(sndSodaFountain);
}

// Checks if the player is in the room
if (objGame.location != 1) exit;
if (collision_circle(x, y, 68, objPlayer, false, true)) {
	if (objPlayer.input_interact) {
		isOn = !isOn;
	}
}