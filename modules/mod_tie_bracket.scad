module tie_bracket()
{

    x1=0;
    x2=display_mount_cutout_width/2;
    y1=0;
    y2=tie_bracket_height;

    c=tie_bracket_height/2;
    m=-0.85;

    px = x1 + (x2-x1)/2;
    py = y1 + (y2-y1)/2;
    nx = -(y2-y1);
    ny = -(x2-x1);
    nm = (py+ny)/(px+nx);
    nc = py - (nm * px);

    // m is negative for reasons
    rx = (nc + c) / (nm - m);
    ry = (m * rx) + c;

    dx = rx - nx;
    dy = ry - ny;
    r = sqrt((rx * rx) + (ry * ry));

    difference()
    {
	translate([-display_mount_cutout_width/2, 0, 0]) cube([display_mount_cutout_width,tie_bracket_thickness,tie_bracket_height]);   
	translate([ rx+10,tie_bracket_thickness+clearance,ry]) rotate([90,0,0]) cylinder(r=r,h=tie_bracket_thickness+(2*clearance), $fn=$fn*4);
	translate([-rx-10,tie_bracket_thickness+clearance,ry]) rotate([90,0,0]) cylinder(r=r,h=tie_bracket_thickness+(2*clearance), $fn=$fn*4);
    }
}
