function scr_enemystep2() {
	//init
	if (!init){
	    init=1;
	    hp=1;
	    //World 1------------------------------------------------------------
	    if (type==1) hp=1; //breadcrumb - sit still, fire
	    else if (type==2) hp=2; //spikeball - follow, 1/4t random
	    else if (type==3) hp=2; //glass - random, fire straight
	    //World 2------------------------------------------------------------
	    else if (type==4) hp=6; //flame - fire homing
	    else if (type==5) hp=8; //virus - bounce clockwise quickly, fire spiral
	    else if (type==6) hp=14; //ghost - follow slowly, fire, invisible while moving
	    else if (type==7) hp=4; //bat - go random quickly, fire straight
	    //World 3------------------------------------------------------------
	    else if (type==8) hp=20; //seriously - go random, fire spiral
	    else if (type==9) hp=20; //spring - go up and down quickly, fire homing
	    else if (type==10) hp=32; //jelly - follow slowly, return fire
	    else if (type==11) hp=28; //sun - follow randomly, fire phasing
	    //World 4------------------------------------------------------------
	    else if (type==12) hp=32; //dragon - go slowly random, fire phase
	    else if (type==13) hp=48; //totem - go random, fire triple
	    else if (type==14) hp=64; //skull - go clockwise, fire homing
	    else if (type==15) hp=64; //hand - follow, fire homing
	    //World 5------------------------------------------------------------
	    else if (type==16) hp=128; //heartbreak - follow random, fire various shots
	    else if (type==17) hp=10000000; //hypesnake - WOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
    
	    fire=((x+y) mod 80);
	    }

	//animate
	if (global.animcyc==0)
	    img=0;
	else if (global.animcyc==floor(global.animcyclength/2))
	    img=1;
	if (damaged){
	    img=2;
	    damaged=0;
	    }
	image_single=img+(type-1)*4;

	if (ready){
	    cyc+=1;
	    fire+=1;
	    //type 1 - breadcrumb
	    if (type==1){
	        if (cyc==16){
	            cyc=0;
	            }
	        if (fire>=88){
	            firealt=1-firealt;
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            for (i=0;i<4;i+=1){
	                tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	                tempid.force=type;
	                tempid.direction=i*90+45*firealt;
	                tempid.spiral=1;
	                }
	            }
	        }
	    //type 2 - spikeball
	    else if (type==2){
	        if (cyc==8){
	            cyc=0;
	            stutter+=1;
	            if (stutter==3)
	                stutter=0;
	            if (stutter==0){
	                pdir=(point_direction(x,y,obj_battleyou.x,obj_battleyou.y));
	                if (pdir>=315 || pdir<45)
	                    dir=0;
	                else if (pdir>=45 && pdir<135)
	                    dir=1;
	                else if (pdir>=135 && pdir<225)
	                    dir=2;
	                else
	                    dir=3;
	                }
	            go=0;
	            if (dir==0){
	                if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==1){
	                if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==2){
	                if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==3){
	                if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28){
	                    }
	                else
	                    go=1;
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=2;
	            else if (dir==1)
	                y-=2;
	            else if (dir==2)
	                x-=2;
	            else if (dir==3)
	                y+=2;
	            }
	        }
    
	    //type 3 - glass
	    else if (type==3){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            for (i=0;i<2;i+=1){
	                tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	                tempid.force=type;
	                tempid.phase=1;
	                tempid.direction=dir*90+i*180;
	                }
	            }
	        if (cyc==16){
	            cyc=0;
	            dir=floor(random(4));
	            go=0;
	            repeat(10){ //good enough
	                if (!go){
	                    if (dir==0){
	                        if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    else if (dir==1){
	                        if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    else if (dir==2){
	                        if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    else if (dir==3){
	                        if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    }
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=1;
	            else if (dir==1)
	                y-=1;
	            else if (dir==2)
	                x-=1;
	            else if (dir==3)
	                y+=1;
	            }
	        }
    
	    //type 4 - flame
	    else if (type==4){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            tempid.homing=1;
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            tempid.spiral=1;
	            }
	        }
    
	    //type 5 - virus
	    else if (type==5){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.ttl=60;
	            tempid.speed=0;
	            for (i=0;i<2;i+=1){
	                tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	                tempid.force=type;
	                if (dir==0 || dir==2){
	                    if (y>obj_battleyou.y)
	                        tempid.direction=90;
	                    else
	                        tempid.direction=270;
	                    }
	                else{
	                    if (x>obj_battleyou.x)
	                        tempid.direction=180;
	                    else
	                        tempid.direction=0;
	                    }
	                }
	            }
	        if (cyc==8){
	            cyc=0;
	            go=0;
	            if (dir==0){
	                if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16)
	                    dir=3;
	                else
	                    go=1;
	                }
	            else if (dir==1){
	                if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16)
	                    dir=0;
	                else
	                    go=1;
	                }
	            else if (dir==2){
	                if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16)
	                    dir=1;
	                else
	                    go=1;
	                }
	            else if (dir==3){
	                if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28)
	                    dir=2;
	                else
	                    go=1;
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=2;
	            else if (dir==1)
	                y-=2;
	            else if (dir==2)
	                x-=2;
	            else if (dir==3)
	                y+=2;
	            }
	        }
    
	    //type 6 - ghost
	    else if (type==6){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            tempid.phase=1;
	            }
	        if (cyc==16){
	            cyc=0;
	            stutter=1-stutter;
	            invisible=stutter;
	            go=0;
	            if (stutter==0){
	                pdir=(point_direction(x,y,obj_battleyou.x,obj_battleyou.y));
	                if (pdir>=315 || pdir<45)
	                    dir=0;
	                else if (pdir>=45 && pdir<135)
	                    dir=1;
	                else if (pdir>=135 && pdir<225)
	                    dir=2;
	                else
	                    dir=3;
	                go=0;
	                if (dir==0){
	                    if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16){
	                        }
	                    else
	                        go=1;
	                    }
	                else if (dir==1){
	                    if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16){
	                        }
	                    else
	                        go=1;
	                    }
	                else if (dir==2){
	                    if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16){
	                        }
	                    else
	                        go=1;
	                    }
	                else if (dir==3){
	                    if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28){
	                        }
	                    else
	                        go=1;
	                    }
	                if (go){
	                    if (dir==0)
	                        instance_create_depth(x+16-8,y-8,0,obj_holder);
	                    else if (dir==1)
	                        instance_create_depth(x-8,y-16-8,0,obj_holder);
	                    else if (dir==2)
	                        instance_create_depth(x-16-8,y-8,0,obj_holder);
	                    else if (dir==3)
	                        instance_create_depth(x-8,y+16-8,0,obj_holder);
	                    }
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=1;
	            else if (dir==1)
	                y-=1;
	            else if (dir==2)
	                x-=1;
	            else if (dir==3)
	                y+=1;
	            }
	        }
    
	    //type 7 - bat
	    else if (type==7){
	        if (hp<=0){
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            for (i=-1;i<2;i+=1){
	                tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	                tempid.force=type;
	                tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y)+i*10;
	                }
	            }
	        hpprev=hp;
	        if (cyc==8){
	            cyc=0;
	            if (point_distance(x,y,obj_battleyou.x,obj_battleyou.y)<48){
	                pdir=(point_direction(x,y,obj_battleyou.x,obj_battleyou.y))+180;
	                if (pdir>=315 || pdir<45)
	                    dir=0;
	                else if (pdir>=45 && pdir<135)
	                    dir=1;
	                else if (pdir>=135 && pdir<225)
	                    dir=2;
	                else
	                    dir=3;
	                }
	            else
	                dir=floor(random(4));
	            go=0;
	            repeat(10){ //good enough
	                if (!go){
	                    if (dir==0){
	                        if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16){
	                            if (point_distance(x,y,obj_battleyou.x,obj_battleyou.y)>=48)
	                                dir=floor(random(4));
	                            }
	                        else
	                            go=1;
	                        }
	                    else if (dir==1){
	                        if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16){
	                            if (point_distance(x,y,obj_battleyou.x,obj_battleyou.y)>=48)
	                                dir=floor(random(4));
	                            }
	                        else
	                            go=1;
	                        }
	                    else if (dir==2){
	                        if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16){
	                            if (point_distance(x,y,obj_battleyou.x,obj_battleyou.y)>=48)
	                                dir=floor(random(4));
	                            }
	                        else
	                            go=1;
	                        }
	                    else if (dir==3){
	                        if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28){
	                            if (point_distance(x,y,obj_battleyou.x,obj_battleyou.y)>=48)
	                                dir=floor(random(4));
	                            }
	                        else
	                            go=1;
	                        }
	                    }
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=2;
	            else if (dir==1)
	                y-=2;
	            else if (dir==2)
	                x-=2;
	            else if (dir==3)
	                y+=2;
	            }
	        }
    
	    //type 8 - seriously
	    else if (type==8){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.direction=dir*90;
	            tempid.spiral=1;
	            }
	        if (cyc==16){
	            cyc=0;
	            dir=floor(random(4));
	            go=0;
	            repeat(10){ //good enough
	                if (!go){
	                    if (dir==0){
	                        if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    else if (dir==1){
	                        if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    else if (dir==2){
	                        if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    else if (dir==3){
	                        if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    }
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=1;
	            else if (dir==1)
	                y-=1;
	            else if (dir==2)
	                x-=1;
	            else if (dir==3)
	                y+=1;
	            }
	        }
    
	    //type 9 - spring
	    else if (type==9){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.homing=1;
	            if (x>obj_battleyou.x)
	                tempid.direction=180;
	            else
	                tempid.direction=0;
	            }
	        if (cyc==8){
	            cyc=0;
	            go=0;
	            if (dir==0){
	                if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16)
	                    dir=1;
	                else
	                    go=1;
	                }
	            else if (dir==1){
	                if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28)
	                    dir=0;
	                else
	                    go=1;
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                y-=2;
	            else if (dir==1)
	                y+=2;
	            }
	        }
    
	    //type 10 - jelly
	    else if (type==10){
	        if (fire>=8){
	            fire=0;
	            if (hpprev>hp){
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	                tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	                tempid.force=type;
	                tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	                }
	            hpprev=hp;
	            }
	        if (cyc==16){
	            cyc=0;
	            stutter+=1;
	            if (stutter==3)
	                stutter=0;
	            go=0;
	            if (stutter==0){
	                pdir=(point_direction(x,y,obj_battleyou.x,obj_battleyou.y));
	                if (pdir>=315 || pdir<45)
	                    dir=0;
	                else if (pdir>=45 && pdir<135)
	                    dir=1;
	                else if (pdir>=135 && pdir<225)
	                    dir=2;
	                else
	                    dir=3;
	                go=0;
	                if (dir==0){
	                    if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16){
	                        }
	                    else
	                        go=1;
	                    }
	                else if (dir==1){
	                    if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16){
	                        }
	                    else
	                        go=1;
	                    }
	                else if (dir==2){
	                    if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16){
	                        }
	                    else
	                        go=1;
	                    }
	                else if (dir==3){
	                    if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28){
	                        }
	                    else
	                        go=1;
	                    }
	                if (go){
	                    if (dir==0)
	                        instance_create_depth(x+16-8,y-8,0,obj_holder);
	                    else if (dir==1)
	                        instance_create_depth(x-8,y-16-8,0,obj_holder);
	                    else if (dir==2)
	                        instance_create_depth(x-16-8,y-8,0,obj_holder);
	                    else if (dir==3)
	                        instance_create_depth(x-8,y+16-8,0,obj_holder);
	                    }
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=1;
	            else if (dir==1)
	                y-=1;
	            else if (dir==2)
	                x-=1;
	            else if (dir==3)
	                y+=1;
	            }
	        }
    
	    //type 11 - sun
	    else if (type==11){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            tempid.phase=1;
	            }
	        if (cyc==8){
	            cyc=0;
	            stutter=1-stutter;
	            if (stutter==0){
	                pdir=(point_direction(x,y,obj_battleyou.x,obj_battleyou.y));
	                if (pdir>=315 || pdir<45)
	                    dir=0;
	                else if (pdir>=45 && pdir<135)
	                    dir=1;
	                else if (pdir>=135 && pdir<225)
	                    dir=2;
	                else
	                    dir=3;
	                }
	            else{
	                dir=floor(random(4));
	                }
	            go=0;
	            if (dir==0){
	                if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==1){
	                if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==2){
	                if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==3){
	                if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28){
	                    }
	                else
	                    go=1;
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=2;
	            else if (dir==1)
	                y-=2;
	            else if (dir==2)
	                x-=2;
	            else if (dir==3)
	                y+=2;
	            }
	        }
    
	    //type 12 - dragon
	    else if (type==12){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            for (i=-1;i<2;i+=2){
	                tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	                tempid.force=type;
	                tempid.phase=1;
	                tempid.direction=180+i*30;
	                }
	            }
	        if (cyc==16){
	            cyc=0;
	            stutter+=1;
	            if (stutter==2)
	                stutter=0;
	            go=0;
	            if (stutter==0){
	                dir=floor(random(4));
	                go=0;
	                if (dir==0){
	                    if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16){
	                        }
	                    else
	                        go=1;
	                    }
	                else if (dir==1){
	                    if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16){
	                        }
	                    else
	                        go=1;
	                    }
	                else if (dir==2){
	                    if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16){
	                        }
	                    else
	                        go=1;
	                    }
	                else if (dir==3){
	                    if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28){
	                        }
	                    else
	                        go=1;
	                    }
	                if (go){
	                    if (dir==0)
	                        instance_create_depth(x+16-8,y-8,0,obj_holder);
	                    else if (dir==1)
	                        instance_create_depth(x-8,y-16-8,0,obj_holder);
	                    else if (dir==2)
	                        instance_create_depth(x-16-8,y-8,0,obj_holder);
	                    else if (dir==3)
	                        instance_create_depth(x-8,y+16-8,0,obj_holder);
	                    }
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=1;
	            else if (dir==1)
	                y-=1;
	            else if (dir==2)
	                x-=1;
	            else if (dir==3)
	                y+=1;
	            }
	        }
    
	    //type 13 - totem
	    else if (type==13){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            for (i=0;i<3;i+=1){
	                tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	                tempid.force=type;
	                tempid.direction=dir*90+i*120;
	                //if (i==0)
	                //    tempid.homing=1;
	                //else
	                    tempid.phase=1;
	                }
	            }
	        if (cyc==16){
	            cyc=0;
	            dir=floor(random(4));
	            go=0;
	            repeat(10){ //good enough
	                if (!go){
	                    if (dir==0){
	                        if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    else if (dir==1){
	                        if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    else if (dir==2){
	                        if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    else if (dir==3){
	                        if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28)
	                            dir=floor(random(4));
	                        else
	                            go=1;
	                        }
	                    }
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=1;
	            else if (dir==1)
	                y-=1;
	            else if (dir==2)
	                x-=1;
	            else if (dir==3)
	                y+=1;
	            }
	        }
    
	    //type 14 - skull
	    else if (type==14){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.homing=1;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            }
	        if (cyc==8){
	            cyc=0;
	            go=0;
	            if (dir==0){
	                if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16)
	                    dir=3;
	                else
	                    go=1;
	                }
	            else if (dir==1){
	                if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16)
	                    dir=0;
	                else
	                    go=1;
	                }
	            else if (dir==2){
	                if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16)
	                    dir=1;
	                else
	                    go=1;
	                }
	            else if (dir==3){
	                if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28)
	                    dir=2;
	                else
	                    go=1;
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=2;
	            else if (dir==1)
	                y-=2;
	            else if (dir==2)
	                x-=2;
	            else if (dir==3)
	                y+=2;
	            }
	        }
    
	    //type 15 - hand
	    else if (type==15){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.homing=1;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            }
	        if (cyc==16){
	            cyc=0;
	            pdir=(point_direction(x,y,obj_battleyou.x,obj_battleyou.y));
	            if (pdir>=315 || pdir<45)
	                dir=0;
	            else if (pdir>=45 && pdir<135)
	                dir=1;
	            else if (pdir>=135 && pdir<225)
	                dir=2;
	            else
	                dir=3;
	            go=0;
	            if (dir==0){
	                if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==1){
	                if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==2){
	                if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==3){
	                if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28){
	                    }
	                else
	                    go=1;
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=1;
	            else if (dir==1)
	                y-=1;
	            else if (dir==2)
	                x-=1;
	            else if (dir==3)
	                y+=1;
	            }
	        }
    
	    //type 16 - heartbreak
	    else if (type==16){
	        if (fire>=88){
	            fire=0;
	            sound_stop(snd_enemyshot);
	            sfx_play(snd_enemyshot);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.phase=1;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.spiral=1;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            tempid=instance_create_depth(x,y,-5,obj_enemyshot);
	            tempid.force=type;
	            tempid.spiral=1;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y)+180;
	            }
	        if (cyc==8){
	            cyc=0;
	            stutter=1-stutter;
	            if (stutter==0){
	                if (point_distance(x,y,obj_battleyou.x,obj_battleyou.y)<64)
	                    pdir=(point_direction(x,y,obj_battleyou.x,obj_battleyou.y))+180;
	                else
	                    pdir=(point_direction(x,y,obj_battleyou.x,obj_battleyou.y));
	                if (pdir>=315 || pdir<45)
	                    dir=0;
	                else if (pdir>=45 && pdir<135)
	                    dir=1;
	                else if (pdir>=135 && pdir<225)
	                    dir=2;
	                else
	                    dir=3;
	                }
	            else{
	                if (point_distance(x,y,obj_battleyou.x,obj_battleyou.y)<48){
	                    pdir=(point_direction(x,y,obj_battleyou.x,obj_battleyou.y))+180;
	                    if (pdir>=315 || pdir<45)
	                        dir=0;
	                    else if (pdir>=45 && pdir<135)
	                        dir=1;
	                    else if (pdir>=135 && pdir<225)
	                        dir=2;
	                    else
	                        dir=3;
	                    }
	                else
	                    dir=floor(random(4));
	                }
	            go=0;
	            if (dir==0){
	                if (!place_free(x+16,y) || place_meeting(x+16,y,obj_enemy) || place_meeting(x+16,y,obj_holder) || x>scr_xview()+scr_wview()-16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==1){
	                if (!place_free(x,y-16) || place_meeting(x,y-16,obj_enemy) || place_meeting(x,y-16,obj_holder) || y<scr_yview()+16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==2){
	                if (!place_free(x-16,y) || place_meeting(x-16,y,obj_enemy) || place_meeting(x-16,y,obj_holder) || x<scr_xview()+16){
	                    }
	                else
	                    go=1;
	                }
	            else if (dir==3){
	                if (!place_free(x,y+16) || place_meeting(x,y+16,obj_enemy) || place_meeting(x,y+16,obj_holder) || y>scr_yview()+scr_hview()-28){
	                    }
	                else
	                    go=1;
	                }
	            if (go){
	                if (dir==0)
	                    instance_create_depth(x+16-8,y-8,0,obj_holder);
	                else if (dir==1)
	                    instance_create_depth(x-8,y-16-8,0,obj_holder);
	                else if (dir==2)
	                    instance_create_depth(x-16-8,y-8,0,obj_holder);
	                else if (dir==3)
	                    instance_create_depth(x-8,y+16-8,0,obj_holder);
	                }
	            }
	        if (go){
	            if (dir==0)
	                x+=2;
	            else if (dir==1)
	                y-=2;
	            else if (dir==2)
	                x-=2;
	            else if (dir==3)
	                y+=2;
	            }
	        }
    
	    //type 17 - hypesnake
	    else if (type==17){
	        if (global.shakescreen<=2)
	            global.shakescreen=4;
	        x-=2;
	        }
	    }

	//explode
	//oh my!
	if (hp<=0){
	    sound_stop(snd_explo);
	    sfx_play(snd_explo);
	    instance_destroy();
	    instance_create_depth(x,y,-20,obj_explo);
	    for (i=0;i<4;i+=1)
	        (instance_create_depth(x,y,-15,obj_explopart)).direction=45+90*i;
	    if (global.flashr==0){
	        global.flashr=0;
	        global.flashg=0;
	        global.flashb=150;
	        }
	    global.shakescreen=4;
	    }



}
