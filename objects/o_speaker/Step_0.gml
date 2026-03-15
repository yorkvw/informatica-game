audio_emitter_position(emitter, x, y, 0);

// ── Fade-out als de room verlaten is ──────────────────────
if (fading_out) {
    fade_gain -= fade_speed;
    if (fade_gain <= 0) {
        fade_gain = 0;
        if (sound_id != noone && audio_is_playing(sound_id)) {
            audio_stop_sound(sound_id);
            sound_id = noone;
        }
        fading_out = false;
    } else {
        audio_emitter_gain(emitter, fade_gain);
    }
}