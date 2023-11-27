function scr_pressf4() {
	if (keyboard_check(vk_alt)){
	    scr_saveoptions();
	    sound_stop_all();
	    game_end();
	    }
	else{
	    if (!scr_fullscreen(0,0))
	        scr_fullscreen(1,1);
	    else
	        scr_fullscreen(1,0);
	    global.overridefullscreen=1;
	    }



}
