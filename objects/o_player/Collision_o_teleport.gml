if(other.target_room == r_stad){
	o_controller.save_data()
}

if(other.target_room == r_upgrade || other.target_room == r_stad || global.talkedToNpc == true){
	teleport(other.target_room, other.target_x, other.target_y);
	return;
}else if(global.talkedToNpc == false && talkToNpcHint == false){
	show_hint("talkToNpc")	
	talkToNpcHint = true
}