/// @description
//Check if the door is closing or opening
if (image_speed = 1) {
	//Once is open, it will stay open and the player can walk in
	image_speed = 0;
	image_index = 5;
	collideable = false;
}
else {
	//Once closed it will stay closed until the player walks by again.
	image_speed = 0;
	image_index = 0;
	collideable = true;;
}