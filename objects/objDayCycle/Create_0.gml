/// @description
seconds = 0;
minutes = 0;
hours = 0;

day = 1;

//Seconds per step
timeIncrement = 50;
timePaused = true;

//Color Variables
maxDarkness = 0.7;
darkness = 0;
lightColor = c_black;
drawDayLight = false;

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

enum phase {
	sunset = 0,
	nightTime = 4.5,
}

//Other variables
surface = -1;
flashlight = noone;