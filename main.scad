include <variables.scad>;
use <sofle/top_plate.scad>;
use <sofle/bottom_plate.scad>;
use <sofle/oled_cover.scad>;
use <palm_rest.scad>;
use <stand.scad>;

bevel = 3;
plate_length = 100;
palm_length = 70;
palm_height = 20;
standoff_height = 8;

// translate([-14.9, 0, 49.8]) rotate([0, 20])
	case();
// translate([0, 10]) stand();

module case() {
	color("SlateGray")
		translate([0, 0, plate_thickness + standoff_height])
		top_plate();
	color("Green")
		translate([-88, 223, plate_thickness + standoff_height - 5 + plate_thickness])
		import("sofle/sofle_pcb.stl");
	color("DarkSlateGray")
		bottom_plate(bevel, plate_length, palm_length, palm_height);
	color("White")
		translate([0, 127, plate_thickness + standoff_height - 5 + 12])
		oled_cover();

	color("RoyalBlue")
		translate([plate_x_offset, 0])
		palm_rest(palm_width, palm_height, palm_length, bevel);
}
