function scr_battlesabotstep() {
	if (!init){
	    init=1;
	    scr_joycreate();
		game_set_speed(global.difficulty == 2 ? 40 : 30, gamespeed_fps);
	    if (global.difficulty==2)
	        speeddif=1.6;
	    else
	        speeddif=1;
	    smackline[0]="";
	    smackline[1]="";
	    smackline[2]="";
	    smackline[3]="";
	    realsmackstring="";
	    smackstring="";
	    smacklength=0;
	    if (global.battle==50){
	        scr_stopmusic();
	        if (global.playmusic)
	            sound_loop(global.music[7]);
        
	        bossoff=420;
	        tempid=instance_create(96,532,obj_bossenemy);
	        tempid.sprite_index=spr_boss1;
	        tempid.active=0;
	        tempid.type=1;
	        tempid.hp=128;
	        tempid.firefromx=16;
	        tempid.firefromy=12;
        
	        tempid=instance_create(88,476,obj_bossenemy);
	        tempid.sprite_index=spr_boss2;
	        tempid.active=0;
	        tempid.type=2;
	        tempid.hp=256;
	        tempid.firefromx=16;
	        tempid.firefromy=16;
        
	        tempid=instance_create(96,428,obj_bossenemy);
	        tempid.sprite_index=spr_boss3;
	        tempid.active=0;
	        tempid.type=3;
	        tempid.hp=192;
	        tempid.firefromx=12;
	        tempid.firefromy=12;
        
	        tempid=instance_create(88,392,obj_bossenemy);
	        tempid.sprite_index=spr_boss4;
	        tempid.active=0;
	        tempid.type=4;
	        tempid.hp=128;
	        tempid.firefromx=8;
	        tempid.firefromy=12;
        
	        tempid=instance_create(96,320,obj_bossenemy);
	        tempid.sprite_index=spr_boss5;
	        tempid.active=0;
	        tempid.type=5;
	        tempid.hp=256;
	        tempid.firefromx=20;
	        tempid.firefromy=25;
        
	        tempid=instance_create(112,288,obj_bossenemy);
	        tempid.sprite_index=spr_boss6;
	        tempid.active=0;
	        tempid.type=6;
	        tempid.hp=192;
	        tempid.firefromx=12;
	        tempid.firefromy=12;
        
	        tempid=instance_create(112,204,obj_bossenemy);
	        tempid.sprite_index=spr_boss7;
	        tempid.active=0;
	        tempid.type=7;
	        tempid.hp=256;
	        tempid.firefromx=12;
	        tempid.firefromy=32;
        
	        tempid=instance_create(88,172,obj_bossenemy);
	        tempid.sprite_index=spr_boss8;
	        tempid.active=0;
	        tempid.type=8;
	        tempid.hp=192;
	        tempid.firefromx=8;
	        tempid.firefromy=8;
        
	        tempid=instance_create(112,140,obj_bossenemy);
	        tempid.sprite_index=spr_boss9;
	        tempid.active=0;
	        tempid.type=9;
	        tempid.hp=128;
	        tempid.firefromx=16;
	        tempid.firefromy=12;
        
	        tempid=instance_create(104,24,obj_bossenemy);
	        tempid.sprite_index=spr_boss10;
	        tempid.active=0;
	        tempid.type=10;
	        tempid.hp=1536;
	        tempid.firefromx=5;
	        tempid.firefromy=5;

	        tempid=instance_create(1024,1024,obj_bossenemy);
	        tempid.sprite_index=spr_boss10;
	        tempid.active=0;
	        tempid.type=11;
	        tempid.hp=1536;
	        tempid.firefromx=0;
	        tempid.firefromy=0;
        
	        for (i=0;i<11;i+=1)
	            bossdead[i]=0;
            
	        skiptoend=0;
	        if (skiptoend){
	            bossdead[1]=1;
	            bossdead[2]=1;
	            bossdead[3]=1;
	            bossdead[4]=1;
	            bossdead[5]=1;
	            bossdead[6]=1;
	            bossdead[7]=1;
	            bossdead[8]=1;
	            bossdead[9]=1;
	            with (obj_bossenemy){
	                active=0;
	                if (type==10 || type==1)
	                    active=1;
	                }
	            var_layer=3;
	            bossoff=0;
	            }
	        }
	    }

	scr_joy(0);
	scr_input();

	//Pause/abort
	if (pressescape && !pressescapeprev){
	    if (!obj_battleyou.ignoreall && obj_battleyou.hp>0 && !victory && !failure){
	        //easy way
	        obj_battleyou.hp=0;
	        //hard way would require deactivating everything
	        //and fiddling with stuff run by battlesabot.
	        //too dangerous.
	        }
	    }

	//Time taken
	if (global.frames<global.maxframes){
	    global.frames+=1;
	    //Skip timing frames on Master
	    if (global.difficulty==2){
	        global.skipframe+=1;
	        if (global.skipframe>=4){
	            global.skipframe=0;
	            global.frames-=1;
	            }
	        }
	    }

	//Hypesnakes
	if (global.difficulty==3){
	    //the hype is building...
	    hype+=1;
	    //here it comes!
	    if (hype==290){
	        sound_volume(snd_hype,0);
	        sndvol=0.7;
	        }
	    if (hype==300){
	        if (global.sound)
	            sound_loop(snd_hype);
	        for (i=0;i<9;i+=1){
	            tempid=instance_create(320+(i mod 2)*32,i*16,obj_enemy);
	            tempid.type=17;
	            tempid.ready=1;
	            tempid.mask_index=spr_enemymegabox;
	            }
	        }
	    if (hype>=300 && hype<=1000){
	        obj_battleyou.x-=4;
	        sndvol+=0.005;
	        sound_volume(snd_hype,sndvol);
	        }
	    }

	//Boss advance
	if (bossdead[1] && bossdead[2] && bossdead[3] && var_layer==0 && !advance && obj_battleyou.hp>0 && !failure){
	    advance=1;
	    obj_battleyou.superregen=1;
	    advancecyc=0;
	    obj_battleyou.ignoreall=1;
	    obj_battleyou.walkdir=0;
	    obj_battleyou.hspeed=-16;
	    obj_battleyou.vspeed=0;
	    with (obj_enemyshot){
	        instance_destroy();
	        instance_create(x,y,obj_puff);
	        }
	    }
	else if (bossdead[4] && bossdead[5] && bossdead[6] && var_layer==1 && !advance && obj_battleyou.hp>0 && !failure){
	    advance=1;
	    obj_battleyou.superregen=1;
	    advancecyc=0;
	    obj_battleyou.ignoreall=1;
	    obj_battleyou.walkdir=0;
	    obj_battleyou.hspeed=-16;
	    obj_battleyou.vspeed=0;
	    with (obj_enemyshot){
	        instance_destroy();
	        instance_create(x,y,obj_puff);
	        }
	    }
	else if (bossdead[7] && bossdead[8] && bossdead[9] && var_layer==2 && !advance && obj_battleyou.hp>0 && !failure){
	    advance=1;
	    obj_battleyou.superregen=1;
	    advancecyc=0;
	    obj_battleyou.ignoreall=1;
	    obj_battleyou.walkdir=0;
	    obj_battleyou.hspeed=-16;
	    obj_battleyou.vspeed=0;
	    with (obj_enemyshot){
	        instance_destroy();
	        instance_create(x,y,obj_puff);
	        }
	    }

	if (advance){
	    obj_battleyou.speed*=0.9;
	    if (obj_battleyou.speed<0.2)
	        obj_battleyou.speed=0;
	    advancecyc+=1;
	    //Go to layer 3
	    if (var_layer==2){
	        if (advancecyc==1)
	            scr_stopmusic();
	        if (advancecyc==30){
	            if (global.playmusic)
	                sound_loop(global.music[8]);
	            horishake=1;
	            }
	        if (advancecyc>=30 && advancecyc<310){
	            if (advancecyc mod 2==0){
	                bossoff-=1;
	                //obj_battleyou.y-=0.5;
	                }
	            }
	        if (advancecyc==310){
	            horishake=0;
	            smacktalk=1;
	            smacktalkcyc=0;
	            }
	        if (advancecyc==310+ceil(300*speeddif)){
	            advance=0;
	            obj_battleyou.superregen=0;
	            obj_battleyou.resetignoreall=2;
	            obj_battleyou.attackcyc=0;
	            var_layer+=1;
	            with (obj_bossenemy){
	                if (type==10 || type==11)
	                    active=1;
	                }
	            }
	        }
	    //Go to layer 1 and 2
	    else{
	        if (advancecyc==30)
	            horishake=1;
	        if (advancecyc>=30 && advancecyc<170){
	            bossoff-=1;
	            //obj_battleyou.y-=1;
	            }
	        if (advancecyc==170){
	            horishake=0;
	            if (var_layer==0)
	                bossoff=280;
	            else if (var_layer==1)
	                bossoff=140;
	            }
	        if (advancecyc==200){
	            advance=0;
	            obj_battleyou.superregen=0;
	            obj_battleyou.resetignoreall=2;
	            obj_battleyou.attackcyc=0;
	            var_layer+=1;
	            if (var_layer==1){
	                with (obj_bossenemy){
	                    if (type==4 || type==5 || type==6)
	                        active=1;
	                    }
	                }
	            else if (var_layer==2){
	                with (obj_bossenemy){
	                    if (type==7 || type==8 || type==9)
	                        active=1;
	                    }
	                }
	            else if (var_layer==3){
	                with (obj_bossenemy){
	                    if (type==10 || type==11)
	                        active=1;
	                    }
	                }
	            }
	        }
	    }

	//victory
	if (introcyc>=60 && global.difficulty!=3 && instance_number(obj_enemy)==0 && instance_number(obj_bossenemy)==0 && !victory && !failure){
	    victory=1;
	    if (global.sound)
	        sound_play(snd_victory);
	    if (obj_battleyou.hp<=0)
	        obj_battleyou.hp=1;
	    with (obj_enemyshot){
	        instance_destroy();
	        instance_create(x,y,obj_puff);
	        }
	    with (obj_shot){
	        instance_destroy();
	        instance_create(x,y,obj_puff);
	        }
	    with (obj_flask){
	        instance_destroy();
	        instance_create(x,y-z,obj_puff);
	        }
	    global.shakescreen=8;
	    global.npccured[global.battlenpc]=1;
	    global.npcjustcured[global.battlenpc]=1;
	    ignoreall=1;
	    speed=0;
	    dollx=obj_battleyou.x;
	    dolly=obj_battleyou.y;
	    //dollys=-16;
	    dollys=0;
	    dollyacc=0;
	    obj_battleyou.visible=0;
	    obj_battleyou.ignoreall=1;
	    }

	//Shakescreen
	if (global.shakescreen>0){
	    global.shakescreen-=1;
	    if (global.shakescreen mod 2==0)
	        scr_setyview(bossoff+global.shakescreen);
	    else
	       scr_setyview(bossoff);
	    }
	else
	    scr_setyview(bossoff);

	if (horishake){
	    horishakecyc+=1;
	    if (horishakecyc mod 4<=1)
	        scr_setxview(2);
	    else
	        scr_setxview(0);
	    }
	else
	    scr_setxview(0);

	//Global animation cycler
	global.animcyc+=1;
	if (global.animcyc==global.animcyclength)
	    global.animcyc=0;

	//Background color
	if (global.flashr>0){
	    global.flashr-=global.flashspeed;
	    if (global.flashr<=0)
	        global.flashr=0;
	    }
	if (global.flashg>0){
	    global.flashg-=global.flashspeed;
	    if (global.flashg<=0)
	        global.flashg=0;
	    }
	if (global.flashb>0){
	    global.flashb-=global.flashspeed;
	    if (global.flashb<=0)
	        global.flashb=0;
	    }
	if (global.flashr>=250)
	    global.flashr=250;
	if (global.flashg>=250)
	    global.flashg=250;
	if (global.flashb>=250)
	    global.flashb=250;
	if (global.gmv==5){
	    global.flashr=0;
	    global.flashg=0;
	    global.flashb=0;
	    }
	global.bgcolor=make_color_rgb(global.flashr,global.flashg,global.flashb);
	__background_set_colour( global.bgcolor );



}
