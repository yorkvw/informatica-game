function cave_tutorial() {
    if (sprite_index == s_cave_open) {
        show_hint("cave_open");
        
        o_player.teleport(target_room, target_x, target_y);
    }
    else {
        show_hint("cave_closed");
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