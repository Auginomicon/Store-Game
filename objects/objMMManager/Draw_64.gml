/// @description
if (showControls) {
	instance_deactivate_object(objButton);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_font(fntMainMenu);
	draw_set_color(c_white);
	draw_text(display_get_gui_width() * 0.5, display_get_gui_height() * 0.2, "Controls");
	
	draw_set_font(fntMainMenu);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width() * 0.5, display_get_gui_height() * 0.3, "Movement - WASD \nInteract - E (Talk/Pickup Items)\nInventory - Tab \nUse Equipped Item - LMB \n\nInventory Stuff \nUse Item - LMB \nEquip Item - RMB \nDrop Item - R \n\nTo Navigate Dialog Options and Pause Menu, use W (Up), D (Down), and E (select)\n\nPress any button to continue");
}
else if (showCredits) {
	instance_deactivate_object(objButton);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_font(fntMainMenu);
	draw_set_color(c_white);
	draw_text(display_get_gui_width() * 0.5, display_get_gui_height() * 0.2, "Credits");
	
	draw_set_font(fntMainMenu);
	draw_set_halign(fa_center);
	draw_text(display_get_gui_width() * 0.5, display_get_gui_height() * 0.3, "Programming - Auginomicon \nSound Management - Auginomicon \n Art - Auginomicon \n\nMade on GameMaker Studio 2 \nOriginal sound files from FreeSFX, SoundBible, FreeSound, and ZapSpalt \nScript used from GMLscripts.com (instance_nth_nearest) \nMain Menu Music by Cupp (On YouTube) \n\nPress any button to continue");
}
else {
	draw_set_alpha(.3);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}