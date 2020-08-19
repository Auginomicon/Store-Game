///@description string_wrap
///@arg string
///@arg maxWidth
function StringWrap(argument0, argument1) {

	var str = argument0;
	var maxWidth = argument1;

	var strLeng = string_length(str);
	var lastSpace = 1;
	var count = 1;
	var substr;

	repeat(strLeng) {
		substr = string_copy(str, 1, count);
		if (string_char_at(str, count) == " ") {
			lastSpace = count;
		}
		if (string_width(substr) > maxWidth) {
			str = string_delete(str, lastSpace, 1);
			str = string_insert("\n", str, lastSpace);
		}
	
		count++;
	}

	return str;


}
