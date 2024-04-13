include <modules/mod_display_mount.scad>
include <modules/mod_motherboard_mount.scad>
include <modules/mod_tie_bracket.scad>

col_1=[0.5,0.5,1];
col_2=[1,0.5,0.5];
col_3=[0.5,1,0.5];


color(col_1)
display_mount();

color(col_2)
translate([-(display_mount_cutout_width/2),
	   -motherboard_mount_vertical_offset,
	   display_mount_thickness+((motherboard_mount_height+motherboard_mount_height_offset)/2)]) rotate([90,0,0]) rotate([0,270, 0]) motherboard_mount();


color(col_3)
translate([0,
	   (motherboard_mount_width/2)-motherboard_mount_vertical_offset,
	   display_mount_thickness]) 
tie_bracket();
