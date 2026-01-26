var xinput = keyboard_check(vk_right) - keyboard_check(vk_left);
var yinput = keyboard_check(vk_down) - keyboard_check(vk_up);
move_and_collide(xinput * my_speed, yinput * my_speed, o_solid);

if (xinput > 0) {
  sprite_index = s_player_right;
  image_speed = 1;
}
else if (xinput < 0) {
  sprite_index = s_player_left;
  image_speed = 1;
}
else if (yinput > 0) {
  sprite_index = s_player_front;
  image_speed = 1;
}
else if (yinput < 0) {
  sprite_index = s_player_back;
  image_speed = 1;
}

