function scr_battlesabotdraw() {
	//Drawinit
	if (!drawinit){
	    drawinit=1;
	    transition=1;
	    transitioncyc=0;
	    }

	//intro
	if (introcyc<1000)
	    introcyc+=1;
	if (introcyc>=8){
	    if (introcyc<=18)
	        drawbanner+=1;
	    if (introcyc mod 15==0 && introcyc<50){
	        global.flashr=180;
	        sfx_play(snd_healmode);
	        }
	    if (introcyc<40){
	        for (i=0;i<drawbanner;i+=1){
	            scr_drawext(spr_message1,11,10,get_xview()+0+i*16,get_yview()+52);
	            //draw_sprite_ext(spr_message1,10,get_xview()+0+i*16,get_yview()+52,1,1,0,global.bgcolor,1);
	            draw_sprite(spr_message1,i+healmodeflash*12,get_xview()+0+i*16,get_yview()+52);
	            }
	        }
	    if (introcyc>=50 && introcyc<=60)
	        drawbanner-=1;
	    if (introcyc>=40 && introcyc<60){
	        for (i=10-drawbanner;i<10;i+=1){
	            scr_drawext(spr_message1,11,10,get_xview()+0+i*16,get_yview()+52);
	            //draw_sprite_ext(spr_message1,10,get_xview()+0+i*16,get_yview()+52,1,1,0,global.bgcolor,1);
	            draw_sprite(spr_message1,i+healmodeflash*12,get_xview()+0+i*16,get_yview()+52);
	            }
	        }
	    if (introcyc==60){
	        obj_battleyou.resetignoreall=2;
	        with (obj_enemy)
	            ready=1;
	        with (obj_bossenemy){
	            if (type==1 || type==2 || type==3)
	                active=1;
	            }
	        }
	    }

	//victory
	if (victory){
	    if (vicgdir==0){
	        vicg-=10;
	        if (vicg<=0)
	            vicgdir=1;
	        }
	    else if (vicgdir==1){
	        vicg+=10;
	        if (vicg>=150)
	            vicgdir=0;
	        }
	    if (vicg<0) vicg=0;
	    global.flashg=vicg;
    
	    dollys+=dollyacc;
	    dolly+=dollys;
	    scr_drawext(spr_black,0,1,dollx-8,dolly-8);
	    //draw_sprite_ext(spr_black,1,dollx-8,dolly-8,1,1,0,global.bgcolor,1);
	    draw_sprite(spr_you,6,dollx,dolly);
	    if (victorycyc<1000)
	        victorycyc+=1;
	    if (victorycyc>=15){
	        scr_drawext(spr_rewardline,1,0,get_xview()+24,get_yview()+72);
	        //draw_sprite_ext(spr_rewardline,0,get_xview()+24,get_yview()+72,1,1,0,global.bgcolor,1);
	        scr_drawtext(get_xview()+32,get_yview()+80,"YOU GOT A >!",8,spr_text);
	        }
	    if (victorycyc>=15 && victorycyc<=25)
	        drawvictory+=1;
	    if (victorycyc>=0){
	        for (i=0;i<drawvictory;i+=1){
	            scr_drawext(spr_message1,11,10,get_xview()+0+i*16,get_yview()+52);
	            //draw_sprite_ext(spr_message1,10,get_xview()+0+i*16,get_yview()+52,1,1,0,global.bgcolor,1);
	            draw_sprite(spr_message2,i,get_xview()+0+i*16,get_yview()+52);
	            }
	        }
	    if (victorycyc>=30 && (pressinteract && !pressinteractprev) && !victorydone){
	        victorydone=1;
	        transition=2;
	        transitioncyc=0;
	        }
	    }

	//failure
	//takes priority over victory
	if (failure){
	    scr_drawext(spr_pause2,1,0,get_xview()+0,get_yview()+0);
	    //draw_sprite_ext(spr_pause2,0,get_xview()+0,get_yview()+0,1,1,0,global.bgcolor,1);
	    dollys+=dollyacc;
	    dolly+=dollys;
	    scr_drawext(spr_black,0,1,dollx-8,dolly-8);
	    //draw_sprite_ext(spr_black,1,dollx-8,dolly-8,1,1,0,global.bgcolor,1);
	    draw_sprite(spr_you,6,dollx,dolly);
    
	    failurecyc+=1;
	    if (failurecyc>=15 && failurecyc<=25)
	        drawfailure+=1;
	    if (failurecyc>0){
	        for (i=0;i<drawfailure;i+=1){
	            scr_drawext(spr_message1,11,10,get_xview()+0+i*16,get_yview()+52);
	            //draw_sprite_ext(spr_message1,10,get_xview()+0+i*16,get_yview()+52,1,1,0,global.bgcolor,1);
	            draw_sprite(spr_message2,i+10,get_xview()+0+i*16,get_yview()+52);
	            }
	        }
	    if (failurecyc==60){
	        transition=2;
	        transitioncyc=0;
	        }
	    }

	//Draw HUD
	if (!failure){
	    draw_sprite(spr_battlescreen,0,0,get_yview()+get_hview()-12);
	    draw_sprite(spr_battlescreen,0,0,get_yview()+get_hview());
	    draw_sprite(spr_battlescreen,0,room_width,get_yview()+get_hview()-12);
	    draw_sprite(spr_battlescreen,0,room_width,get_yview()+get_hview());
	    draw_sprite(spr_text,30,get_xview()+4,get_yview()+130);
	    //health bar
	    for (i=0;i<28;i+=1){
	        hpimg=1;
	        if (i==0)
	            hpimg=0;
	        else if (i==27)
	            hpimg=2;
	        draw_sprite(spr_hpbar,hpimg,get_xview()+16+i*4,get_yview()+129);
	        }
	    drawhpnum=ceil((obj_battleyou.hp/global.hearts)*28);
	    for (i=0;i<drawhpnum;i+=1){
	        hpimg=4;
	        if (i==0)
	            hpimg=3;
	        else if (i==27)
	            hpimg=5;
	        draw_sprite(spr_hpbar,hpimg,get_xview()+16+i*4,get_yview()+129);
	        }
	    //flasks
	    drawtext="";
	    if (obj_battleyou.flasks<10)
	        drawtext+=" ";
	    drawtext+=string(obj_battleyou.flasks)+"&";
	    scr_drawtext(get_xview()+132,get_yview()+130,drawtext,8,spr_text);
	    }

	//Final boss smack talk
	if (smacktalk){
	    smacktalkcyc+=1;
	    if (smacktalkcyc==1){
	        smackline[0]="Rage...$$$$$$$$$$#$loss...$$$$$$$$$$#$$sorrow...$$";
	        smackline[1]="Can they really#$be healed?$$";
	        smackline[2]="The pain#$lets us know#$$we are alive...$$";
	        smackline[3]="Your healing#$is not needed#$$in this world!$$";
	        }
	    else if (smacktalkcyc==ceil(30*speeddif)){
	        smacklength=string_length(smackline[0]);
	        smacklengthcyc=0;
	        realsmackstring=smackline[0];
	        smackstep=0;
	        }
	    else if (smacktalkcyc==ceil(120*speeddif)){
	        smacklength=string_length(smackline[1]);
	        smacklengthcyc=0;
	        realsmackstring=smackline[1];
	        smackstep=0;
	        }
	    else if (smacktalkcyc==ceil(180*speeddif)){
	        smacklength=string_length(smackline[2]);
	        smacklengthcyc=0;
	        realsmackstring=smackline[2];
	        smackstep=0;
	        }
	    else if (smacktalkcyc==ceil(240*speeddif)){
	        smacklength=string_length(smackline[3]);
	        smacklengthcyc=0;
	        realsmackstring=smackline[3];
	        smackstep=0;
	        }
	    else if (smacktalkcyc==ceil(300*speeddif)){
	        smacktalk=0;
	        smacklength=0;
	        smacklengthcyc=0;
	        realsmackstring="";
	        smackstep=0;
	        }
	    if (smacklength>0){
	        if (smackstep<smacklength)
	            smackstep+=1;
	        smackstring=string_copy(realsmackstring,0,smackstep);
	        scr_drawtext(8,8,smackstring,8,spr_text2);
	        }
	    }

	//Transition in
	if (transition==1){
	    transitioncyc+=1;
	    if (transitioncyc==3 || transitioncyc2>0)
	        transitioncyc2+=1;
	    if (transitioncyc2>5)
	        transitioncyc2=5;
	    if (transitioncyc>0){
	        for (i=0;i<5-transitioncyc2;i+=1){
	            for (j=0;j<9;j+=1){
	                if (i==5-transitioncyc2-1){
	                    draw_sprite(spr_black,2,get_xview()+i*16,get_yview()+j*16);
	                    draw_sprite(spr_black,3,get_xview()+144-i*16,get_yview()+j*16);
	                    }
	                else{
	                    draw_sprite(spr_black,0,get_xview()+i*16,get_yview()+j*16);
	                    draw_sprite(spr_black,0,get_xview()+144-i*16,get_yview()+j*16);
	                    }
	                }
	            }
	        }
	    if (transitioncyc==8){
	        transition=0;
	        transitioncyc=0;
	        transitioncyc2=0;
	        }
	    }

	//Transition out
	if (transition==2){
	    transitioncyc+=1;
	    if (transitioncyc mod 3==2 || transitioncyc2>0)
	        transitioncyc2+=1;
	    if (transitioncyc2>5)
	        transitioncyc2=5;
	    if (transitioncyc>0){
	        for (i=0;i<transitioncyc2;i+=1){
	            for (j=0;j<9;j+=1){
	                if (i==transitioncyc2-1){
	                    draw_sprite(spr_black,2,get_xview()+i*16,get_yview()+j*16);
	                    draw_sprite(spr_black,3,get_xview()+144-i*16,get_yview()+j*16);
	                    }
	                else{
	                    draw_sprite(spr_black,0,get_xview()+i*16,get_yview()+j*16);
	                    draw_sprite(spr_black,0,get_xview()+144-i*16,get_yview()+j*16);
	                    }
	                }
	            }
	        }
	    if (transitioncyc==8){
	        if (victory){
	            global.hearts+=1; //get reward
	            if (global.hearts>99)
	                global.hearts=99;
	            }
	        transition=0;
	        transitioncyc=0;
	        transitioncyc2=0;
	        room_goto(global.camefrom);
	        }
	    }

	//DEBUG: show hitboxes
	//brush_color=c_red;
	//with (all)
	//    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom);



}
