/// @description 
if (collision_circle(x, y, 125, objPlayer, false, true)) {
	
	instance_destroy();
	
	var tempSanity = objPlayer.sanity + sanityRestore;
	if (objPlayer.maxSanity <= tempSanity) {
		objPlayer.sanity = 100;
	}
	else {
		objPlayer.sanity += sanityRestore;
	}
}