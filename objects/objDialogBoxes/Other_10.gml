/// @description Text Wrapping
name = names[page];
voice = voices[page];
portraitIndex = portraits[page];

if (!is_array(message[page])) {
	textWrapped = StringWrap(message[page], textMaxWidth);
	strLen = string_length(textWrapped);
	choiceDialog = false;
}
else {
	msgArray = message[page];
	msgArrayLength = array_length_1d(msgArray);
	choiceDialog = true;
}
counter = 0;