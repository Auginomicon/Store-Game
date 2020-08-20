///@description GoToLocation
//@arg newLocation
//@arg xLocation
//@arg yLocation
function GoToLocation(argument0, argument1, argument2, argument3){
	objPlayer.x = argument1;
	objPlayer.y = argument2;
	objPlayer.idleNum = argument3;
	objGame.location = argument0;
}