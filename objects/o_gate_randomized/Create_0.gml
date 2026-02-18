randomize()

var randomnr = random(1)
show_debug_message(randomnr)

if(randomnr) > 0.5 {
    instance_destroy()
}else {
    sprite_index = s_gate_large;
    var _wall = instance_create_layer(x, y, layer, o_solid);
    _wall.image_xscale = sprite_width / _wall.sprite_width;
    _wall.image_yscale = sprite_height / _wall.sprite_height;
}
