/// @description
if (!global.gamePaused) exit;

var dsGrid = menuPages[page];
var dsHeight = ds_grid_height(dsGrid);
var yBuffer = 64;
var xBuffer = 32;
var startY = (global.viewHeight / 2) - ((((dsHeight - 1) / 2) * yBuffer));
var startX = global.viewWidth / 2;

// Draw Background
var c = c_black;
draw_rectangle_color(0, -5, global.guiWidth, global.guiHeight, c, c, c, c, false);

// Draw Elements
draw_set_valign(fa_middle);
draw_set_halign(fa_right);
draw_set_font(fntTime);
c = c_white;
var ltx = startX - xBuffer;
var lty, xo;

var yy = 0;
repeat(dsHeight) {
	lty = startY + (yy * yBuffer);
	c = c_white;
	xo = 0;
	if (yy == menuOptions[page]) {
		c = c_aqua;
		xo = (xBuffer / 2);
	}
	draw_text_color(ltx + xo, lty, dsGrid[# 0, yy], c, c, c, c, 1);
	yy++;
}

// Draw division line
draw_line_color(startX + xBuffer - 15, startY - yBuffer, startX + xBuffer - 15, lty + yBuffer, c_white, c_white);

// Draw right side elements
draw_set_halign(fa_left);
var rtx = startX + xBuffer, rty;
yy = 0;
repeat(dsHeight) {
	rty = startY + (yy * yBuffer);
	switch(dsGrid[# 1, yy]) {
		case menuElementType.shift:
			var currentVal = dsGrid[# 3, yy];
			var currentArr = dsGrid[# 4, yy];
			c = c_white;
			var leftShift = "<< ";
			var rightShift = " >>";
			
			if (currentVal == 0) leftShift = "";
			if (currentVal == array_length(dsGrid[# 4, yy]) - 1) rightShift = "";
			if (inputting and yy == menuOptions[page]) c = c_lime; 
			draw_text_color(rtx, rty, leftShift+currentArr[currentVal]+rightShift, c, c, c, c, 1);
		break;
		
		case menuElementType.slider:
			var len = 98;
			var currentVal = dsGrid[# 3, yy];
			var currentArr = dsGrid[# 4, yy];
			var circlePos = ((currentVal - currentArr[0]) / (currentArr[1] - currentArr[0]));
			c = c_white;
			
			draw_line_width_color(rtx, rty, rtx + len, rty, 2, c_white, c_white);
			if (inputting and yy == menuOptions[page]) c = c_lime; 
			draw_circle_color(rtx + (circlePos * len), rty, 4, c, c, false);
			draw_text_color(rtx + (len * 1.2), rty, string(floor(circlePos * 100)) + "%", c, c, c, c, 1);
		break;
		
		case menuElementType.toggle:
			var currentVal = dsGrid[# 3, yy];
			var c1, c2;
			c = c_white;
			if (inputting and yy == menuOptions[page]) c = c_lime; 
			if (currentVal == 0) { c1 = c; c2 = c_dkgray; }
			else { c1 = c_dkgray; c2 = c; }
			draw_text_color(rtx, rty, "ON", c1, c1, c1, c1, 1);
			draw_text_color(rtx + 124, rty, "Off", c2, c2, c2, c2, 1);
		break;
	}
	yy++;
}
// Reset valign
draw_set_valign(fa_top);