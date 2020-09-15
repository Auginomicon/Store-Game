/// @description 
event_inherited();

// Pathing
state = enemyState.Free;
path = path_add();

// Movement
walkspd = 3;
runspd = 4;
spd = walkspd;

// For taking item variables
holding = "Empty";
desiredItem = noone;
setItem = false;
hideX = 0;
hideY = 0;

// other
idleNum = 0;
secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);
snatchedItems = 0;