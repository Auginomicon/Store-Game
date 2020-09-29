/// @description
// Make it so that this step event doesnt run when the player is not in this location
if (objGame.location != 1) exit;

if (point_in_rectangle(objPlayer.x, objPlayer.y, x - (sprite_width / 2), y, x + (sprite_width * 0.5), y + 32)) {
	if (objPlayer.input_interact) {
		//animDone = false;
		with(objPlayer) {
			isSafe = !isSafe;
			audio_play_sound(sndDoor, 1, false);
			show_debug_message("Are you really safe?");
			facing = -1;
			canMove = !canMove;
			if (isSafe) y = objJanitorDoor.y
			else y += 24;
		}
	}
}