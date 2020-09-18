/// @description 
draw_set_color(c_white);
draw_set_font(fntInventory);
draw_text(global.guiWidth * 0.4, global.guiHeight * 0.02, hours);
draw_text(global.guiWidth * 0.4, global.guiHeight * 0.02 + 25, (minutes));
draw_text(global.guiWidth * 0.4, global.guiHeight * 0.02 + 50, (seconds));