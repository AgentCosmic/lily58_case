module pcb_cover(height, thickness) {
	difference() {
		linear_extrude(height=height)
			offset(r=3)
			import("pcb.svg");
		translate([0, 0, -0.01])
		linear_extrude(height=height + 0.02)
			offset(r=3 - thickness)
			import("pcb.svg");
	}
}
