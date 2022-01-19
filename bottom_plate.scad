include <variables.scad>;
use <palm_rest.scad>;

module bottom_plate(thickness, radius, plate_length, plate_width, palm_length, palm_height) {
	color("DarkSlateGray")
		translate([-83, 135, 2])
		scale([1, 1, 5 / 4]) // original thickness is 16mm
		import("lily58_bottom_plate.stl", center=true);

	difference() {
		plate();
		translate([plate_x_offset, -plate_length]) 
			palm_rest(plate_width, palm_height, palm_length, radius, thickness);
	}

	module plate() {
		color("Blue")
		translate([plate_x_offset, 0, 0]) {
			linear_extrude(height=thickness)
				polygon(points=[
						[0, -8], [14, 0], [73, 0], [73, 16], [plate_width, 16],
						[plate_width, -plate_length + radius], [0, -plate_length + radius]
					]
				);

			// smooth corners
			translate([0, -plate_length + radius])
			linear_extrude(height=thickness)
			hull() {
				translate([radius, 0]) circle(radius);
				translate([plate_width - radius, 0]) circle(radius);
			}

			// palm feet support
			translate([0, -plate_length - 0.01, thickness]) 
				palm_feets(thickness, 10, 2, plate_width, palm_length, 10);
		}
	}
}
