gravity=0.5;
if (x<8){
    x=8;
    hspeed=abs(hspeed);
    }
else if (x>room_width-8){
    x=room_width-8;
    hspeed=-abs(hspeed);
    }
if (y>room_height-8){
    y=room_height-8;
    vspeed=-6-random(4);
    if (random(1)<0.05){
        instance_destroy();
        instance_create_depth(x,y,-20,obj_explo);
        for (i=0;i<8;i+=1){
            tempid=instance_create_depth(x,y,-15,obj_explopart)
            tempid.direction=i*45;
            tempid.speed=8+(i mod 2)*8;
            }
        instance_create_depth(x,-32,0,obj_breakobject);
        }
    }

imgcyc+=1;
if (imgcyc==6){
    if (!enemy)
        img=1+type*4;
    else
        img=0+type*4;
    }
else if (imgcyc==12){
    imgcyc=0;
    if (!enemy)
        img=3+type*4;
    else
        img=1+type*4;
    }


