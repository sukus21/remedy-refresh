if (obj_battleyou.damaged==0 && obj_battleyou.hp>0){
    if (global.difficulty==2)
        obj_battleyou.hp-=other.force*2;
    else
        obj_battleyou.hp-=other.force;
    obj_battleyou.damaged=8;
    global.flashr=200;
    global.flashg=0;
    global.flashb=0;
    sfx_play(snd_hurt);
    }
with (other){
    instance_destroy();
    instance_create_depth(x,y,-10,obj_puff);
    }

