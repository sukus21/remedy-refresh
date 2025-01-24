if (damage>=global.boxhp){
    instance_create_depth(x,y,1000,obj_cover);
    instance_create_depth(x+8,y+8,-20,obj_explo);
    instance_destroy();
    if (global.flashr==0 && !obj_battlesabot.victory && !obj_battlesabot.failure){
        global.flashr=0;
        global.flashg=100;
        global.flashb=100;
        }
    if (global.shakescreen==0)
        global.shakescreen=3;
    audio_stop_sound(snd_explo);
    sfx_play(snd_explo);
    }

