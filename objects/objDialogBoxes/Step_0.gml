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
	
	//TODO: Fix the small rectangle problem in the mouse selection 
	//var i = 0;
	//var yAdd = 0;
	//repeat(msgArrayLength) {
	//	if (point_in_rectangle(mouseX, mouseY, textX - (boxWidth * .3), textY + yAdd + i, textX + (boxWidth), textY + string_height_ext(msgArray[i], textHeight, textMaxWidth) + yAdd + i)) {
	//		choice = i;
	//		if (mouse_check_button_pressed(mb_left)) {
	//			selected = true;
	//		}
	//	}
		
	//	yAdd = string_height_ext(msgArray[i], textHeight, textMaxWidth);
	//	i++
	//}
}