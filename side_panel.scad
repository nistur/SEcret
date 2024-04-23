include<modules/mod_side_bracket.scad>

if (project == 0)
    side_bracket();
else
    projection()
        side_bracket();

