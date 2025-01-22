function scr_input() {
	
	// Allow mashing overlapping keys and buttons to reset interact input
	pressinteractprev = pressinteract;
	for (var i = 0; i < 50; i++) {
	    pressubprev[i] = pressub[i];
	}
	
	if (global.joystickexists) {
	    for (var i = 1; i < imaxx; i++) {
	        if (joyhold[i] && i != global.joyup && i != global.joydown && i != global.joyleft && i != global.joyright) {
	            if ((i+global.fliprun) mod 2 == 0) {
	                pressub[i] = true;
				}
	        }
	        else pressub[i] = false;
	    }
	}
	
	// keyboard interact buttons
	pressub[40] = keyboard_check(vk_space);
	pressub[41] = keyboard_check(vk_control);
	pressub[42] = keyboard_check(vk_enter);
	pressub[43] = keyboard_check(vk_numpad0);
	pressub[44] = keyboard_check(vk_numpad1);
	pressub[45] = keyboard_check(vk_delete);
	pressub[46] = keyboard_check(vk_insert);
	pressub[47] = keyboard_check(ord("Z"));
	pressub[48] = keyboard_check(ord("Y"));
	pressub[49] = keyboard_check(ord("X"));
		
	for (var i = 0; i < 50; i++) {
	    if (pressub[i] && !pressubprev[i]) {
		    pressinteract = true;
		    pressinteractprev = false;
	    }
	}
	
	if (global.mobile_interact) {
		pressinteract = true;
		pressinteractprev = false;
	}

	pressrunprev = pressrun;
	joyrun = false;
	if (global.joystickexists) {
	    for (var i = 1; i < imaxx; i++) {
	        if (joyhold[i] && i != global.joyup && i != global.joydown && i != global.joyleft && i != global.joyright) {
	            if ((i+global.fliprun) mod 2 == 1) {
	                joyrun = true;
				}
	        }
	    }
	}
	pressrun = keyboard_check(vk_shift) or joyrun or global.mobile_run;
	
	// Directional keys
	pressupprev = pressup;
	pressup = keyboard_check(vk_up) or keyboard_check(ord("W")) or joyhold[33] or global.mobile_up;
	pressdownprev = pressdown;
	pressdown = keyboard_check(vk_down) or keyboard_check(ord("S")) or joyhold[34] or global.mobile_down;
	pressleftprev = pressleft;
	pressleft = keyboard_check(vk_left) or keyboard_check(ord("A")) or joyhold[35] or global.mobile_left;
	pressrightprev = pressright;
	pressright = keyboard_check(vk_right) or keyboard_check(ord("D")) or joyhold[36] or global.mobile_right;
	
	pressescapeprev = pressescape;
	pressescape = keyboard_check(vk_escape);
}
