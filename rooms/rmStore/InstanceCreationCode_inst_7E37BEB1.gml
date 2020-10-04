sprite_index = sprGlassDoor2;
mask_index = sprGlassDoor2;

hitbox = instance_create_layer(x, y + 16, "Instances", objHitbox);
hitbox.sprite_index = sprite_index;

x1 = x - 48;
y1 = y;

x2 = x;
y2 = y + sprite_height;