/// @description
event_inherited();

walkspd = 1;
spd = walkspd
runSpd = 8;
path = path_add();

enum enemyState {
	Free,
	Chase,
	Run
}

state = enemyState.Free;

//Other Variables
range = 250;
currentLocation = 1;