// 1. Haal elke frame de ACTUELE grootte van je camera op
cam = view_camera[0];
var _cam_w = camera_get_view_width(cam);
var _cam_h = camera_get_view_height(cam);

// 2. Bereken het midden
view_w_half = _cam_w * 0.5;
view_h_half = _cam_h * 0.5;

// 3. Volg de speler
if (instance_exists(follow)) {
    xTo = follow.x;
    yTo = follow.y;
}

// 4. Beweeg de camera (Ik heb /50 tijdelijk veranderd naar /10, zodat hij sneller bij de speler is!)
x += (xTo - x) / 10;
y += (yTo - y) / 10;

// 5. Zorg dat de camera de randen van de map niet voorbij gaat
x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

// 6. Shake effect
var _shake_x = 0;
var _shake_y = 0;

if (shake_time > 0) {
    _shake_x = random_range(-shake_magnitude, shake_magnitude);
    _shake_y = random_range(-shake_magnitude, shake_magnitude);
    shake_time -= 1;
}

// 7. Zet de camera EXACT op de juiste positie
camera_set_view_pos(cam, x - view_w_half + _shake_x, y - view_h_half + _shake_y);