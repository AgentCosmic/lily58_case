include <variables.scad>;
use <top_plate.scad>;
use <bottom_plate.scad>;
use <palm_rest.scad>;

plate_thickness = 3;
bevel = 3;
plate_length = 100;
palm_width = 130.01;
palm_length = 70;
palm_height = 20;

translate([0, 0, 11])
	top_plate(plate_thickness);
color("Green")
	translate([-79, 229.5, 7])
	import("pcb.stl");
bottom_plate(plate_thickness, bevel, plate_length, palm_width, palm_length, palm_height);

color("RoyalBlue")
	translate([plate_x_offset, 0]) {
		palm_rest(palm_width, palm_height, palm_length, bevel, plate_thickness);
	}


// !offset(r = 10) {
	// cylinder(r=2, h=plate_thickness, center=true);
// }
