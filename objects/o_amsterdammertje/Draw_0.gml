draw_self();

if (instance_exists(o_player)) {
    if (distance_to_object(o_player) < 30) {
        
        var _float_y = sin(current_time / 200) * 3; 
        
        var _xx = round(x); 
        var _yy = round((bbox_top - 25) + _float_y);
		
        var _scale = 0.040;
        
        draw_sprite_ext(s_upgrade_prompt, 0, _xx, _yy, _scale, _scale, 0, c_white, 1);
    }
}