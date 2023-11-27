if (type==3 || type==4){
        imgcyc+=1;
    if (imgcyc==2){
        imgcyc=0;
        img+=1;
        if (img==4)
            img=0;
        }
    image_single=img+type*4;
    }
else if (type>=5)
    image_single=dir+20;
else
    image_single=dir+type*4;

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

else if (x<scr_xview()+4 || x>scr_xview()+scr_wview()-4 || y<scr_yview()+4 || y>scr_yview()+scr_hview()-16){
    if (x<scr_xview()+4)
        x=scr_xview()+4;
    else if (x>scr_xview()+scr_wview()-4)
        x=scr_xview()+scr_wview()-4;
    if (y<scr_yview()+4)
        y=scr_yview()+4;
    else if (y>scr_yview()+scr_hview()-16)
        y=scr_yview()+scr_hview()-16;
    instance_destroy();
    instance_create(round(x),round(y),obj_puff);
    }

