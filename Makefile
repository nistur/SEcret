OBJS=display_mount.stl 		\
	motherboard_mount.stl	\
	side_panel.stl       	\
	tie_bracket.stl 	\
	bracket.stl		\
	motherboard_mount.svg 	\
	side_panel.svg       	\
	tie_bracket.svg

.phony: all

all: ${OBJS}

%.stl : %.scad
	openscad -o $@ $<

%.svg : %.scad
	openscad -o $@ $< -D project=1
