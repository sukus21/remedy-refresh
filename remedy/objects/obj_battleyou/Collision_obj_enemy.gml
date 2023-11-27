if (damaged==0 && hp>0){
    if (global.difficulty==2)
        hp-=other.type*2;
    else
        hp-=other.type;
    other.hp-=other.type;
    damaged=8;
    global.flashr=200;
    global.flashg=0;
    global.flashb=0;
    if (global.sound)
        sound_play(snd_hurt);
    }

