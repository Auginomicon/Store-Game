/// @description Spawn in enemies
var rng = 1//irandom(9) +1;

switch(rng) {
	case 1:
		// Spawn the gown gal
		if(instance_exists(objGownGal)) { 
			var spawn = GetSpawnLocations();
			var inst = instance_create_layer(spawn[0], spawn[1], "Instances", objGownGal);
			inst.currentLocation = spawn[2];
		}
	break;
	
	case 2:
		
	break;
	
	case 3:
		
	break;
	
	case 4:
		
	break;
	
	case 5:
		
	break;
	
	case 6:
		
	break;
	
	case 7:
		
	break;
	
	case 8:
		
	break;
	
	case 9:
		
	break;
	
	case 10:
		
	break;
}

alarm[0] = 15 * room_speed;
