/// @description find an item
// Repeat through all the instances of objItem to find one that's not garbage and inside the store.
if (setItem) exit;

setItem = true;
var num = instance_number(objItem);
var i = 1;
repeat(num) {
	var inst = instance_nth_nearest(x, y, objItem, i);
	if (inst.currentLocation == 1 and inst.name != "Garbage") {
		desiredItem = inst.id;
		break;
	}
	i++;
}