/// @description Create the grid when you spawn in the map
if (room == rmStore) {
	var cellWidth = 32;
	var cellHeight = 32;
	
	var hCell = room_width / cellWidth;
	var vCell = room_height / cellHeight;
	
	global.grid = mp_grid_create(0, 0, hCell, vCell, cellWidth, cellHeight);
	mp_grid_add_instances(global.grid, objWall, false);
}

if (room == rmInitialize) {
	audio_group_load(audiogroup_effects);
	audio_group_load(audiogroup_music);
}