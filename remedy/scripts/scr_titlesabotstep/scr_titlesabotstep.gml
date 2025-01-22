function scr_titlesabotstep() {
	if (tier!=4)
	    scr_joy(0);
	scr_input();

	if (pressescape && !pressescapeprev){
	    if (tier==4){
	        tier=1;
	        selected=8;
	        sfx_play(snd_back);
	        }
	    else if (tier==3){
	        tier=2;
	        selected=prevselected;
	        sfx_play(snd_back);
	        }
	    else if (tier==2){
	        tier=0;
	        selected=loadgame;
	        sfx_play(snd_back);
	        }
	    else if (tier==1){
	        tier=0;
	        selected=2;
	        scr_saveoptions();
	        sfx_play(snd_back);
	        }
	    else{
	        scr_saveoptions();
	        sound_stop_all();
	        game_end();
	        }
	    }

	//text
	if (state==0){
	    //unlock really
	    if (pressright){
	        really+=1;
	        if (!unlockreally && really==150){
	            unlockreally=1;
	            sfx_play(snd_select);
	            }
	        }
	    else
	        really=0;
	    //select
	    if (pressdown && !pressdownprev){
	        if (tier!=4)
	            selected+=1;
	        if (tier!=4)
	            sfx_play(snd_select);
	        if (tier==0){
	            if (selected==4)
	                selected=0;
	            }
	        else if (tier==1){
	            if ((selected==8 && !global.joystickexists) || (selected==9 && global.joystickexists))
	                selected=0;
	            }
	        else if (tier==2){
	            if (selected==4)
	                selected=0;
	            }
	        else if (tier==3){
	            if (unlockreally){
	                if (selected==5)
	                    selected=0;
	                }
	            else{
	                if (selected==4)
	                    selected=0;
	                }
	            }
	        }
	    else if (pressup && !pressupprev){
	        if (tier!=4)
	            selected-=1;
	        if (tier!=4)
	            sfx_play(snd_select);
	        if (tier==0){
	            if (selected==-1)
	                selected=3;
	            }
	        else if (tier==1){
	            if (selected==-1){
	                if (global.joystickexists)
	                    selected=8;
	                else
	                    selected=7;
	                }
	            }
	        else if (tier==2){
	            if (selected==-1)
	                selected=3;
	            }
	        else if (tier==3){
	            if (unlockreally){
	                if (selected==-1)
	                    selected=4;
	                }
	            else{
	                if (selected==-1)
	                    selected=3;
	                }
	            }
	        }
    
	    //advance
	    if (pressinteract && !pressinteractprev){
	        //main menu
	        if (tier==0){
	            if (selected==0 || selected==1){
	                tier=2;
	                if (selected==0)
	                    loadgame=0;
	                else if (selected==1)
	                    loadgame=1;
	                selected=0;
	                filestring="Back#";
	                if (file_exists("remedy1.sav")){
	                    if (scr_finddifficulty("remedy1.sav")==0)
	                        filestring+="Normal >";
	                    else if (scr_finddifficulty("remedy1.sav")==1)
	                        filestring+="Hard >";
	                    else if (scr_finddifficulty("remedy1.sav")==2)
	                        filestring+="Master >";
	                    else
	                        filestring+="Really >";
	                    filestring+=string(scr_findhearts("remedy1.sav"))+"#";
	                    }
	                else{
	                    if (loadgame)
	                        filestring+="-----#"
	                    else
	                        filestring+="File1#"
	                    }
	                if (file_exists("remedy2.sav")){
	                    if (scr_finddifficulty("remedy2.sav")==0)
	                        filestring+="Normal >";
	                    else if (scr_finddifficulty("remedy2.sav")==1)
	                        filestring+="Hard >";
	                    else if (scr_finddifficulty("remedy2.sav")==2)
	                        filestring+="Master >";
	                    else
	                        filestring+="Really >";
	                    filestring+=string(scr_findhearts("remedy2.sav"))+"#";
	                    }
	                else{
	                    if (loadgame)
	                        filestring+="-----#"
	                    else
	                        filestring+="File2#"
	                    }
	                if (file_exists("remedy3.sav")){
	                    if (scr_finddifficulty("remedy3.sav")==0)
	                        filestring+="Normal >";
	                    else if (scr_finddifficulty("remedy3.sav")==1)
	                        filestring+="Hard >";
	                    else if (scr_finddifficulty("remedy3.sav")==2)
	                        filestring+="Master >";
	                    else
	                        filestring+="Really >";
	                    filestring+=string(scr_findhearts("remedy3.sav"))+"#";
	                    }
	                else{
	                    if (loadgame)
	                        filestring+="-----#"
	                    else
	                        filestring+="File3#"
	                    }
	                sfx_play(snd_select);
	                }
	            else if (selected==2){
	                tier=1;
	                selected=0;
	                sfx_play(snd_select);
	                }
	            else if (selected==3){
	                sound_stop_all();
	                game_end();
	                }
	            }
	        //options
	        else if (tier==1){
	            if (selected==0){
	                tier=0;
	                selected=2;
	                sfx_play(snd_back);
	                scr_saveoptions();
	                }
	            else if (selected==1){
	                if (scr_fullscreen(0,0))
	                    scr_fullscreen(1,0);
	                else
	                    scr_fullscreen(1,1);
	                sfx_play(snd_select);
	                }
	            else if (selected==2){
	                global.windowed+=1;
	                if (global.windowed>8)
	                    global.windowed=1;
	                if (scr_fullscreen(0,0)==0)
	                    scr_scalewindow();
	                sfx_play(snd_select);
	                }
	            else if (selected==3){
	                global.playmusic=1-global.playmusic;
	                if (global.playmusic==0)
	                    scr_stopmusic();
	                else                    
	                    sound_loop(global.music[1]);
	                sfx_play(snd_select);
	                }
	            else if (selected==4){
	                global.sound=1-global.sound;
	                sfx_play(snd_select);
	                }
	            else if (selected==5){
	                global.autosave=1-global.autosave;
	                sfx_play(snd_select);
	                }
	            else if (selected==6){
	                global.alwaysrun=1-global.alwaysrun;
	                sfx_play(snd_select);
	                }
	            else if (selected==7){
	                global.fliprun=1-global.fliprun;
	                sfx_play(snd_select);
	                }
	            else if (selected==8){
	                tier=4;
	                readyforassign=0;
	                assign=0;
	                global.joyup=99;
	                global.joydown=99;
	                global.joyleft=99;
	                global.joyright=99;
	                selected=0;
	                sfx_play(snd_select);
	                }
	            }
	        //new/load game
	        else if (tier==2){
	            if (selected==0){
	                tier=0;
	                if (!loadgame)
	                    selected=0;
	                else
	                    selected=1;
	                sfx_play(snd_back);
	                }
	            else if (selected>=1){
	                if (!loadgame){
	                    if (selected==1)
	                        global.savefilename="remedy1.sav";
	                    else if (selected==2)
	                        global.savefilename="remedy2.sav";
	                    else if (selected==3)
	                        global.savefilename="remedy3.sav";
	                    prevselected=selected;
	                    selected=1;
	                    tier=3;
	                    sfx_play(snd_select);
	                    }
	                else{
	                    if (selected==1)
	                        global.savefilename="remedy1.sav";
	                    else if (selected==2)
	                        global.savefilename="remedy2.sav";
	                    else if (selected==3)
	                        global.savefilename="remedy3.sav";
	                    if (file_exists(global.savefilename)){
	                        state=1;
	                        scr_stopmusic();
	                        sfx_play(snd_select);
	                        }
	                    else{
	                        sfx_play(snd_back);
	                        }
	                    }
	                }
	            }
	        //select difficulty
	        else if (tier==3){
	            if (selected==0){
	                tier=2;
	                selected=prevselected;
	                sfx_play(snd_back);
	                }
	            else if (selected==1){
	                state=1;
	                global.difficulty=0;
	                scr_stopmusic();
	                sfx_play(snd_select);
	                }
	            else if (selected==2){
	                state=1;
	                global.difficulty=1;
	                scr_stopmusic();
	                sfx_play(snd_select);
	                }
	            else if (selected==3){
	                state=1;
	                global.difficulty=2;
	                scr_stopmusic();
	                sfx_play(snd_select);
	                }
	            else if (selected==4){
	                state=1;
	                global.difficulty=3;
	                scr_stopmusic();
	                sfx_play(snd_select);
	                }
	            }
	        //joystick assign
	        else if (tier==4){
	            if (readyforassign){
	                tier=1;
	                selected=8;
	                if (assign==4){
	                    sfx_play(snd_select);
	                    }
	                else{
	                    sfx_play(snd_back);
	                    global.joyup=99;
	                    global.joydown=99;
	                    global.joyleft=99;
	                    global.joyright=99;
	                    }
	                }
	            }
	        }
    
	    //left and right on window size
	    if (tier==1 && selected==2){
	        if (pressleft && !pressleftprev){
	            global.windowed-=1;
	            if (global.windowed<1)
	                global.windowed=8;
	            if (scr_fullscreen(0,0)==0)
	                scr_scalewindow();
	            sfx_play(snd_select);
	            }
	        else if (pressright && !pressrightprev){
	            global.windowed+=1;
	            if (global.windowed>8)
	                global.windowed=1;
	            if (scr_fullscreen(0,0)==0)
	                scr_scalewindow();
	            sfx_play(snd_select);
	            }
	        }
    
	    //joy assign
	    if (tier==4){
	        tempcheckjoy=0;
	        for (i=1;i<imaxx;i+=1){
	            if (joystick_check_button(1,i)==1)
	                tempcheckjoy=1;
	            }
	        if (tempcheckjoy==0){
	            readyforassign=1;
	            scr_stopjoy();
	            }
	        else if (readyforassign)
	            scr_joyassign();
	        }
	    }

	//start / load
	else if (state==1){
	    cyc+=1;
	    if (cyc==1)
	        transition=2;
	    global.roomgoto=rom_saturnianpalace;
	    if (loadgame==0)
	        global.fromsavefile=0;
	    else if (loadgame==1){
	        if (file_exists(global.savefilename))
	            global.fromsavefile=1;
	        else
	            global.fromsavefile=0;
	        }
	    }



}
