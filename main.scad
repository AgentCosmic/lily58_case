include <variables.scad>;
use <top_plate.scad>;
use <bottom_plate.scad>;
use <palm_rest.scad>;
use <pcb_cover.scad>;

plate_thickness = 3;
bevel = 3;
plate_length = 100;
palm_width = 130.01;
palm_length = 70;
palm_height = 20;
standoff_height = 8;

translate([0, 0, plate_thickness + standoff_height])
	top_plate(plate_thickness);
color("Green")
	translate([-79, 229.5, 7])
	import("pcb.stl");
color("DarkSlateGray")
	bottom_plate(plate_thickness, bevel, plate_length, palm_width, palm_length, palm_height);

color("White")
	translate([4, 86, 3 - 0.01])
	pcb_cover(standoff_height, nozzle_size*2);

color("RoyalBlue")
	translate([plate_x_offset, 0])
	palm_rest(palm_width, palm_height, palm_length, bevel, plate_thickness);
