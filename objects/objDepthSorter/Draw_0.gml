/// @description
//Resize the grid
var instNum = instance_number(ParDepth);
var dGrid = dsDepthGrid;

ds_grid_resize(dGrid, 2, instNum);

//Add the entities to the grid
var yy = 0;
with(ParDepth) {
	dGrid[# 0, yy] = id;
	dGrid[# 1, yy] = y;
	yy++;
}

//Sort the grid in ascending order
ds_grid_sort(dGrid, 1, true);

//Loop through the grid to draw all the instances correctly
var yy = 0;
var inst;
repeat(instNum) {
	//Pull out the ID
	inst = dGrid[# 0, yy];
	with(inst) {
		event_perform(ev_draw, 0);
	}
	yy++;
}