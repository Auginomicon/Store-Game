/// @description 
if (showControls or showCredits) {
	instance_deactivate_object(objButton);

	if (keyboard_check_pressed(vk_anykey)) {
		showControls = false;
		showCredits = false;
		instance_activate_object(objButton);
	}
}