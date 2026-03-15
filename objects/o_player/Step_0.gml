// INPUT
var xinput = keyboard_check(vk_right) - keyboard_check(vk_left);
var yinput = keyboard_check(vk_down) - keyboard_check(vk_up);

// normalize diagonal speed
var len = point_distance(0,0,xinput,yinput);
if (len > 0) {
    xinput /= len;
    yinput /= len;
}

var mx = xinput * my_speed;
var my = yinput * my_speed;

var nudge = 3; // how many pixels the player can auto-adjust


// HORIZONTAL MOVEMENT
if (!place_meeting(x + mx, y, o_solidparent)) {
    x += mx;
}
else
{
    // try nudging up
    for (var i = 1; i <= nudge; i++)
    {
        if (!place_meeting(x + mx, y - i, o_solidparent))
        {
            x += mx;
            y -= i;
            break;
        }
        if (!place_meeting(x + mx, y + i, o_solidparent))
        {
            x += mx;
            y += i;
            break;
        }
    }
}


// VERTICAL MOVEMENT
if (!place_meeting(x, y + my, o_solidparent)) {
    y += my;
}
else
{
    // try nudging left/right
    for (var i = 1; i <= nudge; i++)
    {
        if (!place_meeting(x - i, y + my, o_solidparent))
        {
            y += my;
            x -= i;
            break;
        }
        if (!place_meeting(x + i, y + my, o_solidparent))
        {
            y += my;
            x += i;
            break;
        }
    }
}


// AUDIO
audio_listener_position(x, y, 0);
audio_listener_orientation(0, 1, 0, 0, 0, 1);


// ROOM SCALE
var scale_mult = 1;
if (room == r_stad) scale_mult = 1.5;
else if (room == r_upgrade) scale_mult = 7;


// ANIMATION
if (xinput != 0) {
    sprite_index = s_player_side;
    image_speed = 1;
    image_xscale = scale_mult * sign(xinput);
}
else if (yinput != 0) {
    image_speed = 1;
    image_xscale = scale_mult;

    if (yinput > 0) sprite_index = s_player_front;
    else sprite_index = s_player_back;
}
else {
    image_speed = 0;
    image_index = 0;
}


// VAL COLLISION
if (vspeed > 0) {
    var cave_inst = instance_place(x, y + vspeed, obj_cave);
    if (cave_inst != noone && cave_inst.is_solid) {
        y = cave_inst.bbox_top - bbox_bottom + y;
        vspeed = 0;
        on_ground = true;
    }
}