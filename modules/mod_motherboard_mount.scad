include<../lib/utils.scad>
include<../params.scad>

module mb_base()
{
    difference()
    {
	rounded_box(motherboard_mount_width, motherboard_mount_height+motherboard_mount_height_offset, motherboard_mount_thickness, motherboard_mount_radius);
	nhex = 2*motherboard_mount_hex_grid_radius / motherboard_mount_hex_size;
	intersection()
	{
	    translate([0,motherboard_mount_height_offset,-clearance]) cylinder(r=motherboard_mount_hex_grid_radius, h=motherboard_mount_thickness+(2*clearance));
	    translate([0, motherboard_mount_height_offset, -clearance]) hex_grid(motherboard_mount_hex_size, motherboard_mount_hex_spacing, nhex, nhex, motherboard_mount_thickness + (2*clearance));
	}
    }
}

module _mb_display_mount()
{
    union()
    {
	cylinder(r=motherboard_mount_display_mount_radius,h=motherboard_mount_display_mount_thickness);
	translate([-motherboard_mount_display_mount_radius,0, 0])
	    cube([motherboard_mount_display_mount_radius*2,motherboard_mount_display_mount_radius,motherboard_mount_display_mount_thickness]);
    }
}

module mb_display_mount()
{
    translate([0,
	       -(motherboard_mount_height+motherboard_mount_height_offset)/2,
	       motherboard_mount_display_mount_radius+motherboard_mount_thickness])
	rotate([-90,0,0])
    difference()
    {
	_mb_display_mount();
	translate([0,0,clearance+motherboard_mount_display_mount_thickness-motherboard_mount_screw_head_depth])
	    screw(motherboard_mount_screw_size,
		  motherboard_mount_display_mount_thickness,
		  motherboard_mount_screw_head_size,
		  motherboard_mount_screw_head_depth);
    }
}

module mb_display_mounts()
{
    translate([ motherboard_mount_display_mount_offset,0,0]) mb_display_mount();
    translate([-motherboard_mount_display_mount_offset,0,0]) mb_display_mount();
}

module mb_mitx_screwmounts()
{
    // I have mixed up X and Y here - this is because I created the mount in one orientation, then looked at the mobo
    // and decided it made sense to me in another orientation. I may change this later
    x0=(motherboard_mount_width/2)-motherboard_mount_mitx_screw_yoffs;
    y0=((motherboard_mount_height+motherboard_mount_height_offset)/2)-motherboard_mount_mitx_screw_xoffs;
    y1=y0-motherboard_mount_mitx_screw_spacing_width;
    x1=x0-motherboard_mount_mitx_screw_spacing_height;
    y2=y0-motherboard_mount_mitx_screw_spacing_width_2offs;
    
    translate([x0,y0,-clearance]) cylinder(r=(motherboard_mount_mitx_screw_insert_size/2) + clearance, h=motherboard_mount_thickness + (2*clearance));
    translate([x0,y1,-clearance]) cylinder(r=(motherboard_mount_mitx_screw_insert_size/2) + clearance, h=motherboard_mount_thickness + (2*clearance));
    translate([x1,y1,-clearance]) cylinder(r=(motherboard_mount_mitx_screw_insert_size/2) + clearance, h=motherboard_mount_thickness + (2*clearance));
    translate([x1,y2,-clearance]) cylinder(r=(motherboard_mount_mitx_screw_insert_size/2) + clearance, h=motherboard_mount_thickness + (2*clearance));
}

module motherboard_mount()
{
    difference()
    {
	union()
	{
	    mb_base();
	    mb_display_mounts();
	}
	mb_mitx_screwmounts();
    }
}