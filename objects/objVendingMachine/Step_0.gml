/// @description
switch (state) {
	case MachineState.On:
	
		//Set the message variable to this
		message[0] = "Should I buy something?";
		message[1] = ["$"+string(cost1)+" "+item1, "$"+string(cost2)+" "+item2, "Nah"];
		message[2] = "...";

		//Set up who is speaking with each text box here.
		speakers = [objPlayer, objPlayer, objPlayer];
		nextLine = [0, [-1, -1, -1], -1];
		scripts = [-1, [[VendItem, item1, cost1, 1], [VendItem, item2, cost2, 1], -1], -1];
		portraitNums = [0, 0, 0];
		
	break;
	
	case MachineState.Broken:
		
	case MachineState.Off:
		//Set the message variable to this
		message[0] = "It doesn't seem to be working...";

		//Set up who is speaking with each text box here.
		speakers = [objPlayer];
		
		//Set the MachineState.On speakers to -1 to resize the array.
		for(var i = 1; i <= 3; i++) {
			array_set(speakers, i, -1);
		}
		nextLine = [-1];
		scripts = -1;
		portraitNums[0] = 1;
	break;
}