/// @description
if (objGame.location == 1 or objGame.location == 2) {
	if (distance_to_object(objPlayer) < 200) {
		if (!audio_is_playing(sndDoorBell)) { audio_play_sound(sndDoorBell, 1, false); }
	}
}
