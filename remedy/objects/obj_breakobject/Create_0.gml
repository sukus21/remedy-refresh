type=floor(random(64));
enemy=0;
if (random(1)<0.5){
    sprite_index=spr_enemy;
    type=floor(random(16));
    enemy=1;
    }
if (!enemy)
    img=3+type*4;
else
    img=1+type*4;
hspeed=1+random(2);
if (random(1)<0.5)
    hspeed*=-1;

