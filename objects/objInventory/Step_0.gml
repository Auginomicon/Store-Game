/// @description
//Make it so you can't open the inventory while you are paused or in a dialog/text box
if (instance_exists(objTextBoxes) or instance_exists(objDialogBoxes) or global.gamePaused or global.cameraSystem) { exit; }

if (objPlayer.input_open_inv and !objPlayer.isSafe) {
	showInventory = !showInventory
	if (global.isOn) { global.isOn = false; }
}

if (showInventory) {
	//Paused the player when the inventory is open.
	with (objPlayer) {
		state = pStates.Paused;
	}
	
	//Get mouse positions on the GUI 
	mouseX = device_mouse_x_to_gui(0);
	mouseY = device_mouse_y_to_gui(0);
	
	//A clickable location on the home button
	if (point_in_circle(mouseX, mouseY, invUIX + (inventoryWidth * 0.5), invUIY + (inventoryHeight * .92), 13)) {
		if (mouse_check_button_pressed(mb_left)) {
			show_debug_message("Home button clicked");
			index = 0;
		}
	}
	
	//Switch case to organize the applications
	switch(index) {
		case 0: //Home screen
			//Create a clickable section on the first application
			if (point_in_rectangle(mouseX, mouseY, invAppX, invAppY, invAppX + appSize, invAppY + appSize)) {
				if (mouse_check_button_pressed(mb_left)) {
					show_debug_message("Inventory button clicked");
					index = 1;
				}
			}
	
			//Create a clickable section on the second application
			if (point_in_rectangle(mouseX, mouseY, invAppX + buffer, invAppY, invAppX + appSize + buffer, invAppY + appSize)) {
				if (mouse_check_button_pressed(mb_left)) {
					show_debug_message("Bank button clicked");
					index = 2;
				}
			}
	
			//Create a clickable section on the third application
			if (point_in_rectangle(mouseX, mouseY, invAppX + (buffer * 2), invAppY, invAppX + appSize + (buffer * 2), invAppY + appSize)) {
				if (mouse_check_button_pressed(mb_left)) {
					show_debug_message("Phone button clicked");
					index = 3;
				}
			}
			
			//Create a clickable section on the Fourth application
			if (point_in_rectangle(mouseX, mouseY, invAppX, invAppY + buffer, invAppX + appSize, invAppY + appSize + buffer)) {
				if (mouse_check_button_pressed(mb_left)) {
					show_debug_message("Game App clicked");
					index = 4;
				}
			}
			
			//Create a clickable section on the fifth application
			if (point_in_rectangle(mouseX, mouseY, invAppX + (buffer), invAppY + buffer, invAppX + appSize + (buffer), invAppY + appSize + buffer)) {
				if (mouse_check_button_pressed(mb_left)) {
					show_debug_message("Settings clicked");
					index = 5;
				}
			}
			
			//Create a clickable section on the sixth application
			if (point_in_rectangle(mouseX, mouseY, invAppX + (buffer * 2), invAppY + buffer, invAppX + appSize + (buffer * 2), invAppY + appSize + buffer)) {
				if (mouse_check_button_pressed(mb_left)) {
					show_debug_message("Job App");
					index = 6;
				}
			}
		break;
		
		case 1: //Inventory
			//First inventory slot
			if (point_in_rectangle(mouseX, mouseY, invSlotPosX, invSlotPosY, invSlotPosX + invSlotWidth, invSlotPosY + invSlotHeight)) {
				UseItem(0);
			}
			
			//Second inventory slot
			if (point_in_rectangle(mouseX, mouseY, invSlotPosX, invSlotPosY + invSlotBuffer, invSlotPosX + invSlotWidth, invSlotPosY + invSlotHeight + invSlotBuffer)) {
				UseItem(1);
			}
			
			//Third inventory slot
			if (point_in_rectangle(mouseX, mouseY, invSlotPosX, invSlotPosY + (2 * invSlotBuffer), invSlotPosX + invSlotWidth, invSlotPosY + invSlotHeight + (2 * invSlotBuffer))) {
				UseItem(2);
			}
			
			//Fourth inventory slot
			if (point_in_rectangle(mouseX, mouseY, invSlotPosX, invSlotPosY + (3 * invSlotBuffer), invSlotPosX + invSlotWidth, invSlotPosY + invSlotHeight + (3 * invSlotBuffer))) {
				UseItem(3);
			}
			
		break;
		
		case 2: // Piggy Bank
			// Do nothing
		break;
		
		case 3: // Contacts
			// TODO: create a dialog with the contact
		break;
		
		case 4: // Flappy Duck
			// Do Nothing
		break
		
		case 5: // Settings
			if (point_in_rectangle(mouseX, mouseY, invUIX + (inventoryWidth * 0.2), invUIY + (inventoryHeight * 0.42), invUIX + (inventoryWidth * 0.2) + 102, invUIY + (inventoryHeight * 0.42) + 30)) {
				if (mouse_check_button_pressed(mb_left)) {
					global.silent = !global.silent;
				}
			}
		break;
		
		case 6: // Job App
			// Do nothing
		break;
	}
}