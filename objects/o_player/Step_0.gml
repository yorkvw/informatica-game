var xinput = keyboard_check(vk_right) - keyboard_check(vk_left);
var yinput = keyboard_check(vk_down) - keyboard_check(vk_up);
move_and_collide(xinput * my_speed, yinput * my_speed, o_solidparent);

audio_listener_position(x, y, 0);
audio_listener_orientation(0, 1, 0, 0, 0, 1);

if(!room == r_stad || !room == r_upgrade){ 
	if (xinput != 0) {
	    sprite_index = s_player_side;
	    image_speed = 1;
    
	    image_xscale = xinput; 
	}

	else if (yinput != 0) {
	    image_speed = 1;
	    image_xscale = 1; 

	    if (yinput > 0) {
	        sprite_index = s_player_front;
	    } else {
	        sprite_index = s_player_back;
	    }
	}

	if (xinput == 0 && yinput == 0){
	    image_speed = 0;
	    image_index = 0;
	}
	
	// VAL COLLISION
	if (vspeed > 0) {
	    var cave_inst = instance_place(x, y + vspeed, obj_cave);
	    if (cave_inst != noone && cave_inst.is_solid) {
	        y = cave_inst.bbox_top - bbox_bottom + y;
	        vspeed = 0;
	        on_ground = true;
	    }
	}
}else {
	if(room == r_stad){
		if (xinput != 0) {
		    sprite_index = s_player_side;
		    image_speed = 1;
		    image_xscale = 1.5*xinput; 
		}

		else if (yinput != 0) {
		    image_speed = 1;
		    image_xscale = 1.5; 

		    if (yinput > 0) {
		        sprite_index = s_player_front;
		    } else {
		        sprite_index = s_player_back;
		    }
		}

		if (xinput == 0 && yinput == 0){
		    image_speed = 0;
		    image_index = 0;
		}
	
		// VAL COLLISION
		if (vspeed > 0) {
		    var cave_inst = instance_place(x, y + vspeed, obj_cave);
		    if (cave_inst != noone && cave_inst.is_solid) {
		        y = cave_inst.bbox_top - bbox_bottom + y;
		        vspeed = 0;
		        on_ground = true;
		    }
		}
	}else {
	if (xinput != 0) {
	    sprite_index = s_player_side;
	    image_speed = 1;
    
	    image_xscale = 7*xinput; 
	}

	else if (yinput != 0) {
	    image_speed = 1;
	    image_xscale = 7; 

	    if (yinput > 0) {
	        sprite_index = s_player_front;
	    } else {
	        sprite_index = s_player_back;
	    }
	}

	if (xinput == 0 && yinput == 0){
	    image_speed = 0;
	    image_index = 0;
	}
	
	// VAL COLLISION
	if (vspeed > 0) {
	    var cave_inst = instance_place(x, y + vspeed, obj_cave);
	    if (cave_inst != noone && cave_inst.is_solid) {
	        y = cave_inst.bbox_top - bbox_bottom + y;
	        vspeed = 0;
	        on_ground = true;
	    }
	}
	}
	
}
