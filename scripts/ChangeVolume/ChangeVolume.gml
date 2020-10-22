function ChangeVolume(){
	var type = menuOptions[page];
	
	switch(type) {
		case 0: 
			audio_master_gain(argument0);
			global.masterVolume = argument0;
		break;
		
		case 1: 
			audio_group_set_gain(audiogroup_music, argument0, 0);
			global.musicVolume = argument0;
		break;
		
		case 2: 
			audio_group_set_gain(audiogroup_effects, argument0, 0);
			global.effectVolume = argument0;
		break;
	}
}