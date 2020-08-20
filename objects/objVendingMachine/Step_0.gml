/// @description
switch (state) {
	case MachineState.On:
	
		//Set the message variable to this
		message[0] = "Should I buy something?";
		message[1] = ["$"+string(myCost)+" "+myItem, "Nah"];
		message[2] = "...";

		//Set up who is speaking with each text box here.
		speakers = [objPlayer, objPlayer, objPlayer];
		nextLine = [0, [-1, -1], -1];
		//scripts = [-1,[[ChangeVariable, objPlayer.id, "inventory", 1],-1], -1];
		scripts = [-1,[[VendItem, myItem, myCost],-1], -1];
		
	break;
	
	case MachineState.Broken:
		
	case MachineState.Off:
		//Set the message variable to this
		message[0] = "It doesn't seem to be working...";

		//Set up who is speaking with each text box here.
		speakers = [objPlayer];
		
		//Set the MachineState.On speakers to -1 to resize the array.
		for(var i = 1; i <= 2; i++) {
			array_set(speakers, i, -1);
		}
		nextLine = [-1];
		scripts = -1;
	break;
}