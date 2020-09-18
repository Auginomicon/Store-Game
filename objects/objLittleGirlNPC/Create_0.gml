/// @description 
event_inherited();

walkspd = 2;
spd = walkspd;

voice = sndVoice4;
name = "Little Girl"

message[0] = "Hmm, hmmm, la la la!";
message[1] = "I give me a Candy Bar, please!";
message[2] = ["Sure thing", "No, you'll have to pay for it.", "Let me go get it."];
message[3] = "Yaaay...";
message[4] = "Thank you kind soul. I'll be leaving now.";
message[5] = "You don't have one. It's not nice to lie...";
message[6] = "Don't make me wait too long...";
message[7] = "Let's play a game then... \nFind my little doll!";
message[8] = "";

speakers = [id, id, objPlayer, id, id, id, id, id, id, objPlayer];
nextLine = [1, 2, [3, 7, 6], 5, -1, -1, -1, -1];
scripts = [-1, -1, [[ItemCheck, "Candy Bar", nextLine[2][0], 4],  -1, [EventTrigger, objLittleGirlNPC, 0]], -1, [EventTrigger, objLittleGirlNPC, 1], [EventTrigger, objLittleGirlNPC, 2], -1, [EventTrigger, objLittleGirlNPC, 2]];
portraitNums = [0, 0, 0, 0, 0, 0, 0 ,0 ,0];

path_start(pLittleGirlSpawn, spd, path_action_stop, true);
idleNum = 0;
currentLocation = 2;
wanderX = 1953;
wanderY = 1264;
path = path_add();
inside = false;
waiting = false;
leaving = false;