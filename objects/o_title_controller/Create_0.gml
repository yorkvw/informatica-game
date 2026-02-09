var _sprite_list = [s_logo_S, s_logo_I, s_logo_L, s_logo_E, s_logo_N, s_logo_C, s_logo_E2, s_logo_D];

target_height = 128; 

bounce_amount = 0.6;   
gravity_force = 0.5;   
start_y = -200;        
spacing = 5;           
fall_delay = 10;       

letters = []; 
var _total_width = 0;

for (var i = 0; i < array_length(_sprite_list); i++) {
    var _spr = _sprite_list[i];

    var _this_scale = target_height / sprite_get_height(_spr);

    _total_width += sprite_get_width(_spr) * _this_scale;
}

_total_width += (array_length(_sprite_list) - 1) * spacing;

var _current_x = x - (_total_width / 2);

for (var i = 0; i < array_length(_sprite_list); i++) {
    var _spr = _sprite_list[i];

    var _s = target_height / sprite_get_height(_spr);
    var _w = sprite_get_width(_spr) * _s;
    
    var _letter_data = {
        sprite: _spr,
        scale: _s,
        x_pos: _current_x + (_w / 2),
        y_pos: start_y,               
        target_y: y,                 
        vsp: 0,                       
        timer: i * fall_delay,        
        state: "waiting"              
    };
    
    array_push(letters, _letter_data);

    _current_x += _w + spacing;
}


sub_sprite = s_logo_silenced;
sub_height = 64;
sub_y_offset = 60;

sub_scale = sub_height / sprite_get_height(sub_sprite);

sub_active = false;
sub_target_x = x;
sub_current_x = room_width + 500;