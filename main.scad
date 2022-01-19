use <bottom_plate.scad>;
use <palm_rest.scad>;

bottom_plate_thickness = 2;
bevel = 3;
palm_length = 100;
palm_width = 121.95;
palm_rest_length = 70;
palm_x_offset = 20.5;

difference() {
	union() {
		bottom_plate(bottom_plate_thickness, bevel, palm_length, palm_width);
		color("RoyalBlue")
		translate([palm_x_offset, -palm_length - 0.01]) 
			palm_feets(bottom_plate_thickness, 10, 2, palm_width, palm_rest_length);
	}
	translate([palm_x_offset, -palm_length]) 
		palm_rest(palm_width, 15, palm_rest_length, bevel, bottom_plate_thickness);
}

translate([palm_x_offset, -palm_length]) {
	palm_rest(palm_width, 15, palm_rest_length, bevel, bottom_plate_thickness);
}
