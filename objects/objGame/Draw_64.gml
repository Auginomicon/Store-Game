/// @description
if (jumpscare) {
	var c = c_black;
	draw_set_alpha(.8);
	draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c, c, c, c, false);
	draw_set_alpha(1);
	switch (creature) {
		case 0: var monster = sprGownGalJumpScare; break;
		case 1: var monster = sprTallGuyJumpScare; break;
	}
	repeat(3) {
		if (flash <= 1) {
			draw_sprite_ext(monster, 0, global.guiWidth * 0.25, global.guiHeight * 0.5, 6, 6, 0, c_white, flash)
			flash += 0.08;
		}
		else {
			flash = 0;
		}
	}
	if (alarm[1] == -1) {
		alarm[1] = .5 * room_speed;
	}
}

if (showWinScreen) {
	draw_set_font(fntTime);
	draw_set_alpha(1);
	draw_set_halign(fa_left);
	var c = c_black;
	draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c, c, c, c, false);
	draw_set_color(c_white);
	draw_text(global.guiWidth * 0.12, global.guiHeight * 0.05, "You passed the night!");
	draw_text(global.guiWidth * 0.075, global.guiHeight * 0.175, "Press any button to continue");
	
	draw_set_font(fntFont);
	draw_set_halign(fa_center);
	draw_text(global.guiWidth * 0.25, global.guiHeight * 0.3, "Thank you for playing the demo. \nPlease tell me what to improve, add, and tweak!");
	exit;
}

if (playerDead) {
	var c = c_red;
	draw_set_alpha(.45);
	draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c, c, c, c, false);
	draw_set_font(fntTime);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_left)
	draw_text(global.guiWidth * 0.2, global.guiHeight * 0.05, "Game Over");
	draw_text(global.guiWidth * 0.075, global.guiHeight * 0.175, "Press any button to continue");
	exit;
}

if (global.gamePaused) exit;
if (room == rmStore and !global.cameraSystem) {
	draw_sprite(sprPlayerUI, 0, global.guiWidth * 0.02, global.guiHeight * 0.02);
	draw_sprite_ext(sprPlayerUI, 2, global.guiWidth * 0.02, global.guiHeight * 0.02, objPlayer.energy / objPlayer.maxEnergy, 1, 0, c_white, 1);
	draw_sprite(sprPlayerUI, 1, global.guiWidth * 0.02, global.guiHeight * 0.055);
	draw_sprite_ext(sprPlayerUI, 3, global.guiWidth * 0.02, global.guiHeight * 0.055, objPlayer.sanity / objPlayer.maxSanity, 1, 0, c_white, 1);
	
	if (needToClockOut) {
		draw_set_font(fntTime);
		draw_set_color(c_white);
		draw_set_halign(fa_left)
		draw_text(global.guiWidth * 0.04, global.guiHeight * 0.4, "Shift Over! Clock out at corkboard.");
		draw_set_alpha(1);
		if (alarm[2] == -1) {
			
		}
	}
}

if (doTransition) {
	objPlayer.state = pStates.Paused;
	objPlayer.facing = -1;
	if (instance_exists(ParEnemy)) { 
		ParEnemy.spd = 0;
		ParEnemy.path_speed = 0;
	}
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
			if (instance_exists(ParEnemy)) { 
				ParEnemy.spd = ParEnemy.walkspd;
				ParEnemy.path_speed = ParEnemy.spd;
			}
		}
	}
	
	//Draw the fade
	draw_set_alpha(blackAlpha);
	draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c_black, c_black, c_black, c_black, false);

	draw_set_alpha(1);
}