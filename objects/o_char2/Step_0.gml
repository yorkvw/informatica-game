// ============================================================
//  E-TOETS: menu openen / sluiten / terug naar overzicht
// ============================================================
if (keyboard_check_pressed(ord("E"))) {
    if (menu_open) {
        if (selected_upgrade != -1) {
            stop_upgrade_sound();
            selected_upgrade = -1; // detail → overzicht
        } else {
            stop_upgrade_sound();
            menu_open = false;     // overzicht → dicht
        }
    } else if (instance_exists(o_player) && distance_to_object(o_player) < 30) {
        menu_open        = true;
        selected_upgrade = -1;
    }
}

if (!menu_open) exit;

// TIP: blokkeer speler-input hier als dat nodig is, bijv:
// with (o_player) { can_move = false; }  (pas aan naar jouw player-variabele)

// ============================================================
//  MUISKLIK
// ============================================================
if (!mouse_check_button_pressed(mb_left)) exit;

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _cx = _gw / 2;
var _cy = _gh / 2;
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Paneelgrenzen (zelfde als in Draw_64)
var _pw = 520;
var _ph = 440;
var _px = _cx - _pw / 2;
var _py = _cy - _ph / 2;

// ── Klik buiten paneel = sluiten ──────────────────────────
if (_mx < _px || _mx > _px + _pw || _my < _py || _my > _py + _ph) {
    if (selected_upgrade != -1) {
        stop_upgrade_sound();
        selected_upgrade = -1;
    } else {
        stop_upgrade_sound();
        menu_open = false;
    }
    exit;
}

// ── OVERZICHT: klik op een kaart ─────────────────────────
if (selected_upgrade == -1) {

    var _cols   = 3;
    var _card_w = 140;
    var _card_h = 100;
    var _gap    = 14;
    var _grid_w = _cols * _card_w + (_cols - 1) * _gap;
    var _grid_x = _cx - _grid_w / 2;
    var _grid_y = _py + 64;

    for (var i = 0; i < array_length(upgrades); i++) {
        var _col = i % _cols;
        var _row = i div _cols;
        var _ix  = _grid_x + _col * (_card_w + _gap);
        var _iy  = _grid_y + _row * (_card_h + _gap);

        if (_mx > _ix && _mx < _ix + _card_w && _my > _iy && _my < _iy + _card_h) {
            selected_upgrade = i;
            start_upgrade_sound(upgrades[i]);
            exit;
        }
    }

// ── DETAIL VIEW: terug-knop of koop-knop ─────────────────
} else {

    var _item  = upgrades[selected_upgrade];
    var _owned = variable_global_get(_item.var_name);

    // Terug-knop (linksboven in paneel)
    var _back_x = _px + 14;
    var _back_y = _py + 10;
    var _back_w = 84;
    var _back_h = 28;
    if (_mx > _back_x && _mx < _back_x + _back_w && _my > _back_y && _my < _back_y + _back_h) {
        stop_upgrade_sound();
        selected_upgrade = -1;
        exit;
    }

    // Koop-knop (alleen zichtbaar als niet owned)
    if (!_owned) {
        var _btn_w = 170;
        var _btn_h = 42;
        var _btn_x = _cx - _btn_w / 2;
        var _btn_y = _py + _ph - 68;

        if (_mx > _btn_x && _mx < _btn_x + _btn_w && _my > _btn_y && _my < _btn_y + _btn_h) {
            if (global.total_coins >= _item.cost) {
                global.total_coins -= _item.cost;
                variable_global_set(_item.var_name, true);
            }
            exit;
        }
    }
}
