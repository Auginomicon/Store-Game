/// @description Draw the textbox
NineSliceBoxStretched(sprTextBox, x1, y1, x2, y2, background);
//NineSliceBoxStretched(sprTextBox, namex1, namey1, namex2, namey2, background);

//Set all of these before drawing text to reduce issues.
draw_set_font(fntFont);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(message, 1, textProgress);
draw_text((x1+x2) * 0.5, y1 + 15, _print);
//draw_set_color(c_white);
//draw_text((x1+x2) * 0.5 + 2, y1 + 7, _print);