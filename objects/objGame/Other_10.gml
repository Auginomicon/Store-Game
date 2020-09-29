/// @description End the night
// Destroy all enemies
with(ParEnemy) {
	instance_destroy();
}
// Checks if the little girl npc is around
if (instance_exists(objLittleGirlNPC)) { 
	with (objLittleGirlNPC) {
		instance_destroy();
	}
}
// Stop any more random events
alarm[0] = -1;

needToClockOut = false;
showWinScreen = true;
audio_stop_all();
audio_play_sound(sndCheering, 5, false);