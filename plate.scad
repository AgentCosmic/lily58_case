color("DarkSlateGray")
	translate([119, 15, 0 ])
	import("bottom_plate.stl", center=true);

thickness = 3;
radius = 5;
hook_depth = 5;
palm_length = 90;
palm_width = 129;
rest_length = 70;

translate([14, 0]) {
	// base plate
	color("Blue")
	linear_extrude(height=3)
		polygon(points=[
				[0, -17], [34, 1], [96, 1], [palm_width, 10],
				[palm_width, -palm_length + radius], [palm_width - radius, -palm_length], [radius, -palm_length], [0, -palm_length + radius]
			]
		);

	translate([0, -palm_length, 20])
		palm_rest(palm_width, 10, rest_length, radius, thickness);

	color("RoyalBlue")
	translate([radius, -palm_length + thickness, 0.5]) // 0.5 mm spacing for wiggle room
		hook(palm_width - radius * 2, hook_depth, thickness);
}

module hook(width, depth, thickness) {
	// hook ceiling
	translate([0, 0, thickness * 2])
		cube([width, depth + thickness, thickness]);
	// hook wall
	translate([0, depth, 0])
		cube([width, thickness, thickness * 3]);
}

module palm_rest(width, height, length, radius, thickness) {
	translate([radius, radius, height - thickness])
		cube([width - radius * 2, length - radius * 2, thickness]);
}
