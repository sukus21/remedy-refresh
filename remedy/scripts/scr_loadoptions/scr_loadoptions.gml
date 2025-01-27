function scr_loadoptions() {
	if (file_exists("options.sav")) {
	    fileid = file_text_open_read("options.sav");
    
	    temp = real(file_text_read_string(fileid));
	    if (temp >= 4) {
	        global.fliprun = 1;
	        temp -= 4;
	    }
	    if (temp >= 2) {
	        global.alwaysrun = 1;
	        temp -= 2;
	    }
	    global.fullscreen = temp;
	    file_text_readln(fileid);
	    if (!global.overridefullscreen) {
			fullscreen_set(global.fullscreen);
		}
	    global.windowed = real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.playmusic = real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.sound = real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.autosave = real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.joyup = real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.joydown = real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.joyleft = real(file_text_read_string(fileid));
	    file_text_readln(fileid);
	    global.joyright = real(file_text_read_string(fileid));
	    file_text_readln(fileid);

	    if (global.joyup <= 0) global.joyup = 99;
	    else if (global.joyup >= 33) global.joyup = 99;
		if (global.joydown <= 0) global.joydown = 99;
	    else if (global.joydown >= 33) global.joydown = 99;
	    if (global.joyleft <= 0) global.joyleft = 99;
	    else if (global.joyleft >= 33) global.joyleft = 99;
	    if (global.joyright <= 0) global.joyright = 99;
	    else if (global.joyright >= 33) global.joyright = 99;
        
	    file_text_close(fileid);
	}

	// Load extended mobile options
	if (file_exists(MOBILE_SETTINGS_FILE)) {
		var _file = file_text_open_read(MOBILE_SETTINGS_FILE);

		// Validate version
		var _version = file_text_read_real(_file);
		file_text_readln(_file);
		if (MOBILE_SETTINGS_VERSION != _version) {
			file_text_close(_file);
			file_delete(MOBILE_SETTINGS_FILE);
			return;
		}

		// Load settings
		global.mobile_button_scale = file_text_read_real(_file);
		file_text_readln(_file);
		global.mobile_button_height = file_text_read_real(_file);
		file_text_close(_file);
	}
}
