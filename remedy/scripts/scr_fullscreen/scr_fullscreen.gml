function scr_fullscreen(argument0, argument1) {
	//switches between windowed and fullscreen
	//argument0 0 = get fullscreen
	//argument0 1 = set fullscreen
	//argument1 = what to set the fullscreen to

	//GM5
	/*
	if (argument0==0)
	    return full_screen;
	else if (argument0==1){
	    full_screen=argument1;
	    if (argument1==0)
	        scr_scalewindow();
	    }
	*/
	//GM7
	if (argument0==0)
	    return window_get_fullscreen();
	else if (argument0==1){
	    window_set_fullscreen(argument1);
	    if (argument1==0)
	        scr_scalewindow();
	    }



}
