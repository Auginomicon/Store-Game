function ChangeWindowMode(){
	switch(argument[0]) {
		case 0: window_set_fullscreen(true); break;
		case 1: window_set_fullscreen(false); break;
	}
}