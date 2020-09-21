/// @description Draw the inventory

if (showInventory) {
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, global.guiWidth, global.guiHeight, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	draw_sprite(inventorySprite, index, invUIX, invUIY);
	
	//Have a switch case to draw things from a specific tab
	switch (index) {
		case 0: //Home screen
			draw_set_font(fntTime);
			draw_set_halign(fa_center);
			var mins = objDayCycle.minutes;
			while (mins >= 60) {
				mins -= 60;
			}
			var hrs = objDayCycle.hours + 6;
			while (hrs >= 12) {
				hrs -= 11;
			}
			var c = c_black;
			var zero = "";
			if (mins < 10) {
				zero = "0";
			}
			draw_text_color(invUIX + (inventoryWidth * 0.46), invUIY + (inventoryHeight * .14), ":", c, c, c, c, 1);
			draw_text_color(invUIX + (inventoryWidth * 0.3), invUIY + (inventoryHeight * .14), floor(hrs), c, c, c, c, 1);
			draw_text_color(invUIX + (inventoryWidth * 0.65), invUIY + (inventoryHeight * .14), zero+string(floor(mins)), c, c, c, c, 1);
			draw_set_halign(fa_left);
		break;
		
		case 1: //Inventory
			draw_set_font(fntInventory);
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			
			var i = 0;
			var slotNum = 0;
			var sSlotColor = c_white;
				repeat(4) {
					//draw_text(invSlotX, invSlotY + (invSlotBuffer * i),string(objPlayer.inventory[i]));
					switch(string(objPlayer.inventory[i])) {
						case "Empty": slotNum = 1; break;
						case "Energy Bar": slotNum = 0; break;
						case "Sanity Soda": slotNum = 2; break;
						case "Mop": slotNum = 3; break;
						case "Storage Box": slotNum = 5; break;
						case "Candy Bar": slotNum = 4; break;
						case "Flashlight": slotNum = 6; break;
						case "Key": slotNum = 7; break;
						case "Garbage": slotNum = 8; break;
						case "Lock": slotNum = 9; break;
						case "Notebook": slotNum = 10; break;
						case "Doll": slotNum = 11; break;
					}
					if (i == objPlayer.equipped[1] && (string(objPlayer.inventory[i]) != "Empty") && objPlayer.equipped[0] != -1) {
						sSlotColor = c_gray;
					}
					else {
						sSlotColor = c_white;
					}
					
					draw_sprite_ext(sprItemSlots, slotNum, invSlotX, invSlotY + (invSlotBuffer * i), 1, 1, 0, sSlotColor, 1);
					i++;
				}
			draw_set_halign(fa_left);
			
		break;
		
		case 2: //Bank Account
			var displayMoneyX = invUIX + (inventoryWidth * 0.5);
			var displayMoneyY = invUIY + (inventoryHeight * 0.35);
			draw_set_font(fntFont);
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			draw_text(displayMoneyX, displayMoneyY, "$ " + string(objPlayer.money));
			draw_set_halign(fa_left);
		break;
		
		case 3: //Phonebook
			//TODO: Have a picture then name of the person's contact.
		break;
		
		case 4: //Phone game
			draw_set_font(fntInventory);
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			var gameTextX = invUIX + (inventoryWidth * 0.5);
			var gameTextY = invUIY + (inventoryHeight * 0.3);
			draw_text(gameTextX, gameTextY, "Sorry! \ngame servers \nare down! :(");
			
		break;
		
		case 5: // Settings
			draw_set_font(fntInventory);
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			var gameTextX = invUIX + (inventoryWidth * 0.275);
			var gameTextY = invUIY + (inventoryHeight * 0.465);
			var c = c_red;
			if (global.silent = true) {
				c = c_green;
			}
			draw_circle_color(gameTextX, gameTextY, 8, c, c, false);
		break;
		
		case 6: // Job App
			draw_set_font(fntInventory);
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			var gameTextX = invUIX + (inventoryWidth * 0.15);
			var gameTextY = invUIY + (inventoryHeight * 0.5);
			draw_sprite_ext(sprJobProgressBar, 1, gameTextX, gameTextY, 1, 1, 0, c_white, 1);
			draw_sprite_ext(sprJobProgressBar, 0, gameTextX, gameTextY, objPlayer.jobProgression / objPlayer.maxJobProgression, 1, 0, c_white, 1);
			
		break;
	}
}