function GoToMainMenu(){
	with(all) {
		instance_destroy();
	}
	
	SaveFile();
	game_restart();
}