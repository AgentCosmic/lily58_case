include <../variables.scad>;
use <../palm_rest.scad>;
screw_y_offset = 5;

module bottom_plate() {
	radius = 3;
	hole_width = 20;
	difference() {
		plate();
		translate([plate_x_offset, 0]) 
			feet_holes(palm_width, palm_length, plate_thickness);

		// stand hook hole
		translate([plate_x_offset + (palm_width - 20) / 2, 10, -0.01])
			cube([20, plate_thickness + 0.4, plate_thickness + 0.02]);

		// center hole
		// translate([plate_x_offset + (palm_width - hole_width) / 2, 25, -0.01])
		// hull() {
		// 	translate([0, 50])
		// 		cylinder(h=plate_thickness + 0.02, r=radius);
		// 	translate([hole_width, 50])
		// 		cylinder(h=plate_thickness + 0.02, r=radius);
		// 	translate([hole_width, 0])
		// 		cylinder(h=plate_thickness + 0.02, r=radius);
		// 	cylinder(h=plate_thickness + 0.02, r=radius);
		// }
	}

	// outer protection
	outline_height = standoff_height + plate_thickness - 5 - 1.6 - 1; // assuming: pcb = 1.6
	translate([0, 0, plate_thickness - 0.01])
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
			linear_extrude(height=plate_thickness)
				import("bottom_plate.svg");
			translate([0, 0, -0.5])
			linear_extrude(height=plate_thickness + 2)
				import("screw_holes.svg");
		}
		// palm feet support
		translate([plate_x_offset, 0]) 
			palm_feets(3, palm_length);
	}
}

bottom_plate();
