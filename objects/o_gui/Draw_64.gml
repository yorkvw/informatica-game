// Coins linksboven
draw_text(20, 20, string_concat("Coins: ", string(o_player.coins)));

// Sleutels
if (o_player.keys > 0) {
    var spacing = 32;
    for (var i = 0; i < o_player.keys; i++) {
        draw_sprite(s_key, 0, 20 + i * spacing, 50);
    }
}

if (instance_exists(o_player)) {
    var heart_spacing = 32; // Ruimte tussen de hartjes (breedte van je sprite + beetje extra)
    var heart_y = 90;       // De hoogte (onder de keys die op 50 staan)

    for (var i = 0; i < global.player_lives; i++) {
        draw_sprite_ext(s_heart, 0, 20 + (i * heart_spacing), heart_y, 0.1, 0.1, 0, c_white, 1);
    }
}


// ================= TIMER =================
var margin = 20;
var box_w = 110;
var box_h = 40;

var box_x = display_get_gui_width() - box_w - margin;
var box_y = margin;

// tijd berekenen
var minutes = timer_seconds div 60;
var seconds = timer_seconds mod 60;
var txt = string(minutes) + ":" + string_format(seconds, 2, 0);

// achtergrond
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
draw_set_alpha(1);

// tekst in het midden van de box
draw_set_color(c_white);
draw_text(
    box_x + box_w / 2 - string_width(txt) / 2,
    box_y + box_h / 2 - string_height(txt) / 2,
    txt
);

instance_activate_all();
global.game_paused = false;