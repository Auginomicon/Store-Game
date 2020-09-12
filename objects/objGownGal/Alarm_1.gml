/// @description head twitches
image_index = choose(0, 1);

if (state == enemyState.Free and sprite_index == sprGownGalIdle2) {
	alarm[1] = choose(1, 1*room_speed);
}
else {
	alarm[1] = -1;
}