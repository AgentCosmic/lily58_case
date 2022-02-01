include <../variables.scad>;
use <../palm_rest.scad>;

module bottom_plate(thickness, radius, plate_length, plate_width, palm_length, palm_height) {
	difference() {
		plate();
		translate([plate_x_offset, 0]) 
			feet_holes(plate_width, palm_length, thickness);
	}

	// palm feet support
	translate([plate_x_offset, 0, thickness]) 
		palm_feets(2, 3, plate_width, palm_length, 13);

	// pcb outline
	outline_height = 4; // assuming: top plate = 3, pcb = 2, standoff = 8
	translate([0, 0, thickness - 0.01])
		difference() {
			linear_extrude(height=outline_height)
				import("pcb_outline.svg");
			translate([0, 0, -0.01])
				linear_extrude(height=outline_height + 0.02)
				offset(r=-nozzle_size*3)
				import("pcb_outline.svg");
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
