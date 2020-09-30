/// @description Collides with player
objPlayer.sanity -= 45;
audio_play_sound(sndJumpScare02, 10, false);
instance_destroy();

with (objGame) {
	creature = 1;
	jumpscare = true;
}