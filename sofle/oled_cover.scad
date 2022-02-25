include <../variables.scad>;

module oled_cover() {
	linear_extrude(height=plate_thickness)
		import("oled_cover.svg");
}
