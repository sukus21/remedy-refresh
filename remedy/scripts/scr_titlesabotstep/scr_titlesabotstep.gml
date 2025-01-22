function scr_titlesabotstep() {
	if (tier != TITLESABOT_TIER.JOYPAD) scr_joy(0);
	scr_input();

	// Back out
	if (pressescape && !pressescapeprev) {
		// Back out of controller options
	    if (tier == TITLESABOT_TIER.JOYPAD) {
	        tier = TITLESABOT_TIER.OPTIONS;
	        selected = 8;
	        sfx_play(snd_back);
	    }
		
		// Back out of difficulty select
	    else if (tier == TITLESABOT_TIER.DIFFICULTY) {
	        tier = TITLESABOT_TIER.FILE;
	        selected = prevselected;
	        sfx_play(snd_back);
	    }
		
		// Back out of file select
	    else if (tier == TITLESABOT_TIER.FILE) {
	        tier = TITLESABOT_TIER.MAIN;
	        selected = loadgame;
	        sfx_play(snd_back);
	    }
		
		// Back out of options
	    else if (tier == TITLESABOT_TIER.OPTIONS) {
	        tier = TITLESABOT_TIER.MAIN;
	        selected = 2;
	        scr_saveoptions();
	        sfx_play(snd_back);
	    }
		
		// Back out of game (quit)
	    else {
	        scr_saveoptions();
	        sound_stop_all();
	        game_end();
	    }
	}

	// text
	if (state == 0) {
	    
		// unlock really
	    if (pressright) {
	        really += 1;
	        if (!unlockreally && really == 150) {
	            unlockreally = true;
	            sfx_play(snd_select);
	        }
	    }
	    else really = 0;
		
	    // select
		var _moved = (pressdown and !pressdownprev) - (pressup and !pressupprev);
	    if (_moved != 0) {
	        if (tier != TITLESABOT_TIER.JOYPAD) selected += _moved;
	        if (global.sound && tier != TITLESABOT_TIER.JOYPAD) sound_play(snd_select);
			
			var _step_max = 0;
			switch(tier) {
				case TITLESABOT_TIER.MAIN: _step_max = 3; break;
				case TITLESABOT_TIER.OPTIONS: _step_max = 7 + global.joystickexists; break;
				case TITLESABOT_TIER.FILE: _step_max = 3; break;
				case TITLESABOT_TIER.DIFFICULTY: _step_max = 3 + unlockreally; break;
			}
			selected = option_advance(selected, _step_max);
		}
    
	    // advance
	    if (pressinteract && !pressinteractprev) {
	        
			// main menu
	        if (tier == TITLESABOT_TIER.MAIN) {
				
				// New file or load file
	            if (selected == 0 || selected == 1) {
	                tier = TITLESABOT_TIER.FILE;
					loadgame = (selected == 1);
	                selected = 0;
	                filestring = "Back#";
					
					for(var _file = 1; _file <= 3; _file++) {
						var _fname = "remedy" + string(_file) + ".sav";
						if (file_exists(_fname)) {
							switch(scr_finddifficulty(_fname)) {
								case 0: filestring += "Normal >"; break;
								case 1: filestring += "Hard >"; break;
								case 2: filestring += "Master >"; break;
								default: filestring += "Really >"; break;
							}
		                    filestring += string(scr_findhearts(_fname)) + "#";
		                }
		                else {
							filestring += (loadgame) ? "-----#" : "File" + string(_file) + "#";
						}
					}
	                sfx_play(snd_select);
	            }
				
				// Options
	            else if (selected == 2) {
	                tier = TITLESABOT_TIER.OPTIONS;
	                selected = 0;
	                sfx_play(snd_select);
	            }
				
				// Quit
	            else if (selected == 3) {
	                sound_stop_all();
	                game_end();
	            }
	        }
			
	        // options
	        else if (tier == TITLESABOT_TIER.OPTIONS) {
				
				// Back
	            if (selected == 0) {
	                tier = TITLESABOT_TIER.MAIN;
	                selected = 2;
	                sfx_play(snd_back);
	                scr_saveoptions();
	            }
				
				// Fullscreen
	            else if (selected == 1) {
					scr_fullscreen(1, !window_get_fullscreen());
	                sfx_play(snd_select);
	            }
				
				// Window size
	            else if (selected == 2) {
	                global.windowed++;
	                if (global.windowed > 8) global.windowed = 1;
					
	                if (!window_get_fullscreen()) scr_scalewindow();
	                sfx_play(snd_select);
	            }
				
				// Music toggle
	            else if (selected == 3) {
	                global.playmusic = !global.playmusic;
	                if (!global.playmusic) scr_stopmusic();
	                else sound_loop(global.music[1]);
	                sfx_play(snd_select);
	            }
				
				// Sound toggle
	            else if (selected == 4) {
	                global.sound = !global.sound;
	                sfx_play(snd_select);
	            }
				
				// Autosave
	            else if (selected == 5) {
	                global.autosave = !global.autosave;
	                sfx_play(snd_select);
	            }
				
				// Always run
	            else if (selected == 6) {
	                global.alwaysrun = !global.alwaysrun;
	                sfx_play(snd_select);
	            }
				
				// Swap act/run
	            else if (selected == 7) {
	                global.fliprun = !global.fliprun;
	                sfx_play(snd_select);
	            }
				
				// What?
	            else if (selected == 8) {
	                tier = TITLESABOT_TIER.JOYPAD;
	                readyforassign = 0;
	                assign = 0;
	                global.joyup = 99;
	                global.joydown = 99;
	                global.joyleft = 99;
	                global.joyright = 99;
	                selected = 0;
	                sfx_play(snd_select);
	            }
	        }
			
	        // new/load game
	        else if (tier == TITLESABOT_TIER.FILE) {
				
				// Back
	            if (selected == 0) {
	                tier = TITLESABOT_TIER.MAIN;
					selected = bool(loadgame);
	                sfx_play(snd_back);
	            }
				
				// File select
	            else if (selected >= 1) {
					global.savefilename = "remedy" + string(selected) + ".sav";
					
					// Create new save
	                if (!loadgame) {
	                    prevselected = selected;
	                    selected = 1;
	                    tier = TITLESABOT_TIER.DIFFICULTY;
	                    sfx_play(snd_select);
	                }
					
					// Load save
	                else {
	                    if (file_exists(global.savefilename)) {
	                        state = 1;
	                        scr_stopmusic();
	                        sfx_play(snd_select);
	                    }
	                    else sfx_play(snd_back);
	                }
	            }
	        }
			
	        // select difficulty
	        else if (tier == TITLESABOT_TIER.DIFFICULTY) {
	            if (selected == 0) {
	                tier = TITLESABOT_TIER.FILE;
	                selected = prevselected;
	                sfx_play(snd_back);
	            }
	            else {
					state = 1;
					global.difficulty = selected-1;
					scr_stopmusic();
					sfx_play(snd_select);
				}
	        }
			
	        // joystick assign
	        else if (tier == TITLESABOT_TIER.JOYPAD) {
	            if (readyforassign) {
	                tier = TITLESABOT_TIER.OPTIONS;
	                selected = 8;
	                if (assign == 4) sfx_play(snd_select);
	                else {
	                    sfx_play(snd_back);
	                    global.joyup = 99;
	                    global.joydown = 99;
	                    global.joyleft = 99;
	                    global.joyright = 99;
	                }
	            }
	        }
	    }
    
	    // Sliders
		var _slide = (pressright and !pressrightprev) - (pressleft and !pressleftprev);
		if (_slide != 0 and tier == TITLESABOT_TIER.OPTIONS) {
			if(!global.is_mobile) {
				
				// Window size
				if (selected == 2) {
		            global.windowed += _slide;
					global.windowed = option_advance(global.windowed, 8, 1);
		            if (!window_get_fullscreen()) scr_scalewindow();
		            sfx_play(snd_select);
		        }
			}
			else {
				
				// Button scale
				if(selected == 1) {
					global.mobile_button_scale += _slide * 0.10;
					global.mobile_button_scale = clamp(global.mobile_button_scale, 0.2, 2.0);
					sfx_play(snd_select);
				}
				
				// Button height
				else if(selected == 2) {
					global.mobile_button_height = option_advance(global.mobile_button_height + _slide*0.10, 1.0, 0);
					sfx_play(snd_select);
				}
			}
	    }
    
	    // joy assign
	    if (tier == TITLESABOT_TIER.JOYPAD) {
	        tempcheckjoy = 0;
	        for (i = 1; i < imaxx; i += 1) {
	            if (joystick_check_button(1, i)) tempcheckjoy = 1;
	        }
	        if (tempcheckjoy == 0) {
	            readyforassign = 1;
	            scr_stopjoy();
	        }
	        else if (readyforassign) scr_joyassign();
	    }
	}

	// start / load
	else if (state == 1) {
	    cyc++;
	    if (cyc == 1) transition = 2;
	    global.roomgoto = rom_saturnianpalace;
	    if (loadgame == 0) global.fromsavefile = 0;
	    else if (loadgame == 1) {
	       global.fromsavefile = file_exists(global.savefilename);
	    }
	}
	
	// Transition
	if(transition == 2) transition_out();
}

function option_advance(_step, _max, _min = 0) {
	if (_step < _min) return _max;
	if (_step > _max) return _min;
	return _step;
}
