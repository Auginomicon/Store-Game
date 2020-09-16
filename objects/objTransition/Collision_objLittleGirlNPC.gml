/// @description
with(other) {
	if (!inside) {
		event_perform(ev_alarm, 1);
		if (alarm[2] == -1) {
			alarm[2] = 30 * room_speed;
		}
	}
	x = other.transportX;
	y = other.transportY;
	inside = true;
	path_clear_points(path);
	currentLocation = other.newLocation;
	secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);
}
