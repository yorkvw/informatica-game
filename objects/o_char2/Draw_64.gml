if (!menu_open) exit;

// ── Scherm & paneel layout ────────────────────────────────
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _cx = _gw / 2;
var _cy = _gh / 2;
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _pw = 520;
var _ph = 440;
var _px = _cx - _pw / 2;
var _py = _cy - _ph / 2;

// ── Achtergrond overlay ───────────────────────────────────
draw_set_alpha(0.68);
draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1);

// ── Paneelkader ───────────────────────────────────────────
draw_set_color(#1E1208);
draw_rectangle(_px, _py, _px + _pw, _py + _ph, false);
draw_set_color(#9A7040);
draw_rectangle(_px, _py, _px + _pw, _py + _ph, true);
// binnenrand voor extra diepte
draw_set_color(#5A3A18);
draw_rectangle(_px + 3, _py + 3, _px + _pw - 3, _py + _ph - 3, true);

// ── Coins (altijd zichtbaar, rechtsboven in paneel) ───────
draw_set_font(-1); // vervang door jouw font als je die hebt
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(#FFD700);
draw_text(_px + _pw - 14, _py + 12, "Coins: " + string(global.total_coins));

// ─────────────────────────────────────────────────────────
//  OVERZICHT  (selected_upgrade == -1)
// ─────────────────────────────────────────────────────────
if (selected_upgrade == -1) {

    // Titel
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(#E8C878);
    draw_text(_cx, _py + 13, "UPGRADES");

    // ── Kaartgrid ─────────────────────────────────────────
    var _cols   = 3;
    var _card_w = 140;
    var _card_h = 100;
    var _gap    = 14;
    var _grid_w = _cols * _card_w + (_cols - 1) * _gap;
    var _grid_x = _cx - _grid_w / 2;
    var _grid_y = _py + 64;

    for (var i = 0; i < array_length(upgrades); i++) {
        var _item  = upgrades[i];
        var _owned = variable_global_get(_item.var_name);
        var _col   = i % _cols;
        var _row   = i div _cols;
        var _ix    = _grid_x + _col * (_card_w + _gap);
        var _iy    = _grid_y + _row * (_card_h + _gap);

        var _hover = (_mx > _ix && _mx < _ix + _card_w && _my > _iy && _my < _iy + _card_h);

        // Kaart achtergrond
        if (_owned) {
            draw_set_color(#142814);
        } else if (_hover) {
            draw_set_color(#4A3218);
        } else {
            draw_set_color(#2E1E0C);
        }
        draw_rectangle(_ix, _iy, _ix + _card_w, _iy + _card_h, false);

        // Kaart rand
        draw_set_color(_owned ? #408040 : (_hover ? #C8A050 : #6A4A28));
        draw_rectangle(_ix, _iy, _ix + _card_w, _iy + _card_h, true);

        // Icoon gecentreerd in de kaart
        // LET OP: draw_sprite_ext gebruikt de sprite-origin uit de editor.
        // Zet je sprite-origin op Center voor het beste resultaat.
        var _icon_cx = _ix + _card_w / 2;
        var _icon_cy = _iy + 44;
        var _icon_size = 42;
        var _spr_w  = sprite_get_width(_item.spr);
        var _spr_h  = sprite_get_height(_item.spr);
        var _sx     = _icon_size / _spr_w;
        var _sy     = _icon_size / _spr_h;
        draw_sprite_ext(_item.spr, 0, _icon_cx, _icon_cy, _sx, _sy, 0, c_white, _owned ? 0.45 : 1.0);

        // Naam onderaan de kaart
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_set_color(_owned ? #60A060 : #D4B880);
        draw_text(_icon_cx, _iy + _card_h - 6, _item.name);

        // Prijsbadge linksboven in kaart
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        if (_owned) {
            draw_set_color(#60A060);
            draw_text(_ix + 6, _iy + 5, "Gekocht");
        } else {
            draw_set_color(#FFD700);
            draw_text(_ix + 6, _iy + 5, string(_item.cost) + "c");
        }
    }

    // Footer hint
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(#5A4A38);
    draw_text(_cx, _py + _ph - 8, "Klik op een upgrade voor details   |   E = Sluiten");

// ─────────────────────────────────────────────────────────
//  DETAIL VIEW  (selected_upgrade >= 0)
// ─────────────────────────────────────────────────────────
} else {

    var _item     = upgrades[selected_upgrade];
    var _owned    = variable_global_get(_item.var_name);
    var _can_buy  = (!_owned && global.total_coins >= _item.cost);

    // ── Terug-knop ────────────────────────────────────────
    var _back_x = _px + 14;
    var _back_y = _py + 10;
    var _back_w = 84;
    var _back_h = 28;
    var _back_hov = (_mx > _back_x && _mx < _back_x + _back_w && _my > _back_y && _my < _back_y + _back_h);

    draw_set_color(_back_hov ? #8A6030 : #3A2810);
    draw_rectangle(_back_x, _back_y, _back_x + _back_w, _back_y + _back_h, false);
    draw_set_color(#9A7040);
    draw_rectangle(_back_x, _back_y, _back_x + _back_w, _back_y + _back_h, true);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(_back_hov ? #FFFFFF : #C8A060);
    draw_text(_back_x + _back_w / 2, _back_y + _back_h / 2, "< Terug");

    // ── Icoon (groot, gecentreerd) ────────────────────────
    var _icon_size = 80;
    var _spr_w    = sprite_get_width(_item.spr);
    var _spr_h    = sprite_get_height(_item.spr);
    var _sx       = _icon_size / _spr_w;
    var _sy       = _icon_size / _spr_h;
    var _icon_y   = _py + 100;
    draw_sprite_ext(_item.spr, 0, _cx, _icon_y, _sx, _sy, 0, c_white, 1.0);

    // ── Naam ─────────────────────────────────────────────
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(#E8C870);
    draw_text(_cx, _icon_y + _icon_size / 2 + 14, _item.name);

    // ── Scheidingslijn ────────────────────────────────────
    var _div_y = _icon_y + _icon_size / 2 + 40;
    draw_set_color(#5A3A18);
    draw_line(_px + 40, _div_y, _px + _pw - 40, _div_y);

    // ── Beschrijving ──────────────────────────────────────
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(#C8A870);
    draw_text_ext(_cx, _div_y + 14, _item.desc, -1, _pw - 100);

    // ── Prijs ─────────────────────────────────────────────
    var _price_y = _py + _ph - 108;
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    if (_owned) {
        draw_set_color(#60A060);
        draw_text(_cx, _price_y, "Al gekocht");
    } else if (!_can_buy) {
        draw_set_color(#A05050);
        draw_text(_cx, _price_y, "Prijs: " + string(_item.cost) + " coins   (te weinig coins)");
    } else {
        draw_set_color(#FFD700);
        draw_text(_cx, _price_y, "Prijs: " + string(_item.cost) + " coins");
    }

    // ── Koop-knop ─────────────────────────────────────────
    if (!_owned) {
        var _btn_w   = 170;
        var _btn_h   = 42;
        var _btn_x   = _cx - _btn_w / 2;
        var _btn_y   = _py + _ph - 76;
        var _btn_hov = (_mx > _btn_x && _mx < _btn_x + _btn_w && _my > _btn_y && _my < _btn_y + _btn_h);

        // achtergrond
        if (!_can_buy) {
            draw_set_color(#2A2A2A);
        } else if (_btn_hov) {
            draw_set_color(#2A6A2A);
        } else {
            draw_set_color(#1A4A1A);
        }
        draw_rectangle(_btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h, false);

        // rand
        draw_set_color(_can_buy ? #60C060 : #505050);
        draw_rectangle(_btn_x, _btn_y, _btn_x + _btn_w, _btn_y + _btn_h, true);

        // label
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(_can_buy ? #FFFFFF : #606060);
        draw_text(_cx, _btn_y + _btn_h / 2, _can_buy ? "Kopen" : "Niet genoeg coins");
    }

    // Footer hint
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(#5A4A38);
    draw_text(_cx, _py + _ph - 8, "E = Terug naar overzicht");
}

// ── Draw-state resetten ───────────────────────────────────
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
