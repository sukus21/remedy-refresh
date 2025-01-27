function scr_sabotdraw() {
	//Drawinit
	if (!drawinit){
	    drawinit=1;
	    transition=1;
	    transitioncyc=0;
	    global.flashr=0;
	    global.flashg=0;
	    global.flashb=0;
	    }

	//quit prompt
	if (obj_you.quit==1 || obj_you.quit==2){
	    for(i=0;i<10;i+=1){
	        for(j=0;j<9;j+=1)
	            draw_sprite(spr_black,0,get_xview()+i*16,get_yview()+j*16);
	        }
	    if (obj_you.quit==1)
	        scr_drawtext(get_xview()+16,get_yview()+get_hview()/2-20,"$$$$$Save?##$$$$No$$$Yes",8,spr_text);
	    else if (obj_you.quit==2){
	        if (global.autosave)
	            scr_drawtext(get_xview()+16,get_yview()+get_hview()/2-20,"$Save and Quit?##$$$$No$$$Yes",8,spr_text);
	        else
	            scr_drawtext(get_xview()+16,get_yview()+get_hview()/2-20,"$$$Quit game?##$$$$No$$$Yes",8,spr_text);
	        }
	    //scr_drawtext(get_xview()+32,get_yview()+get_hview()/2-20,"$$$Quit?##$$No$$$Yes",8,spr_text);
	    draw_sprite(spr_text,96,get_xview()+40+obj_you.quitselect*40,get_yview()+get_hview()/2-4);
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
	        //First intro
	        if (global.firstintro!=1 && global.finalbossdead!=1)
	            obj_you.ignoreall=0;
	        else if (global.firstintro==1){
	            extratransition=1;
	            global.firstintro=2;
	            }
	        else if (global.finalbossdead==1){
	            extratransition=1;
	            global.finalbossdead=2;
	            }
	        }
	    }
	//Intro with Queen, ending with Prince
	if (extratransition){
	    extratransitioncyc+=1;
	    if (extratransitioncyc>=4){
	        extratransitioncyc=0;
	        extratransition=0;
	        with (obj_you){
	            if (walkdir==0)
	                scr_youinteract(x+16,y);
	            else if (walkdir==1)
	                scr_youinteract(x,y-16);
	            else if (walkdir==2)
	                scr_youinteract(x-16,y);
	            else if (walkdir==3)
	                scr_youinteract(x,y+16);
	            }
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
	        transition=0;
	        transitioncyc=0;
	        transitioncyc2=0;
	        //find battle room to go to
	        //the following can be easily solved with execute_string,
	        //but I avoid it just in case.
	        //instead look at this glorious code and weep.
	        if (quitgame){
	            scr_stopmusic();
	            scr_saveoptions();
	            room_goto(rom_title);
	            }
	        else if (beginbattle){
	            if (global.difficulty==3) global.roomgoto=rom_battle51;
	            else if (global.battle==1) global.roomgoto=rom_battle1;
	            else if (global.battle==2) global.roomgoto=rom_battle2;
	            else if (global.battle==3) global.roomgoto=rom_battle3;
	            else if (global.battle==4) global.roomgoto=rom_battle4;
	            else if (global.battle==5) global.roomgoto=rom_battle5;
	            else if (global.battle==6) global.roomgoto=rom_battle6;
	            else if (global.battle==7) global.roomgoto=rom_battle7;
	            else if (global.battle==8) global.roomgoto=rom_battle8;
	            else if (global.battle==9) global.roomgoto=rom_battle9;
	            else if (global.battle==10) global.roomgoto=rom_battle10;
	            else if (global.battle==11) global.roomgoto=rom_battle11;
	            else if (global.battle==12) global.roomgoto=rom_battle12;
	            else if (global.battle==13) global.roomgoto=rom_battle13;
	            else if (global.battle==14) global.roomgoto=rom_battle14;
	            else if (global.battle==15) global.roomgoto=rom_battle15;
	            else if (global.battle==16) global.roomgoto=rom_battle16;
	            else if (global.battle==17) global.roomgoto=rom_battle17;
	            else if (global.battle==18) global.roomgoto=rom_battle18;
	            else if (global.battle==19) global.roomgoto=rom_battle19;
	            else if (global.battle==20) global.roomgoto=rom_battle20;
	            else if (global.battle==21) global.roomgoto=rom_battle21;
	            else if (global.battle==22) global.roomgoto=rom_battle22;
	            else if (global.battle==23) global.roomgoto=rom_battle23;
	            else if (global.battle==24) global.roomgoto=rom_battle24;
	            else if (global.battle==25) global.roomgoto=rom_battle25;
	            else if (global.battle==26) global.roomgoto=rom_battle26;
	            else if (global.battle==27) global.roomgoto=rom_battle27;
	            else if (global.battle==28) global.roomgoto=rom_battle28;
	            else if (global.battle==29) global.roomgoto=rom_battle29;
	            else if (global.battle==30) global.roomgoto=rom_battle30;
	            else if (global.battle==31) global.roomgoto=rom_battle31;
	            else if (global.battle==32) global.roomgoto=rom_battle32;
	            else if (global.battle==33) global.roomgoto=rom_battle33;
	            else if (global.battle==34) global.roomgoto=rom_battle34;
	            else if (global.battle==35) global.roomgoto=rom_battle35;
	            else if (global.battle==36) global.roomgoto=rom_battle36;
	            else if (global.battle==37) global.roomgoto=rom_battle37;
	            else if (global.battle==38) global.roomgoto=rom_battle38;
	            else if (global.battle==39) global.roomgoto=rom_battle39;
	            else if (global.battle==40) global.roomgoto=rom_battle40;
	            else if (global.battle==41) global.roomgoto=rom_battle41;
	            else if (global.battle==42) global.roomgoto=rom_battle42;
	            else if (global.battle==43) global.roomgoto=rom_battle43;
	            else if (global.battle==44) global.roomgoto=rom_battle44;
	            else if (global.battle==45) global.roomgoto=rom_battle45;
	            else if (global.battle==46) global.roomgoto=rom_battle46;
	            else if (global.battle==47) global.roomgoto=rom_battle47;
	            else if (global.battle==48) global.roomgoto=rom_battle48;
	            else if (global.battle==49) global.roomgoto=rom_battle49;
	            else if (global.battle==50) global.roomgoto=rom_battle50;
	            }
	        //go to room
	        if (!quitgame)
	            room_goto(global.roomgoto);
	        }
	    }

	//Location message
	if (locmescyc<100){
	    locmescyc+=1;
	    if (locmescyc==45)
	        hidelocmessage=1;
	    }
	if (!hidelocmessage && locmescyc>=3){
	    draw_sprite_ext(spr_locationmessage, 1, get_xview(), get_yview(), 1, 1, 0, global.bgcolor, 1);
	    draw_sprite(spr_locationmessage,0,get_xview(),get_yview());
	    xoff=(get_wview()/2)-string_length(loctext)*4;
	    scr_drawtext(get_xview()+xoff,get_yview()+3,loctext,8,spr_text);
	    }

	//DEBUG: show hitboxes
	//brush_color=c_red;
	//with (all)
	//    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom);



}
