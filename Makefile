OBJS=display_mount.stl \
	motherboard_mount.stl

.phony: all

all: ${OBJS}

%.stl : %.scad
	openscad -o $@ $<
