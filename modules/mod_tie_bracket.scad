include<../lib/utils.scad>
include<../params.scad>

module _tie_mount()
{
	union()
	{
	    cylinder(r=motherboard_mount_display_mount_radius,h=tie_bracket_thickness);
	    translate([-motherboard_mount_display_mount_radius,0, 0])
		cube([motherboard_mount_display_mount_radius*2,motherboard_mount_display_mount_radius,tie_bracket_thickness]);
	}
}

module tie_mount()
{
    union()
    {
	difference()
	{
	    _tie_mount();
	    
	    translate([0,0,-0.1]) cylinder(r=(motherboard_mount_screw_insert_size/2)+clearance, h=tie_bracket_thickness+0.2);
	}
	
	translate([-motherboard_mount_display_mount_radius,motherboard_mount_display_mount_radius,0]) cube([motherboard_mount_display_mount_radius*2,motherboard_mount_thickness,tie_bracket_thickness]);
    }
}

module tie_base_inner()
{
    w=(display_mount_cutout_width)/2;
    h=tie_bracket_height;
    translate([0,-clearance,0])
    difference()
    {
	translate([-display_mount_cutout_width/2, 0, 0]) cube([display_mount_cutout_width,tie_bracket_thickness+clearance*2,tie_bracket_height]);
	translate([-w+motherboard_mount_display_mount_radius,tie_bracket_thickness+clearance,0])
	    scale([w,1,h])
	    rotate([90,0,0])
	    cylinder(r=1,h=tie_bracket_thickness+(2*clearance),$fn=$fn*4);
	translate([w-motherboard_mount_display_mount_radius,tie_bracket_thickness+clearance,0])
	    scale([w,1,h])
	    rotate([90,0,0])
	    cylinder(r=1,h=tie_bracket_thickness+(2*clearance),$fn=$fn*4);
	translate([-display_mount_cutout_width/2, -clearance, tie_bracket_height-(motherboard_mount_display_mount_radius*2)]) cube([display_mount_cutout_width,tie_bracket_thickness+clearance*2,motherboard_mount_display_mount_radius*2]);
    }
}

module tie_base()
{
    w=(display_mount_cutout_width-motherboard_mount_display_mount_radius*2)/2;
    h=tie_bracket_height-(motherboard_mount_display_mount_radius*2);
    difference()
    {
	translate([-display_mount_cutout_width/2, 0, 0]) cube([display_mount_cutout_width,tie_bracket_thickness,tie_bracket_height]);
	translate([-w-motherboard_mount_display_mount_radius,tie_bracket_thickness+clearance,0])
	    scale([w,1,h])
	    rotate([90,0,0])
	    cylinder(r=1,h=tie_bracket_thickness+(2*clearance),$fn=$fn*4);
	translate([w+motherboard_mount_display_mount_radius,tie_bracket_thickness+clearance,0])
	    scale([w,1,h])
	    rotate([90,0,0])
	    cylinder(r=1,h=tie_bracket_thickness+(2*clearance),$fn=$fn*4);

	tie_base_inner();
    }
}

module tie_bracket()
{    
    union()
    {
	tie_base();
	translate([0,motherboard_mount_display_mount_radius + tie_bracket_thickness,0]) rotate([0,0,180]) mount_bracket();
	translate([-(display_mount_cutout_width/2)-motherboard_mount_display_mount_radius-motherboard_mount_thickness,0,tie_bracket_height-motherboard_mount_display_mount_radius]) rotate([-90,-90,0])
	{
	    tie_mount();
	}
	
	translate([(display_mount_cutout_width/2)+motherboard_mount_display_mount_radius+motherboard_mount_thickness,0,tie_bracket_height-motherboard_mount_display_mount_radius]) rotate([-90,90,0])
	{
	    tie_mount();
	}
    }
}
