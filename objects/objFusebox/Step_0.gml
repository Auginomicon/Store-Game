/// @description 
// Check if the fusebox is broken or not.
if (image_index != 2) exit;

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