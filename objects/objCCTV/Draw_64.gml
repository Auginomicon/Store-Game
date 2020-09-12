/// @description Draws an overlay on the screen to simulate a camera
// Quit the event if the camera system is off
if (!global.cameraSystem) exit;

// Draw gray background
draw_set_alpha(0.5);
draw_rectangle_color(0, 0, global.guiWidth * .5, global.guiHeight * .5, c_gray, c_gray, c_gray, c_gray, false);
draw_set_alpha(1);

// Draw the corner pieces
NineSliceBoxStretched(sprCCTVOverlay, 0, 0, global.guiWidth * .5, global.guiHeight * .5, 0);
draw_sprite(sprREC, rec, global.guiWidth * 0.42, global.guiHeight * 0.035);
if (alarm[0] == -1) {
	alarm[0] = (room_speed * 1);
}

// Draw the buttons
draw_sprite(sprCCTVButton, 0, global.guiWidth * 0.38, global.guiHeight * 0.4);
draw_sprite_ext(sprCCTVButton, 0, global.guiWidth * 0.37, global.guiHeight * 0.4, -1, 1, 0, c_white, 1);