include<../lib/utils.scad>
include<../params.scad>

module side_base()
{
    difference()
    {
	rounded_box(side_bracket_width, side_bracket_height+side_bracket_height_offset, side_bracket_thickness, side_bracket_radius);
	nhex = 2*side_bracket_hex_grid_radius / side_bracket_hex_size;
	intersection()
	{
	    translate([0,side_bracket_height_offset,-clearance]) cylinder(r=side_bracket_hex_grid_radius, h=side_bracket_thickness+(2*clearance));
	    translate([0, side_bracket_height_offset, -clearance]) hex_grid(side_bracket_hex_size, side_bracket_hex_spacing, nhex, nhex, side_bracket_thickness + (2*clearance));
	}
    }
}

module side_tie_mount()
{
    translate([side_bracket_width/2,((tie_bracket_height-side_bracket_height_offset)/2)-side_bracket_display_mount_radius,side_bracket_thickness + side_bracket_display_mount_radius])
    rotate([-90,0,0])
    rotate([0,-90,0])
	mount_bracket();
}

module side_display_mount()
{
    translate([0,
	       -(side_bracket_height+side_bracket_height_offset)/2,
	       side_bracket_display_mount_radius+side_bracket_thickness])
	rotate([-90,0,0])
	mount_bracket();
}

module side_display_mounts()
{
    translate([ side_bracket_display_mount_offset,0,0]) side_display_mount();
    translate([-side_bracket_display_mount_offset,0,0]) side_display_mount();
}

module side_bracket()
{
    difference()
    {
	union()
	{
	    side_base();
	    side_display_mounts();
	    side_tie_mount();
	}
    }
}

