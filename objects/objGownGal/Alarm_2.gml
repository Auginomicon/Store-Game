/// @description  Move locations
var arr = GetSpawnLocations();

sprite_index = choose(sprGownGalIdle1, sprGownGalIdle2);
audio_play_sound(sndSpoop02, 2, false);

if (sprite_index == sprGownGalIdle2) {
	alarm[1] = choose(1, 1*room_speed);
}
else if (sprite_index == sprGownGalIdle1) {
	image_speed = 1;
}

if (objPlayer.sanity <= 65) {
	
	x = arr[0];
	y = arr[1];
	currentLocation = arr[2];
}
else {
	// keep relooping the array until the spawn is no longer inside the buidling or the same location
	while(arr[2] == 1 or (x == arr[0] and y == arr[1])) {
		arr = GetSpawnLocations();
	}
	
	x = arr[0];
	y = arr[1];
	currentLocation = arr[2];
}
if (state == enemyState.Free) {
	alarm[2] = 30 * room_speed;
}
else {
	alarm[2] = -1;
}