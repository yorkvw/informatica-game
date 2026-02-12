// check of speler dichtbij is (simple rectangle collision)
if (!opened && keyboard_check_pressed(ord("E"))) {
    if (position_meeting(x, y, o_player)) { // speler "in contact" met de kist
        opened = true;
        sprite_index = s_chest_opened;   // kist open
        o_controller.coins += value;       // coins geven
    }
}

if (!opened && keyboard_check_pressed(ord("E"))) {
    if (point_distance(x, y, o_player.x, o_player.y) < 32) {
        opened = true;
        sprite_index = s_chest_opened;
        o_controller.coins += value;
    }
}