/// @description
event_inherited();

// Movement
walkspd = 1;
runSpd = 6;
spd = walkspd;

//Path variables
path = path_add();
secondClosestTransition = instance_nth_nearest(x, y, objTransition, 2);
currentLocation = 2;
roamX = x;
roamY = y;
alarm[2] = 1;
pathBool = false;

// State
state = enemyState.Free;
idleNum = 0;

// Courage
courage = 0;
maxCourage = 100;