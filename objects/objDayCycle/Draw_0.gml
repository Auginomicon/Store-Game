/// @description
var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (surface_exists(surface)) {
	//Setting the target surface
	surface_set_target(surface);
	
	//Drawing the time of day
	draw_set_color(lightColor);
	draw_set_alpha(darkness);
	draw_rectangle(0, 0, cw, ch, false);
	
	gpu_set_blendmode(bm_subtract);
	
	with(objLight) {
		//draw_circle_color(x - cx, y -cy, radius + random(1), c_white, c_black, 0);
		draw_sprite(sprLight, subimg, x - cx + shake, y - cy + shake);
	}
	
	//Reset blendmode
	gpu_set_blendmode(bm_normal);
	
	//Reset values
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface(surface, cx, cy);
}
else {
	//Setting the target surface
	surface = surface_create(cw, ch);
	
	//Setting the target surface
	surface_set_target(surface);
	
	//Drawing the time of dat
	draw_set_color(lightColor);
	draw_set_alpha(darkness);
	draw_rectangle(0, 0, cw, ch, false);
	
	//Rest values
	surface_reset_target();
}