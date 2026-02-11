global.game_paused = true;

// alles pauzeren behalve controller
instance_deactivate_all(true);
instance_activate_object(o_controller);
instance_activate_object(o_upgrade_menu);