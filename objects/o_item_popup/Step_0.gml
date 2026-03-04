y += vsp;

vsp = min(vsp + 0.05, -0.5);

image_alpha -= fade_speed;

if (image_alpha <= 0) {
    instance_destroy();
}