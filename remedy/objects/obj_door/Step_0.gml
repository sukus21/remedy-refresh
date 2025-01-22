//open door
if (obj_you.walkcyc<=2 && instance_number(obj_pause)==0 && obj_you.quit==0){
    if (place_meeting(x-8,y,obj_you) || place_meeting(x+8,y,obj_you) || place_meeting(x,y-8,obj_you) || place_meeting(x,y+8,obj_you)){
        if (wait==0){
            wait=40;
            if (global.item[tag]==1){
                sfx_play(snd_flaskexplo);
                instance_destroy();
                instance_create(x+8,y+8,obj_explo);
                global.flashr=150;
                global.flashg=150;
                global.flashb=150;
                global.door[tag]=1;
                }
            else{
                shake=18;
                sfx_play(snd_back);
                }
            }
        }
    if (wait>0)
        wait-=1;
    }
if (shake>0)
    shake-=1;
image_single=tag;

