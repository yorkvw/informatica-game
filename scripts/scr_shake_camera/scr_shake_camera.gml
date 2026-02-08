/// shake_camera(intensity, duration)
// Intensity = hoe sterk (pixels), duration = frames

function shake_camera(intensity, duration) {
    // sla de originele camera position op als dat nog niet is gedaan
    if (!variable_global_exists("cam_shake_timer")) {
        global.cam_shake_timer = 0;
        global.cam_shake_intensity = 0;
        global.cam_shake_orig_x = camera_get_view_x(view_camera[0]);
        global.cam_shake_orig_y = camera_get_view_y(view_camera[0]);
    }
    global.cam_shake_timer = duration;
    global.cam_shake_intensity = intensity;
}