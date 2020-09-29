/// @description Giggle randomly
if (distance_to_object(objPlayer) < 250) {
	var giggle = choose(sndGiggle01,sndGiggle02, sndGiggle03, sndGiggle04);
	if (!audio_is_playing(giggle)) audio_play_sound(giggle, 7, false);
}
// Redo alarm
alarm[2] = choose(2, 4, 7, 10, 5) * room_speed;