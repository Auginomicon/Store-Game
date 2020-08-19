///@description ChangeVariable
///@arg id
///@arg variable string
///@arg value
function ChangeVariable(argument0, argument1, argument2) {

	//Change a variable of the object with that id.
	with (argument0) {
		variable_instance_set(argument0, argument1, argument2);
	}


}
