// Create the menu
// For Menu

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

dsMenuMain = CreateMenuPage(
	["Resume", menuElementType.scriptRunner, ResumeGame],
	["Settings", menuElementType.pageTransfer, menuPage.settings],
	["Quit", menuElementType.scriptRunner, ExitGame]
);

dsSettings = CreateMenuPage(
	["Audio", menuElementType.pageTransfer, menuPage.audio],
	["Graphics", menuElementType.pageTransfer, menuPage.graphics],
	["Back", menuElementType.pageTransfer, menuPage.main]
);

dsAudio = CreateMenuPage(
	["Master", menuElementType.slider, ChangeVolume, 1, [0,1]],
	["Back", menuElementType.pageTransfer, menuPage.main]
);

dsGraphics = CreateMenuPage(
	["Resolution", menuElementType.shift, ChangeResolution, 0, ["384 x 216", "768 x 432", "1152 x 648", "1536 x 874", "1920 x 1080"]],
	["Window Mode", menuElementType.toggle, 1, ["Fullscreen", "Windowed"]],
	["Back", menuElementType.pageTransfer, menuPage.main]
);

page = 0;
menuPages = [dsMenuMain, dsSettings, dsAudio, dsGraphics];
var i = 0;
repeat(array_length(menuPages)) {
	menuOptions[i] = 0;
	i++;
}