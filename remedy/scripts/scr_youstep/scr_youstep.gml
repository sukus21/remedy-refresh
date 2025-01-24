function scr_youstep() {
	scr_joy(0);
	scr_input();

	//Reset ignoreall
	if (resetignoreall>0){
	    resetignoreall-=1;
	    if (resetignoreall==0)
	        ignoreall=0;
	    }

	//Controls
	else if (walkcyc==0){
	    //in quit menu
	    if ((quit==1 || quit==2) && obj_sabot.transition==0){
	        //move marker
	        if ((pressleft && !pressleftprev) || (pressright && !pressrightprev)){
	            quitselect=1-quitselect;
	            sfx_play(snd_select);
	            }
	        //advance
	        if (pressinteract && !pressinteractprev){
	            if (quit==1){
	                if (quitselect==0){
	                    quit=2;
	                    sfx_play(snd_back);
	                    }
	                else{
	                    quit=2;
	                    scr_save();
	                    sfx_play(snd_warp);
	                    }
	                }
	            else if (quit==2){
	                if (quitselect==0){
	                    quitignoreall=0;
	                    quit=0;
	                    sfx_play(snd_back);
	                    }
	                else{
	                    if (global.autosave){
	                        scr_save();
	                        sfx_play(snd_warp);
	                        }
	                    quitignoreall=1;
	                    ignoreall=1;
	                    obj_sabot.transition=2;
	                    obj_sabot.quitgame=1;
	                    sfx_play(snd_select);
	                    }
	                }
	            }
	        }
	    //not in quit menu
	    else if (!ignoreall && !quitignoreall){
	        //Hyperchest
	        if (place_meeting(x,y,obj_hyperchest) && global.hyperchest==1){
	            obj_sabot.hidelocmessage=1;
	            global.hyperchest=2;
	            for (i=1;i<26;i+=1)
	                global.chestopened[i]=1;
	            global.hearts+=12;
	            global.force+=1;
	            global.multi+=2;
	            global.regen+=4;
	            global.flasks+=4;
	            global.item[0]=1;
	            global.item[1]=1;
	            if (global.hearts>99)
	                global.hearts=99;
	            if (global.force>99)
	                global.force=99;
	            if (global.multi>99)
	                global.multi=99;
	            if (global.regen>99)
	                global.regen=99;
	            if (global.flasks>99)
	                global.flasks=99;
	            ignoreall=1;
	            sfx_play(snd_openchest);
	            global.flashr=200;
	            global.flashg=200;
	            global.flashb=200;
	            //open chest
	            with (tempid){
	                instance_destroy();
	                instance_create_depth(x,y,50,obj_openchest);
	                }            
	            scr_singlebubble("All chests in East and West Hurtland have been opened!#$>12 <1 @2 \\4 &4","",0,1);
	            }
	        //arrows
	        else if (pressright){
	            walkdir=0;
	            if (pressrun ^^ global.alwaysrun)
	                walkspd=4;
	            else
	                walkspd=2;
	            if (place_free(x+walktilesize,y) && x<room_width-walktilesize)
	                walkcyc=walktilesize;
	            }
	        else if (pressup){
	            walkdir=1;
	            if (pressrun ^^ global.alwaysrun)
	                walkspd=4;
	            else
	                walkspd=2;
	            if (place_free(x,y-walktilesize) && y>walktilesize)
	                walkcyc=walktilesize;
	            }
	        else if (pressleft){
	            walkdir=2;
	            if (pressrun ^^ global.alwaysrun)
	                walkspd=4;
	            else
	                walkspd=2;
	            if (place_free(x-walktilesize,y) && x>walktilesize)
	                walkcyc=walktilesize;
	            }
	        else if (pressdown){
	            walkdir=3;
	            if (pressrun ^^ global.alwaysrun)
	                walkspd=4;
	            else
	                walkspd=2;
	            if (place_free(x,y+walktilesize) && y<room_height-walktilesize)
	                walkcyc=walktilesize;
	            }
	        if (walkcyc==0 && pressinteract && !pressinteractprev){
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
	    //press escape
	    if ((pressescape && !pressescapeprev) && !place_meeting(x,y,obj_destination) && !quitignoreall){
	        //cancel quit menu
	        if (quit>0){
	            quitignoreall=0;
	            quit=0;
	            sfx_play(snd_back);
	            }
	        //enter quit menu
	        else if (obj_sabot.transition==0 && obj_sabot.extratransition==0){
	            //cancel things in pause menu
	            if (instance_number(obj_pause)==1){
	                with (obj_pause){
	                    if (quitprompt){
	                        quitprompt=0;
	                        sfx_play(snd_back);
	                        }
	                    else if (tier==0){
	                        obj_you.resetignoreall=2;
	                        instance_destroy();
	                        sfx_play(snd_back);
	                        }
	                    else if (tier==1){
	                        scr_saveoptions();
	                        tier=0;
	                        global.pauseselected=5;
	                        sfx_play(snd_back);
	                        }
	                    }
	                }
	            //enter quit menu
	            else if (!(room==rom_royalcastle2f && instance_number(obj_textbubble)>0)){
	                quitignoreall=1;
	                if (global.autosave)
	                    quit=2;
	                else
	                    quit=1;
	                quitselect=0;
	                sfx_play(snd_openchest);
	                }
	            }
	        }
	    }

	//Walking
	if (walkcyc>0){
	    walkcyc-=walkspd;
	    if (walkcyc==0)
	        checkdestnow=1;
	    if (walkdir==0)
	        x+=walkspd;
	    else if (walkdir==1)
	        y-=walkspd;
	    else if (walkdir==2)
	        x-=walkspd;
	    else if (walkdir==3)
	        y+=walkspd;
	    }

	//Animate
	if (global.animcyc==0)
	    img=0;
	else if (global.animcyc==floor(global.animcyclength/2))
	    img=1;
	image_single=img+walkdir*2;

	//Touch destination
	tempid=-1;
	tempid=instance_place(x,y,obj_destination);
	if (tempid>-1){
	    if (checkdestnow==1 && !tempid.noentry && obj_sabot.destination==0){
	        ignoreall=1;
	        global.destination=tempid.out;
	        global.roomgoto=tempid.dest;
	        if (tempid.overridedir){
	            global.overridedir=1;
	            global.overridedirout=tempid.overridedirout;
	            }
	        obj_sabot.transition=2;
	        obj_sabot.transitioncyc=0;
	        }
	    }
	checkdestnow=0;

	//Secret wall
	if (place_meeting(x,y,obj_secretwall))
	    depth=1000100;
	else
	    depth=0;



}
