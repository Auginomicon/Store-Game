/// @description
event_inherited();
sprite_index = choose(sprShadowFigure1, sprShadowFigure2, sprShadowFigure3, sprShadowFigure4);
collideable = false;
path = path_add();
currentLocation = 1;
state = enemyState.Free;
roamX = 0;
roamY = 0;
alarm[0] = 1;