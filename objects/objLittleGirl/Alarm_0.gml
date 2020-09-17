/// @description find an item
// So that the alarm does not go off repeatedly
if (itemFound == true) exit;

itemFound = true;

var num = instance_number(objItem);
var i = 1;
repeat(num) {
	var inst = instance_nth_nearest(x, y, objItem, i);
	if (inst.currentLocation == 3 and inst.name == "Garbage") {
		desiredItem = inst.id;
		break;
	}
	i++;
}

// Checks if there are no more garbage bags
if (desiredItem == noone) {
	noMoreTrash = true;
}