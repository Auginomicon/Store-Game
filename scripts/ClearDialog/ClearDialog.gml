///@description ClearDialogBox
///@arg resize
///@arg object
///@arg user_event
function ClearDialog() {
	with(argument[1]) {
		var size = argument[0];
		//for (var i = 0; i < array_length(message); i++) {
		//	array_set(message, i, -1);
		//}
		array_resize(message, size);
		array_resize(speakers, size);
		array_resize(scripts, size);
	
		var i = 0;
		repeat(size) {
			array_set(message, i, -1);
			array_set(speakers, i, -1);
			array_set(scripts, i, -1);
			i++;
		}
		if (argument_count > 2) {
			EventTrigger(argument[1], argument[2]);
		}
		else {
			event_perform(ev_other, ev_user0);
		}
	}
}