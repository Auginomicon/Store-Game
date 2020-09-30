/// @description
if (!objPlayer.isSafe) {
	objPlayer.sanity -= 60;
	audio_play_sound(sndJumpScare01, 10, false);
	instance_destroy();
	
	with (objGame) {
		creature = 0;
		jumpscare = true;
	}
}