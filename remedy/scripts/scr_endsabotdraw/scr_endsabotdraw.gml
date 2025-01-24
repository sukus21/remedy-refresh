function scr_endsabotdraw() {
	//Draw player and NPC
	global.animcyc+=1;
	if (global.animcyc==global.animcyclength)
	    global.animcyc=0;
	if (global.animcyc==0){
	    img=0;
	    img2=1;
	    }
	else if (global.animcyc==floor(global.animcyclength/2)){
	    img=1;
	    img2=3;
	    }
	imgsingle=img+6;
	imgsingle2=img2;
	draw_sprite(spr_you,imgsingle,96,104);
	if (global.marrytag==999)
	    draw_sprite(spr_openchest,0,56,96);
	else if (global.marrytag==998)
	    draw_sprite(spr_superchest,0,56,96);
	else
	    draw_sprite(spr_npc,imgsingle2+global.marrytag*4,56,96);

	//Draw text
	if (endingtalk){
	    if (endinglength>0){
	        if (endingstep<endinglength)
	            endingstep+=1;
	        endingstring=string_copy(realendingstring,0,endingstep);
	        scr_drawtext(16,4,endingstring,8,spr_text);
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
	        //First intro
	        if (global.firstintro!=1 && global.finalbossdead!=1) {
	            if (instance_exists(obj_you)) {
					obj_you.ignoreall=0;
				}
			}
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
	        //restart
	        sound_stop_all();
	        room_goto(rom_title);
	        }
	    }



}
