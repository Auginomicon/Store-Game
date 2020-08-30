/// @description
event_inherited();
isNPC = true;
collideable = false;

//Communication Variables
portraitIndex = -1;
voice = sndVoice;
name = "Corkboard";

message[0] = "This must be the To-Do List.";
message[1] = "Hey, this is Abby! These will be the things you will have to do during your shift!";
message[2] = "You gotta... Clean up the trash in the store, restock the shelves and stay happy! :)";
message[3] = "Oh and I'll give you some extra money if you clean up the trash in the back.. I think a dog ripped open a bag or something."
speakers = [objPlayer, objPlayer, objPlayer, objPlayer];
nextLine = [0, 2, 3, -1];
scripts = -1;