/// @description
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

if (surface_exists(surface)) {
	//Setting the target surface
	surface_set_target(surface);
	
	//Drawing the time of day
	draw_set_color(lightColor);
	draw_set_alpha(darkness);
	draw_rectangle(0, 0, global.guiWidth, global.guiHeight, false);
	
	if (hours >= 1.5) {
		gpu_set_blendmode(bm_subtract);
		
		with(objLight) {
			if (worldLight) {
				if (working) {
					draw_sprite(sprLight, subimg, x - cx + shake, y - cy + shake);
				}
			}
			else {
				draw_circle_color(mouse_x - cx, mouse_y - cy, 42, c_white, c_white, false);
			}
		}
	
		//Reset blendmode
		gpu_set_blendmode(bm_normal);
	}
	
	//Reset values
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface(surface, cx, cy);
}
else {
	//Setting the target surface
	surface = surface_create(global.guiWidth, global.guiHeight);
	
	//Setting the target surface
	surface_set_target(surface);
	
	//Drawing the time of dat
	draw_set_color(lightColor);
	draw_set_alpha(darkness);
	draw_rectangle(0, 0, global.guiWidth, global.guiHeight, false);
	
	//Rest values
	surface_reset_target();
}