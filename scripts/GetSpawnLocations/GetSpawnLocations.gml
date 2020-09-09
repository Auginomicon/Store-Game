//@description GetSpawnLocations
// Get the x and y location of a random possible spawn for an enemy
function GetSpawnLocations(){
	// create an array that holds 3 variables.
	// 1) x
	// 2) y
	// 3) current location
	var arr = array_create(3, noone);
	
	var rnd = irandom(6) +1;
	
	switch(rnd) {
		case 1: // By the road
			arr[0] = 4140;
			arr[1] = 2183;
			arr[2] = 2;
			show_debug_message("Spawn by the road");
		break;
		
		case 2: // By the dumpster in front
			arr[0] = 4799;
			arr[1] = 942;
			arr[2] = 2;
			show_debug_message("Spawn by the dumpster out front");
		break;
		
		case 3: // Left of the front of the store;
			arr[0] = 3951;
			arr[1] = 985;
			arr[2] = 2;
			show_debug_message("Spawn out front by the left of the store");
		break;
		
		case 4: // By the bathroom out back
			arr[0] = 4408;
			arr[1] = 3882;
			arr[2] = 3;
			show_debug_message("Spawn by the bathrooms");
		break;
		
		case 5: // Inside the store, lower section
			arr[0] = 2239;
			arr[1] = 1624;
			arr[2] = 1;
			show_debug_message("Spawn inside the store, lower section");
		break;
		
		case 6: // By the dumpster in the back
			arr[0] = 3483;
			arr[1] = 3891;
			arr[2] = 3;
			show_debug_message("Spawn by the dumpster out back");
		break;
		
		case 7: // By the soda fountain in the store
			arr[0] = 1957;
			arr[1] = 1101;
			arr[2] = 1;
			show_debug_message("Spawn by the soda fountain");
		break;
	}
	
	return arr; 
}