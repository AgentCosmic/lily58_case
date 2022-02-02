include <../variables.scad>;
use <../palm_rest.scad>;

module bottom_plate(thickness, radius, plate_length, palm_width, palm_length, palm_height) {
	hole_width = 20;
	difference() {
		plate();
		translate([plate_x_offset, 0]) 
			feet_holes(palm_width, palm_length, thickness);
		// center hold
		translate([plate_x_offset + (palm_width - hole_width) / 2, 20, -0.01])
			cube([20, 60, thickness + 0.02]);
	}

	// pcb outline
	outline_height = 4; // assuming: top plate = 3, pcb = 1.6, standoff = 8
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
		// palm feet support
		translate([plate_x_offset, 0, thickness]) 
			palm_feets(2, 3, palm_width, palm_length, 13);
	}
}
