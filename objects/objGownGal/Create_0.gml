/// @description
event_inherited();

//Variables
walkspd = 1;
spd = walkspd
runSpd = 8;

//Path variables
path = path_add();
secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);

//State
state = enemyState.Free;

//Other Variables
range = 250;
currentLocation = 3;
sawPlayerHide = false;
hitbox.sprite_index = sprBoundingBox;