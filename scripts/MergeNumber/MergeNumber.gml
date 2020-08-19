///@description MergeColor
///@arg num1
///@arg num2
///@arg amount
function MergeNumber(argument0, argument1, argument2) {

	var num1 = argument0;
	var num2 = argument1;
	var amount = argument2;

	var diff = num1 - num2;
	var merged = num1 - (diff * amount);

	return merged;


}
