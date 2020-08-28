///@description GiveItem
///@arg itemName
///@arg cost

function VendItem(argument0, argument1) {

	var i = 0;
	repeat(4) {
		if (objPlayer.inventory[i] == "Empty") {
			if (objPlayer.money >= argument1) {
				//TODO: Play sound effect here
				objPlayer.inventory[i] = argument0;
				objPlayer.money -= argument1;
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
