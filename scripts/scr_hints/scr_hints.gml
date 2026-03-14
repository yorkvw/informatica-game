function show_hint(_message_key) {
    if (instance_exists(o_ui_hint)) {
        instance_destroy(o_ui_hint);
    }

	if (!variable_global_exists("translations")) {
        if (file_exists("messages.json")) {
            var _buff = buffer_load("messages.json");
            var _json_string = buffer_read(_buff, buffer_string);
            buffer_delete(_buff);
            
            global.translations = json_parse(_json_string); 
        } else {
            show_debug_message("FOUT: messages.json is niet gevonden!");
            var _fallback_box = instance_create_depth(0, 0, -9999, o_ui_hint);
            _fallback_box.text = _message_key;
            return;
        }
    }

    var _final_text = "";
    var _lang = global.language;
	
	var _chosen_font = fnt_gui;

    if (variable_struct_exists(global.translations.messages, _message_key)) {
        
        var _message_struct = global.translations.messages[$ _message_key];
        
        if (variable_struct_exists(_message_struct, _lang)) {
            _final_text = _message_struct[$ _lang];
            if (_lang == "tr") {
                _chosen_font = fnt_tr;
            }
        } 
        else if (variable_struct_exists(_message_struct, "nl")) {
            _final_text = _message_struct[$ "nl"];
        }
        else {
            _final_text = _message_key;
        }
        
    } else {
        _final_text = _message_key;
    }

	var _hint_box = instance_create_depth(0, 0, -9999, o_ui_hint);
    _hint_box.text = _final_text;
    _hint_box.my_font = _chosen_font;
}