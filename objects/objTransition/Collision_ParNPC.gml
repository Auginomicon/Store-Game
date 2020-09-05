/// @description move the location of the NPC to the new area
with (other) {
	x = other.transportX;
	y = other.transportY;
	path_clear_points(path);
	currentLocation = other.newLocation;
}
