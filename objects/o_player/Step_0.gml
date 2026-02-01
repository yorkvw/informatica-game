var xinput = keyboard_check(vk_right) - keyboard_check(vk_left);
var yinput = keyboard_check(vk_down) - keyboard_check(vk_up);
move_and_collide(xinput * my_speed, yinput * my_speed, o_solidparent);

if (xinput > 0) {
  sprite_index = s_player_side;
  image_speed = 1;
}

else if (xinput < 0) {
  sprite_index = s_player_side;
  image_speed = 1;
}

if(xinput < 0 && image_xscale != -1){
	image_xscale *= -1
	x -= sprite_width
}

if(xinput > 0 && image_xscale != 1){
	image_xscale *= -1
	x -= sprite_width
}

else if (yinput > 0) {
  sprite_index = s_player_front;
  image_speed = 1;
}

else if (yinput < 0) {
  sprite_index = s_player_back;
  image_speed = 1;
}
else if (xinput == 0 && yinput == 0){
	image_speed = 0;	
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
