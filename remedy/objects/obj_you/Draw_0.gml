if (global.gmv==5){
    if (room==rom_easthurtland)
        draw_sprite(spr_black,4,x-8,y-8);
    else if (room==rom_westhurtland)
        draw_sprite(spr_black,5,x-8,y-8);
    else if (room==rom_northhurtland)
        draw_sprite(spr_black,6,x-8,y-8);
    else if (room==rom_royalvalley)
        draw_sprite(spr_black,7,x-8,y-8);
    else
        draw_sprite(spr_black,0,x-8,y-8);
    }
else if (global.gmv==7)
    scr_drawext(spr_black,0,1,x-8,y-8);
//draw_sprite_ext(spr_black,1,x-8,y-8,1,1,0,global.bgcolor,1);
draw_sprite(sprite_index,image_single,x,y);

