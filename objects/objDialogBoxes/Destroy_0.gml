/// @description Reset NPC move boolean
//TODO: Perhaps change it to be the individual id and not all the NPCS.
with(ParNPC) {
	canMove = true;
}

with(objPlayer) {
	objPlayer.canMove = true;
}