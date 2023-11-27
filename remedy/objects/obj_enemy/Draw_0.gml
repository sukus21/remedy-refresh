if (!invisible || img==2)
    draw_sprite(sprite_index,image_single,round(x),round(y+damaged*2));
if (type==17){
    for (i=1;i<20;i+=1)
        draw_sprite(sprite_index,image_single+4,round(x)+i*16,round(y+damaged*2));
    }
