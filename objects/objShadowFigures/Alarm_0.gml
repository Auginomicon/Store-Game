/// @description Get new roam location
path_delete(path);
switch(currentLocation) {
	case 1: // Inside the store
		roamX = irandom_range(1002, 2272);
		roamY = irandom_range(965, 1815);
	break;
	
	case 2: // Out front
		roamX = irandom_range(3302, 5548);
		roamY = irandom_range(1013, 2418);
	break;
	
	case 3: // Out back
		roamX = irandom_range(3250, 4936);
		roamY = irandom_range(3785, 4476);
	break;
}
path = path_add();