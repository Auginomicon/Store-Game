hitbox = instance_create_layer(x, y, "Instances", objHitbox);
hitbox.sprite_index = sprite_index;

x1 = x - (sprite_width / 2);
y1 = y;

x2 = x + (sprite_width / 2);
y2 = y + 48;