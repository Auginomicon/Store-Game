/// @description 
var i = 0;
repeat(array_length(menuPages)) {
	ds_grid_destroy(menuPages[i])
	i++;
}