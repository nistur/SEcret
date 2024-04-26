function inches(i) = i * 25.4;

display_mount_width=227;
display_mount_height=176;
display_mount_thickness=10;
display_mount_outside_radius=11;
display_mount_side_cutout_depth=6;

display_mount_cutout_width=184;
display_mount_cutout_height=135;
display_mount_cutout_radius=6;

display_mount_upper_mount_radius=10;
display_mount_upper_mount_yoffs=91;
display_mount_upper_mount_xoffs=39;
display_mount_upper_mount_inside_radius=5;

display_mount_lower_mount_radius=7;
display_mount_lower_mount_yoffs=99;
display_mount_lower_mount_xoffs=96.5;
display_mount_lower_mount_xseparation=132;
display_mount_lower_mount_hole_radius=2;
display_mount_lower_mount_inside_radius=4.8;
display_mount_lower_mount_depth=1;

display_mount_fixture_radius=9;
display_mount_fixture_xoffs=102.5;
display_mount_fixture_yoffs=77;
display_mount_fixture_depth=2;

lcd_width=211;
lcd_height=162;
lcd_thickness=4;
lcd_bracket_radius=2;
lcd_bracket_length=3.75;
lcd_bracket_width=7;
lcd_bracket_screw_radius=0.8;


motherboard_mount_width=170;
motherboard_mount_height=170;
motherboard_mount_height_offset=10;
motherboard_mount_width_offset=5;
motherboard_mount_thickness=4;
motherboard_mount_radius=11;
motherboard_mount_display_mount_radius=8;
motherboard_mount_display_mount_thickness=8;
motherboard_mount_display_mount_offset=60;
motherboard_mount_vertical_offset=10;
motherboard_mount_screw_size=3;
motherboard_mount_screw_head_size=7;
motherboard_mount_screw_head_depth=4;
motherboard_mount_hex_grid_radius=60;
motherboard_mount_hex_size=10;
motherboard_mount_hex_spacing=1;

motherboard_mount_mitx_screw_spacing_height=inches(6.2);
motherboard_mount_mitx_screw_spacing_width=inches(6.1);
motherboard_mount_mitx_screw_spacing_width_2offs=inches(0.9);
motherboard_mount_mitx_screw_xoffs=inches(0.4);
motherboard_mount_mitx_screw_yoffs=inches(0.25);
motherboard_mount_mitx_screw_insert_size=4.25;

motherboard_mount_screw_insert_size=4.25;
motherboard_mount_screw_insert_depth=4;

tie_bracket_height=170;
tie_bracket_thickness=4;


side_bracket_width = motherboard_mount_width;
side_bracket_height = motherboard_mount_height;
side_bracket_height_offset = motherboard_mount_height_offset;
side_bracket_thickness = motherboard_mount_thickness;
side_bracket_radius = motherboard_mount_radius;
side_bracket_display_mount_radius = motherboard_mount_display_mount_radius;
side_bracket_display_mount_thickness = motherboard_mount_display_mount_thickness;
side_bracket_display_mount_offset = motherboard_mount_display_mount_offset;
side_bracket_vertical_offset = motherboard_mount_vertical_offset;
side_bracket_screw_size = motherboard_mount_screw_size;
side_bracket_screw_head_size = motherboard_mount_screw_head_size;
side_bracket_screw_head_depth = motherboard_mount_screw_head_depth;
side_bracket_hex_grid_radius = motherboard_mount_hex_grid_radius;
side_bracket_hex_size = motherboard_mount_hex_size;
side_bracket_hex_spacing = motherboard_mount_hex_spacing;

clearance=0.2;

$fn = $preview ? 60 : 360;

project=0;
