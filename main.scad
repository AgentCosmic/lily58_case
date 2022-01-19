include <variables.scad>;
use <bottom_plate.scad>;
use <palm_rest.scad>;

bottom_plate_thickness = 2;
bevel = 3;
plate_length = 100;
plate_width = 121.95;
palm_length = 70;
palm_height = 15;

bottom_plate(bottom_plate_thickness, bevel, plate_length, plate_width, palm_length, palm_height);

color("RoyalBlue")
translate([plate_x_offset, -plate_length]) {
	palm_rest(plate_width, palm_height, palm_length, bevel, bottom_plate_thickness);
}
