if (keyboard_check_pressed(ord("E"))) {
	if(o_player.keys > 0) {
	    if (place_meeting(x, y+5, o_player))
		{
			instance_destroy();
			o_player.keys -= 1
		}
	}
}