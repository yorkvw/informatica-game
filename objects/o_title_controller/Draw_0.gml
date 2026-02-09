for (var i = 0; i < array_length(letters); i++) {
    var _l = letters[i];
    draw_sprite_ext(
        _l.sprite, 
        0, 
        _l.x_pos, 
        _l.y_pos, 
        _l.scale, 
        _l.scale, 
        0, 
        c_white, 
        1
    );
}

for (var i = 0; i < array_length(letters); i++) {
    var _l = letters[i];
    draw_sprite_ext(_l.sprite, 0, _l.x_pos, _l.y_pos, _l.scale, _l.scale, 0, c_white, 1);
}

if (sub_active || sub_current_x < room_width) {
    draw_sprite_ext(sub_sprite, 0, sub_current_x, y + sub_y_offset, sub_scale, sub_scale, 0, c_white, 1);
}