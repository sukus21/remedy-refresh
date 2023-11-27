if (active==1){
    other.hp-=global.force*8;
    other.damaged=1;
    if (global.sound){
        repeat(5) //because it doens't always work
            sound_stop(snd_hitenemy)
        sound_play(snd_hitenemy);
        }
    }

