function scr_saveoptions() {
	fileid = file_text_open_write("options.sav");

	global.fullscreen = window_get_fullscreen();
	file_text_write_string(fileid, string(global.fullscreen + global.alwaysrun*2 + global.fliprun*4));
	file_text_writeln(fileid);
	file_text_write_string(fileid, string(global.windowed));
	file_text_writeln(fileid);
	file_text_write_string(fileid, string(global.playmusic));
	file_text_writeln(fileid);
	file_text_write_string(fileid, string(global.sound));
	file_text_writeln(fileid);
	file_text_write_string(fileid, string(global.autosave));
	file_text_writeln(fileid);
	file_text_write_string(fileid, string(global.joyup));
	file_text_writeln(fileid);
	file_text_write_string(fileid, string(global.joydown));
	file_text_writeln(fileid);
	file_text_write_string(fileid, string(global.joyleft));
	file_text_writeln(fileid);
	file_text_write_string(fileid, string(global.joyright));
	file_text_writeln(fileid);
	
	// identifier
	file_text_write_string(fileid, "Princess Remedy options savefile 1.3 (18 September 2022)");
	file_text_writeln(fileid);

	file_text_close(fileid);
	
	// Save extended mobile options
	var _file = file_text_open_write(MOBILE_SETTINGS_FILE);
	file_text_write_real(_file, MOBILE_SETTINGS_VERSION);
	file_text_writeln(_file);
	file_text_write_real(_file, global.mobile_button_scale);
	file_text_writeln(_file);
	file_text_write_real(_file, global.mobile_button_height);
	file_text_writeln(_file);
	file_text_close(_file);
}
