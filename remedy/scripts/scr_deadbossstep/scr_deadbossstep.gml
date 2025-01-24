function scr_deadbossstep() {
	if (final){
	    obj_battleyou.speed*=0.9;
	    cyc+=1;
	    if (cyc<=150){
	        if (cyc mod 2==0){
	            myx=bbox_left+(bbox_right-bbox_left)/2;
	            myy=bbox_top+(bbox_bottom-bbox_top)/2;
	            instance_create_depth(myx-16+floor(random(32)),myy-16+floor(random(32)),-20,obj_explo);
	            global.shakescreen=4;
	            }
	        if (cyc mod 6==0){
	            sfx_play(snd_explo);
	            }
	        if (cyc mod 24==0){
	            global.flashr=150;
	            global.flashg=50;
	            global.flashb=50;
	            }
	        if (cyc mod 24==8){
	            global.flashr=50;
	            global.flashg=150;
	            global.flashb=50;
	            }
	        if (cyc mod 24==16){
	            global.flashr=50;
	            global.flashg=50;
	            global.flashb=150;
	            }
	        }
	    if (cyc==150){
	        sfx_play(snd_bossexplo);
	        global.flashr=250;
	        global.flashg=250;
	        global.flashb=250;
	        global.shakescreen=16;
	        myx=bbox_left+(bbox_right-bbox_left)/2;
	        myy=bbox_top+(bbox_bottom-bbox_top)/2;
	        for (i=0;i<32;i+=1){
	            tempid=instance_create_depth(myx,myy,-15,obj_explopart);
	            tempid.slow=1;
	            tempid.speed=10+(i mod 2)*10;
	            tempid.direction=i*11.25;
	            }
	        }
	    if (cyc==180){
	        final=0;
	        global.finalbossdead=1;
	        with (obj_bossenemy)
	            instance_destroy();
	        }
	    }



}
