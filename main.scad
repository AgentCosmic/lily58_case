include <variables.scad>;
use <sofle/top_plate.scad>;
use <sofle/bottom_plate.scad>;
use <palm_rest.scad>;

plate_thickness = 3;
bevel = 3;
plate_length = 100;
palm_width = 121.228;
palm_length = 70;
palm_height = 20;
standoff_height = 8;

color("SlateGray")
	translate([0, 0, plate_thickness + standoff_height])
	top_plate(plate_thickness);
color("Green")
	translate([-88, 223, plate_thickness + standoff_height - 5 + plate_thickness])
	import("sofle/sofle_pcb.stl");
color("DarkSlateGray")
	bottom_plate(plate_thickness, bevel, plate_length, palm_width, palm_length, palm_height);

color("RoyalBlue")
	translate([plate_x_offset, 0])
	palm_rest(palm_width, palm_height, palm_length, bevel, plate_thickness);
