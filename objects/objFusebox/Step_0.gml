/// @description 
// Check if the fusebox is broken or not.
if (objGame.location != 3){
	audio_stop_sound(sndGenerator);
	exit;
}
if (image_index != 2) {
	if (distance_to_object(objPlayer) < 200) {
		if (!audio_is_playing(sndGenerator)) { audio_play_sound(sndGenerator, 1, false); }
	}
	else { audio_stop_sound(sndGenerator); }
}
else {
	if (collision_circle(x, y, 52, objPlayer, false, true)) {
		if (keyboard_check(ord("E"))) {
			progress += 0.2;
			objPlayer.canMove = false;
		}
		else {
			if (!global.gamePaused or instance_exists(objDialogBoxes) or instance_exists(objTextBoxes) or objInventory.showInventory) {
				objPlayer.canMove = true;
			}
			// Progress will decay if untreated
			progress -= 0.05;
			if (progress <= 0) {
				progress = 0;
			}
		}
	}

	if (progress >= maxProgress) {
		image_index = 0;
		progress = 0;
		event_perform(ev_other, ev_user1);
	}
}