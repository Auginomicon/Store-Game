/// @description
if (room == rmStore and !global.cameraSystem) {
	draw_sprite(sprPlayerUI, 0, global.guiWidth * 0.02, global.guiHeight * 0.02);
	draw_sprite_ext(sprPlayerUI, 2, global.guiWidth * 0.02, global.guiHeight * 0.02, objPlayer.energy / objPlayer.maxEnergy, 1, 0, c_white, 1);
	draw_sprite(sprPlayerUI, 1, global.guiWidth * 0.02, global.guiHeight * 0.055);
	draw_sprite_ext(sprPlayerUI, 3, global.guiWidth * 0.02, global.guiHeight * 0.055, objPlayer.sanity / objPlayer.maxSanity, 1, 0, c_white, 1);
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
	draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c_black, c_black, c_black, c_black, false);

	draw_set_alpha(1);
}


if (objFusebox.image_index != 2) exit;
if (!objInventory.showInventory) {
	if (collision_circle(objFusebox.x, objFusebox.y, 52, objPlayer, false, true)) {
		draw_set_color(c_white);
		draw_set_font(fntFont);
		draw_text(global.guiWidth * 0.215, global.guiHeight * 0.435, "Repair Progress");
		draw_sprite_ext(sprRepairBar, 0, global.guiWidth * 0.23, global.guiHeight * 0.48, 1, 1, 0, c_white, 1);
		draw_sprite_ext(sprRepairBar, 1, global.guiWidth * 0.23, global.guiHeight * 0.48, objFusebox.progress / objFusebox.maxProgress, 1, 0, c_white, 1);
	}
}