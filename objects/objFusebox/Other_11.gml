/// @description Turn on all lights and machines
var elements = layer_get_all_elements("Lights");
for (var i = 0; i < array_length(elements); i++) {
		if (layer_get_element_type(elements[i]) == layerelementtype_instance) {
		var layerelement = elements[i];
		var inst = layer_instance_get_instance(layerelement);
		inst.working = true;
	}
}
objVendingMachine.state = MachineState.On;
objSodaMachine.state = MachineState.On;
objCameraSystem.state = MachineState.On;

with(objPlayer) {
	canMove = true;
}