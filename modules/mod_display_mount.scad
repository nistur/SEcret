include<../lib/utils.scad>
include<../params.scad>

module dm_upper_mount()
{
    union()
    {
	cylinder(r=display_mount_upper_mount_radius,h=display_mount_thickness);
	length=display_mount_upper_mount_yoffs-(display_mount_cutout_height/2);
	translate([-display_mount_upper_mount_radius,-length,0])
	    cube([2*display_mount_upper_mount_radius, length, display_mount_thickness]);
    }
    
}

module dm_upper_mount_holes()
{
    translate([0,0,-1]) cylinder(r=display_mount_upper_mount_inside_radius+clearance, h=display_mount_thickness+2);
}

module dm_lower_mount()
{
    union()
    {
	cylinder(r=display_mount_lower_mount_radius,h=display_mount_thickness);
	length=display_mount_lower_mount_yoffs-(display_mount_cutout_height/2);
	translate([-display_mount_lower_mount_radius,0,0])
	    cube([2*display_mount_lower_mount_radius, length, display_mount_thickness]);
    }
}

module dm_lower_mount_holes()
{
    translate([0,0,-clearance])
	cylinder(r=display_mount_lower_mount_hole_radius+clearance, h=display_mount_thickness+(2*clearance));
    translate([0,0,-clearance])
	cylinder(r=display_mount_lower_mount_inside_radius+clearance, h=display_mount_lower_mount_depth+(clearance*2));
    
}

module dm_motherboard_mount_holes()
{
    translate([-(display_mount_cutout_width/2)-(motherboard_mount_display_mount_radius+motherboard_mount_thickness),
	       0,
	       display_mount_thickness-(motherboard_mount_screw_insert_size)])
    {
	translate([0,motherboard_mount_display_mount_offset, 0])
	    cylinder(r=(motherboard_mount_screw_insert_size/2)+clearance, h=motherboard_mount_screw_insert_depth+(2*clearance));
	translate([0,-motherboard_mount_display_mount_offset, 0])
	    cylinder(r=(motherboard_mount_screw_insert_size/2)+clearance, h=motherboard_mount_screw_insert_depth+(2*clearance));
    }
    translate([+(display_mount_cutout_width/2)+(motherboard_mount_display_mount_radius+motherboard_mount_thickness),
	       0,
	       display_mount_thickness-(motherboard_mount_screw_insert_size)])
    {
	translate([0,motherboard_mount_display_mount_offset, 0])
	    cylinder(r=(motherboard_mount_screw_insert_size/2)+clearance, h=motherboard_mount_screw_insert_depth+(2*clearance));
	translate([0,-motherboard_mount_display_mount_offset, 0])
	    cylinder(r=(motherboard_mount_screw_insert_size/2)+clearance, h=motherboard_mount_screw_insert_depth+(2*clearance));
    }
    
    translate([0,
	       (motherboard_mount_width/2) + tie_bracket_thickness + motherboard_mount_display_mount_radius,
	       display_mount_thickness-(motherboard_mount_screw_insert_size)])
	cylinder(r=(motherboard_mount_screw_insert_size/2)+clearance, h=motherboard_mount_screw_insert_depth+(2*clearance));
}

module dm_side_cutout()
{
    // This is a lot of maths, but basically, it calculates a cylinder, by which a chord of length L, would fit
    // in between the two fixtures on that side, and of height h, which is specified by the depth of the cutout
    // If then calculates how much to move this cylinder so that the requested chord will be in the correct locations
    // chord calculation:
    // r= (L^2)/(8h) + h/2
    h=display_mount_side_cutout_depth;
    L=(display_mount_fixture_xoffs-(display_mount_outside_radius*2))*2;
    r=((L*L)/(8*h)) + (h/2);
    x = sin(acos((L/2)/r)) * r;
    offs=((display_mount_width/2)+r)-(r-x);
    translate([offs,0,-clearance]) cylinder(r=r,h=display_mount_thickness+(2*clearance), $fn=$fn*4);
    translate([-offs,0,-clearance]) cylinder(r=r,h=display_mount_thickness+(2*clearance), $fn=$fn*4);
}

