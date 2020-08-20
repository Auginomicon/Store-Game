/// @description
if (doTransition) {
	if (location != newLocation) {
		blackAlpha += 0.05;
		if (blackAlpha >= 1) {
			GoToLocation(newLocation, transportX, transportY, playerFacingAfter);	
		}
	}
	else {
		blackAlpha -= 0.05;
		if (blackAlpha <= 0) {
			doTransition = false;
		}
	}
	
	//Draw the fade
	draw_set_alpha(blackAlpha);
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black, c_black, false);

	draw_set_alpha(1);
}