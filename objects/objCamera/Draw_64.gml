/// @description
// Draws the progress bar on the screen when it needs to be repaired
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

#region Old Janitor Closet Code
/*
if (!objPlayer.isSafe) exit;

var animLength = 20;
var animSpeed = 5;
//Draw bg
draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c_black, c_black, c_black, c_black, false);

if (instance_exists(objGownGal)) {
	if (objGownGal.currentLocation == objGame.location) {
		with(objJanitorDoor) {
			if (xFrame + (animSpeed / 60) < animLength - 1 and !animDone) {
				xFrame += (animSpeed / 60);
				if (xFrame + (animSpeed / 60) == animLength - 1) animDone = true;
			}
			else {
				xFrame = 0;
			}
			
			draw_sprite(sprJanitorScene1, floor(xFrame), global.guiWidth * 0.05, 0);
			
			if (distance_to_object(objGownGal) < 300) {
				// Really close to the player
			}
			else if (distance_to_object(objGownGal) < 550) {
				// Somewhat close to
			}
			else if (distance_to_object(objGownGal) < 800) {
				// Not that close at all
			}
		}
	}
	else {
		// Sprite of looking out into the hallway
		draw_sprite(sprJanitorScene1, 0, global.guiWidth * 0.05, 0);
	}
}
else {
	// Sprite of looking out into the hallway
	draw_sprite(sprJanitorScene1, 0, global.guiWidth * 0.05, 0);
}

draw_set_alpha(0.71);
draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
*/ 
#endregion