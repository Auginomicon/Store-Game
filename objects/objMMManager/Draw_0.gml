/// @description 
depth = 1;

// Draw random person
draw_sprite_ext(character, 0, 526, 400, 4, 4, 0, c_white, 1);

// Draw gb
draw_sprite(sprMainMenuBG, 0, x, y);

// Draw title
draw_set_font(fntTitleName);
draw_set_color(c_black);
draw_text(x + 20, y + 16, "Night Shift: HappyMart");