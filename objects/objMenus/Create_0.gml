// Create the menu
// For Menu
depth = -15;
enum menuPage {
	main,
	settings,
	audio,
	graphics,
	height
}

enum menuElementType {
	scriptRunner,
	pageTransfer,
	slider,
	shift,
	toggle
}
if (file_exists("Game.sav")) {
	ini_open("Game.sav");
	
	var fs = ini_read_real("Options", "Fullscrren", 0);
	
	ini_close();
}

dsMenuMain = CreateMenuPage(
	["Resume", menuElementType.scriptRunner, ResumeGame],
	["Settings", menuElementType.pageTransfer, menuPage.settings],
	["Leave", menuElementType.scriptRunner, GoToMainMenu]
);

dsSettings = CreateMenuPage(
	["Audio", menuElementType.pageTransfer, menuPage.audio],
	["Graphics", menuElementType.pageTransfer, menuPage.graphics],
	["Back", menuElementType.pageTransfer, menuPage.main]
);

dsAudio = CreateMenuPage(
	["Master", menuElementType.slider, ChangeVolume, global.masterVolume, [0,1]],
	["Music", menuElementType.slider, ChangeVolume, global.musicVolume, [0,1]],
	["Effects", menuElementType.slider, ChangeVolume, global.effectVolume, [0,1]],
	["Back", menuElementType.pageTransfer, menuPage.settings]
);

dsGraphics = CreateMenuPage(
	["Window Mode", menuElementType.toggle, ChangeWindowMode, fs, ["Fullscreen", "Windowed"]],
	["Back", menuElementType.pageTransfer, menuPage.settings]
);

page = 0;
menuPages = [dsMenuMain, dsSettings, dsAudio, dsGraphics];
var i = 0;
repeat(array_length(menuPages)) {
	menuOptions[i] = 0;
	i++;
}

inputting = false;