/// @description

if (global.gamePaused) { exit; }

// Checks if the NPC is moving
if (canMove) {
	path_speed = spd;
	
	if(direction >= 306 or direction <= 45) {
		sprite_index = sprLostEmployeeNormieWalkRight; //right
		idleNum = 1;
	}
	if (direction >= 46 and direction <= 135) {
		sprite_index = sprLostEmployeeNormieWalkUp; //up
		idleNum = 2;
	}
	if (direction >= 136 and direction <=225) {
		sprite_index = sprLostEmployeeNormieWalkLeft; //left
		idleNum = 0;
	}
	if (direction >= 226 and direction <= 305) {
		sprite_index = sprLostEmployeeNormieWalkDown; //down
		idleNum = 3;
	}
	
	if (path_position == 1) {
		sprite_index = sprLostEmployeeNormieIdle;
		idleNum = 0;
		image_index = idleNum;
	}
}
else {
	// Stops the movement action
	sprite_index = sprLostEmployeeNormieIdle;
	image_index = idleNum;
	path_speed = 0;
}