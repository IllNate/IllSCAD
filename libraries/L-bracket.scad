bracket_joint_length = 30;

screw_pad_width = 30;
screw_pad_thickness = 4;

vert_pad_height = 30;
vert_pad_thickness = 4;

vert_hole_center_height = 10;
vert_hole_diameter = 4;

include <ScrewTab.scad>

make();

module make() {
    align_vertical = vert_hole_center_height-vert_pad_height/2;
    
    screw_tab(8,screw_pad_thickness,4.1,60,screw_pad_width-8);
    difference() {
        translate([vert_pad_thickness/2,0,vert_pad_height/2])
            cube([vert_pad_thickness,bracket_joint_length,vert_pad_height], true);  
        translate([-1,0,vert_hole_center_height])
            rotate([0,90,0])
                cylinder(vert_pad_thickness+2,d=vert_hole_diameter,true,$fn=36);
    }
}