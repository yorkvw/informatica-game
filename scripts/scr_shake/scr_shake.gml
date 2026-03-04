function screen_shake(_kracht, _frames) {
    if (instance_exists(o_camera)) {
        if (_kracht > o_camera.shake_magnitude) {
            o_camera.shake_magnitude = _kracht;
            o_camera.shake_time = _frames;
        }
    }
}