function LoadFile(){
	if (file_exists("Game.sav")) {
		ini_open("Game.sav");
		
		global.day = ini_read_real("Game", "Night", 1);
		
		ini_close();
	}
}