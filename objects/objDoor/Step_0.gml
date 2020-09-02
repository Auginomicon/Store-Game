/// @description
//Checks if the player is close by
if (point_in_rectangle(objPlayer.x, objPlayer.y, x1, y1, x2, y2)) {
	image_speed = 1;
} 
else {
	if (image_index != 1) {
		image_speed = -1;
	}
}