function scr_titlesabotdraw() {
	if (state==0){
	    //DRAW
	    //main menu
	    if (tier==0){
	        scr_drawtext(16,88,"New game#Load game#Options#Quit",8,spr_text2);
	        draw_sprite(spr_text,96,8,88+selected*8);
	        }
	    //options
	    else if (tier==1){
	        tiertext="Back#Fullscreen ";
	        if (scr_fullscreen(0,1))
	            tiertext+="ON#"
	        else
	            tiertext+="OFF#"
        
	        tiertext+="Windowed size x"+string(global.windowed)+"#";

	        tiertext+="Music ";
	        if (global.playmusic)
	            tiertext+="ON#"
	        else
	            tiertext+="OFF#"
        
	        tiertext+="Sound ";
	        if (global.sound)
	            tiertext+="ON#"
	        else
	            tiertext+="OFF#"
        
	        tiertext+="Autosave ";
	        if (global.autosave)
	            tiertext+="ON#"
	        else
	            tiertext+="OFF#"
        
	        tiertext+="Always run ";
	        if (global.alwaysrun)
	            tiertext+="ON#"
	        else
	            tiertext+="OFF#"
        
	        tiertext+="Swap act/run ";
	        if (global.fliprun)
	            tiertext+="ON#"
	        else
	            tiertext+="OFF#"
        
	        if (global.joystickexists)
	            tiertext+="Setup gamepad";
        
	        for (i=0;i<10;i+=1){
	            for (j=0;j<6;j+=1)        
	                draw_sprite(spr_black,0,i*16,56+j*16)
	            }
	        scr_drawtext(16,64,tiertext,8,spr_text2);
	        draw_sprite(spr_text,96,8,64+selected*8);
	        }
	    //assign joystick
	    else if (tier==4){
	        for (i=0;i<10;i+=1){
	            for (j=0;j<6;j+=1)
	                draw_sprite(spr_black,0,i*16,56+j*16)
	            }
	        if (assign<=3)
	            tiertext="#Press the D-Pad###Press a keyboard#key to cancel and#reset the buttons";
	        else
	            tiertext="#Gamepad setup#complete!##Press a keyboard#key to return"
	        scr_drawtext(16,64,tiertext,8,spr_text2);
	        if (assign==0)
	            scr_drawtext(16,80,"    Up",8,spr_text3);
	        else if (assign==1)
	            scr_drawtext(16,80,"   Down",8,spr_text3);
	        else if (assign==2)
	            scr_drawtext(16,80,"   Left",8,spr_text3);
	        else if (assign==3)
	            scr_drawtext(16,80,"   Right",8,spr_text3);
	        }
	    //new/load game
	    else if (tier==2){
	        scr_drawtext(16,88,filestring,8,spr_text2);
	        draw_sprite(spr_text,96,8,88+selected*8);
	        }
	    //select difficulty
	    else if (tier==3){
	        if (unlockreally)
	            scr_drawtext(16,88,"Back#Normal#Hard#Master#Reallyjoel's dad",8,spr_text2);
	        else
	            scr_drawtext(16,88,"Back#Normal#Hard#Master",8,spr_text2);
	        draw_sprite(spr_text,96,8,88+selected*8);
	        }

	    //Music missing message
	    if (global.musicmissing && (tier==0 || tier==2 || tier==3)){
	        for (i=0;i<10;i+=1)
	            draw_sprite(spr_black,0,i*8,132);
	        scr_drawtext(0,132,"                    ",8,spr_text2);
	        scr_drawtext(0,132,"Music files missing!",8,spr_text3);
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
	                    draw_sprite(spr_black,2,scr_xview()+i*16,scr_yview()+j*16);
	                    draw_sprite(spr_black,3,scr_xview()+144-i*16,scr_yview()+j*16);
	                    }
	                else{
	                    draw_sprite(spr_black,0,scr_xview()+i*16,scr_yview()+j*16);
	                    draw_sprite(spr_black,0,scr_xview()+144-i*16,scr_yview()+j*16);
	                    }
	                }
	            }
	        }
	    if (transitioncyc==8){
	        transition=0;
	        transitioncyc=0;
	        transitioncyc2=0;
	        scr_saveoptions();
	        //go to room
	        if (global.fromsavefile)
	            scr_load();
	        else
	            room_goto(global.roomgoto);
	        }
	    }



}
