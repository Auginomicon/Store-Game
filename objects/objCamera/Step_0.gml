/// @description Update camera

if (!global.cameraSystem) {
	following = objPlayer;
	viewWidthHalf = camera_get_view_width(cam) * 0.5;
	viewHeightHalf = camera_get_view_height(cam) * 0.5;
	
	if(keyboard_check(ord("U"))) { if(instance_exists(objLittleGirl)) { following = objLittleGirl }} //TODO: Remove this later
}
else {
	with(objPlayer) {
		state = pStates.Paused;
	}
	following = objCCTV;
}

//Follw the target
x = clamp(x, following.x - hBorder, following.x + hBorder);
y = clamp(y, following.y - vBorder, following.y + vBorder);

//Camera Shake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - (( 1 / shakeLength) * shakeMagnitude));

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);