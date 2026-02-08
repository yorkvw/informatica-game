// Zorg dat de variabelen bestaan
if (!variable_global_exists("cam_shake_timer")) global.cam_shake_timer = 0;
if (!variable_global_exists("cam_shake_intensity")) global.cam_shake_intensity = 0;
if (!variable_global_exists("cam_shake_orig_x")) {
    global.cam_shake_orig_x = camera_get_view_x(view_camera[0]);
    global.cam_shake_orig_y = camera_get_view_y(view_camera[0]);
}