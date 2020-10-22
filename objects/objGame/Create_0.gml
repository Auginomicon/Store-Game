/// @description Set up variables for the game.
randomize();

//Global Variables
global.gamePaused = false;
global.textSpeed = 0.75;
global.ResolutionW = 750;
global.ResolutionH = 420;

room_goto_next();
LoadFile();

//Variables for room transition fade
global.guiWidth = 1500
global.guiHeight = 840
surface_resize(application_surface, 1500, 840);
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
global.playerName = "Sammuel";
global.nightStarted = false;
global.bonussMoney = .35;
global.silent = false;
global.bathroomRitual = false;
global.roadRitual = false;

// Sound
if (file_exists("Game.sav")) {
	ini_open("Game.sav");
	global.masterVolume = ini_read_real("Options", "MasterVolume", 1);
	global.musicVolume = ini_read_real("Options", "MusicVolume", 1);
	global.effectVolume =ini_read_real("Options", "EffectsVolume", 1);
	ini_close();
}
else {
	global.masterVolume = 1;
	global.effectVolume = 1;
	global.musicVolume = 1;
}

playerDead = false;
needToClockOut = false;
showWinScreen = false;
jumpscare = false;
creature = 0;
flash = 0;
deathMsg = "";

global.bonusTask = irandom(3) + 1;
/*
	Bonus Tasks
	1 - Throw out garbage
	2 - Restock Shelves
	3 - Mopping
	4 - Clean up trash on the ground
*/

// Event triggers
eventTrigger1 = false;
eventTrigger2 = false;
eventTrigger3 = false;
eventTrigger4 = false;
eventTrigger5 = false;

eventHelper = false;

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

// For Menu
global.viewWidth =	camera_get_view_width(view_camera[0]);
global.viewHeight = camera_get_view_height(view_camera[0]);
display_set_gui_size(global.viewWidth, global.viewHeight);

// Load audio groups
audio_group_load(audiogroup_effects);
audio_group_load(audiogroup_music);