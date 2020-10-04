/// @description
path_delete(path);
if (audio_is_playing(sndSpoop01)) audio_stop_sound(sndSpoop01);
if (audio_is_playing(sndViolins)) audio_stop_sound(sndViolins);
instance_destroy(hitbox);