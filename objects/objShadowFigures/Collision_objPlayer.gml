/// @description
if (!objPlayer.isSafe) {
	with(other) {
		sanity -= 1;
		var tempEnergy = energy - 35;
		if (tempEnergy <= 0) {
			energy = 0;
		}
		else {
			energy -= 35;
		}
	}
	instance_destroy();
}