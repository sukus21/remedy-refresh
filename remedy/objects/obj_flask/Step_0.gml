zspeed+=zgrav;
z+=zspeed;
if (z<=0){
    instance_destroy();
    global.flashr=50;
    global.flashg=150;
    global.flashb=150;
    global.shakescreen=6;
    for (i=0;i<4;i+=1){
        tempid=instance_create(x,y,obj_puff);
        tempid.slow=1;
        tempid.speed=8;
        tempid.direction=45+i*90;
        }
    instance_create(x,y,obj_flaskexplo);
    sfx_play(snd_flaskexplo);
    }
imgcyc+=1;
if (imgcyc==2){
    imgcyc=0;
    img+=1;
    if (img==8)
        img=0;
    }
image_single=img;

trailcyc+=1;
if (trailcyc==2){
    trailcyc=0;
    trail=1-trail;
    (instance_create(x,y-z,obj_flasktrail)).type=trail;
    }

