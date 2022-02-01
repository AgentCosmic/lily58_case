include <../variables.scad>;
use <../palm_rest.scad>;

module top_plate(thickness) {
	difference() {
		linear_extrude(height=thickness)
			import("top_plate.svg");
		translate([0, 0, -0.5])
			linear_extrude(height=thickness + 2)
			import("screw_holes.svg");
		translate([0, 0, -0.5])
			linear_extrude(height=thickness + 2)
			import("key_holes.svg");
	}

	// pcb outline
	outline_height = 5 - thickness - 0.5;
	translate([0, 0, -outline_height + 0.01])
	difference() {
		linear_extrude(height=outline_height)
			import("pcb_outline.svg");
		translate([0, 0, -0.01])
			linear_extrude(height=outline_height + 0.02)
			offset(r=-nozzle_size*3)
			import("pcb_outline.svg");
		translate([-1, 126, - 1])
			cube([24, 60, 5]);
	}
}
