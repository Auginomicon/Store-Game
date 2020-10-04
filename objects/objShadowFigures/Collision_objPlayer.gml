/// @description
if (!objPlayer.isSafe) {
	with(other) {
		sanity -= 1;
		var tempEnergy = energy - 35;
		if (tempEnergy <= 0) {
			energy = 0;
		}
		else {
			energy -= 35;
		}
	}
	if (!audio_is_playing(sndExhale)) audio_play_sound(sndExhale, 5, false);
	instance_destroy();
}