function scr_pausedraw() {
	//draw
	scr_drawext(spr_pause2,1,0,x,y);
	//draw_sprite_ext(spr_pause2,0,x,y,1,1,0,global.bgcolor,1);
	if (tier==0)
	    draw_sprite(spr_pause,0,x,y);
	else if (tier==1 || tier==2)
	    draw_sprite(spr_pause,1,x,y);

	//marker
	if (quitprompt)
	    draw_sprite(spr_text,96,x+16+subselected*32,y+8+(global.pauseselected+1)*8);
	else if (tier!=2)
	    draw_sprite(spr_text,96,x+8,y+8+global.pauseselected*8);


	//items
	if (tier==0){
	    if (global.item[0])
	        draw_sprite(spr_key,0,x+104,y+56);
	    if (global.item[1])
	        draw_sprite(spr_key,1,x+120,y+56);
	    if (global.item[2])
	        draw_sprite(spr_key,2,x+136,y+56);
	    if (global.item[3])
	        draw_sprite(spr_key,3,x+104,y+72);
	    if (global.item[4])
	        draw_sprite(spr_key,4,x+120,y+72);
	    if (global.item[5])
	        draw_sprite(spr_key,5,x+136,y+72);
	    }
	//info
	if (tier==0)
	    scr_drawtext(x+104,y+40,"Remedy",8,spr_text);
	if (tier==0 || tier==1){
	    scr_drawtext(x+16,y+7,textstring,8,spr_text);
	    scr_drawtext(x+8,y+95,textstring2,8,spr_text);
	    }
	else if (tier==2){
	    if (assign<=3)
	        textstring="#Press the D-Pad###Press a keyboard#key to cancel and#reset the buttons";
	    else
	        textstring="#Gamepad setup#complete!##Press a keyboard#key to return"
	    scr_drawtext(x+16,y+8,textstring,8,spr_text2);
	    if (assign==0)
	        scr_drawtext(x+16,y+24,"    Up",8,spr_text3);
	    else if (assign==1)
	        scr_drawtext(x+16,y+24,"   Down",8,spr_text3);
	    else if (assign==2)
	        scr_drawtext(x+16,y+24,"   Left",8,spr_text3);
	    else if (assign==3)
	        scr_drawtext(x+16,y+24,"   Right",8,spr_text3);
	    }



}