module dm_base()
{
    union()
    {
	difference()
	{
	    union()
	    {
		rounded_box(display_mount_width, display_mount_height, display_mount_thickness, display_mount_outside_radius);
		translate([ display_mount_upper_mount_xoffs,display_mount_upper_mount_yoffs,0]) dm_upper_mount();
		translate([-display_mount_upper_mount_xoffs,display_mount_upper_mount_yoffs,0]) dm_upper_mount();
		
		translate([display_mount_lower_mount_xoffs,-display_mount_lower_mount_yoffs,0]) dm_lower_mount();
		translate([display_mount_lower_mount_xoffs-display_mount_lower_mount_xseparation,-display_mount_lower_mount_yoffs,0]) dm_lower_mount();
		
		translate([0,
		    (motherboard_mount_width/2) + tie_bracket_thickness + motherboard_mount_display_mount_radius - motherboard_mount_vertical_offset,
		    0]) cylinder(r=motherboard_mount_display_mount_radius, h=display_mount_thickness);
	
            }
            dm_side_cutout();
        }
        translate([-(display_mount_cutout_width/2)-(motherboard_mount_display_mount_radius+motherboard_mount_thickness),
		   motherboard_mount_display_mount_offset-motherboard_mount_vertical_offset,
		   0])
	cylinder(r=motherboard_mount_display_mount_radius, h=display_mount_thickness);
	
        translate([(display_mount_cutout_width/2)+(motherboard_mount_display_mount_radius+motherboard_mount_thickness),
		   motherboard_mount_display_mount_offset-motherboard_mount_vertical_offset,
		   0])
	cylinder(r=motherboard_mount_display_mount_radius, h=display_mount_thickness);
    }    
}

module dm_fixture()
{
    translate([0,0,-clearance]) cylinder(r=display_mount_fixture_radius+clearance, h=display_mount_fixture_depth+clearance*2);
}

module dm_lcd_quarter()
{
    union()
    {
	translate([-clearance,-clearance, -clearance]) cube([(lcd_width/2)+clearance,(lcd_height/2)+clearance,lcd_thickness+(2*clearance)]);
	translate([(lcd_width/2) + lcd_bracket_length-lcd_bracket_radius,(lcd_height/2)-lcd_bracket_radius,-clearance])
	{
	    cylinder(r=lcd_bracket_radius, h=lcd_thickness+(2*clearance));
	    cylinder(r=lcd_bracket_screw_radius, h=display_mount_thickness+(2*clearance));
	    translate([-(lcd_bracket_length-lcd_bracket_radius)-clearance,-lcd_bracket_radius,0]) cube([lcd_bracket_length-lcd_bracket_radius+clearance,lcd_bracket_radius*2,lcd_thickness+(2*clearance)]);

	    // This is nasty and the only bit so far that has magic numbers - can't figure out how to do this in SCAD otherwise
	    translate([lcd_bracket_radius-lcd_bracket_length,lcd_bracket_radius-lcd_bracket_width,0]) rotate([0,0,48.5]) cube([4.9,3,lcd_thickness+(2*clearance)]);
	}
    }
}

module dm_lcd_half()
{
    union()
    {
        dm_lcd_quarter();
	mirror(v=[1,0,0]) dm_lcd_quarter();
    }
}

module dm_lcd()
{
    union()
    {
        dm_lcd_half();
	mirror(v=[0,1,0]) dm_lcd_half();
    }
}

module display_mount()
{
    difference()
    {
	dm_base();

	translate([ display_mount_upper_mount_xoffs,display_mount_upper_mount_yoffs,0]) dm_upper_mount_holes();
	translate([-display_mount_upper_mount_xoffs,display_mount_upper_mount_yoffs,0]) dm_upper_mount_holes();

	
	translate([display_mount_lower_mount_xoffs,-display_mount_lower_mount_yoffs,0]) dm_lower_mount_holes();
	translate([display_mount_lower_mount_xoffs-display_mount_lower_mount_xseparation,-display_mount_lower_mount_yoffs,0]) dm_lower_mount_holes();
	
	translate([0,0,-1]) rounded_box(display_mount_cutout_width, display_mount_cutout_height, display_mount_thickness + 2, display_mount_cutout_radius);

	translate([ display_mount_fixture_xoffs, display_mount_fixture_yoffs, 0]) dm_fixture();
	translate([ display_mount_fixture_xoffs,-display_mount_fixture_yoffs, 0]) dm_fixture();
	translate([-display_mount_fixture_xoffs, display_mount_fixture_yoffs, 0]) dm_fixture();
	translate([-display_mount_fixture_xoffs,-display_mount_fixture_yoffs, 0]) dm_fixture();

	translate([0,-motherboard_mount_vertical_offset,0]) dm_motherboard_mount_holes();
	
	dm_lcd();
    }
}
