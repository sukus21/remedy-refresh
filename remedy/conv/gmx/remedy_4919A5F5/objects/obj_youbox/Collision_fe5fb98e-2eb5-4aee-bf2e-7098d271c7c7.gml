if (obj_battleyou.damaged==0 && obj_battleyou.hp>0){
    if (global.difficulty==2)
        obj_battleyou.hp-=other.force*2;
    else
        obj_battleyou.hp-=other.force;
    obj_battleyou.damaged=8;
    global.flashr=200;
    global.flashg=0;
    global.flashb=0;
    if (global.sound)
        sound_play(snd_hurt);
    }
with (other){
    instance_destroy();
    instance_create(x,y,obj_puff);
    }

