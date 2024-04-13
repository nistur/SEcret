include <modules/mod_display_mount.scad>

// rotating so that the STL that is exported is the correct orientation to print
rotate([0,180,0]) display_mount();
