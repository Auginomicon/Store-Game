/// @description move the location of the NPC to the new area
with (other) {
	x = other.transportX;
	y = other.transportY;
	currentLocation = other.newLocation;
	path_clear_points(path);
}
