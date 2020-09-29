/// @description
if (isSafe) exit;
//Check if the flashlight is equipped
if (equipped[0] == "Flashlight") {
	sprite = [sprMalePlayerWalkRightFlashlight, sprMalePlayerWalkLeftFlashlight, sprMalePlayerWalkUpFlashlight, sprMalePlayerWalkDownFlashlight, sprMalePlayerIdleFlashlight, sprMalePlayerMopping];
}
else {
	sprite = [sprMalePlayerWalkRight, sprMalePlayerWalkLeft, sprMalePlayerWalkUp, sprMalePlayerWalkDown, sprMalePlayerIdle, sprMalePlayerMopping];
}

//Draw the correct sprite for the action they are doing
switch(facing) {
	case dir.right:
		sprite_index = sprite[0];
		idleNum = 1;
		if (equipped[0] == "Flashlight") { 
			draw_sprite_ext(sprFlashlight, 0, x + 17, y - 41, 1, 1, 0, c_white, 1);
		}
		draw_self();
	break;
	
	case dir.left:
		sprite_index = sprite[1];
		idleNum = 0;
		if (equipped[0] == "Flashlight") { 
			draw_sprite_ext(sprFlashlight, 0, x - 17, y - 41, -1, 1, 0, c_white, 1);
		}
		draw_self();
	break;
	
	case dir.up:
		sprite_index = sprite[2];
		idleNum = 2;
		
		draw_self();
	break;
	
	case dir.down:
		sprite_index = sprite[3];
		idleNum = 3;
		draw_self();
		if (equipped[0] == "Flashlight") { 
			draw_sprite_ext(sprFlashlight, 1, x - 8, y - 41, 1, 1, 0, c_white, 1);
		}
	break;
	
	case -1:
		sprite_index = sprite[4];
		if (equipped[0] == "Flashlight") { 
			switch(idleNum) {
				case 0: //Left
					draw_sprite_ext(sprFlashlight, 0, x - 28, y - 43, -1, 1, 0, c_white, 1);
					image_index = idleNum;
					draw_self();
				break;
			
				case 1: //Right
					image_index = idleNum;
					draw_self();
					draw_sprite_ext(sprFlashlight, 2, x + 9, y - 43, 1, 1, 0, c_white, 1);
				break;
			
				case 2: //Up
					image_index = idleNum;
					draw_self();
				break;
			
				case 3: //Down
					draw_sprite_ext(sprFlashlight, 1, x - 11, y - 38, 1, 1, 0, c_white, 1);
					image_index = idleNum;
					draw_self();
				break;
			}
		}
		else if (isMopping) {
			sprite_index = sprite[5];
			sanity -= 0.01;
			energy -= 0.01;
			draw_self();
		}
		else {
			image_index = idleNum;
			draw_self();
		}
	break;
}