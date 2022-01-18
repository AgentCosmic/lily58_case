module bottom_plate(thickness, radius, palm_length, palm_width) {
	color("DarkSlateGray")
		translate([-83, 135, 2])
		scale([1, 1, 5 / 4]) // original thickness is 16mm
		import("lily58_bottom_plate.stl", center=true);

	// base plate
	color("Blue")
	translate([20.5, 0, 0]) {
		linear_extrude(height=thickness)
			polygon(points=[
					[0, -8], [14, 0], [73, 0], [73, 16], [palm_width, 16],
					[palm_width, -palm_length + radius], [0, -palm_length + radius]
				]
			);

		// smooth corners
		translate([0, -palm_length + radius])
		linear_extrude(height=thickness)
		hull() {
			translate([radius, 0]) circle(radius);
			translate([palm_width - radius, 0]) circle(radius);
		}
	}
}
