/// @description Debug
if(keyboard_check_pressed(ord("G"))) { room_restart(); }

if (keyboard_check_pressed(vk_escape)) {
	global.gamePaused = !global.gamePaused;
	if (global.gamePaused) {
		with(objPlayer) {
			state = pStates.Paused;
		}
	}
}