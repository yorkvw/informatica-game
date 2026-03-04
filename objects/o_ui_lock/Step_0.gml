if (fading) {
    zichtbaarheid -= 0.05;

    if (zichtbaarheid <= 0) {
        instance_destroy();
    }
}