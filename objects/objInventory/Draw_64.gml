/// @description Draw the inventory

if (showInventory) {
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	draw_sprite(inventorySprite, index, invUIX, invUIY);
	
	draw_circle_color(invUIX + (inventoryWidth * 0.5), invUIY + (inventoryHeight * .92), 13,c_white, c_white, true);
	
	//Have a switch case to draw things from a specific tab
	switch (index) {
		case 0: //Draw squares for debugging
			var i = 0;
			repeat (3) {
				draw_rectangle(invAppX + (i * buffer), invAppY, invAppX + appSize + (i * buffer), invAppY + appSize, true);
				i++;
			}
			
			var i = 0;
			repeat (3) {
				draw_rectangle(invAppX + (i * buffer), invAppY + buffer, invAppX + appSize + (i * buffer), invAppY + appSize + buffer, true);
				i++;
			}
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
						case "Soda": slotNum = 2; break;
						case "Mop": slotNum = 3; break;
						case "Storage Box": slotNum = 5; break;
						case "Candy Bar": slotNum = 4; break;
						case "Flashlight": slotNum = 6; break;
					}
					if (i == objPlayer.equipped[1] && (string(objPlayer.inventory[i]) != "Empty")) {
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
		
		case 5: //Web Search App
			draw_set_font(fntInventory);
			draw_set_halign(fa_center);
			draw_set_color(c_black);
			var gameTextX = invUIX + (inventoryWidth * 0.5);
			var gameTextY = invUIY + (inventoryHeight * 0.35);
			draw_text(gameTextX, gameTextY, "No connection");
		break;
		
		case 6: //Text Messages
			//TODO: Show some messages here.
		break;
	}
}