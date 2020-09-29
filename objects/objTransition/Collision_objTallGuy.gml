/// @description move the location of the NPC to the new area
if (newLocation == 1) exit;
with (other) {
	x = other.transportX;
	y = other.transportY;
	path_clear_points(path);
	currentLocation = other.newLocation;
	secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);
	path_delete(path);
	path = path_add();
}
