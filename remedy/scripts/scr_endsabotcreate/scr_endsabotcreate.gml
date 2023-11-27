function scr_endsabotcreate() {
	scr_joycreate();
	fireworkcyc=20;
	transition=1;
	transitioncyc=0;
	scr_stopmusic();
	if (global.playmusic)
	    sound_loop(global.music[6]);
	timestring=scr_frametosec(global.frames);



}
