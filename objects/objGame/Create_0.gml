/// @description Set up variables for the game.
randomize();

//Global Variables
global.gamePaused = false;
global.textSpeed = 0.75;
global.ResolutionW = 750;
global.ResolutionH = 420;
global.silent = false;

surface_resize(application_surface, global.ResolutionW, global.ResolutionH);
room_goto_next();
window_mouse_set(window_get_width() / 2, window_get_height() / 2);

debug = false;

//Variables for room transition fade
global.guiWidth = display_get_gui_width();
global.guiHeight = display_get_gui_height();
blackAlpha = 0;
doTransition = false;

// Variables for placing the player
location = 2;
newLocation = -1;
transportX = 0;
transportY = 0;
playerFacingAfter = -1;

/*
	Locations
	1 - Inside the Store
	2 - Outside in the front of the store
	3 - Outside in the back of the store
	4 - Male Bathroom
	5 - Female Bathroom
*/

//Other variables
global.isOn = false;
global.cameraSystem = false;
playerName = "Player";
global.nightStarted = false;
global.bonusTask = irandom(3) + 1;

/*
	Bonus Tasks
	1 - Throw out garbage
	2 - Restock Shelves
	3 - Mopping
	4 - Clean up trash on the ground
*/

//Enum for direction
enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

//enum for machine states
//Machine enum
enum MachineState {
	On,
	Off,
	Broken
}