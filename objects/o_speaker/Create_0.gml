sound_id    = noone;
emitter     = audio_emitter_create();
fading_out  = false;   // wordt true zodra de room verlaten wordt
fade_gain   = 1.0;     // huidige gain (1.0 = vol, 0.0 = stil)
fade_speed  = 0.02;    // hoeveel gain er per step afgaat (0.02 = ~50 steps = ~1.5 sec bij 30fps)

audio_emitter_position(emitter, x, y, 0);
audio_emitter_falloff(emitter, 100, 800, 1);