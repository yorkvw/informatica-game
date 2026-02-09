if (keyboard_check_pressed(ord("E"))) {
    if (opened == false) {
        if (place_meeting(x, y-5, o_player)) 
        {
            opened = true;
			o_player.coins += 3
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
}