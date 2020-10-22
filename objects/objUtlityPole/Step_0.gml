/// @description 
if (objDayCycle.hours <= 9) exit;

var inst = collision_circle(x, y, 48, objItem, false, true);
if (inst != noone) {
	// Checks for the correct pole
	if (pole == 2) {
		// Checks item sprite
		if (inst.sprite_index == sprDoll and global.silent = true and !objSodaFountain.isOn and objSink.isOn) {
			// Checks for all the previous 
			for (var i = 0; i < 4; i++) {
				if (objPlayer.inventory[i] != "Empty") {
					event_perform(ev_other, ev_user0);
					instance_destroy(inst);
					break;
				}
			}
			if (!global.roadRitual) {
				instance_destroy(inst);
					
				// spawn in 4 snacks
				var s1 = instance_create_layer(4411, 2268, "Instances", objItem);
				s1.sprite_index = sprEnergyBar;
				s1.name = "Energy Bar";
				s1.currentLocation = 2;
				s1.sound = sndFoodPickup;
					
				var s2 = instance_create_layer(4514, 2313, "Instances", objItem);
				s2.sprite_index = sprEnergyBar;
				s2.name = "Energy Bar";
				s2.currentLocation = 2;
				s2.sound = sndFoodPickup;
					
				var s3 = instance_create_layer(4560, 2237, "Instances", objItem);
				s3.sprite_index = sprSanitySoda;
				s3.name = "Sanity Soda";
				s3.currentLocation = 2;
				s3.sound = sndSodaPickup;
					
				var s4 = instance_create_layer(4426, 2187, "Instances", objItem);
				s4.sprite_index = sprCandyBar;
				s4.name = "Candy Bar";
				s4.currentLocation = 2;
				s4.sound = sndFoodPickup;
					
				// Complete ritual
				global.roadRitual = true;
			}
		}
		else {
			// Spawn in all three monsters
			event_perform(ev_other, ev_user0);
			instance_destroy(inst);
		}
	}
	else {
		// Spawn in all three monsters
		event_perform(ev_other, ev_user0);
		instance_destroy(inst);
	}
}

