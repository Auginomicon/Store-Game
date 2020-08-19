/// @description Inherit the parent's variables/event
event_inherited();

//Override
//Variables for speach
portraitIndex = 0;
voice = sndVoice;
name = "NPC";
message[0] = "Hello, new recruit! What's your name? My name is Abby, I'm the manager at this fine establishment.";
message[1] = ["Hey my name is " +objPlayer.name +".", "What's it to ya?"];
message[2] = "Well, it's nice to met ya!"
message[3] = "Uh...";

//Set up who is speaking with each text box here.
speakers = [id, objPlayer, id, id];
nextLine = [0, [2, 3], -1, -1];
scripts = [
	[ChangeVariable, id, "name", "Abby"],
	[-1, -1],
	-1,
	-1
];