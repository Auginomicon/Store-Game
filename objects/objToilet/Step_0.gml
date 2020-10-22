/// @description 
if (distance_to_object(objPlayer) < 32) {
	if (objPlayer.input_interact) {
		if (!audio_is_playing(sndFlush)) audio_play_sound(sndFlush, 4, false);
		// Checks if the time is between 2 and 3.
		if (femaleBr) flushCount++;
	}
}

if (objSodaFountain.isOn and objSink.isOn and flushCount == 3) {
	if (objDayCycle.hours >= 8 and objDayCycle.hours <= 9) {
		if(instance_exists(objGownGal)) {
			if (!global.bathroomRitual) {
				instance_destroy(objGownGal);
				objPlayer.sanity = 100;
				audio_play_sound(sndShriek03, 3, false);
				global.bathroomRitual = true;
			}
		}
	}
	else {
		if (!didJumpscare) {
			audio_play_sound(sndJumpScare01, 10, false);
			with(objGame) {
				jumpscare = true;
				creature = 0;
			}
			flushCount = 0;
			didJumpscare = true;
			
			if (instance_exists(objGownGal)) {
				with(objGownGal) {
					state = enemyState.Run;
				}
				var snd = choose(sndShriek01, sndShriek02, sndShriek03)
				if (!audio_is_playing(snd)) audio_play_sound(snd, 5, false);
			}
		}
	}
}