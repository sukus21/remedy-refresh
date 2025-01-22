function scr_titlesabotdraw() {
	if (state == 0) {
	    // main menu
	    if (tier == TITLESABOT_TIER.MAIN) {
	        scr_drawtext(16, 88, "New game#Load game#Options#Quit", 8, spr_text2);
	        draw_sprite(spr_text, 96, 8, 88+selected*8);
	    }
		
	    // options
	    else if (tier == TITLESABOT_TIER.OPTIONS) {
	        tiertext = "Back#";
			
			if (!global.is_mobile) {
				tiertext += "Fullscreen ";
				tiertext += (window_get_fullscreen()) ? "ON#" : "OFF#";
		        tiertext += "Windowed size ";
				tiertext += "x" + string(global.windowed) + "#";
			}
			else {
				tiertext += "Input scale  ";
				tiertext += titlesabot_percent(global.mobile_button_scale) + "#";
				tiertext += "Input height ";
				tiertext += titlesabot_percent(global.mobile_button_height) + "#";
			}

	        tiertext += "Music ";
	        tiertext += (global.playmusic) ? "ON#" : "OFF#";
	        tiertext += "Sound ";
	        tiertext += (global.sound) ? "ON#" : "OFF#";
        
	        tiertext += "Autosave ";
	        tiertext += (global.autosave) ? "ON#" : "OFF#";
        
	        tiertext += "Always run ";
	        tiertext += (global.alwaysrun) ? "ON#" : "OFF#";
	        tiertext += "Swap act/run ";
	        tiertext += (global.fliprun) ? "ON#" : "OFF#";
        
	        if (global.joystickexists) tiertext += "Setup gamepad";
        
	        for (i = 0; i < 10; i += 1) {
	            for (j = 0; j < 6; j += 1) {        
	                draw_sprite(spr_black, 0, i*16, 56+j*16);
				}
	        }
	        scr_drawtext(16, 64, tiertext, 8, spr_text2);
	        draw_sprite(spr_text, 96, 8, 64+selected*8);
	    }
		
	    // assign joystick
	    else if (tier == TITLESABOT_TIER.JOYPAD) {
	        for (var i = 0; i < 10; i++) {
	            for (var j = 0; j < 6; j++) {
	                draw_sprite(spr_black, 0, i*16, 56+j*16);
	            }
			}
	        if (assign <= 3) tiertext = "#Press the D-Pad###Press a keyboard#key to cancel and#reset the buttons";
	        else tiertext = "#Gamepad setup#complete!##Press a keyboard#key to return";
	        scr_drawtext(16, 64, tiertext, 8, spr_text2);
			
	        if (assign == 0) scr_drawtext(16, 80, "    Up", 8, spr_text3);
	        else if (assign == 1) scr_drawtext(16, 80, "   Down", 8, spr_text3);
	        else if (assign == 2) scr_drawtext(16, 80, "   Left", 8, spr_text3);
	        else if (assign == 3) scr_drawtext(16, 80, "   Right", 8, spr_text3);
	    }
		
	    // new/load game
	    else if (tier == TITLESABOT_TIER.FILE) {
	        scr_drawtext(16, 88, filestring, 8, spr_text2);
	        draw_sprite(spr_text, 96, 8, 88+selected*8);
	    }
		
	    // select difficulty
	    else if (tier == TITLESABOT_TIER.DIFFICULTY) {
			var _text = "Back#Normal#Hard#Master";
	        if (unlockreally) _text += "#Reallyjoel's dad";
	        scr_drawtext(16, 88, _text, 8, spr_text2);
	        draw_sprite(spr_text, 96, 8, 88+selected*8);
	    }

	    // Music missing message
	    if (global.musicmissing && (tier == TITLESABOT_TIER.MAIN || tier == TITLESABOT_TIER.FILE || tier == TITLESABOT_TIER.DIFFICULTY)) {
	        for (var i = 0; i < 10; i++) draw_sprite(spr_black, 0, i*8, 132);
	        scr_drawtext(0, 132, "                    ", 8, spr_text2);
	        scr_drawtext(0, 132, "Music files missing!", 8, spr_text3);
	    }
	}

	// Transition out
	if (transition == 2 and transitioncyc > 0) {
		transition_draw(transitioncyc2);
	}
}

function titlesabot_percent(_value) {
	var _text = string(round(_value * 100)) + "%";
	var _spaces = (4 - string_length(_text)) * " ";
	return _spaces + _text;
}
