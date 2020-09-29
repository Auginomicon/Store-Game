/// @description 
if (!showControls) exit;

instance_deactivate_object(objButton);

if (keyboard_check_pressed(vk_anykey)) {
	showControls = false;
	instance_activate_object(objButton);
}