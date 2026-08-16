include <BOSL2/std.scad>
include <BOSL2/screws.scad>

BACK_CLEARANCE = 8.5;
HOLE_X_DISTANCE = 157;
HOLE_Y_DISTANCE = 116;

HOLE_D = 2.925; // meant for M3 screws
HOLE_BOX_D = 12;

ANCHOR_LENGTH = 13;
PLATE_THICKNESS = ANCHOR_LENGTH;

// TODO: Make the back plate taper from bottom to top

// OLD BACK PLATE:
// cuboid([HOLE_X_DISTANCE + HOLE_BOX_D, HOLE_Y_DISTANCE + HOLE_BOX_D, PLATE_THICKNESS], anchor=BOTTOM)

// BAD PRISMOID ATTEMPT:
// prismoid(size1=[(HOLE_X_DISTANCE + HOLE_BOX_D)/2, (HOLE_Y_DISTANCE + HOLE_BOX_D)/2], size2=[HOLE_X_DISTANCE + HOLE_BOX_D, HOLE_Y_DISTANCE + HOLE_BOX_D], h=ANCHOR_LENGTH, anchor=BOTTOM)

diff() cuboid([HOLE_X_DISTANCE + HOLE_BOX_D, HOLE_Y_DISTANCE + HOLE_BOX_D, PLATE_THICKNESS], anchor=BOTTOM) {
    // Blocks and holes for the mount
    for (pos = [BACK+LEFT, BACK+RIGHT, FRONT+LEFT, FRONT+RIGHT]) {
        position(pos+TOP) {
            cuboid([HOLE_BOX_D, HOLE_BOX_D, BACK_CLEARANCE], anchor=pos+BOTTOM) {
                position(TOP) up(1) tag("remove") screw_hole("M3,25", thread=true, anchor=TOP); // cyl(h=2*(PLATE_THICKNESS), d=HOLE_D, $fn=16, anchor=TOP);
            }
        }
    }

    screw_hole("1/4-20,0.75", thread=true);
}
