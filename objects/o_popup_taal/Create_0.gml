depth = -9999;

var _gewenste_breedte = 180; 
var _afstand = 120;         

var _vlagnl = instance_create_depth(x - _afstand, y, depth - 1, o_vlag_nl);
var _scale_nl = _gewenste_breedte / sprite_get_width(_vlagnl.sprite_index);
_vlagnl.image_xscale = _scale_nl;
_vlagnl.image_yscale = _scale_nl;

var _vlagtr = instance_create_depth(x + _afstand, y, depth - 1, o_vlag_tr);
var _scale_tr = _gewenste_breedte / sprite_get_width(_vlagtr.sprite_index);
_vlagtr.image_xscale = _scale_tr;
_vlagtr.image_yscale = _scale_tr;