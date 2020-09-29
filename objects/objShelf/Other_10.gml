/// @description Lose it's contents if it had any
if (image_index != 0) {
	if (objGame.location == 1) {
		audio_play_sound(sndDropping, 5, false);
	}
	var inst = instance_create_layer(x, y, "Instances", objMessy);
	if (image_index == 1) {
		inst.image_index = 0;
	}
	else {
		inst.image_index = 1;
	}
	image_index = 0;
}