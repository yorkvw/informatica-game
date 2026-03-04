function cave_tutorial() {
    if (sprite_index == s_cave_open) {
        show_message("Deze cave is open, je kunt hiermee snel naar het volgend level. Het kan voorkomen dat de cave gesloten is, dan moet je een andere weg uit vinden.");
        
        o_player.teleport(target_room, target_x, target_y);
    }
    else {
        show_message("De cave is gesloten. Je zult een andere weg moeten vinden om verder te komen.");
    }
}

if (room == mineshaft) {
    show_debug_message(tutorial);
    if (tutorial == false) {
        cave_tutorial();
        tutorial = true;
        return;
    }
}

// Ook hier omdraaien: "other" is de speler die de functie moet runnen
if (sprite_index == s_cave_open) {
    o_player.teleport(target_room, target_x, target_y);
}