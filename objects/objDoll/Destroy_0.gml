/// @description Place held item
if (holding != "Empty") {
	var inst = instance_create_layer(x, y, "Instances", objItem);
	inst.name = holding;
					
	var spr = -1;
	// Get the correct sprite
	switch(holding) {
		case "Energy Bar":	spr = sprEnergyBar; break;
		case "Sanity Soda": spr = sprSanitySoda; break;
		case "Mop":			spr = sprMop; break;
		case "Storage Box": spr = sprBox; break;
		case "Candy Bar":	spr = sprCandyBar;; break;
		case "Flashlight":	spr = sprFlashlight; break;
		case "Key":			spr = sprKey;break;
		case "Lock":		spr = sprLock; break;
		case "Notebook":	spr = sprNotebook; break;
	}
					
	inst.sprite_index = spr;
}