for (var i = 0; i < array_length(letters); i++) {
    var _l = letters[i];

    if (_l.state == "waiting") {
        if (_l.timer > 0) {
            _l.timer--;
        } else {
            _l.state = "falling";
        }
    }
    
    else if (_l.state == "falling") {
        _l.vsp += gravity_force;
        _l.y_pos += _l.vsp;
        
        if (_l.y_pos >= _l.target_y) {
            _l.y_pos = _l.target_y;
            
            if (_l.vsp > 1) {
                _l.vsp = -(_l.vsp * bounce_amount); 
            } else {
                _l.vsp = 0;
                _l.state = "done"; 
            }
        }
    }
}

var _all_ready = true;

for (var i = 0; i < array_length(letters); i++) {
    var _l = letters[i];

    if (_l.state == "waiting") {
        if (_l.timer > 0) {
            _l.timer--;
        } else {
            _l.state = "falling";
        }
        _all_ready = false;
    }
    else if (_l.state == "falling") {
        _l.vsp += gravity_force;
        _l.y_pos += _l.vsp;

        if (_l.y_pos >= _l.target_y) {
            _l.y_pos = _l.target_y;

            if (_l.vsp > 1) {
                _l.vsp = -(_l.vsp * bounce_amount);
            } else {
                _l.vsp = 0;
                _l.state = "done";
            }
        }
        _all_ready = false;
    }
}

if (_all_ready) {
    sub_active = true;
}

if (sub_active) {
    sub_current_x = lerp(sub_current_x, x, 0.08);
}