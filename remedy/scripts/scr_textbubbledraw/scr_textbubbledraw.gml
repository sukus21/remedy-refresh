function scr_textbubbledraw() {
	scr_drawext(spr_textbubble2,1,0,x,y);
	//draw_sprite_ext(spr_textbubble2,1,x,y,1,1,0,global.bgcolor,1);
	draw_sprite(sprite_index,image_single,x,y+nudge);
	scr_drawtext(x+8,y+3+nudge*2,finaltext,8,spr_text);
	if (talktonpc && !marry)
	    scr_drawtext(x+8,y+3+nudge*2,name+":",8,spr_text3);
	if (extraname)
	    scr_drawtext(x+8,y+3+nudge*2,name+":",8,spr_text3);

	//draw marker
	if (marry){
	    draw_sprite(spr_text,96,x+40+selected*40,y+28+nudge);
	    }
	else{
	    if (global.animcyc<global.animcyclength/2)
	        markeryoff=0;
	    else
	        markeryoff=1;
	    if (talktonpc){
	        if ((cured==0 && page==texts-1) || (cured==1 && page==aftertexts-1))
	            draw_sprite(spr_text,95,x+144,y+28+markeryoff+nudge);
	        else
	            draw_sprite(spr_text,91,x+144,y+28+markeryoff+nudge);
	        }
	    else{
	        if (page==texts-1)
	            draw_sprite(spr_text,95,x+144,y+28+markeryoff+nudge);
	        else
	            draw_sprite(spr_text,91,x+144,y+28+markeryoff+nudge);
	        }
	    }



}
