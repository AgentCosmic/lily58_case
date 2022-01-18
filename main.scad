use <bottom_plate.scad>;
use <palm_rest.scad>;

bottom_plate_thickness = 2;
bevel = 4;
palm_length = 100;
palm_width = 121.95;

bottom_plate(bottom_plate_thickness, bevel, palm_length, palm_width);
translate([20.5, -palm_length])
	palm_rest(palm_width, 15, 70, bevel, bottom_plate_thickness);
