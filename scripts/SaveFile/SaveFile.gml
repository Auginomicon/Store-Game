function SaveFile(){
	if (file_exists("Game.sav")) file_delete("Game.sav");
	ini_open("Game.sav");
	
	// Save day you are on
	var SavedDay = global.day;
	ini_write_real("Game", "Night", SavedDay);
	
	// Save if fullscreened
	if (window_get_fullscreen()) {
		ini_write_real("Options", "Fullscreen", 1);
	}
	else {
		ini_write_real("Options", "Fullscreen", 0);
	}
	
	// Save volume settings
	var SavedMVolume = global.masterVolume;
	ini_write_real("Options", "MasterVolume", SavedMVolume);
	
	var SavedMusicVolume = global.musicVolume;
	ini_write_real("Options", "MusicVolume", SavedMusicVolume);
	
	var SavedEffectVolume = global.effectVolume;
	ini_write_real("Options", "EffectsVolume", SavedEffectVolume);
	
	// Close ini file
	ini_close();
}