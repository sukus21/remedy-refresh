function scr_input() {
	//Allow mashing overlapping keys and buttons to reset interact input
	pressinteractprev=pressinteract;
	for (i=0;i<50;i+=1)
	    pressubprev[i]=pressub[i];
	if (global.joystickexists){
	    for (i=1;i<imaxx;i+=1){
	        if (joyhold[i] && i!=global.joyup && i!=global.joydown && i!=global.joyleft && i!=global.joyright){
	            if ((i+global.fliprun) mod 2==0)
	                pressub[i]=1;
	            }
	        else
	            pressub[i]=0;
	        }
	    }
	if (keyboard_check(vk_space))
	    pressub[40]=1;
	else
	    pressub[40]=0;
	if (keyboard_check(vk_control))
	    pressub[41]=1;
	else
	    pressub[41]=0;
	if (keyboard_check(vk_enter))
	    pressub[42]=1;
	else
	    pressub[42]=0;
	if (keyboard_check(vk_numpad0))
	    pressub[43]=1;
	else
	    pressub[43]=0;
	if (keyboard_check(vk_numpad1))
	    pressub[44]=1;
	else
	    pressub[44]=0;
	if (keyboard_check(vk_delete))
	    pressub[45]=1;
	else
	    pressub[45]=0;
	if (keyboard_check(vk_insert))
	    pressub[46]=1;
	else
	    pressub[46]=0;
	if (keyboard_check(ord("Z")))
	    pressub[47]=1;
	else
	    pressub[47]=0;
	if (keyboard_check(ord("Y")))
	    pressub[48]=1;
	else
	    pressub[48]=0;
	if (keyboard_check(ord("X")))
	    pressub[49]=1;
	else
	    pressub[49]=0;
	for (i=0;i<50;i+=1){
	    if (pressub[i] && !pressubprev[i]){
	        pressinteract=1;
	        pressinteractprev=0;
	        }
	    }

	pressrunprev=pressrun;
	joyrun=0;
	if (global.joystickexists){
	    for (i=1;i<imaxx;i+=1){
	        if (joyhold[i] && i!=global.joyup && i!=global.joydown && i!=global.joyleft && i!=global.joyright){
	            if ((i+global.fliprun) mod 2==1)
	                joyrun=1;
	            }
	        }
	    }
	if (keyboard_check(vk_shift) || joyrun)
	    pressrun=1;
	else
	    pressrun=0;

	pressupprev=pressup;
	if (keyboard_check(vk_up) || keyboard_check(ord("W")) || joyhold[33])
	    pressup=1;
	else
	    pressup=0;

	pressdownprev=pressdown;
	if (keyboard_check(vk_down) || keyboard_check(ord("S")) || joyhold[34])
	    pressdown=1;
	else
	    pressdown=0;

	pressleftprev=pressleft;
	if (keyboard_check(vk_left) || keyboard_check(ord("A")) || joyhold[35])
	    pressleft=1;
	else
	    pressleft=0;

	pressrightprev=pressright;
	if (keyboard_check(vk_right) || keyboard_check(ord("D")) || joyhold[36])
	    pressright=1;
	else
	    pressright=0;

	pressescapeprev=pressescape;
	if (keyboard_check(vk_escape))
	    pressescape=1;
	else
	    pressescape=0;



}
