/// @description
//Provides the animation to 
lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;
x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);
objPlayer.canMove = false;
//Removes the text box when space is hit
if (objPlayer.input_interact) {
	var _messageLength = string_length(message);
	if (textProgress >= _messageLength) {
		instance_destroy();
		if (instance_exists(objTextStack)) {
			with(objTextStack) {
				ticket--;
			}
		}
		else {
			with (objPlayer) {
				state = lastState;
			}
		}
	}
	else {
		if (textProgress > 2) {
			textProgress = _messageLength;
		}
	}
}