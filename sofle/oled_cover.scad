include <../variables.scad>;

cover_width = 21.815;
stand_width = 10;
oled_standoff_height = 15;
stand_height = oled_standoff_height - 5; // stand should only cover above the top plate

module oled_cover() {
	linear_extrude(height=plate_thickness)
		import("oled_cover.svg");
	// stand is place below the ground
	translate([(cover_width - stand_width) / 2, 0, -stand_height + 0.01])
		cube([stand_width, plate_thickness, stand_height]);
}

rotate([0, 180]) oled_cover();
