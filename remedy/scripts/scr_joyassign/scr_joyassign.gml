function scr_joyassign() {
	if (global.joystickexists){
	//Catch only one button
	temp=0;
	for (i=1;i<imaxx+1;i+=1){
	    if (joystick_check_button(1,i)){
	        temp+=1;
	        tempbutton=i;
	        }
	    }
	//Assign
	if (temp==1){
	    if (assign==0){
	        global.joyup=tempbutton;
	        if (global.sound)
	            sound_play(snd_select);
	        assign=1;
	        }
	    else if (assign==1){
	        if (global.joyup!=tempbutton){
	            global.joydown=tempbutton;
	            if (global.sound)
	                sound_play(snd_select);
	            assign=2;
	            }
	        }
	    else if (assign==2){
	        if (global.joyup!=tempbutton && global.joydown!=tempbutton){
	            global.joyleft=tempbutton;
	            if (global.sound)
	                sound_play(snd_select);
	            assign=3;
	            }
	        }
	    else if (assign==3){
	        if (global.joyup!=tempbutton && global.joydown!=tempbutton && global.joyleft!=tempbutton){
	            global.joyright=tempbutton;
	            if (global.sound)
	                sound_play(snd_select);
	            assign=4;
	            }
	        }
	    }
	}




}
