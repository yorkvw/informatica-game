if (keyboard_check_pressed(ord("E"))) {
	if (instance_exists(o_player) && distance_to_object(o_player) < 30) {
		room_goto(upgrade_menu)
    }
}