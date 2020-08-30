/// @description
//Check if the flashlight is equipped
if (equipped[0] == "Flashlight") {
	sprite = [sprMalePlayerWalkRightFlashlight, sprMalePlayerWalkLeftFlashlight, sprMalePlayerWalkUpFlashlight, sprMalePlayerWalkDownFlashlight, sprMalePlayerIdleFlashlight];
}
else {
	sprite = [sprMalePlayerWalkRight, sprMalePlayerWalkLeft, sprMalePlayerWalkUp, sprMalePlayerWalkDown, sprMalePlayerIdle];
}

//Draw the correct sprite for the action they are doing
switch(facing) {
	case dir.right:
		sprite_index = sprite[0];
		idleNum = 1;
		if (equipped[0] == "Flashlight") { 
			draw_sprite_ext(sprFlashlight, 0, x + 17, y - 41, 1, 1, 0, c_white, 1);
			
			//Flashlight check
			//UseFlashlight(x+17, y-41);
		}
		draw_self();
	break;
	
	case dir.left:
		sprite_index = sprite[1];
		idleNum = 0;
		if (equipped[0] == "Flashlight") { 
			draw_sprite_ext(sprFlashlight, 0, x - 17, y - 41, -1, 1, 0, c_white, 1);
			
			//Flashlight check
			//UseFlashlight(x - 17, y-41);
		}
		draw_self();
	break;
	
	case dir.up:
		sprite_index = sprite[2];
		idleNum = 2;
		
		//Flashlight check
		//UseFlashlight(x - 8, y-41);
		
		draw_self();
	break;
	
	case dir.down:
		sprite_index = sprite[3];
		idleNum = 3;
		draw_self();
		if (equipped[0] == "Flashlight") { 
			draw_sprite_ext(sprFlashlight, 1, x - 8, y - 41, 1, 1, 0, c_white, 1);
			
			//Flashlight check
			//UseFlashlight(x - 8, y - 41);
		}
	break;
	
	case -1:
		sprite_index = sprite[4];
		image_index = idleNum;
		if (equipped[0] == "Flashlight") { 
			switch(idleNum) {
				case 0: //Left
					draw_sprite_ext(sprFlashlight, 0, x - 28, y - 43, -1, 1, 0, c_white, 1);
					//UseFlashlight(x - 28, y - 43);
					draw_self();
				break;
			
				case 1: //Right
					draw_self();
					draw_sprite_ext(sprFlashlight, 2, x + 9, y - 43, 1, 1, 0, c_white, 1);
					//UseFlashlight(x + 9, y - 41);
				break;
			
				case 2: //Up
					//UseFlashlight(x - 8, y - 41);
					draw_self();
				break;
			
				case 3: //Down
					draw_sprite_ext(sprFlashlight, 1, x - 11, y - 38, 1, 1, 0, c_white, 1);
					//UseFlashlight(x - 11, y-38);
					draw_self();
				break;
			}
		}
		else {
			draw_self();
		}
	break;
}