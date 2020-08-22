/// @description 

if (collision_rectangle(x - (sprite_width / 3), y - 35, x + (sprite_width / 3), y - sprite_height, objPlayer, true, true)) {
	image_alpha = 0.4;
} 
else {
	image_alpha = 1;
}