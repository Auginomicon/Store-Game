///@Description NewTextbox
function NewTextbox() {

	var obj;

	if (instance_exists(objTextBoxes)) {
		obj = objTextStack;
	}
	else {
		obj = objTextBoxes;
	}

	with(instance_create_layer(0, 0, "Text", obj)) {
		message = argument[0];
		if (instance_exists(other)) {
			originInstance = other.id;
		}
		else {
			originInstance = noone;
		}
		if (argument_count > 1) {
			background = argument[1];
		}
		else {
			background = 0;
		}
	}

	with(objPlayer) {
		if (state != pStates.Paused) {
			lastState = state;
			state = pStates.Paused;
		}
	}


}
