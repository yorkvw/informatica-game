if (!talkedTo && keyboard_check_pressed(ord("E"))) {
    
    if (instance_exists(o_player) && distance_to_object(o_player) < 30) {
		talkedTo = true
		show_hint("char1D1")
		show_hint("char1D2")
		show_hint("char1D3")
		show_hint("char1D4")
		show_hint("char1D5")
		show_hint("char1D6")
		show_hint("char1D7") // 67
		show_hint("char1D8")
		show_hint("char1DEND")
    }
}