include <modules/mod_tie_bracket.scad>

// rotating so that the STL that is exported is the correct orientation to print
rotate([0,180,0])
if (project == 0)
    tie_bracket();
else
    projection()
        tie_bracket();
