my_speed = 1.5;
image_speed = 0;
global.player_lives = 3

function teleport(nextroom, xcoordinate, ycoordinate){
    global.target_x = xcoordinate;
    global.target_y = ycoordinate;
	room_goto(nextroom)
}
