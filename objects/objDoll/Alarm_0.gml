/// @description Take an item
holding = desiredItem.name;
with(desiredItem) {
	instance_destroy();
}
desiredItem = -1;