function scr_saveoptions() {
	fileid=file_text_open_write("options.sav");

	if (scr_fullscreen(0, 0))
	    global.fullscreen=1;
	else
	    global.fullscreen=0;
	file_text_write_string(fileid,string(global.fullscreen+global.alwaysrun*2+global.fliprun*4));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.windowed));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.playmusic));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.sound));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.autosave));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.joyup));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.joydown));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.joyleft));
	file_text_writeln(fileid);
	file_text_write_string(fileid,string(global.joyright));
	file_text_writeln(fileid);
	//identifier
	file_text_write_string(fileid,"Princess Remedy options savefile 1.3 (18 September 2022)");
	file_text_writeln(fileid);

	file_text_close(fileid);



}
