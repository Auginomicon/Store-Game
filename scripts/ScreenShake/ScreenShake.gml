///@desc ScreenShake(magnitude, frames);
///@arg Magnitude will set the strength of the screenshake.
///@arg Frames will set how long the shake will occur.
function ScreenShake(argument0, argument1) {

	with (objCamera) {
		if (argument0 > shakeRemain) {
			shakeMagnitude = argument0;
			shakeRemain = shakeMagnitude;
			shakeLength = argument1;
		}
	}


}
