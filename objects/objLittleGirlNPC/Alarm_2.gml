/// @description
var leave = true;
//go to the angry state if there are empty sheleves
var shelfNum = instance_number(objShelf);
for (var i = 1; i < shelfNum; i++) {
	var shelfInst = instance_nth_nearest(x, y, objShelf, i);
	if (shelfInst != 1 or shelfInst != 2) {
		// Go into angery mode
		event_perform(ev_other, ev_user2);
		leave = false;
	}
}

// Leave if all was okay
if (leave) {
	leaving = true;
}