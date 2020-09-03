/// @description Debug
if(keyboard_check_pressed(ord("G"))) { room_restart(); }

if (keyboard_check_pressed(vk_escape)) {
	global.gamePaused = !global.gamePaused;
	if (global.gamePaused) {
		with(objPlayer) {
			state = pStates.Paused;
		}
	}
}

if(keyboard_check_pressed(ord("F"))) { 
	with(objFusebox) {
		image_index = 1;
		event_perform(ev_other, ev_user0);
	}	
}

if(keyboard_check_pressed(ord("V"))) { 
	with(objFusebox) {
		image_index = 0;
		event_perform(ev_other, ev_user1);
	}	
}