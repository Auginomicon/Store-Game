/// @description Check if we are inside or not
switch(room) {
	case rmMainMenu: drawDayLight = false; break;
	case rmStore:
	default: drawDayLight = true;
}

//Reset the depth of this persistent object
depth = 1;