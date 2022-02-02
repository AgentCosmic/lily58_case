include <../variables.scad>;
use <../palm_rest.scad>;

module bottom_plate(thickness, radius, plate_length, palm_width, palm_length, palm_height) {
	hole_width = 20;
	difference() {
		plate();
		translate([plate_x_offset, 0]) 
			feet_holes(palm_width, palm_length, thickness);

		// stand hook hole
		translate([plate_x_offset + (palm_width - 20) / 2, 10, -0.01])
			cube([20, thickness + 0.4, thickness + 0.02]);

		// center hole
		translate([plate_x_offset + (palm_width - hole_width) / 2, 25, -0.01])
		hull() {
			translate([0, 50])
				cylinder(h=thickness + 0.02, r=radius);
			translate([hole_width, 50])
				cylinder(h=thickness + 0.02, r=radius);
			translate([hole_width, 0])
				cylinder(h=thickness + 0.02, r=radius);
			cylinder(h=thickness + 0.02, r=radius);
		}
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
