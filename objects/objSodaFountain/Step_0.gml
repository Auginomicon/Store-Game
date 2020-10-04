/// @description
// Rest puddle variable if it is destroyed
if (!instance_exists(puddle)) {
	puddle = -1;
}

// Checks if it is on
if (!isOn) exit;

// Set sprite
sprite_index = sprSodaFountainOn;
if (objGame.location == 1 and distance_to_object(objPlayer) < 200) {
	if (!audio_is_playing(sndSodaFountain)) audio_play_sound(sndSodaFountain, 5, false);
}
else {
	if (audio_is_playing(sndSodaFountain)) audio_stop_sound(sndSodaFountain);
}

if (alarm[0] == -1) {
	alarm[0] = 8 * room_speed;
}

// Checks if the player is in the room
if (objGame.location != 1) exit;
if (collision_circle(x, y, 68, objPlayer, false, true)) {
	if (objPlayer.input_interact) {
		isOn = false;
		sprite_index = sprSodaFountain;
		alarm[0] = -1;
		if (audio_is_playing(sndSodaFountain)) audio_stop_sound(sndSodaFountain);
	}
}