/// @description Make a noise if they are close by
if (objGame.location == currentLocation and distance_to_object(objPlayer) < 500) {
	audio_play_sound(choose(sndTGGrowl, sndTGRoar01, sndTGRoar02), 1, false);
}

alarm[3] = choose(2, 5, 10) * room_speed;
