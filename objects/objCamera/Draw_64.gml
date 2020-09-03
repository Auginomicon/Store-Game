/// @description Draw hiding in janitor closet when isSafe

if (!objPlayer.isSafe) exit;

draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c_black, c_black, c_black, c_black, false);

// Sprite of looking out into the hallway