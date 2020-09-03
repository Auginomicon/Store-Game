/// @description
switch(image_index) {
	case 0: // On
	case 1: // On with Lock
	break;
	
	case 2: // Broken
		var elements = layer_get_all_elements("Lights");
		for (var i = 0; i < array_length(elements); i++) {
		     if (layer_get_element_type(elements[i]) == layerelementtype_instance) {
		        var layerelement = elements[i];
		        var inst = layer_instance_get_instance(layerelement);
		        inst.working = false;
		    }
		}
		objVendingMachine.state = MachineState.Off;
		objSodaMachine.state = MachineState.Off;
	break;
}