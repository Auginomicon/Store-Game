/// @description
if (room == rmStore and !global.cameraSystem) {
	draw_sprite(sprPlayerUI, 0, guiWidth * 0.02, guiHeight * 0.02);
	draw_sprite_ext(sprPlayerUI, 2, guiWidth * 0.02, guiHeight * 0.02, objPlayer.energy / objPlayer.maxEnergy, 1, 0, c_white, 1);
	draw_sprite(sprPlayerUI, 1, guiWidth * 0.02, guiHeight * 0.055);
	draw_sprite_ext(sprPlayerUI, 3, guiWidth * 0.02, guiHeight * 0.055, objPlayer.sanity / objPlayer.maxSanity, 1, 0, c_white, 1);
}

if (doTransition) {
	objPlayer.state = pStates.Paused;
	objPlayer.facing = -1;
	if (location != newLocation) {
		blackAlpha += 0.05;
		if (blackAlpha >= 1) {
			GoToLocation(newLocation, transportX, transportY, playerFacingAfter);	
		}
	}
	else {
		blackAlpha -= 0.05;
		if (blackAlpha <= 0) {
			doTransition = false;
			objPlayer.state = pStates.Free;
			location = newLocation;
			if (instance_exists(ParEnemy)) { ParEnemy.spd = ParEnemy.walkspd; }
		}
	}
	
	//Draw the fade
	draw_set_alpha(blackAlpha);
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black, c_black, false);

	draw_set_alpha(1);
}