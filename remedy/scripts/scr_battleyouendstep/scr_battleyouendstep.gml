function scr_battleyouendstep() {
	//limits
	if (x<8){
	    x=8;
	    hspeed=0;
	    }
	if (y<scr_yview()+8){
	    y=scr_yview()+8;
	    vspeed=0;
	    }
	if (x>room_width-8){
	    x=room_width-8;
	    hspeed=0;
	    }
	if (y>scr_yview()+scr_hview()-20){
	    y=scr_yview()+scr_hview()-20;
	    vspeed=0;
	    }
	//Limits in boss
	if (global.battle==50){
	    if (x>room_width/2-8){
	        x=room_width/2-8;
	        hspeed=0;
	        }
	    }

	//collision
	//diagonal
	if (!place_free(x,y)){
	    x=xprevious;
	    y=yprevious;
	    if (place_free(x,y+vspeed) && place_free(x+hspeed,y)){
	        hspeed=0;
	        y+=vspeed;
	        }
	    }
	//orthogonal
	if (vspeed>0 && !place_free(x,y+vspeed)){
	    vspeed=0;
	    move_contact_solid(270,4);
	    }
	else if (vspeed<0 && !place_free(x,y+vspeed)){
	    vspeed=0;
	    move_contact_solid(90,4);
	    }
	if (hspeed>0 && !place_free(x+hspeed,y)){
	    hspeed=0;
	    move_contact_solid(0,4);
	    }
	else if (hspeed<0 && !place_free(x+hspeed,y)){
	    hspeed=0;
	    move_contact_solid(180,4);
	    }

	//box
	mybox.x=x;
	mybox.y=y;



}
