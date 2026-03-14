if (keyboard_check_pressed(ord("E"))) {
    // Als het menu open is, sluit het
    if (menu_open) {
        menu_open = false;
    } 
    // Als het menu dicht is en we zijn in de buurt, open het
    else if (instance_exists(o_player) && distance_to_object(o_player) < 30) {
        menu_open = true;
    }
}