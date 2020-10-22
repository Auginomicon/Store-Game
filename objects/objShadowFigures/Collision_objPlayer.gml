/// @description
if (!bathroomEvent) {
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
			sfCollidedWith++;
		}
		if (!audio_is_playing(sndExhale)) audio_play_sound(sndExhale, 5, false);
		instance_destroy();
	}
}
else {
	DeathScreen("Shadow figures surround you \nand take you away.");
	instance_destroy();
}