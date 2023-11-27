function scr_stopmusic() {
	//why ten times? because sound_stop is not
	// guaranteed to work in versions after 5.3A
	repeat(10){
	    for (i=0;i<10;i+=1)
	        sound_stop(global.music[i]);
	    }



}
