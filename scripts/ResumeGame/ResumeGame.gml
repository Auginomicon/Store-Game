// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ResumeGame(){
	global.gamePaused = false;
	audio_resume_all();
	with(objPlayer) {
		canMove = true;
		state = pStates.Free;
	}
}