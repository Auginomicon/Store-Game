///@description ItemCheck
///@arg item_string
///@arg nextLine_iter
///@arg new_nextLine
function ItemCheck(){
	var item = argument[0];
	for(var i = 0; i < 4; i++) {
		if (objPlayer.inventory[i] == item) {
			nextLine[argument[1]] = argument[2];
		}
	}

}