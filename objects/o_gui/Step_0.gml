// Maak variabele voor cheat-menu aan als die nog niet bestaat
if (!variable_global_exists("cheats_open")) {
    global.cheats_open = false;
}

// Timer aftellen (zorg dat timer_seconds >= 0 blijft)
if (timer_seconds > 0) {
    timer_seconds -= 1 * (1 / room_speed); // 1 seconde per echte seconde aftellen
    if (timer_seconds < 0) timer_seconds = 0;
}

// Cheats menu togglen met Ctrl + C
if (keyboard_check_pressed(vk_control) && keyboard_check_pressed(ord("C"))) {
    global.cheats_open = !global.cheats_open;
}

// Cheats menu toetsen verwerken als open
if (global.cheats_open) {

    // Timer naar 5 min 10 sec
    if (keyboard_check_pressed(ord("1"))) {
        timer_seconds = 5 * 60 + 10;
        timer_events_done = [];
    }

    // Timer naar 3 min 10 sec
    if (keyboard_check_pressed(ord("2"))) {
        timer_seconds = 3 * 60 + 10;
        timer_events_done = [];
    }

    // Timer naar 0 min 10 sec
    if (keyboard_check_pressed(ord("3"))) {
        timer_seconds = 10;
        timer_events_done = [];
    }
}

// --- VOORBEELD: camera shake / gameover events ---
// Plaats hier je logica die afgaat bij bepaalde tijden, bv:

var cur_minutes = floor(timer_seconds) div 60;

if (cur_minutes == 5 && !array_contains(timer_events_done, 5)) {
    array_push(timer_events_done, 5);
    scr_shake_camera(10, 30);
    // Andere acties bij 5 min
}

if (cur_minutes == 3 && !array_contains(timer_events_done, 3)) {
    array_push(timer_events_done, 3);
    scr_shake_camera(15, 45);
    // Andere acties bij 3 min
}

if (timer_seconds <= 0 && !array_contains(timer_events_done, 0)) {
    array_push(timer_events_done, 0);
    scr_shake_camera(20, 60);
    room_goto(rm_gameover); // Ga naar gameover room
}


if (keyboard_check_pressed(vk_control) && keyboard_check_pressed(ord("C"))) {
    global.cheats_open = !global.cheats_open;
    show_debug_message("Cheats menu toggled: " + string(global.cheats_open));
}