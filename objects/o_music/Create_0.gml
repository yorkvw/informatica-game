current_music = noone;

if (!audio_is_playing(snd_titlescreen)) {
    current_music = audio_play_sound(snd_titlescreen, 1000, true);
    audio_sound_gain(current_music, 1, 0);
}