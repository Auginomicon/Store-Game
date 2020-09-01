/// @description 
// Inherit the parent event
event_inherited();

//NPC Stats
walkSpeed = 2;
spd = walkSpeed;


// Start Path
// TODO: Make him start the path once the night starts
path_start(pLESpawn, spd, path_action_stop, true);

//Other Variables
canMove = true;
isNPC = true;
idleNum = 1;

//Variables for speach
portraitIndex = 0;
voice = sndVoice;
name = "Larry";
message[0] = "Hello, stranger!";
speakers = [id];
nextLine = [0];
scripts = -1;