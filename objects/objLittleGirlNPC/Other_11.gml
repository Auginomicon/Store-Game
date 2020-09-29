/// @description Start to leave
show_debug_message("Ima head out");
var i = 0;
repeat(4) {
	if(objPlayer.inventory[i] == "Candy Bar") {
		objPlayer.inventory[i] = "Empty";
		if (objPlayer.inventory[i] == objPlayer.equipped[0] and objPlayer.equipped[1] != -1) {
			objPlayer.equipped[0] = -1;
			objPlayer.equipped[1] = -1;
		}
		break;
	}
	i++;
}
leaving = true;
alarm[2] = -1
//ClearDialog(1, objLittleGirlNPC, 3);
path_clear_points(path);