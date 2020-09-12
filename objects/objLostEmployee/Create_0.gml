/// @description 
// Inherit the parent event
event_inherited();

//Start Path
path_start(pLESpawn, spd, path_action_stop, true);

//Other Variables
idleNum = 1;
spokeWithPlayer = false;
currentLocation = 2;

//Variables for speach
portraitIndex = 0;
voice = sndVoice3;
name = "Larry";

message[0] = "Hiya, stranger!";
message[1] = "I'm your co-worker for the night! You can call me Larry!";

message[2] = ["Nice to meet you! My name is " +objGame.playerName +".", "The manager didn't say anything about this."];

message[3] = "Oh, I know who you are. You're the freshmeat; that's what we call all the new recruits here.";
message[4] = "I was originally not scheduled at this time, but Abby-dearest called me last minute so I can properly show you the ropes!";
message[5] = "I used to do night shifts like you, but after a single night I stopped.";

message[6] = ["Were you too chicken to work the night shift?", "Why did you stop?"];

message[7] = "Ha ha ha! During the night, strange things happen that you cannot explain.";
message[8] = "Horrible things happen during the night here in these woods.";
message[9] = "Think of all the paranormal movies you watched and times it by five!";

message[10] = ["I'm calling you out! That stuff doesn't exist", "What can I do to stop it?", "It's not nice to pick on the new guy..."];

message[11] = "Oh, how it must feel to be so blissfully ignorant to what's really out there.";
message[12] = "I think the last night shift employee, left a rulebook somewhere around here. Before he ya know...went missing.";
message[13] = "I'm not picking on you! I'm trying to help you out!";
message[14] = "Go find that rulebook I'll man the cash register."
message[15] = "";

speakers = [id, id, objPlayer, id, id, id, objPlayer, id, id, id, objPlayer, id, id, id, id, id];
nextLine = [1, 2, [3, 4], 5, 5, 6, [7, 8], 9, 9, 10, [11, 12, 13], 12, 14, 12, -1, -1];
scripts = [[ChangeVariable, id, "spokeWithPlayer", 1], -1, [-1, -1], -1, -1, -1, [-1, -1], -1, -1, -1, [-1, -1, -1], -1, -1, -1, [ClearDialog, 7, objLostEmployee], -1];
portraitNums = [11, 14, 0, 15, 17, 12, 0, 18, 12, 18, 0, 18, 13, 17, 11, 0];