if (!opened && keyboard_check_pressed(ord("E"))) {
    if (place_meeting(x, y+5, o_player)) {
        opened = true;
        sprite_index = s_chest_opened;
        o_player.keys += 1;
    }
}
