// --- START GUI INITIALISATIE ---

// 1. Stel custom font in voor een mooier uiterlijk.
// BELANGRIJK: Dit vereist dat je in GameMaker Studio een Font resource hebt aangemaakt
// met de naam "fnt_gui". Als je dat nog niet hebt gedaan, krijg je een foutmelding.
// Oplossing: Maak een nieuwe Font resource aan in de Resource Tree, noem deze "fnt_gui"
// en kies een mooi lettertype (bijv. Press Start 2P, of een ander pixel art font).
draw_set_font(fnt_gui); 

// 2. Stel algemene uitlijning in voor alle GUI-elementen.
draw_set_halign(fa_left);

// --- START GUI LAYOUT ---
var gui_padding = 20;       // Ruimte vanaf de randen
var gui_line_height = 40;   // Ruimte tussen de GUI-items
var text_icon_spacing = 10; // Ruimte tussen het icoon en de tekst

var current_x = gui_padding;
var current_y = gui_padding;

// ================= COINS =================
if (instance_exists(o_controller)) {
    // 1. Definieer de sprite die we gebruiken.
    var icon_sprite = s_coin; 
    var icon_width = sprite_get_width(icon_sprite);
    var icon_height = sprite_get_height(icon_sprite);
    
    // 2. Bereken de verticale middenpositie.
    var text_y_position = current_y + (gui_line_height / 2);
    
    // 3. Teken het icoon.
    // We centreren het icoon in de gereserveerde lijnhoogte.
    // De schaal is nu vast op 1 (geen live effect).
    draw_sprite_ext(icon_sprite, 0, current_x, current_y + (gui_line_height / 2), 1, 1, 0, c_white, 1);

    // 4. Teken het aantal ernaast.
    draw_set_valign(fa_middle);
    draw_text_ext(current_x + icon_width + text_icon_spacing, text_y_position, string(o_controller.coins), -1, -1);

    // Reset de uitlijning naar de standaard.
    draw_set_valign(fa_top); 

    // Verhoog de y-positie voor het volgende item.
    current_y += gui_line_height;
}

// ================= KEYS =================
if (instance_exists(o_controller)) {
    // 1. Definieer de sprite die we gebruiken.
    var icon_sprite = s_key; 
    var icon_width = sprite_get_width(icon_sprite);
    var icon_height = sprite_get_height(icon_sprite);

    // 2. Bereken de verticale middenpositie.
    var text_y_position = current_y + (gui_line_height / 2);
    
    // 3. Teken het icoon.
    // We centreren het icoon in de gereserveerde lijnhoogte.
    draw_sprite_ext(icon_sprite, 0, current_x, current_y + (gui_line_height / 2), 1, 1, 0, c_white, 1);

    // 4. Teken het aantal ernaast.
    draw_set_valign(fa_middle);
    draw_text_ext(current_x + icon_width + text_icon_spacing, text_y_position, string(o_controller.keys), -1, -1);

    // Reset de uitlijning naar de standaard.
    draw_set_valign(fa_top); 

    current_y += gui_line_height;
}

// ================= LIVES (HEARTS) =================
if (instance_exists(o_player)) {
    var heart_sprite = s_heart;
    var heart_spacing = sprite_get_width(heart_sprite) + 5; 
    var hearts_x = current_x;
    var heart_y_position = current_y + (gui_line_height / 2); // Verticaal midden in de lijnhoogte

    for (var i = 0; i < global.player_lives; i++) {
        draw_sprite_ext(heart_sprite, 0, hearts_x + (i * heart_spacing), heart_y_position, 1, 1, 0, c_white, 1);
    }
    current_y += gui_line_height;
}

// ================= ARTEFACT =================
if (o_controller.artefact > 0) {
    var icon_sprite = s_placeholder_artefact;
    var icon_width = sprite_get_width(icon_sprite);
    var icon_height = sprite_get_height(icon_sprite);

    var vertical_center_y = current_y + (gui_line_height / 2);
    
    // We centreren het icoon in de gereserveerde lijnhoogte.
    draw_sprite(icon_sprite, 0, current_x, current_y + (gui_line_height / 2));
    draw_set_valign(fa_middle);
    draw_text_ext(current_x + icon_width + text_icon_spacing, vertical_center_y, string(o_controller.artefact), -1, -1);

    draw_set_valign(fa_top); 

    current_y += gui_line_height;
}

// ================= TIMER =================
var margin = 20;
var box_w = 110;
var box_h = 40;
var box_x = display_get_gui_width() - box_w - margin;
var box_y = margin;

var minutes = timer_seconds div 60;
var seconds = timer_seconds mod 60;
var txt = string(minutes) + ":" + string_format(seconds, 2, 0);

draw_set_alpha(0.7);
draw_set_color(c_black);
draw_roundrect(box_x, box_y, box_x + box_w, box_y + box_h, false);
draw_set_alpha(1);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(box_x + box_w / 2, box_y + box_h / 2, txt);
draw_set_halign(fa_left); // reset naar links voor de rest van de GUI
draw_set_valign(fa_top); // reset naar top voor de rest van de GUI