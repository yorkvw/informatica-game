if (global.cam_shake_timer > 0) {
    global.cam_shake_timer -= 1;

    var shake_x = irandom_range(-global.cam_shake_intensity, global.cam_shake_intensity);
    var shake_y = irandom_range(-global.cam_shake_intensity, global.cam_shake_intensity);

    var cam = view_camera[0];
    camera_set_view_pos(cam, global.cam_shake_orig_x + shake_x, global.cam_shake_orig_y + shake_y);

} else {
    // Reset camera naar originele positie
    var cam = view_camera[0];
    camera_set_view_pos(cam, global.cam_shake_orig_x, global.cam_shake_orig_y);
}