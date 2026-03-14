if (keyboard_check_pressed(vk_space)) {
    instance_destroy(); 
}

if (fading) {
    alpha -= 0.02;

    if (alpha <= 0) {
        instance_destroy();
    }
}