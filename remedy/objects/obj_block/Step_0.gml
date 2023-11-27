if (damage>=global.boxhp){
    instance_create(x,y,obj_cover);
    instance_create(x+8,y+8,obj_explo);
    instance_destroy();
    if (global.flashr==0 && !obj_battlesabot.victory && !obj_battlesabot.failure){
        global.flashr=0;
        global.flashg=100;
        global.flashb=100;
        }
    if (global.shakescreen==0)
        global.shakescreen=3;
    if (global.sound){
        sound_stop(snd_explo);
        sound_play(snd_explo);
        }
    }

