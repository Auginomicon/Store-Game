///@description CreateMenuPage
///@arg [Name1, type, entries1]
function CreateMenuPage(){
	var arg, i = 0;
	repeat(argument_count) {
		arg[i] = argument[i];
		i++
	}
	var dsGridId = ds_grid_create(5, argument_count);
	i = 0;
	repeat(argument_count) {
		var arr = arg[i];
		var arrLen = array_length(arr);
		
		var xx = 0;
		repeat(arrLen) {
			dsGridId[# xx, i] = arr[xx];
			xx++;
		}
		i++;
	}
	return dsGridId;
}