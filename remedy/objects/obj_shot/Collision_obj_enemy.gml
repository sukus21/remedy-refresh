x+=hspeed;
y+=vspeed;
instance_destroy();
instance_create_depth(round(x),round(y),-10,obj_puff);
other.hp-=global.force;
other.damaged=1;
sound_stop(snd_hitenemy)
sound_play(snd_hitenemy);

