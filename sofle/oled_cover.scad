include <../variables.scad>;

cover_width = 21.815;
height = 9;

module oled_cover() {
	linear_extrude(height=plate_thickness)
		import("oled_cover.svg");
	translate([(cover_width - 10) / 2, 0, -height + 0.01])
		cube([10, plate_thickness, height]);
}
