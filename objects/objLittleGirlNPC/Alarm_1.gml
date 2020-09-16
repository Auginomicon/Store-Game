/// @description Get desired location to wander to
var rng = irandom(5);

switch(rng) {
	case 0:
		wanderX = 1953;
		wanderY = 1264;
	break;
	
	case 1:
		wanderX = 2050;
		wanderY = 1588;
	break;
	
	case 2:
		wanderX = 1835;
		wanderY = 1063;
	break;
	
	case 3:
		wanderX = 1757;
		wanderY = 1588;
	break;
	
	case 4:
		wanderX = 2149;
		wanderY = 1744;
	break;
	
	case 5:
		wanderX = 1746;
		wanderY = 1243;
	break;
}
alarm[1] = -1;