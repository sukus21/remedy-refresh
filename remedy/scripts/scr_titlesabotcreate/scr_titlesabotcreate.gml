enum TITLESABOT_TIER {
	MAIN,
	OPTIONS,
	FILE,
	DIFFICULTY,
	JOYPAD,
}

function scr_titlesabotcreate() {
	if (!global.titleinit){
	    global.titleinit=1;;
	    global.fullscreen=1;
	    global.windowed=2;
	    global.playmusic=1;
	    global.sound=1;
	    global.autosave=1;
	    global.savefilename="remedy1.sav";
	    global.joyup=99;
	    global.joydown=99;
	    global.joyleft=99;
	    global.joyright=99;
	    global.alwaysrun=0;
	    global.fliprun=0;
	    scr_loadoptions();
	    scr_saveoptions();
		scale_window();
	    if (joystick_exists(1)){
	        global.joystickexists=1;
	        global.haspov=joystick_has_pov();
	        }
	    else{
	        global.joystickexists=0;
	        global.haspov=0;
	        }
	    }

	scr_joycreate();
	global.init=0;
	global.overridedir=0;
	global.fromsavefile=0;
	global.world=0;
	global.lastworld=0;
	scr_stopjoy();

	if (file_exists("options.sav"))
	    foundoptions=1;

	if (file_exists("remedy1.sav") || file_exists("remedy2.sav") || file_exists("remedy3.sav")){
	    filefound=1;
	    selected=1;
	    }
	else{
	    filefound=0;
	    selected=0;
	    }

	music_play(snd_song2);
    



}
