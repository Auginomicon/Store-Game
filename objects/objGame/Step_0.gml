/// @description Debug
if(keyboard_check_pressed(ord("G"))) { room_restart(); }

if (keyboard_check_pressed(vk_escape)) {
	global.gamePaused = !global.gamePaused;
	if (global.gamePaused) {
		with(objPlayer) {
			canMove = false;
			state = pStates.Paused;
		}
	}
	else {
		with(objPlayer) {
			canMove = true;
			state = pStates.Free;
		}
	}
}

if(keyboard_check_pressed(ord("F"))) { 
	with(objFusebox) {
		image_index = 2;
		event_perform(ev_other, ev_user0);
	}	
}

if(keyboard_check_pressed(ord("V"))) { 
	with(objFusebox) {
		image_index = 0;
		event_perform(ev_other, ev_user1);
	}	
}

if(keyboard_check_pressed(ord("L"))) { 
	with(objManager) {
		event_perform(ev_other, ev_user0);
	}	
}

if(keyboard_check_pressed(ord("H"))) { 
	with(objPlayer) {
		sanity -= 10;
	}	
}

if(keyboard_check_pressed(ord("I"))) { 
	event_perform(ev_alarm, 0)
}