/// @description Set up variables for the game.
randomize();

//Global Variables
global.gamePaused = false;
global.textSpeed = 0.75;
global.ResolutionW = 750;
global.ResolutionH = 420;

surface_resize(application_surface, global.ResolutionW, global.ResolutionH);
room_goto_next();
window_mouse_set(window_get_width() / 2, window_get_height() / 2);

debug = false;

//Variables for room transition fade
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();
blackAlpha = 0;
doTransition = false;

//Variables for placing the player
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
	4 - Bathrooms
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