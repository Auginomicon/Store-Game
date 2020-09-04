/// @description move the location of the NPC to the new area
with (other) {
	x = other.transportX;
	y = other.transportY;
	currentLocation = other.newLocation;
	secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);
	path_clear_points(path);
}
