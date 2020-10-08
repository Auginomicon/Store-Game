/// @description Start the night
with(objDayCycle) {
	timePaused = false;
}

global.nightStarted = true;

// Spawn in the lost employee only during the first night
if (objDayCycle.day == 1) {
	instance_create_layer(6070, 2318, "Instances", objLostEmployee);
}

// Change the lock in to be a tip
with(objSign) {
	scripts[5] = -1;
	message[1][3] = "Tip of The Night";
	
	var rng = irandom(4);
	var tip = "";
	
	switch (rng) {
		case 0:
			tip = "Be sure to lock the switch box out back! Pesky animals like to open it up."
		break;
		
		case 1:
			tip = "Keep the back door locked! One time, a dirty hobo got in and scared the night shift employee!";
		break;
		
		case 2:
			tip = "Never carry too much at one time! What happens when you have to pick something up pronto?";
		break;
		
		case 3:
			tip = "User the numbers on the keyboard to quickly go through the cameras. Memorize the order if you need to!"
		break;
		
		case 4:
			tip = "With the app, your phone will beep when the camreas detect movement. Slience your cellphone if it becomes a problem."
		break;
	}
	message[5] = tip;
}

// Begin random events for the game
with(objGame) {
	alarm[0] = 45 * room_speed;
	alarm[3] = 50 * room_speed;
}