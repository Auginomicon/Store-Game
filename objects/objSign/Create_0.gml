/// @description
event_inherited();
isNPC = true;
collideable = false;

//Communication Variables
portraitIndex = -1;
voice = sndVoice;
name = "Corkboard";

message[0] = "Here's the corkboard.";
message[1] = ["Bonus Jobs!","Contacts","Schedule", "Check-in (Start Night Shift)","Leave"];
message[2] = "'Hey! The bonus job tonight is putting away trash bags in the back!' -Abby";
message[3] = "Here's the " +objManager.name +"'s phone number.";
message[4] = "Day Shift: Linda (7:15 AM - 1:30 PM) \nNoon Shift: Abby (1:45 - 6:30) \nNight Shift: " +objGame.playerName +" (6:45 PM - 7:00 AM)";
message[5] = "Here goes nothing.";
message[6] = "I should talk to the manager first";

speakers = [objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer, objPlayer];
nextLine = [0, [2, 3, 4, 5, -1], 1, 1, 1, 1, -1];
portraitNums = [0, 0, 0, 3, 0, 0, 0];
scripts = [-1, [-1, -1, -1, -1, -1], -1, [AddContact, "Abby"], [EventTrigger, objPlayer, 1], [EventTrigger, objPlayer, 2], -1];

if (objDayCycle.day == 1) {
	nextLine[1][3] = 6;
}