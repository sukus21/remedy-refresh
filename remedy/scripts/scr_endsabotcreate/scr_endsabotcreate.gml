function scr_endsabotcreate() {
	scr_joycreate();
	fireworkcyc=20;
	transition=1;
	transitioncyc=0;
	scr_stopmusic();
	music_play(snd_win);
	timestring=scr_frametosec(global.frames);



}
