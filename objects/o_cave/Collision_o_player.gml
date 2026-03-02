function cave_tutorial(){
    if (sprite_index == s_cave_open) {
        show_message("Deze cave is open, je kunt hiermee snel naar het volgend level. Het kan voorkomen dat de cave gesloten is, dan moet je een andere weg uit vinden.");
        room_goto_next();
    }
    else {
        show_message("De cave is gesloten. Je zult een andere weg moeten vinden om verder te komen.");
    }
}

if (room == mineshaft) {
	cave_tutorial()
	return;
}

if (sprite_index == s_cave_open) {
	room_goto_next();
}

