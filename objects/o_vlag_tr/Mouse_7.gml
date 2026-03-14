global.language = "tr";
global.total_coins = 0;
global.total_artefacts = 0;

if (instance_exists(o_controller)) {
    o_controller.save_data();
}

show_hint("welcome")
room_goto(r_stad);