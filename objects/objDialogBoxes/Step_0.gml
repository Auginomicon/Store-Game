/// @description
mouseX = device_mouse_x_to_gui(0);
mouseY = device_mouse_y_to_gui(0);

if ((keyboard_check_pressed(ord("E")) or selected) and !global.gamePaused) {
	
	if (!choiceDialog and counter < strLen) {
		counter = strLen;
	}
	
	else if (page < array_length_1d(message) - 1) {
		//TODO: Check the speaker's id from the array and change the portrait sprite reference so that other sprites can be used / animated.
		event_perform(ev_other, ev_user1);
		var line = nextLine[page];
		if (choiceDialog) {
			line = line[choice];
		}
		if (line == 0) page++
		else if (line == -1) { instance_destroy(); exit; }
		else page = line;
		
		selected = false;
		
		event_perform(ev_other, ev_user0);
	}
	else {
		instance_destroy();
	}
}

if (choiceDialog) {
	choice += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	//Cycle through the choices
	if (choice > msgArrayLength - 1) choice = 0;
	if (choice < 0) choice = msgArrayLength - 1;
	if (keyboard_check_pressed(ord("S")) or  keyboard_check_pressed(ord("W"))) audio_play_sound(sndSelector, 1, false);
}