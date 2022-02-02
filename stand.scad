include <variables.scad>;

module stand() {
	length = 160;
	tent_angle = 20;
	height = sin(tent_angle) * palm_width;
	floor_width = cos(tent_angle) * palm_width;
	thickness = 3;
	base_fatness = 10;
	stopper_length = 30;

	// base
	difference() {
		// extra thickness width is for the stopper
		cube([floor_width + thickness, length, thickness]);
		translate([base_fatness, base_fatness, -0.01])
			cube([floor_width - base_fatness*2, length - base_fatness*2, thickness + 0.02]);
	}

	// stoppers
	stopper();
	translate([0, length - stopper_length]) stopper();

	// feets
	translate([0, 0, thickness - 0.01]) {
		tri_feet();
		translate([0, length, 0])
			mirror([0, 1, 0])
			tri_feet();
		// middle
		translate([0, length/2 - thickness, 0]) {
			difference() {
				tri_feet();
				translate([base_fatness, -0.01, -0.01])
					cube([floor_width - base_fatness, thickness + 0.02, height]);
			}
			translate([thickness, 0.01])
				rotate([90, 0, -90])
				linear_extrude(thickness)
				polygon(points=[ [0, 0], [0, height - 2], [base_fatness, 0] ]);
		}
	}

	// hook
	hook_width = 12;
	hook_height = 12;
	translate([floor_width / 2, thickness / 2, thickness + height/2 - 0.01])
		rotate([0, tent_angle])
		translate([0, 0, hook_height / 2])
		difference() {
			cube([hook_width, thickness, hook_height], center=true);
			translate([0, 0, 2])
				rotate([90])
				cylinder(h=thickness + 0.02, d=screw_diameter, center=true);
		}

	module tri_feet() {
		translate([0, thickness]) {
			rotate([90])
				linear_extrude(thickness)
				polygon(points=[ [0, 0], [0, height], [floor_width, 0] ]);
			translate([0, -0.01])
				rotate([90, 0, 90])
				linear_extrude(thickness)
				polygon(points=[ [0, 0], [0, height - 2], [base_fatness, 0] ]);
		}
	}

	module stopper() {
		translate([floor_width - tan(tent_angle)*thickness, 0, 0])
			skew([0, tent_angle, 0, 0, 0, 0])
			cube([thickness, stopper_length, thickness + 6]);
	}
}
