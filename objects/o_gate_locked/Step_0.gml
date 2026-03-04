if (keyboard_check_pressed(ord("E"))) {

    if (instance_exists(o_player) && distance_to_object(o_player) < 10) {
        
        if(o_controller.keys > 0) {
            instance_destroy();
            o_controller.keys -= 1;
        }
        else {
            if (!instance_exists(o_ui_lock)) {
                instance_create_layer(x, y, layer, o_ui_lock);
            }
        }
    }
}