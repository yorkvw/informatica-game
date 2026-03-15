if (!opened && keyboard_check_pressed(ord("E"))) {
    
    if (instance_exists(o_player) && distance_to_object(o_player) < 30) {
		
		if(global.pickaxeUnlocked == true){
        
	        opened = true;
	        sprite_index = s_chest_opened;

	        var _popup = instance_create_layer(x, bbox_top + 10, layer, o_item_popup);

	        sprite_index = s_crystal_destroyed
		}
	}else { 
		if(o_controller.crystalUpgradeHint == false){
			show_hint("pickaxeNeeded")
			o_controller.crystalUpgradeHint = true
		}
	}
}