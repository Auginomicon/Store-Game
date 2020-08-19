/// @description Run a script if there is any.
//[script, arg0, arg1...]

if (is_array(scripts)) {
	var pageScript = scripts[page];
	if (choiceDialog) { pageScript = pageScript[choice]; }
	if (pageScript != -1) {
		var len = array_length_1d(pageScript);
		if (len == 1) { script_execute(pageScript[0]); }
		else {
			var args = array_create(len - 1, 0);
			array_copy(args, 0, pageScript, 1, len - 1);
			ExecuteScriptAlt(pageScript[0], args);
		}
	}
}