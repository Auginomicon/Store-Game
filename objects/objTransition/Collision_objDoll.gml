/// @description
with(other) {
	if (!setItem) {
		event_perform(ev_alarm, 1)
	}
	x = other.transportX;
	y = other.transportY;
	path_clear_points(path);
	currentLocation = other.newLocation;
	secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);
	path_delete(path);
	path = path_add();
}
