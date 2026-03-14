menu_open = false;

if (!variable_global_exists("total_coins")) {
    global.total_coins = 150; 
}

upgrades =[
{ name: "Extra Tijd",      desc: "20 seconden langer",                                      spr: s_clock, cost: 10 },
{ name: "Stiller Slopen",  desc: "10% kans dat slopen geen geluid maakt",                   spr: s_coin, cost: 10 },
{ name: "Looter",          desc: "Kans op meer coins bij het slopen",                       spr: s_coin, cost: 12 },
{ name: "Archeoloog",      desc: "Verhoogde kans op artefacten in kisten",                  spr: s_coin, cost: 15 },
{ name: "Gate Master",     desc: "Verlaagt de kans op gesloten gates (kost 1 artefact)",    spr: s_coin, cost: 1 },
{ name: "Stealth",         desc: "10 sec geen geluid → +5 seconden tijd",                   spr: s_coin, cost: 14 },
{ name: "Headstart",       desc: "Start elke run met 5 coins",                              spr: s_coin, cost: 12 },
{ name: "Pickaxe",         desc: "Kan graven slopen (duur + tijdstraf bij gebruik)",        spr: s_coin, cost: 25 },
{ name: "Map",             desc: "Toont spelerlocatie en open gates",                       spr: s_coin, cost: 40 }
	
];