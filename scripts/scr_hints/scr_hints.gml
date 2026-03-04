function show_hint(_text) {
    if (instance_exists(o_ui_hint)) {
        instance_destroy(o_ui_hint);
    }

    var _hint_box = instance_create_depth(0, 0, -9999, o_ui_hint);
    
    _hint_box.text = _text;
}