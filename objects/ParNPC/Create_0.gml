/// @description Initialize Variables upon creation
event_inherited();

//NPC Stats
walkSpeed = 2;
spd = walkSpeed;

//Variables for movement
moveX = 0;
moveY = 0;

//Other Variables
canMove = true;
isNPC = true;

//Variables for speach
portraitIndex = 0;
voice = sndVoice;
name = "NPC";
message[0] = "Hello, stranger!";
speakers = [id];
nextLine = [0];
scripts = -1;
/* ~~~~~~~IMPORTANT~~~~~~~
	The format for dialog choices is as follws.
	The choices will be in an array inside the message array.
	Depending on the choices inside that, the nextLine array will point the dialog to the correct 
		response that follows the dialog choice.
	After the dialog choice is commited, write -1 to all the following responses so we do not
		access them by accident.
	Make sure the speakers id is also set up depending on who is talking!
	
	As for the scripts. The script will be excuted at the end of the desired dialog. For a dialog choice message,
		set them up into an array with each descion 
*/