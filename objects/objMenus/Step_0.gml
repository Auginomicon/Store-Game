/// @description
if (!global.gamePaused) exit;

inputUp =		keyboard_check_pressed(ord("W"));
inputDown =		keyboard_check_pressed(ord("S"));
inputEnter =	keyboard_check_pressed(ord("E")) or keyboard_check_pressed(vk_enter);

var dsGrid = menuPages[page];
var dsHeight = ds_grid_height(dsGrid);

var change = inputDown - inputUp;
if (change != 0) {
	menuOptions[page] += change;
	if ((inputUp) or (inputDown)) audio_play_sound(sndSelector, 1, false);
	if (menuOptions[page] > dsHeight - 1) menuOptions[page] = 0;
	if (menuOptions[page] < 0) menuOptions[page] = dsHeight - 1;
}

if (inputEnter) {
	switch(dsGrid[# 1, menuOptions[page]]) {
		case menuElementType.pageTransfer: page = dsGrid[# 2, menuOptions[page]]; break;
	}
}