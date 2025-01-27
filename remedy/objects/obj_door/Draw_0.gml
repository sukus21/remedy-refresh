if (shake > 0) shakeoff = shake mod 2;
else shakeoff = 0;

draw_sprite_ext(spr_black, 1, x, y, 1, 1, 0, global.bgcolor, 1);
draw_sprite(sprite_index, image_single, x+shakeoff, y);
