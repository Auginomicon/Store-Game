/// @description Trap the player in the bathroom and spawn shadow figures
eventHelper = true;
// Spawn collisions so that the player cannont leave
instance_create_layer(1216, 2784, "Instances", objCollision);
instance_create_layer(1600, 2784, "Instances", objCollision);

alarm[4] = 6 * room_speed;