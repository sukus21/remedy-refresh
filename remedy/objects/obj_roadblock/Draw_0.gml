if (shake>0)
    shakeoff=shake mod 2;
else
    shakeoff=0;

if (global.gmv==7){
    scr_drawext(spr_black,0,1,x,y);
    scr_drawext(spr_black,0,1,x+16,y);
    }
//draw_sprite_ext(spr_black,1,x,y,1,1,0,global.bgcolor,1);
//draw_sprite_ext(spr_black,1,x+16,y,1,1,0,global.bgcolor,1);
if (global.difficulty==3)
    draw_sprite(sprite_index,1,x+shakeoff,y);
else{
    draw_sprite(sprite_index,0,x+shakeoff,y);
    if (amount<10)
        draw_sprite(spr_text,16+amount,x+12+shakeoff,y);
    else{
        draw_sprite(spr_text,16+floor(amount/10),x+8+shakeoff,y);
        draw_sprite(spr_text,16+(amount mod 10),x+16+shakeoff,y);
        }
    }

