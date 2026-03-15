menu_open        = false;
selected_upgrade = -1;    // -1 = overzicht, anders = index van geselecteerde upgrade
active_sound_id  = -1;    // houdt de huidige audio_play_sound instantie bij

// ── Sound helpers (instance methodes zodat ze altijd bereikbaar zijn) ──
stop_upgrade_sound = function() {
    if (active_sound_id != -1 && audio_is_playing(active_sound_id)) {
        audio_stop_sound(active_sound_id);
    }
    active_sound_id = -1;
};

start_upgrade_sound = function(_item) {
    stop_upgrade_sound();
    if (variable_struct_exists(_item, "snd")) {
        active_sound_id = audio_play_sound(_item.snd, 10, true); // priority 10, loop
    }
};

if (!variable_global_exists("total_coins")) {
    global.total_coins = 150;
}

upgrades = [
    {
        name:     "Extra Tijd",
        desc:     "Voegt 20 seconden toe aan de looptijd van elke run.",
        cost:     10,
        spr:      s_clock,
        var_name: "upg_extra_tijd",
    },
    {
        name:     "Stiller Slopen",
        desc:     "10% kans dat het slopen van muren geen geluid maakt.",
        cost:     10,
        spr:      s_coin,
        var_name: "upg_stiller_slopen",
    },
    {
        name:     "Looter",
        desc:     "Verhoogde kans op extra coins bij het slopen van muren.",
        cost:     12,
        spr:      s_coin,
        var_name: "upg_looter",
    },
    {
        name:     "Archeoloog",
        desc:     "Verhoogde kans op artefacten in kisten.",
        cost:     15,
        spr:      s_coin,
        var_name: "upg_archeoloog",
    },
    {
        name:     "Gate Master",
        desc:     "Verlaagt de kans op gesloten gates. Kost 1 artefact per run.",
        cost:     1,
        spr:      s_coin,
        var_name: "upg_gate_master",
    },
    {
        name:     "Stealth",
        desc:     "10 seconden geen geluid maken geeft +5 seconden extra tijd.",
        cost:     14,
        spr:      s_coin,
        var_name: "upg_stealth",
    },
    {
        name:     "Headstart",
        desc:     "Start elke run met 5 extra coins in je zak.",
        cost:     12,
        spr:      s_coin,
        var_name: "upg_headstart",
    },
    {
        name:     "Pickaxe",
        desc:     "Kan graven slopen. Let op: duur en geeft een tijdstraf bij gebruik!",
        cost:     25,
        spr:      s_coin,
        var_name: "upg_pickaxe",
    },
    {
        name:     "Map",
        desc:     "Toont je spelerlocatie en alle open gates op de minikaart.",
        cost:     40,
        spr:      s_coin,
        var_name: "upg_map",
    },
];