/// @description Initialize variables
following = objPlayer;

hBorder = 1;
vBorder = 1;

cam = view_camera[0];
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;

//Screenshake Variables
shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;