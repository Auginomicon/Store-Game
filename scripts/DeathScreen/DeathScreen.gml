/// @description DeathScreen
///@arg Message
function DeathScreen(){
	var msg = argument[0];
	with (objGame) {
		deathMsg = msg;
		playerDead = true;
	}
}