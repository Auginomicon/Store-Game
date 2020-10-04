/// @description 
if (showControls or showCredits) {
	instance_deactivate_object(objButton);

	if (keyboard_check_pressed(vk_anykey)) {
		showControls = false;
		showCredits = false;
		instance_activate_object(objButton);
		character = choose(sprManager, sprLittleGirl, sprLostEmployeeNormieIdle, sprGownGalIdle2, sprShadowFigure1, sprShadowFigure2, sprShadowFigure3, sprShadowFigure4);
	}
}

if (keyboard_check_pressed(ord("R"))) game_restart()