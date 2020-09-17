/// @description 
event_inherited();

walkspd = 2;
spd = walkspd

state = enemyState.Free;

//Path variables
path = path_add();
secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);

// Helper variables
itemFound = false;
desiredItem = noone;
noMoreTrash = false;