function scr_textbubblestep() {
	scr_joy(0);
	scr_input();

	//get ready
	if (readycyc<60)
	    readycyc+=1;
	if ((readycyc==2 && !longdelay) || (readycyc==30 && longdelay))
	    ready=1;

	//select
	if (marry && !obj_you.quit){
	    if ((pressleft && !pressleftprev) || (pressright && !pressrightprev)){
	        selected=1-selected;
	        sfx_play(snd_select);
	        }
	    }

	//advance
	if (nudge==1){
	    nudgecyc+=1;
	    if (nudgecyc>=2){
	        nudgecyc=0;
	        nudge=0;
	        }
	    }
	if (ready && (pressinteract && !pressinteractprev) && !obj_you.quit){
	    page+=1;
	    nudge=1;
	    //marry
	    if (marry){
	        if (selected==0){
	            instance_destroy();
	            obj_you.resetignoreall=2;
	            sfx_play(snd_back);
	            }
	        else{
	            if (global.autosave)
	                scr_save();
	            global.roomgoto=rom_end;
	            obj_sabot.transition=2;
	            sfx_play(snd_select);
	            instance_destroy();
	            }
	        }
	    //NPC
	    else if (talktonpc){
	        if ((cured==0 && page==texts) || (cured==1 && page==aftertexts)){
	            instance_destroy();
	            //enter battle!
	            if (cured==0){
	                sfx_play(snd_enterbattle);
	                global.exitedbattle=1;
	                global.playerposx=obj_you.x;
	                global.playerposy=obj_you.y;
	                global.playerdir=obj_you.walkdir;
	                global.destination=-1;
	                global.battle=battle;
	                global.battlenpc=tag;
	                global.camefrom=room;
	                obj_sabot.beginbattle=1;
	                obj_sabot.transition=2;
	                global.flashr=100;
	                global.flashg=100;
	                global.flashb=100;
	                }
	            else{
	                obj_you.resetignoreall=2;
	                if (global.finalbossdead==2){
	                    if (!global.maymarry){
	                        global.maymarry=1;
	                        global.npccured[60]=2;
	                        //scr_save();
	                        }
	                    }
	                }
	            }
	        else{
	            if (cured==0)
	                finaltext=name+":#"+text[page];
	            else
	                finaltext=name+":#"+aftertext[page];
	            }
	        }
	    else{
	        if (page==texts){
	            instance_destroy();
	            obj_you.resetignoreall=2;
	            }
	        else
	            finaltext=text[page];
	        }
	    finaltext=scr_linebreak(finaltext,148);
	    }



}
