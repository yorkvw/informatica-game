if (!opened && keyboard_check_pressed(ord("E"))) {
    
    if (instance_exists(o_player) && distance_to_object(o_player) < 30) {
        
        opened = true;
        sprite_index = s_chest_opened;

        var _popup = instance_create_layer(x, bbox_top + 10, layer, o_item_popup);

        if (type == "coin") {
            _popup.sprite_index = s_coin; 
            o_controller.coins += amount;
        } 
        else if (type == "key") {
            _popup.sprite_index = s_key;
            o_controller.keys += amount;
        } 
        else if (type == "artefact") {
            o_controller.artefact += amount;
        }
    }
}