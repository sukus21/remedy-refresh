if (ttl>0){
    ttl-=1;
    if (ttl==0){
        instance_destroy();
        instance_create_depth(x,y,-10,obj_puff);
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
    if (x<get_xview()-16 || x>get_xview()+get_wview()+16 || y<get_yview()-16 || y>get_yview()+get_hview()+4)
        instance_destroy();
    }
else{
    if (x<get_xview() || x>get_xview()+get_wview() || y<get_yview() || y>get_yview()+get_hview()-12)
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
        instance_create_depth(round(x),round(y),-10,obj_puff);
        tempid.damage+=1;
        }
    }

