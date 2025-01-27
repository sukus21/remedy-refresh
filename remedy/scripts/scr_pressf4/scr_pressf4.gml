function scr_pressf4() {
	if (keyboard_check(vk_alt)) {
	    scr_saveoptions();
		audio_stop_all();
	    game_end();
	}
	else {
		fullscreen_set(!fullscreen_get());
	    global.overridefullscreen = 1;
	}
}
