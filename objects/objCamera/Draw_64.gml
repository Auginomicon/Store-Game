/// @description Draw hiding in janitor closet when isSafe

if (!objPlayer.isSafe) exit;

var animLength = 20;
var animSpeed = 5;

//Draw bg
draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c_black, c_black, c_black, c_black, false);

if (instance_exists(objGownGal)) {
	if (objGownGal.currentLocation == objGame.location) {
		with(objJanitorDoor) {
			if (xFrame + (animSpeed / 60) < animLength - 1) {
				xFrame += (animSpeed / 60);
			}
			else {
				xFrame = 0;
			}
			
			draw_sprite(sprJanitorScene1, floor(xFrame), global.guiWidth * 0.05, 0);
			
			if (distance_to_point(objGownGal.x, objGownGal.y) < 300) {
				// Really close to the player
			}
			else if (distance_to_point(objGownGal.x, objGownGal.y) < 550) {
				// Somewhat close to
			}
			else if (distance_to_point(objGownGal.x, objGownGal.y) < 800) {
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