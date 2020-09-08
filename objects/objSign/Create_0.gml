/// @description
event_inherited();
isNPC = true;
collideable = false;

//Communication Variables
portraitIndex = -1;
voice = sndVoice;
name = "Corkboard";

message[0] = "Here's the corkboard.";
message[1] = ["Bonus Jobs!","Contacts","Add something later", "Leave"]; //TODO: Add something here
message[2] = "Hey! The bonus job tonight is putting away trash bags in the back! -Abby";
message[3] = "Here's the " +objManager.name +"'s phone number.";
message[4] = "Something here"; //TODO: Add something here
message[5] = "hhh";

speakers = [objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer];
nextLine = [0, [2, 3, 4,- 1], 1, 1, 1, -1];
portraitNums = [0, 0, 0, 3, 0, 0];
scripts = -1;