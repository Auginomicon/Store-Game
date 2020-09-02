/// @description makes the rec sprite flash on the screen
rec = !rec;

if (global.cameraSystem) {
	alarm[0] = (room_speed * 1);
}
else {
	alarm[0] = -1;
}