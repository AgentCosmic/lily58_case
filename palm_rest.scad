include <variables.scad>;

leg_width = 30;
leg_thickness = 3;
padding = 10;
screw_safety = 0.2;
lock_diameter = 4.4;

module palm_rest(width, height, length, radius) {
	thickness = 3;

	// top plate
	translate([0, 0, -thickness/2 + height])
	hull() {
		$fn = 12;
		r = thickness/2;
		translate([r, length - r]) sphere(d=thickness);
		translate([width - r, length - r]) sphere(d=thickness);
		translate([width - r, r]) sphere(d=thickness);
		translate([r, r])sphere(d=thickness);
	}

	// // top plate
	// translate([0, radius, height])
	// 	cube([width, length - radius, thickness]);
	// // round corners
	// translate([0, length, height])
	// 	linear_extrude(height=thickness)
	// 	hull() {
	// 		translate([radius, 0]) circle(radius);
	// 		translate([width - radius, 0]) circle(radius);
	// 	}
    //
	// // curve
	// translate([width, radius + 0.01, height - radius + thickness])
	// rotate([90, 0, -90])
	// intersection() {
	// 	difference() {
	// 		cylinder(width*2, r=radius, center=true, $fn=16);
	// 		cylinder(width*2 + 1, r=radius - thickness, center=true, $fn=16);
	// 	}
	// 	cube([radius, radius, width*2]);
	// }

	// legs
	translate([padding, length - padding])
		palm_leg(leg_width, height);
	translate([width - leg_width - padding, length - padding])
		palm_leg(leg_width, height);
	translate([width - leg_width - padding, padding])
		palm_leg(leg_width, height);
	translate([padding, padding])
		palm_leg(leg_width, height);

	module palm_leg(width, height) {
		translate([0, 0, palm_hook_height + 0.01]) // elevate so it won't touch the floor
			cube([width, leg_thickness, height - palm_hook_height]);
		difference() {
			// feet hook
			translate([width / 3, 0, -0.01]) // so it goes through the floor
				cube([width / 3, leg_thickness, palm_hook_height + 0.03]); // 1 for floor bottom, 1 for floor top, 1 for feet bottom
			// screw hole
			translate([width / 2, 1, lock_diameter/2 + palm_screw_z])
				rotate([90])
				cylinder(leg_thickness + 2, r=lock_diameter/2 + screw_safety, center=true);
		}
	}
}

module feet_holes(width, length, floor_thickness) {
	translate([padding, length - padding]) hole();
	translate([width - leg_width - padding, length - padding]) hole();
	translate([width - leg_width - padding, padding]) hole();
	translate([padding, padding]) hole();
	module hole() {
		translate([leg_width / 3 - nozzle_size, -nozzle_size, -0.01])
			cube([leg_width / 3 + nozzle_size*2, leg_thickness + nozzle_size*2, floor_thickness + 0.03]);
	}
}

module palm_feets(thickness, palm_length, screw_plate_height) {
	translate([padding, palm_length - padding - thickness, 0])
		feet();
	translate([palm_width - leg_width - padding, palm_length - padding - thickness, 0])
		feet();
	translate([palm_width - leg_width - padding, padding - thickness, 0])
		feet();
	translate([padding, padding - thickness, 0])
		feet();
	module feet() {
		difference() {
			cube([leg_width, leg_thickness + thickness*2 + nozzle_size*2, palm_hook_height]);
			translate([leg_width/3 - nozzle_size, thickness - nozzle_size, 0.01])
				cube([leg_width/3 + nozzle_size*2, leg_thickness + nozzle_size*2, palm_hook_height + 0.02]);
			translate([leg_width / 2, leg_thickness*3 + 1, lock_diameter/2 + palm_screw_z])
				rotate([90])
				cylinder(leg_thickness*3 + 2, r=lock_diameter/2 + screw_safety);
		}
	}

	// // screw walls
	// translate([palm_width - padding - leg_width, padding + leg_thickness + nozzle_size])
	// 	screw_wall();
	// translate([padding, padding + leg_thickness + nozzle_size])
	// 	screw_wall();
	// module screw_wall() {
	// 	difference() {
	// 		translate([leg_width / 4, 0])
	// 			cube([leg_width / 2, thickness, screw_plate_height]);
	// 		// screw hole
	// 		translate([leg_width / 2, thickness/2 + 0.01, screw_diameter + palm_screw_z])
	// 			rotate([90])
	// 			cylinder(thickness + 1, r=screw_diameter/2 + screw_safety, center=true);
	// 	}
	// }
}
