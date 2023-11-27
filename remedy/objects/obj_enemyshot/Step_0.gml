if (ttl>0){
    ttl-=1;
    if (ttl==0){
        instance_destroy();
        instance_create(x,y,obj_puff);
        }
    }

imgcyc+=1;
if (imgcyc==2){
    imgcyc=0;
    img+=1;
    if (img==4)
        img=0;
    }
image_single=img+phase*4+homing*8+spiral*12;

if (outside){
    if (x<scr_xview()-16 || x>scr_xview()+scr_wview()+16 || y<scr_yview()-16 || y>scr_yview()+scr_hview()+4)
        instance_destroy();
    }
else{
    if (x<scr_xview() || x>scr_xview()+scr_wview() || y<scr_yview() || y>scr_yview()+scr_hview()-12)
        instance_destroy();
    }

if (homing){
    homecyc+=1;
    if (homecyc<60)
        scr_home(1.5,2);
    }

if (spiral){
    spiralcyc*=0.97;
    direction+=60*spiralcyc;
    }

if (!phase && !homing && !spiral){
    tempid=-1;
    tempid=instance_place(x+hspeed,y+vspeed,obj_block);
    if (tempid>-1){
        move_contact_solid(direction,8);
        x+=hspeed;
        y+=vspeed;
        instance_destroy();
        instance_create(round(x),round(y),obj_puff);
        tempid.damage+=1;
        }
    }

