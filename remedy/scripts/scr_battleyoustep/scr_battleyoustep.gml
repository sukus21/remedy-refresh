function scr_battleyoustep() {
	scr_joy(0);
	scr_input();

	//Regen
	if (hp>0 && hp<global.hearts && !obj_battlesabot.victory && !obj_battlesabot.defeat){
	    regencyc+=1;
	    if (regencyc>=regencycmax || (superregen==1 && regencyc>=2)){
	        regencyc=0;
	        hp+=1;
	        }
	    }
	else
	    regencyc=0;

	//Reset ignoreall
	if (resetignoreall>0){
	    resetignoreall-=1;
	    if (resetignoreall==0){
	        ignoreall=0;
	        if (pressleft)
	            walkdir=2;
	        else if (pressright)
	            walkdir=0;
	        }
	    }

	//move
	ignoreallprev=ignoreall;

	if (!ignoreall){
	    if (pressup && !pressdown){
	        if (place_free(x,y-1))
	            vspeed-=accel;
	        if (pressup && !pressupprev)
	            walkdir=1;
	        if (!pressright && !pressleft && !pressdown)
	            walkdir=1;
	        }
	    else if (pressdown && !pressup){
	        if (place_free(x,y+1))
	            vspeed+=accel;
	        if (pressdown && !pressdownprev)
	            walkdir=3;
	        if (!pressright && !pressleft && !pressup)
	            walkdir=3;
	        }
	    else if (vspeed<0){
	        vspeed+=brake;
	        if (vspeed>=0)
	            vspeed=0;
	        }
	    else if (vspeed>0){
	        vspeed-=brake;
	        if (vspeed<=0)
	            vspeed=0;
	        }
	    if (pressright && !pressleft){
	        if (place_free(x+1,y))
	            hspeed+=accel;
	        if (pressright && !pressrightprev)
	            walkdir=0;
	        if (!pressup && !pressdown && !pressleft)
	            walkdir=0;
	        }
	    else if (pressleft && !pressright){
	        if (place_free(x-1,y))
	            hspeed-=accel;
	        if (pressleft && !pressleftprev)
	            walkdir=2;
	        if (!pressright && !pressup && !pressdown)
	            walkdir=2;
	        }
	    else if (hspeed<0){
	        hspeed+=brake;
	        if (hspeed>=0)
	            hspeed=0;
	        }
	    else if (hspeed>0){
	        hspeed-=brake;
	        if (hspeed<=0)
	            hspeed=0;
	        }
	    }

	//limits
	if (hspeed>=maxspd)
	    hspeed=maxspd;
	if (hspeed<=-maxspd)
	    hspeed=-maxspd;
	if (vspeed>=maxspd)
	    vspeed=maxspd;
	if (vspeed<=-maxspd)
	    vspeed=-maxspd;

	//attack
	if (!ignoreall){
	    attackcyc+=1;
	    if (attackcyc>=attackcycmax){
	        sfx_play(snd_fire);
	        attackcyc=0;
	        for (i=0;i<global.multi;i+=1){
	            tempid=instance_create_depth(x,y,-5,obj_shot);
	            if (global.force>5)
	                tempid.type=5;
	            else
	                tempid.type=global.force-1;
	            tempid.dir=walkdir;
	            tempid.speed=6;
	            tempid.direction=walkdir*90;
	            tempid.direction+=-(global.multi-1)*5+i*10;
	            }
	        }
	    }

	//throw flask
	if (pressinteract && !pressinteractprev && !ignoreall){
	    if (instance_number(obj_flask)==0 && flasks>0){
	        sfx_play(snd_throwflask);
	        flasks-=1;
	        tempid=instance_create_depth(x,y,-4,obj_flask);
	        tempid.direction=walkdir*90;
	        }
	    }

	//damage
	if (damaged>0)
	    damaged-=1;
	//failure
	if (hp<=0 && !obj_battlesabot.failure){
	    sfx_play(snd_bossexplo);
	    sfx_play(snd_failure);
	    audio_stop_sound(snd_hype);
	    hp=0;
	    if (global.battle==50)
	        scr_stopmusic();
	    global.flashr=250;
	    global.flashg=100;
	    global.flashb=100;
	    with (obj_enemy)
	        ready=0;
	    with (obj_bossenemy){
	        active=0;
	        firecyc=0;
	        stopfire=1;
	        }
	    with (obj_enemyshot){
	        instance_destroy();
	        instance_create_depth(x,y,-10,obj_puff);
	        }
	    with (obj_shot){
	        instance_destroy();
	        instance_create_depth(x,y,-10,obj_puff);
	        }
	    with (obj_flask){
	        instance_destroy();
	        instance_create_depth(x,y-z,-10,obj_puff);
	        }
	    obj_battlesabot.failure=1;
	    ignoreall=1;
	    speed=0;
	    obj_battlesabot.dollx=x;
	    obj_battlesabot.dolly=y;
	    obj_battlesabot.dollys=-4;
	    obj_battlesabot.dollyacc=0.5;
	    for (i=0;i<8;i+=1){
	        tempid=instance_create_depth(x,y,-10,obj_puff);
	        tempid.speed=6;
	        tempid.direction=i*45;
	        tempid.depth=obj_battlesabot.depth-10;
	        tempid.slow=1;
	        tempid=instance_create_depth(x,y,-10,obj_puff);
	        tempid.speed=12;
	        tempid.direction=i*45+22.5;
	        tempid.depth=obj_battlesabot.depth-10;
	        tempid.slow=1;
	        }
	    for (i=0;i<32;i+=1){
	        tempid=instance_create_depth(x,y,-15,obj_explopart);
	        tempid.speed=16+(i mod 2)*8;
	        tempid.direction=i*22.5;
	        tempid.depth=obj_battlesabot.depth-5;
	        tempid.slow=1;
	        }
	    }
    
	//animate
	if (global.animcyc==0)
	    img=0;
	else if (global.animcyc==floor(global.animcyclength/2))
	    img=1;
	image_single=img+walkdir*2;



}
