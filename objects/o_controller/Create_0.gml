randomize();

// Sessie variabelen
coins = 0;
keys = 0;
artefact = 0;
time_left = 0;        // huidige tijd
time_upgrade = 600;   // eerste upgrade geeft 600 sec
upgrade_step = 10;    // elke koop +10 extra
upgrade_cost = 1;     // kost 1 coin

// Opgeslagen variabelen
global.total_coins = 0;
global.total_artefacts = 0;

// Save Data Functie
save_data = function() {
    global.total_coins += coins;
    global.total_artefacts += artefact;
    
    coins = 0;
    artefact = 0;

    var _data_struct = {
        total_coins: global.total_coins,
        total_artefacts: global.total_artefacts,
        language: global.language
    };
    
    var _json_string = json_stringify(_data_struct);
    
    var _file = file_text_open_write("save_data.json");
    file_text_write_string(_file, _json_string);
    file_text_close(_file);
};

// Load Data Functie
load_data = function() {
    var _save_file = "save_data.json";
    
    if (file_exists(_save_file)) {
        var _file = file_text_open_read(_save_file);
        var _json_string = "";
        while (!file_text_eof(_file)) {
            _json_string += file_text_read_string(_file);
            file_text_readln(_file);
        }
        file_text_close(_file);
        
        var _save_data = json_parse(_json_string);
        
        if (variable_struct_exists(_save_data, "total_coins")) global.total_coins = _save_data.total_coins;
        if (variable_struct_exists(_save_data, "total_artefacts")) global.total_artefacts = _save_data.total_artefacts;
        if (variable_struct_exists(_save_data, "language")) global.language = _save_data.language;
    } else {
        global.total_coins = 0;
        global.total_artefacts = 0;
        global.language = "";
    }
};

load_data();