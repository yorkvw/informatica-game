if (variable_global_exists("target_x")) {
    x = global.target_x;
    y = global.target_y;
    
    show_debug_message("Spawn pos: " + string(x) + ", " + string(y));
	
    global.target_x = undefined;
    global.target_y = undefined;
}