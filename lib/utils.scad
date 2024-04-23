module __box_cross(x, y, z, r)
{
    // Create a cross shape out of cuboids
    translate([-x/2, -((y/2)-r), 0]) cube([x, y-(2*r), z]);
    translate([-((x/2)-r), -y/2, 0]) cube([x-(2*r), y, z]);
}

module __box_corners(x, y, z, r)
{
    // Add a cylinder into the corner of each box
    translate([((x/2)-r), ((y/2)-r), 0])cylinder(h=z, r=r);
    translate([((x/2)-r), -((y/2)-r), 0])cylinder(h=z, r=r);
    translate([-((x/2)-r), ((y/2)-r), 0])cylinder(h=z, r=r);
    translate([-((x/2)-r), -((y/2)-r), 0])cylinder(h=z, r=r);
}

module rounded_box(x, y, z, r)
{
    // Simple box with radiused corners
    // Created by creating two overlapping cuboids
    // and then adding cylinders in the corners
    union()
    {
        __box_cross(x, y, z, r);
        __box_corners(x, y, z, r);
    }
}


module hex_grid(s, gap, nx, ny, thickness)
{
    cos30= cos(30);
    // Move the grid back so that it's centered on the origin (X/Y)
    translate([-(nx*(s+gap)*cos30)/2,-(s+gap)/2*ny,0])
    for(j = [0 : nx])
    {
	for(i = [0 : ny])
	{
	    // Offset every other row
	    offs = (j % 2) * ((s + gap)/2);
	    // hexes are created by making cylinders with 6 edges
	    // This might not be perfectly accurately calculated, but for
	    // most hex-grid situations, it's good enough
	    translate([j*(s+gap)*cos30, offs + i*(s+gap), 0])
		cylinder(r=s/2, h=thickness, $fn=6);
	}
    }
}


module screw(size,length,head_size,head_depth)
{
    union()
    {
	translate([0,0,-length]) cylinder(r=size/2,h=length+(head_depth/2));
	cylinder(r=head_size/2,h=head_depth);
    }
}

module _mount_bracket()
{
    difference()
    {
	union()
	{
	    cylinder(r=motherboard_mount_display_mount_radius,h=motherboard_mount_display_mount_thickness);
	    translate([-motherboard_mount_display_mount_radius,0, 0])
		cube([motherboard_mount_display_mount_radius*2,motherboard_mount_display_mount_radius,motherboard_mount_display_mount_thickness]);
	}
	translate([-motherboard_mount_display_mount_radius-0.1,-motherboard_mount_display_mount_radius,motherboard_mount_display_mount_radius * 2 + motherboard_mount_display_mount_thickness/2])
	    rotate([0,90,0]) cylinder(r=motherboard_mount_display_mount_radius * 2,h=0.2+motherboard_mount_display_mount_radius*2);
    }
}

module mount_bracket()
{
    difference()
    {
	_mount_bracket();
	translate([0,0,clearance+motherboard_mount_display_mount_thickness-motherboard_mount_screw_head_depth])
	    screw(motherboard_mount_screw_size,
		  motherboard_mount_display_mount_thickness,
		  motherboard_mount_screw_head_size,
		  motherboard_mount_screw_head_depth);
    }
}
