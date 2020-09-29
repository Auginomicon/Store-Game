/// @description move the location of the NPC to the new area
with (other) {
	x = other.transportX;
	y = other.transportY;
	path_clear_points(path);
	path_delete(path);
	currentLocation = other.newLocation;
	secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);
	path = path_add();
}
