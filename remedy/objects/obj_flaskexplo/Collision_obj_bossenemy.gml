if (active==1 && other.active){
    other.hp-=global.force*8;
    other.damaged=1;
    sound_stop(snd_hitenemy)
	sfx_play(snd_hitenemy);
    }

