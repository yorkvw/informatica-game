var _gw = display_get_gui_width();

// draw_set_font(f_pixel);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var _line_height = 20;
var _max_width = _gw - 80;

var _text_h = string_height_ext(text, _line_height, _max_width);
var _box_h = _text_h + 20;

draw_set_alpha(alpha * 0.7); 
draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _box_h, false);

draw_set_alpha(alpha * 0.5);
draw_set_color(c_white);
draw_line(0, _box_h, _gw, _box_h);

draw_set_alpha(alpha);
draw_set_color(c_white);
draw_text_ext(_gw / 2, 10, text, _line_height, _max_width);

draw_set_alpha(1.0);
draw_set_halign(fa_left);