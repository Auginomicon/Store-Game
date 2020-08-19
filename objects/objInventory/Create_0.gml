/// @description Initialize variables

//Inventory Variables
showInventory = false;
scale = 1;

//Gui Variables
guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

//Inventory Variables
inventoryWidth = 174;
inventoryHeight = 300;

inventorySprite = sprInventory;
index = 0;

//UI Variables
invUIX = (guiWidth * 0.30) - (inventoryWidth * scale);
invUIY = (guiHeight * 0.45) - (inventoryHeight * scale);

//Application Varibales
invAppX = invUIX + (inventoryWidth * 0.14);
invAppY = invUIY + (inventoryHeight * 0.38);
appSize = 31;
buffer = appSize + 15;

//Inventory Slots Variables
invSlotX = invUIX + (inventoryWidth * 0.5);
invSlotY = invUIY + (inventoryHeight * 0.32);
invSlotPosX = invUIX + (inventoryWidth * 0.12);
invSlotPosY = invUIY + (inventoryHeight * 0.31);
invSlotWidth = 133;
invSlotHeight = 30;
invSlotBuffer = invSlotHeight + 2;