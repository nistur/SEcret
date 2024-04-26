standoff_size=8;


module standoff(h=8)
{
    color("yellow")
	translate([0,0,-(h+6)])
    {
	cylinder(d=3,h=6);
	translate([0,0,6]) cylinder(d=5.543,h=h,$fn=6);
    }
}

module driver()
{
    for(i=[0,1])
	rotate([0,0,90*i])
    difference()
    {
	translate([-0.4,-2.5,0]) cube([0.8,5,5]);
	translate([-1,1,0])rotate([-26.5,0,0])cube([2,10,10]);
	translate([1,-1,0])rotate([-26.5,0,180])cube([2,10,10]);
    }
}

module itx_screw()
{
    color([0.8,0.8,0.8])
    {
	translate([0,0,-5]) cylinder(d=3,h=5);
	    difference()
	{
	scale([1,1,0.5])
	    sphere(d=5);
	    translate([-2.5,-2.5,-5]) cube([5,5,5]);
	    driver();
	}
    }
}

module mini_itx()
{
    screwpos=[[10.16,6.35],
	      [10.16+154.94,6.35],
	      [10.16+22.46,6.35+157.48],
	      [10.16+154.94,6.35+157.48]];
    difference()
    {
	union()
	{
	    color("green") cube([170,170,1.57]);

	    translate([0,6.35+7.52,1.57])
	    color("black") cube([27,158.75,39]);
	}

	for(screw = screwpos)
	{
	    translate([screw[0],screw[1],-0.015])
	    cylinder(d=3.96,h=1.6);
	}
    }

    
	for(screw = screwpos)
	{
	    translate([screw[0],screw[1],0])
	    {
		standoff(standoff_size);
		translate([0,0,1.6])
		itx_screw();
	    }
	}
    
}
