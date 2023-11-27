function scr_intersabotdraw() {
	if (!drawinit){
	    drawinit=1;
	    y2=-50;
	    cyc=-8;
	    }

	cyc+=1;
	if (cyc==20)
	    yspd=4;
	if (cyc==50)
	    yspd=0;
	if (cyc==110)
	    yspd=4;
	y2+=yspd;
	if (cyc>=170)
	    room_goto(rom_easthurtland);

	if (cyc>=0 && cyc<=110 && (cyc mod 4==0)){
	    if (cyc mod 8==0)
	        instance_create(4+random(24),room_height+16,obj_interstar);
	    else
	        instance_create(room_width-4-random(24),room_height+16,obj_interstar);
	    }

	draw_sprite(spr_fall,0,floor(room_width/2),floor(y2));



}
