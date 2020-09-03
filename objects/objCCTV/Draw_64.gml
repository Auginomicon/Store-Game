/// @description Draws an overlay on the screen to simulate a camera
// Quit the event if the camera system is off
if (!global.cameraSystem) exit;

// Draw gray background
draw_set_alpha(0.5);
draw_rectangle_color(0, 0, global.guiWidth * .5, global.guiHeight * .5, c_gray, c_gray, c_gray, c_gray, false);
draw_set_alpha(1);
//
NineSliceBoxStretched(sprCCTVOverlay, 0, 0, global.guiWidth * .5, global.guiHeight * .5, 0);
draw_sprite(sprREC, rec, global.guiWidth * 0.42, global.guiHeight * 0.035);
if (alarm[0] == -1) {
	alarm[0] = (room_speed * 1);
}