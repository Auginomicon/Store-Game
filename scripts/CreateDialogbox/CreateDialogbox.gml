///@description CreateTextbox
///@arg text
///@arg speaker
///@arg nextLine
///@arg scripts
function CreateDialogbox() {

	var textbox = instance_create_layer(0, 0, "Text", objDialogBoxes);

	//Sets up all the dialog and speakers into arrays so that the player can go through all the queued up text.
	with (textbox) {
		message = argument[0];
		speakers = argument[1];
		nextLine = argument[2];
		scripts = argument[3];
	
		var len = array_length_1d(message);
		var i = 0;
		repeat(len) {
			names[i] = speakers[i].name;
			portraits[i] = speakers[i].portraitIndex;
			voices[i] = speakers[i].voice;
			i++;
		}
		event_perform(ev_other, ev_user0);
	}

	return textbox;


}
