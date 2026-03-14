image_index = 0;
if (!file_exists("save_data.json")) {
    if (!instance_exists(o_popup_taal)) {
        instance_create_layer(room_width / 2, room_height / 2, "Instances", o_popup_taal);
    }
} else {
    room_goto(r_stad);
}