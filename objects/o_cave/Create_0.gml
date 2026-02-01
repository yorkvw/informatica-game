// random open of ingestort bij start
if (irandom(1) == 0) {
    // OPEN grot
    is_solid = false;
    parent = noone;
    sprite_index = s_cave_open;
} else {
    // INGESTORTE grot
    is_solid = true;
    parent = o_solidparent;
    sprite_index = s_cave_collapsed;
}
