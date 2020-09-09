/// @description Inherit the parent's variables/event
event_inherited();

//Override
//Variables for speach
portraitIndex = 0;
voice = sndVoice;
name = "Manager";
message[0] = "Ah! You must be the new recruit! It's a pleasure to meet you...";
message[1] = "Err... sorry, I forgot your name, heh. What was it again?"

message[2] = ["It's fine, my name is " + objGame.playerName +"!", "Does it even matter?", "Didn't you just read my job application? How did you forget already?"];

message[3] = "Oh! Yeah, how could I forget that!~ "
message[4] = "Of course it matters, silly! You're a new employee of HappyMart!~ We care for all of our employees, like it's a biiig family!";
message[5] = "Listen here bucko. I'm a very busy woman and I can't be bothered to learn every worm's name that comes into this establishment.";
message[6] = "...";
message[7] = "Oh. Uh err..";
message[8] = "Well, I'm the manager of this HappyMart! So I'd be happy to show ya the ropes!~";
message[9] = "Your nights will mainly be staying by the cash register, lookin' cute. He he.";
message[10] = "Sadly, we don't get too much business nowadays, thanks to the new parkway that was built.";

message[11] = ["Why did they do that?", "Whew, that's good to hear.", "That's too bad."];

message[12] = "Hmm, I'm not sure entirely.. I think it's because they think the woods around here are spooky! Hehe. How silly~";
message[13] = "Heh, yeah. I guess that is good to hear for you...";
message[14] = "Yeah it really is, this place used to be flowing with people!";
message[15] = "Sorry. I got sidetracked. Other tasks you're legible to do are things like...";
message[16] = "Pick up trash and throw it out, clean up any spills, and clean up and restock the shelves.";
message[17] = "Do enough tasks to fill your progress bar all the way to 100%. I'll download the HappyMart app on your phone now. Also, the PC beside me is the CCTV cameras! Use 'em to check for pests.";
message[18] = "Things can get kinda boring so take this soda to keep your wits about ya! Free of charge!~";
message[19] = "On the corkboard, there will be an important task! If you get that done by the end of your shift, I'll reward you with some under the table cash! Also, that is where you will check in for your shift!"
message[20] = "I think that's everything. If you have any questions, please ask 'em now!";

message[21] = ["What happens if I don't complete all the tasks?", "Why is this job paying so much if it's so easy?", "What's your name? And how do I contact you?", "That's it!"];

message[22] = "That's a simple one!~";
message[23] = "...you're fired.";
message[24] = "We really need someone in this position! And to entice more people to apply, we upped the pay!~";
message[25] = "Oh silly me!~ My name is Abby! And you can find my contact on the corkboard!";
message[26] = "Alrighty then!~ I'm gonna head out now. Toodles!~";
message[27] = "Anything else?";
message[28] = "";

//Set up who is speaking with each text box here.
speakers = [id, id, objPlayer, id, id, id, objPlayer, id, id, id, id, objPlayer, id, id, id, id, id, id, id, id, id, objPlayer, id, id, id, id, id, id, id];
nextLine = [1, 2, [3, 4, 5], 8, 8, 6, 7, 8, 9, 10, 11, [12, 13, 14], 15, 15, 15, 16, 17, 18, 19, 20, 21, [22, 24, 25, 26], 23, 27, 27, 27, -1, 21, 21];
scripts = [-1, -1, [-1, -1, -1], -1, -1, -1, -1, -1, -1, -1, -1, [-1, -1, -1], -1, -1, -1, -1, -1, -1, [VendItem, "Sanity Soda", 0], -1,-1, [-1, -1, -1, [EventTrigger, objManager, 1]], -1, -1, [ChangeVariable, id, "name", "Abby"], -1 ,[ClearDialog, 1, objManager], -1];
portraitNums = [4, 6, 0, 8, 9, 7, 1, 6, 4, 9, 10, 0, 6, 8, 10, 6, 4, 4/*Think face*/, 4, 4, 6, 4, 9, 5, 4, 6, 9, 4, 0];
//Other Variables
startPathing = false;