module palm_rest(width, height, length, radius, floor_thickness) {
	thickness = 2;
	radius = 5;
	padding = 10;

	// top plate
	translate([0, radius, height - thickness])
		cube([width, length, thickness]);

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
	translate([0, 0, floor_thickness])
		cube([width, thickness, height - floor_thickness]);
	cube([width/2, thickness, height - floor_thickness]);
}
