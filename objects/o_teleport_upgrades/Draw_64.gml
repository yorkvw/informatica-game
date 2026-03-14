if (!menu_open) return; // Als het menu dicht is, stop dan deze code.

// 1. Scherm dimensies ophalen
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _cx = _gw / 2; // Midden X
var _cy = _gh / 2; // Midden Y

// Optioneel: Maak de achtergrond een beetje donker
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, _gw, _gh, false);
draw_set_alpha(1.0);

// 2. Teken de perkament achtergrond (Vervang s_menu_bg met jouw lege menu sprite)
draw_sprite(s_upgrade_menu, 0, _cx, _cy);

// --- Layout Instellingen ---
// Pas deze getallen aan om de icoontjes perfect op je achtergrond te laten passen
var _start_x = _cx - 200; // Hoe ver naar links de linkerkolom begint
var _start_y = _cy - 180; // Hoe hoog de bovenste rij begint
var _col_width = 240;     // De afstand tussen de linker en rechter kolom
var _row_height = 90;     // De afstand tussen de rijen naar beneden
var _icon_size = 48;      // Breedte van je icoontje (voor tekst afstand)

// Zet lettertype en kleur voor de tekst (gebruik een custom font als je die hebt, bv. draw_set_font(fnt_pixel))
draw_set_color(#4A3620); // Donkerbruine inkt kleur
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// 3. Loop door de upgrades array heen
for (var i = 0; i < array_length(upgrades); i++) {
    var _item = upgrades[i];
    
    // Bereken in welke rij en kolom dit item hoort
    var _col = i % 2;       // 0, 1, 0, 1... (Links of Rechts)
    var _row = i div 2;     // 0, 0, 1, 1, 2, 2... (Rij nummer)
    
    // Bereken de exacte X en Y voor dit item
    var _draw_x = _start_x + (_col * _col_width);
    var _draw_y = _start_y + (_row * _row_height);
    
    // Teken het Icoontje
    draw_sprite(_item.spr, 0, _draw_x, _draw_y);
    
    // Teken de Naam (ietsjes rechts van het icoon)
    var _text_x = _draw_x + _icon_size + 15;
    
    draw_set_font(-1); // Zet hier je titel font (als je die hebt)
    draw_text(_text_x, _draw_y, _item.name);
    
    // Teken de Beschrijving (Iets kleiner, met een enter als de tekst te lang is)
    draw_text_ext(_text_x, _draw_y + 20, _item.desc, 14, 160);
    
    // Teken de Kosten (met een muntje)
    // Vervang s_coin_small met een klein muntje sprite, 
    // of haal draw_sprite weg en schrijf "Cost: " voor de tekst.
    draw_sprite(s_coin, 0, _text_x, _draw_y + 55); 
    draw_text(_text_x + 20, _draw_y + 55, string(_item.cost));
}

// 4. Teken de bodem tekst (Current Coins & Press E)
draw_set_halign(fa_center);
var _bottom_y = _cy + 220; // Pas aan afhankelijk van hoe hoog je sprite is

draw_text(_cx, _bottom_y, "CURRENT COINS: " + string(global.total_coins));
draw_text(_cx, _bottom_y + 30, "PRESS E TO CLOSE");