include <variables.scad>;
use <palm_rest.scad>;

module top_plate(thickness) {
	color("SlateGray")
	difference() {
		linear_extrude(height=thickness)
			import("top_plate.svg");
		translate([0, 0, -0.5])
		linear_extrude(height=thickness + 2)
			import("screw_holes.svg");
	}
}
