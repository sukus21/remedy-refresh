x+=hspeed;
y+=vspeed;
instance_destroy();
instance_create(round(x),round(y),obj_puff);
other.hp-=global.force;
other.damaged=1;
if (global.sound){
    repeat(5) //because it doens't always work
        sound_stop(snd_hitenemy)
    sound_play(snd_hitenemy);
    }

