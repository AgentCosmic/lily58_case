include <variables.scad>;

padding = 10;

module palm_rest(width, height, length, radius, floor_thickness) {
	thickness = 2;

	// top plate
	translate([0, radius, height - thickness])
		cube([width, length - radius, thickness]);
	// round corners
	translate([0, length, height - thickness])
		linear_extrude(height=thickness)
		hull() {
			translate([radius, 0]) circle(radius);
			translate([width - radius, 0]) circle(radius);
		}

	// curve
	translate([width, radius + 0.01, height - radius])
	rotate([90, 0, -90])
	intersection() {
		difference() {
			cylinder(width*2, r=radius, center=true, $fn=16);
			cylinder(width*2 + 1, r=radius - thickness, center=true, $fn=16);
		}
		cube([radius, radius, width*2]);
	}

	leg_width = 20;
	translate([padding, length - padding])
		palm_leg(leg_width, thickness, height, floor_thickness);
	translate([width - padding, length - padding + thickness])
		rotate([0, 0, 180])
		palm_leg(leg_width, thickness, height, floor_thickness);
	translate([width - padding, padding + thickness])
		rotate([0, 0, 180])
		palm_leg(leg_width, thickness, height, floor_thickness);
	translate([padding, padding])
		palm_leg(leg_width, thickness, height, floor_thickness);
}

module palm_leg(width, thickness, height, floor_thickness) {
	difference() {
		translate([0, 0, floor_thickness + 0.01]) // elevate so it won't touch the floor
			cube([width, thickness, height - floor_thickness]);
		// screw hole
		translate([width / 2, 1, floor_thickness + screw_diameter + 4])
			rotate([90])
			cylinder(thickness + 2, r=screw_diameter, center=true);
	}
	// feet hook
	translate([0, 0, -0.01]) // so it goes through the floor
		cube([width / 2, thickness, floor_thickness + 0.03]); // 1 for floor bottom, 1 for floor top, 1 for feet bottom
}

module palm_feets(thickness, width, height, palm_width, palm_length) {
	translate([padding - thickness, palm_length - padding - thickness, height])
		feet();
	translate([palm_width - width - padding - thickness, palm_length - padding - thickness, height])
		feet();
	translate([palm_width - width - padding - thickness, padding - thickness, height])
		feet();
	translate([padding - thickness, padding - thickness, height])
		feet();
	module feet() {
		cube([width + thickness*2, thickness*3, height]);
	}
}
