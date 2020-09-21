/// @description Spawn in enemies
var rng = irandom(9) +1;

switch(rng) {
	case 1:
		// Spawn the gown gal
		show_debug_message("Gown Gal");
		if(!instance_exists(objGownGal)) { 
			var spawn = GetSpawnLocations();
			var inst = instance_create_layer(spawn[0], spawn[1], "Instances", objGownGal);
			inst.currentLocation = spawn[2];
		}
	break;
	
	case 2:
		// Spawn the tall guy
		show_debug_message("Tall Guy");
		if(!instance_exists(objTallGuy)) { 
			var spawnX = choose(5799, 3061, 4458);
			var spawnY = 2372;
			var inst = instance_create_layer(spawnX, spawnY, "Instances", objTallGuy);
			inst.currentLocation = 2;
		}
	break;
	
	case 3:
		// Spawn the the little girl
		show_debug_message("Little Girl and the Doll");
		if(!instance_exists(objLittleGirlNPC)) { 
			var inst = instance_create_layer(x, y, "Instances", objLittleGirlNPC);
			inst.currentLocation = 2;
		}
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

alarm[0] = 30 * room_speed;
