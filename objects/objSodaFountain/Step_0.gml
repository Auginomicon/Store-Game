/// @description
// Rest puddle variable if it is destroyed
if (!instance_exists(puddle)) {
	puddle = -1;
}

// Checks if it is on
if (!isOn) exit;

// Set sprite
sprite_index = sprSodaFountainOn;

if (alarm[0] == -1) {
	alarm[0] = 8 * room_speed;
}

// Checks if the player is in the room
if (objGame.location != 1) exit;
if (collision_circle(x, y, 68, objPlayer, false, true)) {
	if (objPlayer.input_interact) {
		isOn = false;
		sprite_index = sprSodaFountain;
		alarm[0] = -1;
	}
}