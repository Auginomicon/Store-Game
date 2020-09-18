/// @description 

if(flashlight == noone) {
	if(global.isOn) {
		flashlight = instance_create_layer(mouse_x, mouse_y, "Instances", objLight);
		flashlight.worldLight = false;
	}
}
else {
	if(!global.isOn) { 
		instance_destroy(flashlight);
		flashlight = noone;
	}
}

if (keyboard_check_pressed(ord("T"))) { timePaused = ! timePaused; }
//Increment time when game is not paused
if (global.gamePaused or timePaused) { exit; }


seconds += timeIncrement;
minutes = seconds/ 60;
hours = minutes / 60;

if (drawDayLight) {
	//the phases of the day and night. With color and darks
	var darks, colors, pstart, pend; 
	//Sunset
	if (hours <= phase.nightTime) {
		darks = [0.2, maxDarkness];
		colors = [c_orange, c_navy, merge_color(c_black, c_navy, 0.3)];
		pstart = phase.sunset;
		pend = phase.nightTime;
	} //Night
	else {
		darks = [maxDarkness];
		colors = [merge_color(c_black, c_navy, 0.4)];
		pstart = phase.nightTime;
	}
	
	//Alter the darkness and colors depending on the time of day
	//Colors
	if (pstart == phase.nightTime) {lightColor = colors[0]; }
	else
	{
		var cc = ((hours - pstart) / (pend - pstart)) * (array_length_1d(colors) -1);
		var c1 = colors[floor(cc)];
		var c2 = colors[ceil(cc)];
	
		lightColor = merge_color(c1, c2, cc - floor(cc));
	}
	
	//Darkness
	if (pstart == phase.nightTime) {darkness = darks[0]; }
	else
	{
		var dd = ((hours - pstart) / (pend - pstart)) * (array_length_1d(darks) -1);
		var d1 = darks[floor(dd)];
		var d2 = darks[ceil(dd)];
	
		darkness = MergeNumber(d1, d2, dd - floor(dd));
	}
}
