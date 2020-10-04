/// @description
event_inherited();

currentLocation = 2;
walkspd = 1;
spd = walkspd
hitbox = instance_create_layer(x, y, "Instances", objHitbox);
hitbox.sprite_index = sprite_index;

enum enemyState {
	Free,
	Chase,
	Run,
	Feared,
	Leave
}