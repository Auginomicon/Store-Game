///@description ClearDialogBox
//@arg resize
//@arg object
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
		event_perform(ev_other, ev_user0);
	}
}