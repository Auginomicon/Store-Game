/// @description
if (isOn) {
	sprite_index = sprSinkOn;
}
else {
	sprite_index = sprSink;
}

if (distance_to_object(objPlayer) < 32) {
	if (objPlayer.input_interact) {
		isOn = !isOn;
	}
}