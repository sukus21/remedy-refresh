function scr_pausestep() {
	//init
	if (!init){
	    scr_joycreate();
	    init=1;
	    selectedprev=-1;
	    timestring=scr_frametosec(global.frames);
	    global.pauseselected=0;
	    tier=0;
	    }

	if (tier!=2)
	    scr_joy(0);
	scr_input();

	//get ready
	if (readycyc<10)
	    readycyc+=1;
	if (readycyc==2)
	    ready=1;

	//advance
	if (ready && (pressinteract && !pressinteractprev) && !quitignoreall){
	    if (tier==0){
	        if (global.pauseselected<=4){
	            obj_you.resetignoreall=2;
	            instance_destroy();
	            sfx_play(snd_back);
	            }
	        else if (global.pauseselected==5){
	            tier=1;
	            global.pauseselected=0;
	            sfx_play(snd_select);
	            }
	        else if (global.pauseselected==6 && !justsaved){
	            sfx_play(snd_warp);
	            justsaved=1;
	            scr_save();
	            }
	        else if (global.pauseselected==7){
	            if (quitprompt==0){
	                sfx_play(snd_select);
	                quitprompt=1;
	                subselected=0;
	                }
	            else{
	                if (subselected==0){
	                    sfx_play(snd_back);
	                    quitprompt=0;
	                    }
	                else{
	                    quitignoreall=1;
	                    if (global.autosave){
	                        scr_save();
	                        sound_stop(snd_warp);
	                        sfx_play(snd_warp);
	                        }
	                    obj_you.quitignoreall=1;
	                    obj_sabot.transition=2;
	                    obj_sabot.quitgame=1;
	                    sfx_play(snd_select);
	                    }
	                }
	            }
	        }
	    else if (tier==1){
			if (!global.is_mobile) {
		        if (global.pauseselected == 1) {
		            scr_fullscreen(1, !scr_fullscreen(0, 0));
		            sfx_play(snd_select);
		        }
		        else if (global.pauseselected == 2) {
					global.windowed = option_advance(global.windowed+1, 8, 1);
		            if (!scr_fullscreen(0, 0)) scr_scalewindow();
		            sfx_play(snd_select);
		        }
			}
			else {
				// Input scale
				if(global.pauseselected == 1) {
					sfx_play(snd_select);
					global.mobile_button_scale = option_advance(global.mobile_button_scale + 0.1, 2.0, 0.2);
				}

				// Input height
				else if (global.pauseselected == 2) {
					sfx_play(snd_select);
					global.mobile_button_height = option_advance(global.mobile_button_height + 0.1, 1.0, 0.0);
				}
			}
			
	        if (global.pauseselected==0){
	            scr_saveoptions();
	            tier=0;
	            global.pauseselected=5;
	            sfx_play(snd_back);
	            }
	        else if (global.pauseselected==3){
	            global.playmusic=1-global.playmusic;
	            if (global.playmusic==0)
	                scr_stopmusic();
	            else{
	                if (global.world==1)
	                    sound_loop(global.music[4]);
	                else if (global.world==2)
	                    sound_loop(global.music[2]);
	                else if (global.world==3)
	                    sound_loop(global.music[5]);
	                else if (global.world==4)
	                    sound_loop(global.music[0]);
	                else if (global.world==5)
	                    sound_loop(global.music[3]);
	                else if (global.world==6){
	                    if (global.finalbossdead)
	                        sound_loop(global.music[4]);
	                    else
	                        sound_loop(global.music[9]);
	                    }
	                }
	            sfx_play(snd_select);
	            }
	        else if (global.pauseselected==4){
	            global.sound=1-global.sound;
	            sfx_play(snd_select);
	            }
	        else if (global.pauseselected==5){
	            global.autosave=1-global.autosave;
	            sfx_play(snd_select);
	            }
	        else if (global.pauseselected==6){
	            global.alwaysrun=1-global.alwaysrun;
	            sfx_play(snd_select);
	            }
	        else if (global.pauseselected==7){
	            global.fliprun=1-global.fliprun;
	            sfx_play(snd_select);
	            }
	        else if (global.pauseselected==8){
	            tier=2;
	            readyforassign=0;
	            assign=0;
	            global.joyup=99;
	            global.joydown=99;
	            global.joyleft=99;
	            global.joyright=99;
	            global.pauseselected=0;
	            sfx_play(snd_select);
	            }
	        }
	    else if (tier==2){
	        if (readyforassign){
	            tier=1;
	            global.pauseselected=8;
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

	// Sliders
	if (ready && !quitignoreall and tier == 1) {
		if (!global.is_mobile) {
		    if (global.pauseselected == 2) {
		        if (pressleft && !pressleftprev) {
		            global.windowed -= 1;
		            if (global.windowed < 1)
		                global.windowed = 8;
		            if (scr_fullscreen(0,0) == 0)
		                scr_scalewindow();
		            sfx_play(snd_select);
		            }
		        else if (pressright && !pressrightprev) {
		            global.windowed += 1;
		            if (global.windowed > 8)
		                global.windowed = 1;
		            if (scr_fullscreen(0,0) == 0)
		                scr_scalewindow();
		            sfx_play(snd_select);
	            }
	        }
	    }
		else {
			var _slide = (pressright and !pressrightprev) - (pressleft and !pressleftprev);
			// Button scale
			if (global.pauseselected == 1 and _slide != 0) {
				global.mobile_button_scale = option_advance(global.mobile_button_scale + _slide * 0.10, 2.0, 0.2)
				sfx_play(snd_select);
				global.mobile_lock = 10;
			}
				
			// Button height
			else if (global.pauseselected == 2 and _slide != 0) {
				global.mobile_button_height = option_advance(global.mobile_button_height + _slide*0.10, 1.0, 0);
				sfx_play(snd_select);
				global.mobile_lock = 10;
			}
		}
	}

	//move marker
	if (tier!=2 && ready && !quitignoreall && !quitprompt && pressup && !pressupprev){
	    global.pauseselected-=1;
	    if (tier==0){
	        if (global.pauseselected==-1)
	            global.pauseselected=7;
	        }
	    else if (tier==1){
	        if (global.pauseselected==-1){
	            if (global.joystickexists)
	                global.pauseselected=8;
	            else
	                global.pauseselected=7;
	            }
	        }
	    sfx_play(snd_select);
	    }
	else if (tier!=2 && ready && !quitignoreall && !quitprompt && pressdown && !pressdownprev){
	    global.pauseselected+=1;
	    if (tier==0){
	        if (global.pauseselected==8)
	            global.pauseselected=0;
	        }
	    else if (tier==1){
	        if ((global.pauseselected==8 && !global.joystickexists) || (global.pauseselected==9 && global.joystickexists))
	            global.pauseselected=0;
	        }
	    sfx_play(snd_select);
	    }

	//move submarker
	if (quitprompt){
	    if (ready && !quitignoreall && ((pressleft && !pressleftprev) || (pressright && !pressrightprev))){
	        subselected=1-subselected;
	        sfx_play(snd_select);
	        }
	    }

	//joy assign
	if (tier==2){
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
    
	    if (pressescape && !pressescapeprev){
	        tier=1;
	        global.pauseselected=6;
	        }
	    }

	//text
	if (tier==0){
	    textstring="";
	    if (global.hearts<10)
	        textstring+=" ";
	    textstring+=string(global.hearts);
	    textstring+="> Hearts#";
	    if (global.force<10)
	        textstring+=" ";
	    textstring+=string(global.force);
	    textstring+="< Power#";
	    if (global.multi<10)
	        textstring+=" ";
	    textstring+=string(global.multi);
	    textstring+="@ Multi#";
	    if (global.regen<10)
	        textstring+=" ";
	    textstring+=string(global.regen);
	    textstring+="\\ Regen#";
	    if (global.flasks<10)
	        textstring+=" ";
	    textstring+=string(global.flasks);
	    textstring+="& Flasks#Options#";
	    if (justsaved)
	        textstring+="Game saved#";
	    else
	        textstring+="Save#";
	    if (global.autosave)
	        textstring+="Save+Quit#";
	    else
	        textstring+="Quit#";
	    if (quitprompt)
	        textstring+="$No$$Yes#$}"+timestring;
	    else
	        textstring+="#$}"+timestring;
	    }
	else if (tier==1){
		textstring = "Back#";
		if(!global.is_mobile) {
		    textstring += "Fullscreen ";
			textstring += scr_fullscreen(0, 1) ? "ON#" : "OFF#";   
		    textstring += "Windowed size x" + string(global.windowed) + "#";
		}
		else {
			textstring += "Input scale  ";
			textstring += titlesabot_percent(global.mobile_button_scale) + "#";
			textstring += "Input height ";
			textstring += titlesabot_percent(global.mobile_button_height) + "#";
		}
		
	    textstring+="Music ";
	    if (global.playmusic)
	        textstring+="ON#"
	    else
	        textstring+="OFF#"    
	    textstring+="Sound ";
	    if (global.sound)
	        textstring+="ON#"
	    else
	        textstring+="OFF#"    
	    textstring+="Autosave ";
	    if (global.autosave)
	        textstring+="ON#"
	    else
	        textstring+="OFF#"
	    textstring+="Always run ";
	    if (global.alwaysrun)
	        textstring+="ON#"
	    else
	        textstring+="OFF#"
	    textstring+="Flip act/run ";
	    if (global.fliprun)
	        textstring+="ON#"
	    else
	        textstring+="OFF#"
	    if (global.joystickexists)
	        textstring+="Setup gamepad";
	    }

	//info text
	if (global.pauseselected!=selectedprev){
	    if (tier==0){
	        if (global.pauseselected==0)
	            textstring2="> Hearts#Your life energy in Healing Mode.";
	        else if (global.pauseselected==1){
	            textstring2="< Power#The power of your shots and Flasks in Healing Mode.";
	            if (global.force==1)
	                textstring2+="#Level: Band-aids";
	            else if (global.force==2)
	                textstring2+="#Level: Pills";
	            else if (global.force==3)
	                textstring2+="#Level: Shots";
	            else if (global.force==4)
	                textstring2+="#Level: Magic";
	            else if (global.force==5)
	                textstring2+="#Level: Tiara";
	            else
	                textstring2+="#Level: Frog";
	            }
	        else if (global.pauseselected==2)
	            textstring2="@ Multi#The number of multi-shots in Healing Mode.";
	        else if (global.pauseselected==3)
	            textstring2="\\ Regen#How quickly you regenerate hearts in Healing Mode.";
	        else if (global.pauseselected==4)
	            textstring2="& Flasks#How many Flasks you can throw in each Healing Mode encounter.";
	        else if (global.pauseselected==5)
	            textstring2="Adjust game options.";
	        else if (global.pauseselected==6)
	            textstring2="Save the game.";
	        else if (global.pauseselected==7){
	            if (global.autosave)
	                textstring2="Save and quit the game.";
	            else
	                textstring2="Quit the game.";
	            }
	        textstring2=scr_linebreak(textstring2,144);
	        }
	    else if (tier==1){
	        if (global.pauseselected==0)
	            textstring2="";
	        else if (global.pauseselected==1)
	            textstring2="Turn full screen mode on or off.";
	        else if (global.pauseselected==2)
	            textstring2="Adjust the size of the screen in windowed mode.";
	        else if (global.pauseselected==3)
	            textstring2="Turn music on or off.";
	        else if (global.pauseselected==4)
	            textstring2="Turn sound on or off.";
	        else if (global.pauseselected==5)
	            textstring2="If on, the game prompts to save, and autosaves when reaching the ending.";
	        else if (global.pauseselected==6)
	            textstring2="If on, you no longer need to hold Shift to run.";
	        else if (global.pauseselected==7)
	            textstring2="If on, the Action and Run buttons on the gamepad are swapped.";
	        else if (global.pauseselected==8)
	            textstring2="Set up the D-Pad on the gamepad.";
	        textstring2=scr_linebreak(textstring2,144);
	        }
	    }
	selectedprev=global.pauseselected;



}
