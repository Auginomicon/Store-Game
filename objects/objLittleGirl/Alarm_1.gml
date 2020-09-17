/// @description destroy the garbage bag

// Destroy the bag and replace it with some trash.
with(desiredItem) {
	instance_destroy();
	var inst = instance_create_layer(x, y, "Instances", objMessy);
	inst.image_index = choose(0, 1);
}

// Reset variables
itemFound = false;
desiredItem = noone;