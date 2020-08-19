/// @description
if (global.gamePaused or !canMove) { exit; }

//Apply Collision before moving
Collisions();

//Move the actual player in the end
x += moveX;
y += moveY;