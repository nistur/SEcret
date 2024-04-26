include<modules/mod_display_mount.scad>
include<modules/mod_motherboard_mount.scad>
include<modules/mod_tie_bracket.scad>
include<modules/mod_side_bracket.scad>

include<ref/ref_mini_itx.scad>
col_1=[0.5,0.5,1];
col_2=[1,0.5,0.5];
col_3=[0.5,1,0.5];
col_4=[0.8,0,0.8];


color(col_1)
display_mount();

color(col_2)
translate([-(display_mount_cutout_width/2),
	   -motherboard_mount_vertical_offset,
	   display_mount_thickness+((motherboard_mount_height+motherboard_mount_height_offset)/2)]) rotate([90,0,0]) rotate([0,270, 0])
motherboard_mount();


color(col_3)
translate([0,
	   (motherboard_mount_width/2)-motherboard_mount_vertical_offset,
	   display_mount_thickness]) 
tie_bracket();

color(col_4)
translate([(display_mount_cutout_width/2),
	   -motherboard_mount_vertical_offset,
	   display_mount_thickness+((motherboard_mount_height+motherboard_mount_height_offset)/2)]) rotate([90,0,0]) rotate([0,90, 0]) 
side_bracket();


if($preview)
{
    translate([standoff_size-(display_mount_cutout_width/2),
	       -motherboard_mount_width_offset-motherboard_mount_vertical_offset-motherboard_mount_width/2,
	       display_mount_thickness + motherboard_mount_height + motherboard_mount_height_offset])  rotate([0, 90, 0])
	mini_itx();
}
