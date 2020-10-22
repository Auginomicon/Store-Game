/// @description 
event_inherited();

walkspd = 2;
spd = walkspd;
hitbox.sprite_index = sprLittleGirlBoundBox;

voice = sndVoice4;
name = "Little Girl"

message[0] = "Teeheehee! I like to look at all the sheleves for candy!";
message[1] = "I love looking at all the funny pictures on the boxes!";
message[2] = ["Have this candy bar.", "Go away, twerp.", "What do you want?"];
message[3] = "heehee...";
message[4] = "Thank you kind soul. I'll be leaving now.";
message[5] = "You don't want to see me mad...";
message[6] = "To see all the shelves!";
message[7] = "Better luck next time.";
message[8] = "";

speakers = [id, id, objPlayer, id, id, id, id, id, id, objPlayer];
nextLine = [1, 2, [3, 5, 6], 5, -1, -1, -1, -1];
scripts = [-1, -1, [[ItemCheck, "Candy Bar", nextLine[2][0], 4],  -1, [EventTrigger, objLittleGirlNPC, 0]], -1, [EventTrigger, objLittleGirlNPC, 1], [EventTrigger, objLittleGirlNPC, 2], -1, [EventTrigger, objLittleGirlNPC, 2]];
portraitNums = [19, 19, 19, 20, 20, 21, 21, 20, 19];

path_start(pLittleGirlSpawn, spd, path_action_stop, true);
idleNum = 0;
currentLocation = 2;
wanderX = 1953;
wanderY = 1264;
path = path_add();
inside = false;
waiting = false;
leaving = false;