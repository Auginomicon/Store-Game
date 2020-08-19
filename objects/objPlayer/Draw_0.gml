/// @description

switch(facing) {
	case dir.right:
		sprite_index = sprMalePlayerWalkRight;
		idleNum = 1;
	break;
	
	case dir.left:
		sprite_index = sprMalePlayerWalkLeft;
		idleNum = 0;
	break;
	
	case dir.up:
		sprite_index = sprMalePlayerWalkUp;
		idleNum = 2;
	break;
	
	case dir.down:
		sprite_index = sprMalePlayerWalkDown;
		idleNum = 3;
	break;
	
	case -1:
		sprite_index = sprMalePlayerIdle;
		image_index = idleNum;
	break;
}

draw_self();