//Zif (keyboard_check_pressed(ord("E"))) {
    if (opened == false) {
        if (distance_to_object(o_player) < 30) 
        {
            opened = true;
			o_controller.coins += 3
            switch(sprite_index)
            {
                case s_pot_1: 
                    sprite_index = s_pot_destroyed_1; 
                    break;
                case s_pot_2: 
                    sprite_index = s_pot_destroyed_2; 
                    break;
                case s_pot_3: 
                    sprite_index = s_pot_destroyed_3; 
                    break;
                case s_pot_4: 
                    sprite_index = s_pot_destroyed_4; 
                    break;
            }
        }
    }
//}