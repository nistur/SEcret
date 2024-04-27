module _psu(w, h, d, f)
{
    difference()
    {
	cube([w,d,h]);
	translate([w/2,d/2,h-9]) cylinder(d=f,h=10);
    }
}

module _c13()
{
    difference()
    {
	cube([29,20,21.5]);
	translate([-1,-1,12]) rotate([0,-45,0]) cube([29,22,21.5]);
	translate([30,-1,12]) rotate([0,45,0]) translate([-29,0,0]) cube([29,22,21.5]);
	translate([(29-2.5)/2,-1,2+((21.5-5)/2)]) cube([2.5,10,5]);
	translate([7+((29-2.5)/2),-1,-2+((21.5-5)/2)]) cube([2.5,10,5]);
	translate([-7+((29-2.5)/2),-1,-2+((21.5-5)/2)]) cube([2.5,10,5]);
    }
}

module atx_psu()
{
    color([0.3,0.3,0.3])
    difference()
    {
	_psu(150,86,150, 120);
	translate([132,130,30]) rotate([0,0,-90]) _c13();
    }
}

module sfxl_psu()
{
    color([0.3,0.3,0.3])
	_psu(124,63.5,130,120);
}

module sfx_psu()
{
    color([0.3,0.3,0.3])
    difference()
    {
	_psu(100,63.5,130,90);
    
	translate([82,110,30]) rotate([0,0,-90]) _c13();
    }
}
