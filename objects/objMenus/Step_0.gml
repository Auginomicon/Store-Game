/// @description
if (!global.gamePaused or objGame.playerDead or objGame.showWinScreen) exit;

inputUp =		keyboard_check_pressed(ord("W"));
inputDown =		keyboard_check_pressed(ord("S"));
inputEnter =	keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_enter);

var dsGrid = menuPages[page];
var dsHeight = ds_grid_height(dsGrid);

if (inputting) {
	switch(dsGrid[# 1, menuOptions[page]]) {
		case menuElementType.shift: 
			var hinput = keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));
			if (hinput != 0) {
				// Play audio sound here
				dsGrid[# 3, menuOptions[page]] += hinput;
				dsGrid[# 3, menuOptions[page]] = clamp(dsGrid[# 3, menuOptions[page]], 0, array_length(dsGrid[# 4, menuOptions[page]]) - 1);
			}
		break;
		case menuElementType.slider:
			switch(menuOptions[page]) {
				case 0: break;
				case 1:	break;
				case 2: break;
			}
			var hinput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
			if (hinput != 0) {
				dsGrid[# 3, menuOptions[page]] += hinput *0.01;
				dsGrid[# 3, menuOptions[page]] = clamp(dsGrid[# 3, menuOptions[page]], 0, 1);
			}
		break;
		case menuElementType.toggle:
			var hinput = keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));
			if (hinput != 0) {
				// Play audio sound here
				dsGrid[# 3, menuOptions[page]] += hinput;
				dsGrid[# 3, menuOptions[page]] = clamp(dsGrid[# 3, menuOptions[page]], 0, 1);
			}
		break;
	}
}
else {
var change = inputDown - inputUp;
	if (change != 0) {
		menuOptions[page] += change;
		if ((inputUp) or (inputDown)) audio_play_sound(sndSelector, 1, false);
		if (menuOptions[page] > dsHeight - 1) menuOptions[page] = 0;
		if (menuOptions[page] < 0) menuOptions[page] = dsHeight - 1;
	}
}

if (inputEnter) {
	switch(dsGrid[# 1, menuOptions[page]]) {
		case menuElementType.scriptRunner: script_execute(dsGrid[# 2, menuOptions[page]]); break;
		case menuElementType.pageTransfer: page = dsGrid[# 2, menuOptions[page]]; break;
		case menuElementType.shift:
		case menuElementType.slider:
		case menuElementType.toggle: if (inputting) { script_execute(dsGrid[# 2, menuOptions[page]], dsGrid[# 3, menuOptions[page]]); }
			inputting = !inputting;
	}
}