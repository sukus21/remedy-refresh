function scr_stopjoy() {
	//Reset all joystick input
	if (global.joystickexists){
	    for (i=1;i<imaxx;i+=1){
	        joy[i]=0;
	        joyhold[i]=0;
	        }
	    }



}
