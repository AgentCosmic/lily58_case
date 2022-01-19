use <bottom_plate.scad>;
use <palm_rest.scad>;

bottom_plate_thickness = 2;
bevel = 3;
plate_length = 100;
plate_width = 121.95;
palm_length = 70;
palm_height = 15;
plate_x_offset = 20.5;

difference() {
	bottom_plate(bottom_plate_thickness, bevel, plate_length, plate_width, palm_length, palm_height);
	translate([plate_x_offset, -plate_length]) 
		palm_rest(plate_width, palm_height, palm_length, bevel, bottom_plate_thickness);
}

translate([plate_x_offset, -plate_length]) {
	palm_rest(plate_width, palm_height, palm_length, bevel, bottom_plate_thickness);
}
