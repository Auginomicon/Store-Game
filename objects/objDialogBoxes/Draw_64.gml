/// @description Draw the textbox entirely
if (!choiceDialog) {
	//Draw the box
	draw_sprite(box, 0, boxX, boxY);

	//Draw the portriat background
	draw_sprite(frame, 0, portX, portY);

	//Draw the portrait
	draw_sprite(portrait, portraitIndex, portX, portY);

	//Draw the frame
	draw_sprite(frame, 1, portX, portY);

	//Draw the namebox
	draw_sprite(namebox, 0, nameboxX, nameboxY);

	//Setting up the font
	draw_set_font(fntFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_black);

	//Draw the name 
	draw_text(nameTextX, nameTextY, name);
	draw_set_color(c_white);
	draw_text(nameTextX + 1, nameTextY + 1, name);

	//Draw the text
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	if (!paused and counter < strLen) {
		counter++;
		if (counter mod 4 == 0) {
			audio_play_sound(voice, 10, false);
		}
	
		switch(string_char_at(textWrapped, counter)) {
			case ",":
				paused = true;
				alarm[0] = 15;
				break;
			case ".":
			case "?":
			case "!": 
				paused = true;
				alarm[0] = 25;
				break;
		}
	
	}
	var substr = string_copy(textWrapped, 1, counter);

	draw_text_color(textX, textY, substr, c_white, c_white, c_white, c_white, 1);
	//draw_text_color(textX + 1, textY + 1, substr, c_white, c_white, c_white, c_white, 1);
}
else {
	/*
	var j = 0;
	var choiceHeight = 0;
	repeat(msgArrayLength) {
		choiceHeight -= string_height_ext(msgArray[j], textHeight, textMaxWidth);
		j++;
	}
	*/
	//TODO: Check if you can make the box dimensions dynamic depending on the dialog choice sizes.
	//Draw a box that will be the size of the text options.
	NineSliceBoxStretched(sprTextBox2, diagX1,  portY, diagX1 + diagX2, portY, 0)
	//Set the alignment and font
	draw_set_font(fntFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	var c = c_white;
	var i = 0;
	var yAdd = 0;
	repeat(msgArrayLength) {
		if (choice == i) {
			c = choiceCol;
			draw_text_color(diagX2 + 15, textY + yAdd, "<", c, c, c, c, 1);
			draw_rectangle(diagX1 + 15, textY + yAdd, (diagX1 + 15) + (diagX2 - 30), textY + string_height_ext(msgArray[i], textHeight, textMaxWidth) + yAdd, true);
		}
		else {
			c = messageCol;
		}
		draw_text_ext_color(diagX1 + 25, textY + yAdd, msgArray[i], textHeight, textMaxWidth, c, c, c, c, 1);
		yAdd += string_height_ext(msgArray[i], textHeight, textMaxWidth);
		i++;
	}
}