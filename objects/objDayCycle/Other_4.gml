/// @description Check if we are inside or not
switch(room) {
	//List all outside rooms here
	case rmStore:
	case rmBack: drawDayLight = true; break;
	
	default: drawDayLight = false;
}

//Reset the depth of this persistent object
depth = 1;