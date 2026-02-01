draw_text(20, 20, "Coins: " + string(o_player.coins));

// Sleutels
if (o_player.keys > 0) {
    var spacing = 32;
    for (var i = 0; i < o_player.keys; i += 1) {
        draw_sprite(s_key, 0, 20 + i * spacing, 50);
    }
}