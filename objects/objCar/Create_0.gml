/// @description
event_inherited();
isNPC = true;

//Communication Variables
portraitIndex = -1;
voice = sndVoice;
name = "Car";

hitbox = instance_create_layer(x, y, "Instances", objHitbox);
hitbox.sprite_index = sprite_index;