function transition_draw(_cycle) {
	for (var i = 0; i < _cycle; i++) {
	    for (var j = 0; j < 9; j++) {
	        if (i == _cycle-1) {
	            draw_sprite(spr_black, 2, scr_xview()+i*16, scr_yview()+j*16);
	            draw_sprite(spr_black, 3, scr_xview()+144-i*16, scr_yview()+j*16);
	        }
	        else {
	            draw_sprite(spr_black, 0, scr_xview()+i*16, scr_yview()+j*16);
	            draw_sprite(spr_black, 0, scr_xview()+144-i*16, scr_yview()+j*16);
	        }
	    }
	}
}

function transition_out() {
	transitioncyc++;

	if (transitioncyc mod 3 == 2 || transitioncyc2 > 0) transitioncyc2++;
	if (transitioncyc2 > 5) transitioncyc2 = 5;
	if (transitioncyc == 8) {
	    transition = 0;
	    transitioncyc = 0;
	    transitioncyc2 = 0;
	    scr_saveoptions();

	    // go to room
	    if (global.fromsavefile) scr_load();
	    else room_goto(global.roomgoto);
	}
}
