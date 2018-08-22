/*** Honeycomb generator
/* Original by Dan Nixon: 
/* https://github.com/DanNixon/SCAD_Lib/blob/master/Honeycomb.scad
*/

module HCGrid(grid_size, cell_size, wall_thickness, center)
{
	delta = cell_size + wall_thickness;
	delta_x = (sqrt(3) / 2) * delta;

	function X(x) = x * delta_x;
	function Y(x, y) = (y * delta) + ((x % 2) * (delta / 2));

	center_offset = -[X(grid_size[0]), Y(grid_size[0], grid_size[1])] / 2;

	translate(center ? center_offset : [0, 0])
		for (i = [0 : grid_size[0]])
			for (j = [0 : grid_size[1]])
				translate([X(i), Y(i, j)])
					circle(r = cell_size * (sqrt(3)/3), $fn = 6);
}

/* size - vector for x,y overall dimension
*/
module honeycomb_by_size(size = [], cell_size, wall_thickness, center = false)
{
	rows = floor((1.2 * size[0]) / (cell_size + wall_thickness));
	cols = floor(size[1] / (cell_size + wall_thickness));
	difference() {
		square(size, center);
		HCGrid([rows, cols], cell_size, wall_thickness, center);
	}
}

/* grid - number of honneycomb cells in x,y 
*/
module honeycomb_by_grid(grid = [], cell_size, wall_thickness, center = false)
{
	HCGrid(grid, cell_size, wall_thickness, center);
}