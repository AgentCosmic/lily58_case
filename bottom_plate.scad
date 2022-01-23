include <variables.scad>;
use <palm_rest.scad>;

module bottom_plate(thickness, radius, plate_length, plate_width, palm_length, palm_height) {
	difference() {
		plate();
		translate([plate_x_offset, 0]) 
			feet_holes(plate_width, palm_length, thickness);
	}

	// palm feet support
	translate([plate_x_offset, 0, thickness]) 
		palm_feets(3, 3, plate_width, palm_length, 15);

	// pcb outline
	color("SlateGrey")
	translate([4, 86, 3 - 0.01])
		difference() {
			linear_extrude(height=2)
				offset(r=nozzle_size*3) // add ~1.2mm padding around pcb
				import("pcb.svg");
			translate([0, 0, -0.01])
			linear_extrude(height=2.02)
				import("pcb.svg");
		}

	module plate() {
		difference() {
			linear_extrude(height=thickness)
				import("bottom_plate.svg");
			translate([0, 0, -0.5])
			linear_extrude(height=thickness + 2)
				import("screw_holes.svg");
		}
	}
}
