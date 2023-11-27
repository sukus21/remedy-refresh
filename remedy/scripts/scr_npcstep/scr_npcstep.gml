function scr_npcstep() {
	//Create
	if (init<2){
	    init+=1;
	    if (init==2)
	        scr_npccreate();
	    }

	//Sick
	if (!cured)
	    img=0;

	//Yay
	else if (yay>0){
	    yay-=1;
	    if (global.animcyc==0)
	        img=1;
	    else if (global.animcyc==floor(global.animcyclength/2))
	        img=3;
	    }

	//Idle
	else{
	    if (global.animcyc==0)
	        img=1;
	    else if (global.animcyc==floor(global.animcyclength/2))
	        img=2;
	    }

	image_single=img+tag*4;




}
