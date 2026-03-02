cam = view_camera[0];
follow = o_player;

flash_coin_timer = 0;
flash_key_timer = 0;

view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

xTo = xstart;
yTo = ystart;