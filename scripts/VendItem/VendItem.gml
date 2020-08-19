///@description GiveItem
///@arg itemName
function VendItem(argument0) {

	var i = 0;
	repeat(4) {
		if (objPlayer.inventory[i] == "Empty") {
			if (objPlayer.money >= 2.5) {
				//TODO: Play sound effect here
				objPlayer.inventory[i] = argument0;
				objPlayer.money -= 2.5;
				break;
			}
			else {
				script_execute(NewTextbox, "I don't have enough Money", 1);
				break;
			}
		}
		i++
	}




}
