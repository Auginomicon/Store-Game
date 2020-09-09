///@description EventTrigger
///@arg object
///@arg user_event_number
function EventTrigger(){
	var obj = argument[0];
	var num = argument[1];
	
	with (obj) {
		switch(num) {
			case 0:
				event_perform(ev_other, ev_user0);
			break;
			
			case 1:
				event_perform(ev_other, ev_user1);
			break;
			
			case 2:
				event_perform(ev_other, ev_user2);
			break;
			
			case 3:
				event_perform(ev_other, ev_user3);
			break;
			
			case 4:
				event_perform(ev_other, ev_user4);
			break;
			
			case 5:
				event_perform(ev_other, ev_user5);
			break;
			
			case 6:
				event_perform(ev_other, ev_user6);
			break;
		}
	}
}