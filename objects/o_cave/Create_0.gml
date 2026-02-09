randomize()

var randomnr = random(1)
show_debug_message(randomnr)

if(randomnr) > 0.5 {
    sprite_index = s_cave_open;
	 var _wall = instance_create_layer(x, y, layer, o_solid);
    _wall.image_xscale = sprite_width / _wall.sprite_width;
    _wall.image_yscale = sprite_height / _wall.sprite_height;
}else {
    sprite_index = s_cave_collapsed;
    var _wall = instance_create_layer(x, y, layer, o_solid);
    _wall.image_xscale = sprite_width / _wall.sprite_width;
    _wall.image_yscale = sprite_height / _wall.sprite_height;
}
