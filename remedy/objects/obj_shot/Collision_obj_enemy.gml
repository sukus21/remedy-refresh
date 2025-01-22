x+=hspeed;
y+=vspeed;
instance_destroy();
instance_create(round(x),round(y),obj_puff);
other.hp-=global.force;
other.damaged=1;
sound_stop(snd_hitenemy)
sound_play(snd_hitenemy);

