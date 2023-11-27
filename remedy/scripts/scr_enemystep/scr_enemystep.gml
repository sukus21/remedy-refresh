function scr_enemystep() {
	//init
	if (!init){
	    init=1;
	    hp=1;
	    //World 1------------------------------------------------------------
	    if (type==1) hp=1; //breadcrumb - sit still
	    else if (type==2) hp=2; //spikeball - follow
	    else if (type==3) hp=2; //glass - random
	    //World 2------------------------------------------------------------
	    else if (type==4) hp=6; //flame - sit still, fire
	    else if (type==5) hp=8; //virus - bounce clockwise quickly
	    else if (type==6) hp=14; //ghost - follow slowly, fire
	    else if (type==7) hp=4; //bat - go random quickly
	    //World 3------------------------------------------------------------
	    else if (type==8) hp=20; //seriously - go random, fire straight
	    else if (type==9) hp=20; //spring - go up and down quickly, fire to closest side
	    else if (type==10) hp=32; //jelly - sit still, return fire
	    else if (type==11) hp=28; //sun - half follow, half random
	    //World 4------------------------------------------------------------
	    else if (type==12) hp=32; //dragon - sit still, fire straight phase
	    else if (type==13) hp=48; //totem - go random, fire straight phase
	    else if (type==14) hp=64; //skull - bounce clockwise, fire phase
	    else if (type==15) hp=64; //hand - follow, fire phase
	    //World 5------------------------------------------------------------
	    else if (type==16) hp=128; //heartbreak - go half follow, half random quickly, fire phase
    
	    fire=((x+y) mod 96);
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
	        }
	    //type 2 - spikeball
	    else if (type==2){
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
	                    instance_create(x+16-8,y-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==2)
	                    instance_create(x-16-8,y-8,obj_holder);
	                else if (dir==3)
	                    instance_create(x-8,y+16-8,obj_holder);
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
    
	    //type 3 - glass
	    else if (type==3){
	        if (cyc==16){
	            cyc=0;
	            subcyc=1-subcyc;
	            go=0;
	            if (subcyc==1){
	                dir=floor(random(4));
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
	                        instance_create(x+16-8,y-8,obj_holder);
	                    else if (dir==1)
	                        instance_create(x-8,y-16-8,obj_holder);
	                    else if (dir==2)
	                        instance_create(x-16-8,y-8,obj_holder);
	                    else if (dir==3)
	                        instance_create(x-8,y+16-8,obj_holder);
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
    
	    //type 4 - flame
	    else if (type==4){
	        if (fire>=96){
	            fire=0;
	            if (global.sound){
	                sound_stop(snd_enemyshot);
	                sound_play(snd_enemyshot);
	                }
	            tempid=instance_create(x,y,obj_enemyshot);
	            tempid.force=type;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            }
	        }
    
	    //type 5 - virus
	    else if (type==5){
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
	                    instance_create(x+16-8,y-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==2)
	                    instance_create(x-16-8,y-8,obj_holder);
	                else if (dir==3)
	                    instance_create(x-8,y+16-8,obj_holder);
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
	        if (fire>=96){
	            fire=0;
	            if (global.sound){
	                sound_stop(snd_enemyshot);
	                sound_play(snd_enemyshot);
	                }
	            tempid=instance_create(x,y,obj_enemyshot);
	            tempid.force=type;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	            }
	        if (cyc==16){
	            cyc=0;
	            stutter=1-stutter;
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
	                        instance_create(x+16-8,y-8,obj_holder);
	                    else if (dir==1)
	                        instance_create(x-8,y-16-8,obj_holder);
	                    else if (dir==2)
	                        instance_create(x-16-8,y-8,obj_holder);
	                    else if (dir==3)
	                        instance_create(x-8,y+16-8,obj_holder);
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
	        if (cyc==8){
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
	                    instance_create(x+16-8,y-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==2)
	                    instance_create(x-16-8,y-8,obj_holder);
	                else if (dir==3)
	                    instance_create(x-8,y+16-8,obj_holder);
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
	        if (fire>=96){
	            fire=0;
	            if (global.sound){
	                sound_stop(snd_enemyshot);
	                sound_play(snd_enemyshot);
	                }
	            tempid=instance_create(x,y,obj_enemyshot);
	            tempid.force=type;
	            tempid.direction=dir*90;
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
	                    instance_create(x+16-8,y-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==2)
	                    instance_create(x-16-8,y-8,obj_holder);
	                else if (dir==3)
	                    instance_create(x-8,y+16-8,obj_holder);
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
	        if (fire>=96){
	            fire=0;
	            if (global.sound){
	                sound_stop(snd_enemyshot);
	                sound_play(snd_enemyshot);
	                }
	            tempid=instance_create(x,y,obj_enemyshot);
	            tempid.force=type;
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
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y+16-8,obj_holder);
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
	                if (global.sound){
	                    sound_stop(snd_enemyshot);
	                    sound_play(snd_enemyshot);
	                    }
	                tempid=instance_create(x,y,obj_enemyshot);
	                tempid.force=type;
	                tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
	                }
	            hpprev=hp;
	            }
	        if (cyc==16){
	            cyc=0;
	            }
	        }
    
	    //type 11 - sun
	    else if (type==11){
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
	                    instance_create(x+16-8,y-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==2)
	                    instance_create(x-16-8,y-8,obj_holder);
	                else if (dir==3)
	                    instance_create(x-8,y+16-8,obj_holder);
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
	        if (fire>=96){
	            fire=0;
	            if (global.sound){
	                sound_stop(snd_enemyshot);
	                sound_play(snd_enemyshot);
	                }
	            tempid=instance_create(x,y,obj_enemyshot);
	            tempid.force=type;
	            tempid.phase=1;
	            tempid.direction=180;
	            }
	        if (cyc==16){
	            cyc=0;
	            }
	        }
    
	    //type 13 - totem
	    else if (type==13){
	        if (fire>=96){
	            fire=0;
	            if (global.sound){
	                sound_stop(snd_enemyshot);
	                sound_play(snd_enemyshot);
	                }
	            tempid=instance_create(x,y,obj_enemyshot);
	            tempid.force=type;
	            tempid.phase=1;
	            tempid.direction=dir*90;
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
	                    instance_create(x+16-8,y-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==2)
	                    instance_create(x-16-8,y-8,obj_holder);
	                else if (dir==3)
	                    instance_create(x-8,y+16-8,obj_holder);
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
	        if (fire>=96){
	            fire=0;
	            if (global.sound){
	                sound_stop(snd_enemyshot);
	                sound_play(snd_enemyshot);
	                }
	            tempid=instance_create(x,y,obj_enemyshot);
	            tempid.force=type;
	            tempid.phase=1;
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
	                    instance_create(x+16-8,y-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==2)
	                    instance_create(x-16-8,y-8,obj_holder);
	                else if (dir==3)
	                    instance_create(x-8,y+16-8,obj_holder);
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
	        if (fire>=96){
	            fire=0;
	            if (global.sound){
	                sound_stop(snd_enemyshot);
	                sound_play(snd_enemyshot);
	                }
	            tempid=instance_create(x,y,obj_enemyshot);
	            tempid.force=type;
	            tempid.phase=1;
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
	                    instance_create(x+16-8,y-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==2)
	                    instance_create(x-16-8,y-8,obj_holder);
	                else if (dir==3)
	                    instance_create(x-8,y+16-8,obj_holder);
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
	        if (fire>=96){
	            fire=0;
	            if (global.sound){
	                sound_stop(snd_enemyshot);
	                sound_play(snd_enemyshot);
	                }
	            tempid=instance_create(x,y,obj_enemyshot);
	            tempid.force=type;
	            tempid.phase=1;
	            tempid.direction=point_direction(x,y,obj_battleyou.x,obj_battleyou.y);
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
	                    instance_create(x+16-8,y-8,obj_holder);
	                else if (dir==1)
	                    instance_create(x-8,y-16-8,obj_holder);
	                else if (dir==2)
	                    instance_create(x-16-8,y-8,obj_holder);
	                else if (dir==3)
	                    instance_create(x-8,y+16-8,obj_holder);
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
    
	    }

	//explode
	//oh my!
	if (hp<=0){
	    if (global.sound){
	        sound_stop(snd_explo);
	        sound_play(snd_explo);
	        }
	    instance_destroy();
	    instance_create(x,y,obj_explo);
	    for (i=0;i<4;i+=1)
	        (instance_create(x,y,obj_explopart)).direction=45+90*i;
	    if (global.flashr==0){
	        global.flashr=0;
	        global.flashg=0;
	        global.flashb=150;
	        }
	    global.shakescreen=4;
	    }



}
