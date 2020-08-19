/// @description Update camera

//Follw the character
x = clamp(x, following.x - hBorder, following.x + hBorder);
y = clamp(y, following.y - vBorder, following.y + vBorder);

//Camera Shake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - (( 1 / shakeLength) * shakeMagnitude));

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);