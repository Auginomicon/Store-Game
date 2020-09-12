/// @description
// Make it so that this step event doesnt run when the player is not in this location
if (objGame.location != 1 or state == MachineState.Off) exit;

if (point_in_rectangle(objPlayer.x, objPlayer.y, x - (sprite_width * 0.5), y, x + (sprite_width * 0.5), y + 32)) {
	if (objPlayer.input_interact) {
		show_debug_message("Toggle Camera Systems");
		global.cameraSystem = !global.cameraSystem;
		with(objPlayer) {
			facing = -1;
		}
	}
}