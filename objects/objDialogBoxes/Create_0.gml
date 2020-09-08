/// @description Variables for text boxes
box = sprTextBox2;
frame = sprFrame;
portrait = sprPortraits;
namebox = sprNameBox;
depth = -5;

//Get the width and height for these.
boxWidth = sprite_get_width(box);
boxHeight = sprite_get_height(box);
portraitWidth = sprite_get_width(portrait);
portraitHeight = sprite_get_height(portrait);
nameboxWidth = sprite_get_width(namebox);
nameboxHeight = sprite_get_height(namebox);

//Get the locations of all the sprites for this.
portX = (global.ResolutionW - boxWidth - portraitWidth) * 0.5;
portY = global.ResolutionH * .98 - portraitHeight;
boxX = portX + portraitWidth;
boxY = portY;
nameboxX = portX;
nameboxY = boxY - nameboxHeight;

//Setting up variables for the text
xBuffer = 12;
yBuffer = 8;
textX = boxX + xBuffer;
textY = boxY + yBuffer;
nameTextX = nameboxX + (nameboxWidth * 0.5);
nameTextY = nameboxY + (nameboxHeight * 0.5);
textMaxWidth = boxWidth - (2 * xBuffer);

draw_set_font(fntFont);
textHeight = string_height("M") + .5;

//	TODO: look into this so that we can use different sprites for each character to have unique emotions.
portraitIndex = 0;
counter = 0;
paused = false;

page = 0;
voice = sndVoice;
name = "";

choice = 0;
choiceCol = c_black;
messageCol = c_gray;
diagX1 = global.ResolutionW * 0.05;
diagX2 = global.ResolutionW * 0.90;
diagY = global.ResolutionH * 0.05;
selected = false;
