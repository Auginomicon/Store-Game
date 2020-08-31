/// @description
// Exits if the boolean is false
if (!global.cameraSystem) exit;

//Office
if(keyboard_check_pressed(ord(0))) {
	currentCam = 0;
}

//Hallway
if(keyboard_check_pressed(ord(1))) {
	currentCam = 1;
}

//Storage
if(keyboard_check_pressed(ord(2))) {
	currentCam = 2;
}

//Store 1
if(keyboard_check_pressed(ord(3))) {
	currentCam = 3;
}

//Store 2
if(keyboard_check_pressed(ord(4))) {
	currentCam = 4;
}

//Bathrooms
if(keyboard_check_pressed(ord(5))) {
	currentCam = 5;
}

//Garbage Container
if(keyboard_check_pressed(ord(6))) {
	currentCam = 6;
}

//Front of Store 1
if(keyboard_check_pressed(ord(7))) {
	currentCam = 7;
}

//Front of Store 2
if(keyboard_check_pressed(ord(8))) {
	currentCam = 8;
}

//Roadside
if(keyboard_check_pressed(ord(9))) {
	currentCam = 9;
}

switch(currentCam) {
	case 0: //Office
		x = 1093;
		y = 1129;
	break;
	
	case 1: //Hallway
		x = 1302;
		y = 1394;
	break;
	
	case 2: // Storage Room
		x = 1213;
		y = 1678;
	break;
	
	case 3: // Store 1
		x = 1851;
		y = 1171;
	break;
	
	case 4: // Store 2
		x = 2068;
		y = 1612;
	break;
	
	case 5: // Bathrooms
		x = 4254;
		y = 3880;
	break;
	
	case 6: // Garbage Containers
		x = 3607;
		y = 3853;
	break;
	
	case 7: // Front of store 1
		x = 4291;
		y = 948;
	break;
	
	case 8: // Front of store 2
		x = 4856;
		y = 887;
	break;
	
	case 9: // Roadside
		x = 4250;
		y = 2182;
	break;
}