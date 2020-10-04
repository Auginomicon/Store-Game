/// @description 
event_inherited();

walkspd = 2;
spd = walkspd
hitbox.sprite_index = sprLittleGirlBoundBox;
state = enemyState.Free;

//Path variables
path = path_add();
secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);

// Helper variables
itemFound = false;
desiredItem = noone;
noMoreTrash = false;
alarm[2] = 1;