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
spawnRoom = -1;
spawnX = 0;
spawnY = 0;
spawnPlayerFacing = -1; //TODO: Check if I can remove this variable once all animations are in. Remove in Room Start event too.

enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}