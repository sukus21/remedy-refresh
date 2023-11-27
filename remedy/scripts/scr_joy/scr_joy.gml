function scr_joy(argument0) {
	if (global.joystickexists){
	//argument0 1 is directions only
	if (argument0!=1){
	    //BUTTONS
	    for (i=1;i<imaxx;i+=1){
	        if (joystick_check_button(1,i)==1){
	            if (!joy[i] && !joyhold[i])
	                joy[i]=1;
	            else
	                joy[i]=0;
	            joyhold[i]=1;
	            }
	        else{
	            joy[i]=0;
	            joyhold[i]=0;
	            }
	        }
	    }

	//D-PAD
	if (joyhold[global.joyup] || (global.haspov && (joystick_pov(1)==0 || joystick_pov(1)==45 || joystick_pov(1)==315)) || joystick_direction(1)==vk_numpad7 || joystick_direction(1)==vk_numpad8 || joystick_direction(1)==vk_numpad9){
	    if (!joy[33] && !joyhold[33])
	        joy[33]=1;
	    else
	        joy[33]=0;
	    joyhold[33]=1;
	    }
	else{
	    joy[33]=0;
	    joyhold[33]=0;
	    }
	if (joyhold[global.joydown] || (global.haspov && (joystick_pov(1)==180 || joystick_pov(1)==135 || joystick_pov(1)==225)) || joystick_direction(1)==vk_numpad1 || joystick_direction(1)==vk_numpad2 || joystick_direction(1)==vk_numpad3){
	    if (!joy[34] && !joyhold[34])
	        joy[34]=1;
	    else
	        joy[34]=0;
	    joyhold[34]=1;
	    }
	else{
	    joy[34]=0;
	    joyhold[34]=0;
	    }
	if (joyhold[global.joyleft] || (global.haspov && (joystick_pov(1)==270 || joystick_pov(1)==315 || joystick_pov(1)==225)) || joystick_direction(1)==vk_numpad1 || joystick_direction(1)==vk_numpad4 || joystick_direction(1)==vk_numpad7){
	    if (!joy[35] && !joyhold[35])
	        joy[35]=1;
	    else
	        joy[35]=0;
	    joyhold[35]=1;
	    }
	else{
	    joy[35]=0;
	    joyhold[35]=0;
	    }
	if (joyhold[global.joyright] || (global.haspov && (joystick_pov(1)==90 || joystick_pov(1)==45 || joystick_pov(1)==135)) || joystick_direction(1)==vk_numpad3 || joystick_direction(1)==vk_numpad6 || joystick_direction(1)==vk_numpad9){
	    if (!joy[36] && !joyhold[36])
	        joy[36]=1;
	    else
	        joy[36]=0;
	    joyhold[36]=1;
	    }
	else{
	    joy[36]=0;
	    joyhold[36]=0;
	    }
	}



}
