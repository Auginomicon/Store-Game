/// @description create a puddle
if (puddle == -1) {
	puddle = instance_create_layer(x, 1056, "Instances", objMessy);
	puddle.image_index = choose(2, 3);
}