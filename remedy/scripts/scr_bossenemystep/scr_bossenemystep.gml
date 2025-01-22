function scr_bossenemystep() {
	//init
	if (!init){
	    init=1;
	    }

	//die
	if (hp<=0 && active){
	    sfx_play(snd_bossexplo);
	    if (type==10){
	        obj_battleyou.vspeed=0;
	        obj_battleyou.hspeed=-16;
	        obj_battleyou.ignoreall=1;
	        obj_battleyou.walkdir=0;
	        with (obj_enemyshot){
	            instance_destroy();
	            instance_create(x,y,obj_puff);
	            }
	        scr_stopmusic();
	        }
	    if (type!=11){
	        global.shakescreen=8;
	        global.flashr=150;
	        global.flashg=150;
	        global.flashb=150;
	        }
	    tempid=instance_create(x,y,obj_deadboss);
	    tempid.sprite_index=sprite_index;
	    if (type==10)
	        tempid.final=1;
	    myx=bbox_left+(bbox_right-bbox_left)/2;
	    myy=bbox_top+(bbox_bottom-bbox_top)/2;
	    instance_create(myx,myy,obj_explo);
	    instance_create(myx-12,myy-12,obj_explo);
	    instance_create(myx-12,myy+12,obj_explo);
	    instance_create(myx+12,myy-12,obj_explo);
	    instance_create(myx+12,myy+12,obj_explo);
	    obj_battlesabot.bossdead[type]=1;
	    instance_destroy();
	    }

	//Fire
	//Stage 1
	if (active && !stopfire){
	    if (global.difficulty==0){
	        firecyc+=1;
	        if (type==1){
	            if (firecyc==40){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==8)
	                    firecyc2=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=100+firecyc2*5;
	                tempid.gravity=0.05;
	                tempid.speed=3;
	                tempid.force=10;
	                }
	            }
	        else if (type==2){
	            if (firecyc==30){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.force=10;
	                tempid.phase=1;
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)-30;
	                tempid.force=10;
	                tempid.phase=1;
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)+30;
	                tempid.force=10;
	                tempid.phase=1;
	                }
	            }
	        else if (type==3){
	            if (firecyc==40){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==8)
	                    firecyc2=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=180+firecyc2*5;
	                tempid.gravity=0.05;
	                tempid.force=10;
	                }
	            }
	        //Stage 2
	        else if (type==4){
	            if (firecyc==90){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=3;
	                tempid.force=10;
	                }
	            }
	        else if (type==5){
	            if (firecyc==30){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                sfx_play(snd_explo);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=3;
	                tempid.sprite_index=spr_enemyshot2;
	                tempid.force=15;
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)-30;
	                tempid.speed=3;
	                tempid.force=10;
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)+30;
	                tempid.speed=3;
	                tempid.force=10;
	                }
	            }
	        else if (type==6){
	            if (firecyc==30){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=1;
	                tempid.force=10;
	                tempid.phase=1;
	                }
	            }
	        //Stage 3
	        else if (type==7){
	            if (firecyc==20){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==5)
	                    firecyc2=-4;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)+firecyc2*5;
	                tempid.force=10;
	                if (global.force>=6)
	                    tempid.sprite_index=spr_wooshot;
	                }
	            }
	        else if (type==8){
	            if (firecyc==40){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==2)
	                    firecyc2=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                for (i=0;i<8;i+=1){
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=100+(i*20)+firecyc2*10;
	                    tempid.force=10;
	                    tempid.phase=1;
	                    }
	                }
	            }
	        else if (type==9){
	            if (firecyc==80){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                sfx_play(snd_explo);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=0.5;
	                tempid.sprite_index=spr_enemyshot2;
	                tempid.force=15;
	                tempid.outside=1;
	                }
	            }
	        //Stage 4
	        else if (type==10){
	            if (firecyc==60){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==5)
	                    firecyc2=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(8+firecyc2*8,-8,obj_enemyshot);
	                tempid.direction=270;
	                tempid.speed=1;
	                tempid.force=10;
	                tempid.outside=1;
	                tempid=instance_create(8+32+firecyc2*8,-8,obj_enemyshot);
	                tempid.direction=270;
	                tempid.speed=1;
	                tempid.force=10;
	                tempid.outside=1;
	                }
	            firecyc3+=1;
	            if (firecyc3==120){
	                firecyc3=0;
	                if (global.shakescreen==0)
	                    global.shakescreen=4;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                sfx_play(snd_explo);
	                for (i=0;i<5;i+=1){
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)-60+i*30;
	                    tempid.speed=2;
	                    tempid.sprite_index=spr_enemyshot2;
	                    tempid.force=15;
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)-60+i*30;
	                    tempid.speed=1;
	                    tempid.force=10;
	                    }
	                }
	            firecyc4+=1;
	            if (firecyc4==120){
	                firecyc4=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=0.25;
	                tempid.force=10;
	                tempid.phase=1;
	                }
	            }
	        }
    
	    //HARD MODE
	    else{
	        firecyc+=1;
	        if (type==1){
	            if (firecyc==40){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==8)
	                    firecyc2=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                for (i=-1;i<2;i+=1){
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=100+firecyc2*5+i*30;
	                    tempid.gravity=0.05;
	                    tempid.speed=3;
	                    tempid.force=10;
	                    }
	                }
	            }
	        else if (type==2){
	            if (firecyc==30){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.force=10;
	                tempid.homing=1;
	                }
	            }
	        else if (type==3){
	            if (firecyc==40){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==8)
	                    firecyc2=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                for (i=-1;i<2;i+=1){
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=180+firecyc2*5+i*30;
	                    tempid.gravity=0.05;
	                    tempid.force=10;
	                    }
	                }
	            }
	        //Stage 2
	        else if (type==4){
	            if (firecyc==45){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=3;
	                tempid.force=10;
	                }
	            }
	        else if (type==5){
	            if (firecyc==30){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                sfx_play(snd_explo);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=3;
	                tempid.sprite_index=spr_enemyshot2;
	                tempid.force=15;
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)-30;
	                tempid.speed=3;
	                tempid.force=10;
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)+30;
	                tempid.speed=3;
	                tempid.force=10;
	                }
	            }
	        else if (type==6){
	            if (firecyc==30){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                for (i=-1;i<2;i+=1){
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)+i*30;
	                    tempid.speed=1;
	                    tempid.force=10;
	                    tempid.phase=1;
	                    }
	                }
	            }
	        //Stage 3
	        else if (type==7){
	            firecyc3+=1;
	            if (firecyc==20){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==5)
	                    firecyc2=-4;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)+firecyc2*5;
	                tempid.force=10;
	                if (global.force>=6)
	                    tempid.sprite_index=spr_wooshot;
	                }
	            if (firecyc3==40){
	                firecyc3=0;
	                firecyc4+=1;
	                if (firecyc4==8)
	                    firecyc4=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=100+firecyc4*5;
	                tempid.gravity=0.05;
	                tempid.speed=3;
	                tempid.force=10;
	                if (global.force>=6)
	                    tempid.sprite_index=spr_wooshot;
	                }
	            }
	        else if (type==8){
	            if (firecyc==40){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==2)
	                    firecyc2=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                for (i=0;i<8;i+=1){
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=100+(i*20)+firecyc2*10;
	                    tempid.force=10;
	                    tempid.phase=1;
	                    }
	                }
	            }
	        else if (type==9){
	            if (firecyc==40){
	                firecyc=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                sfx_play(snd_explo);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=1.2;
	                tempid.sprite_index=spr_enemyshot2;
	                tempid.force=15;
	                tempid.outside=1;
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=0.8;
	                tempid.sprite_index=spr_enemyshot2;
	                tempid.force=15;
	                tempid.outside=1;
	                }
	            }
	        //Stage 4
	        else if (type==10){
	            if (firecyc==80){
	                firecyc=0;
	                firecyc2+=1;
	                if (firecyc2==5)
	                    firecyc2=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(8+firecyc2*8,-8,obj_enemyshot);
	                tempid.direction=270;
	                tempid.speed=1;
	                tempid.force=10;
	                tempid.outside=1;
	                tempid=instance_create(8+32+firecyc2*8,-8,obj_enemyshot);
	                tempid.direction=270;
	                tempid.speed=1;
	                tempid.force=10;
	                tempid.outside=1;
	                }
	            firecyc3+=1;
	            if (firecyc3==128){
	                firecyc3=0;
	                if (global.shakescreen==0)
	                    global.shakescreen=4;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                sfx_play(snd_explo);
	                for (i=0;i<5;i+=1){
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)-60+i*30;
	                    tempid.speed=2;
	                    tempid.sprite_index=spr_enemyshot2;
	                    tempid.force=15;
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y)-60+i*30;
	                    tempid.speed=1;
	                    tempid.force=10;
	                    }
	                }
	            firecyc4+=1;
	            if (firecyc4==128){
	                firecyc4=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                tempid.direction=point_direction(x+firefromx,y+firefromy,obj_battleyou.x,obj_battleyou.y);
	                tempid.speed=0.25;
	                tempid.force=10;
	                tempid.phase=1;
	                }
	            firecyc5+=1;
	            if (firecyc5==64){
	                firecyc5=0;
	                firecyc6+=1;
	                if (firecyc6==8)
	                    firecyc6=0;
	                sound_stop(snd_enemyshot);
	                sfx_play(snd_enemyshot);
	                for (i=-2;i<2;i+=1){
	                    tempid=instance_create(x+firefromx,y+firefromy,obj_enemyshot);
	                    tempid.direction=180+firecyc6*5+i*30;
	                    tempid.gravity=0.05;
	                    tempid.force=10;
	                    }
	                }
	            }
	        }
	    }

	//animate
	img=0;
	if (damaged){
	    img=1;
	    damaged=0;
	    }
	image_single=img;



}
