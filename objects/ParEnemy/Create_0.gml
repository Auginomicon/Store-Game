/// @description
event_inherited();

currentLocation = 2;
walkspd = 1;
spd = walkspd
isPhantom = false;

enum enemyState {
	Free,
	Chase,
	Run,
	Feared,
	Leave
}