/// @description Initialize Variables upon creation
event_inherited();

//Player Stats
sanity = 100;
maxSanity = 100;
energy = 100;
maxEnergy = 100;

walkSpeed = 3;
name = "Player";

enum pStates {
	Free,
	Idle,
	Paused
}

//Inventory
inventory[0] = "Empty";
inventory[1] = "Empty";
inventory[2] = "Empty";
inventory[3] = "Empty";

money = 5;

//Other Variables
canMove = true;
state = pStates.Free;
lastState = state;
idleNum = 1;

//Variables for speach
portraitIndex = 1;
voice = sndVoice;
name = "Player";
radius = 64;
activeTextbox = noone;