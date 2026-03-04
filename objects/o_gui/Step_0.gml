// Timer aftellen (zorg dat timer_seconds >= 0 blijft)
if (timer_seconds > 0) {
    timer_seconds -= 1 * (1 / room_speed); // 1 seconde per echte seconde aftellen
    if (timer_seconds < 0) timer_seconds = 0;
}
else {
    timer_seconds = 0; 

    if (room != r_gameover) {
        room_goto(r_gameover);
    }
}

if (timer_seconds <= 300 && shook_at_5 == false) {

    screen_shake(5, 30); 
    
    shook_at_5 = true; 
}