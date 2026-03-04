if (room == mineshaft) {

    if (current_music != noone && audio_is_playing(current_music)) {
        audio_sound_gain(current_music, 0, 2000); 
    }
    
    if (!audio_is_playing(snd_track1)) {
        current_music = audio_play_sound(snd_track1, 1000, true);

        audio_sound_gain(current_music, 0, 0);
        audio_sound_gain(current_music, 0.25, 2000);
    }
}