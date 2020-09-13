/// @description Turn off the power
if (objFusebox.image_index = 1) {
	objFusebox.image_index = 0;
	instance_destroy();
}
else {
	with(objFusebox) {
		image_index = 2;
		event_perform(ev_other, ev_user0);
	}	
}

// Reset variables
pathBool = false;
courage = 0;
spd = walkspd;