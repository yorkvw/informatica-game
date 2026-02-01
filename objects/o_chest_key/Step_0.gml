if (!opened && keyboard_check_pressed(ord("E"))) {
    if (point_distance(x, y, o_player.x, o_player.y) < 32) {
        opened = true;
        sprite_index = s_chest_opened;
        o_player.keys += 1; // speler krijgt een sleutel
    }
}
