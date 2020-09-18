/// @description
seconds = 0;
minutes = 0;
hours = 0;

day = 1;

//Seconds per step
timeIncrement = 50;
timePaused = false;

//Color Variables
maxDarkness = 0.85;
darkness = 0;
lightColor = c_black;
drawDayLight = false;

enum phase {
	sunset = 0,
	nightTime = 3.5,
}

//Other variables
surface = -1;
flashlight = noone;

alarm[0] = 1 * room_speed;