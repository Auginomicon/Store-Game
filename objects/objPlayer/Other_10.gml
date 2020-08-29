/// @description Remove equipped item
inventory[equipped[1]] = "Empty";
equipped[0] = -1;
equipped[1] = -1;
show_debug_message("Equipped item used!")