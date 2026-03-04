if (instance_exists(follow)) {
    xTo = follow.x;
    yTo = follow.y;
}

x += (xTo - x) / 50;
y += (yTo - y) / 50;

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// Shake
var _shake_x = 0;
var _shake_y = 0;

if (shake_time > 0) {
    _shake_x = random_range(-shake_magnitude, shake_magnitude);
    _shake_y = random_range(-shake_magnitude, shake_magnitude);
    
    shake_time -= 1;
}

// Pas de camera positie aan (inclusief de shake)
camera_set_view_pos(cam, x - view_w_half + _shake_x, y - view_h_half + _shake_y);