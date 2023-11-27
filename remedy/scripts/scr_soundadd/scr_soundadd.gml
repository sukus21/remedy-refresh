function scr_soundadd() {
	//adds music in 5/7

	//GM5
	/*
	if (file_exists("music/song1.mp3"))
	    global.music[0]=sound_add("music/song1.mp3",1,0,0);
	else if (file_exists("song1.mp3"))
	    global.music[0]=sound_add("song1.mp3",1,0,0);
	else{
	    global.music[0]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song2.mp3"))
	    global.music[1]=sound_add("music/song2.mp3",1,0,0);
	else if (file_exists("song2.mp3"))
	    global.music[1]=sound_add("song2.mp3",1,0,0);
	else{
	    global.music[1]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song3.mp3"))
	    global.music[2]=sound_add("music/song3.mp3",1,0,0);
	else if (file_exists("song3.mp3"))
	    global.music[2]=sound_add("song3.mp3",1,0,0);
	else{
	    global.music[2]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song4.mp3"))
	    global.music[3]=sound_add("music/song4.mp3",1,0,0);
	else if (file_exists("song4.mp3"))
	    global.music[3]=sound_add("song4.mp3",1,0,0);
	else{
	    global.music[3]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song5.mp3"))
	    global.music[4]=sound_add("music/song5.mp3",1,0,0);
	else if (file_exists("song5.mp3"))
	    global.music[4]=sound_add("song5.mp3",1,0,0);
	else{
	    global.music[4]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song6.mp3"))
	    global.music[5]=sound_add("music/song6.mp3",1,0,0);
	else if (file_exists("song6.mp3"))
	    global.music[5]=sound_add("song6.mp3",1,0,0);
	else{
	    global.music[5]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/win.mp3"))
	    global.music[6]=sound_add("music/win.mp3",1,0,0);
	else if (file_exists("win.mp3"))
	    global.music[6]=sound_add("win.mp3",1,0,0);
	else{
	    global.music[6]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/boss1.mp3"))
	    global.music[7]=sound_add("music/boss1.mp3",1,0,0);
	else if (file_exists("boss1.mp3"))
	    global.music[7]=sound_add("boss1.mp3",1,0,0);
	else{
	    global.music[7]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/boss2.mp3"))
	    global.music[8]=sound_add("music/boss2.mp3",1,0,0);
	else if (file_exists("boss2.mp3"))
	    global.music[8]=sound_add("boss2.mp3",1,0,0);
	else{
	    global.music[8]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song7.mp3"))
	    global.music[9]=sound_add("music/song7.mp3",1,0,0);
	else if (file_exists("song7.mp3"))
	    global.music[9]=sound_add("song7.mp3",1,0,0);
	else{
	    global.music[9]=snd_empty;
	    global.musicmissing=1;
	    }
	*/

	//GM7
	if (file_exists("music/song1.mp3"))
	    global.music[0]=sound_add("music/song1.mp3",0,1);
	else if (file_exists("song1.mp3"))
	    global.music[0]=sound_add("song1.mp3",0,1);
	else{
	    global.music[0]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song2.mp3"))
	    global.music[1]=sound_add("music/song2.mp3",0,1);
	else if (file_exists("song2.mp3"))
	    global.music[1]=sound_add("song2.mp3",0,1);
	else{
	    global.music[1]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song3.mp3"))
	    global.music[2]=sound_add("music/song3.mp3",0,1);
	else if (file_exists("song3.mp3"))
	    global.music[2]=sound_add("song3.mp3",0,1);
	else{
	    global.music[2]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song4.mp3"))
	    global.music[3]=sound_add("music/song4.mp3",0,1);
	else if (file_exists("song4.mp3"))
	    global.music[3]=sound_add("song4.mp3",0,1);
	else{
	    global.music[3]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song5.mp3"))
	    global.music[4]=sound_add("music/song5.mp3",0,1);
	else if (file_exists("song5.mp3"))
	    global.music[4]=sound_add("song5.mp3",0,1);
	else{
	    global.music[4]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song6.mp3"))
	    global.music[5]=sound_add("music/song6.mp3",0,1);
	else if (file_exists("song6.mp3"))
	    global.music[5]=sound_add("song6.mp3",0,1);
	else{
	    global.music[5]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/win.mp3"))
	    global.music[6]=sound_add("music/win.mp3",0,1);
	else if (file_exists("win.mp3"))
	    global.music[6]=sound_add("win.mp3",0,1);
	else{
	    global.music[6]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/boss1.mp3"))
	    global.music[7]=sound_add("music/boss1.mp3",0,1);
	else if (file_exists("boss1.mp3"))
	    global.music[7]=sound_add("boss1.mp3",0,1);
	else{
	    global.music[7]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/boss2.mp3"))
	    global.music[8]=sound_add("music/boss2.mp3",0,1);
	else if (file_exists("boss2.mp3"))
	    global.music[8]=sound_add("boss2.mp3",0,1);
	else{
	    global.music[8]=snd_empty;
	    global.musicmissing=1;
	    }
	if (file_exists("music/song7.mp3"))
	    global.music[9]=sound_add("music/song7.mp3",0,1);
	else if (file_exists("song7.mp3"))
	    global.music[9]=sound_add("song7.mp3",0,1);
	else{
	    global.music[9]=snd_empty;
	    global.musicmissing=1;
	    }



}
