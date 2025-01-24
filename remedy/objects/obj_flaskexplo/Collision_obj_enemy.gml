if (active==1){
    other.hp-=global.force*8;
    other.damaged=1;
    audio_stop_sound(snd_hitenemy)
    sfx_play(snd_hitenemy);
    }

