/**
/* Make a drying rack with honneycomb pattern
*/

rack_length = 150;
rack_width = 100;
rack_thickness = 3;
rack_mount_height = 50;
rack_ridge_thickness = 2.5;

use <IllSCAD/libraries/honneycomb.scad>

//Main
make();


//Functions
module make() {

    //Platform
    linear_extrude(rack_thickness) {
        honeycomb_by_size([rack_length, rack_width], 4, 1, true);
        difference(){
            square([rack_length, rack_width],true);
            square([rack_length-2*rack_ridge_thickness, 
                rack_width-2*rack_ridge_thickness],true);
        }
    }
    
    //Wall Plate
    //rotate
     //   square([rack_length, rack_width],true);
    
}

