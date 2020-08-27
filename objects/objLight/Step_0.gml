/// @description Add shake if it is a hall light
switch(sprite) {
	case sprHallwayLight:
	case sprOutsideBathrromLight:
		shake = irandom(1);
	break;
}