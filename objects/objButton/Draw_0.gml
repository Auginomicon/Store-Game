/// @description Draw text on the button
draw_self()
if (text != -1) {
	draw_set_font(fntFont);

	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	var c1 = c_black;
	var c2 = c_blue;
	draw_text_color(x + (sprite_width / 2), y + (sprite_height / 2), text, c1, c1, c2, c2, 1);

	// Reset alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}