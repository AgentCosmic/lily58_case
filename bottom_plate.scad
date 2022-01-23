include <variables.scad>;
use <palm_rest.scad>;

module bottom_plate(thickness, radius, plate_length, plate_width, palm_length, palm_height) {
	color("DarkSlateGray")

	difference() {
		plate();
		translate([plate_x_offset, 0]) 
			feet_holes(plate_width, palm_length, thickness);
	}

	module plate() {
		difference() {
			linear_extrude(height=thickness)
				import("bottom_plate.svg");
			translate([0, 0, -0.5])
			linear_extrude(height=thickness + 2)
				import("screw_holes.svg");
		}

		// palm feet support
		translate([plate_x_offset, 0, thickness]) 
			palm_feets(3, 3, plate_width, palm_length, 15);
	}
}
