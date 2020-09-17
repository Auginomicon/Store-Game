/// @description Initialize Variables upon creation
event_inherited();

//Player Stats
sanity = 100;
maxSanity = 100;
energy = 100;
maxEnergy = 100;

walkSpeed = 3;
name = objGame.playerName;

jobProgression = 0;
maxJobProgression = 100;

enum pStates {
	Free,
	Idle,
	Paused
}

//Inventory
inventory[0] = "Key";
inventory[1] = "Empty";
inventory[2] = "Empty";
inventory[3] = "Empty";

money = 50;

// Cell 1 - Item name
// Cell 2 - Slot it came from
equipped[0] = -1;
equipped[1] = -1;

//Other Variables
canMove = true;
state = pStates.Free;
lastState = state;
idleNum = 1;
isSafe = false;
isMopping = false;

//Variables for speach
portraitIndex = 1;
voice = sndVoice2;
name = "Player";
radius = 32;
activeTextbox = noone;