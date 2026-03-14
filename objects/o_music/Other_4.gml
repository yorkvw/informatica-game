if (room == r_stad) {

    if (current_music != noone && audio_is_playing(current_music)) {
        audio_sound_gain(current_music, 0, 2000); 
    }

    var sp = instance_find(o_speaker, 0);

    if (sp != noone && !audio_is_playing(sp.sound_id))
    {
        sp.sound_id = audio_play_sound_on(sp.emitter, snd_ezan, true, 1);
    }
}