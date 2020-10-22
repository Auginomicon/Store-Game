/// @description Chance for the lights to go out
var rng = random(1);

// 35 percent chance the lights will go out
if (rng <= .35) {
	with(objLight) {
		repeater = irandom_range(4, 10);
		alarm[0] = 1;
	}
}

if (objDayCycle.hours >= 8 and objDayCycle.hours <= 9) { 
	alarm[5] = 35 * room_speed;
}