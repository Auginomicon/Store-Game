/// @description
//Checks if the player is close by
if (point_in_rectangle(objPlayer.x, objPlayer.y, x - (sprite_width / 2), y, x + (sprite_width / 2), y + 48)) {
	image_speed = 1;
}
else {
	if (image_index != 1) {
		image_speed = -1;
	}
}