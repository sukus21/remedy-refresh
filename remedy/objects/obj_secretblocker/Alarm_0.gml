if (global.maymarry==1 && global.hearts>=80 && global.force>=5 && global.multi>=5 && global.regen>=10 && global.flasks>=10){
    instance_destroy();
    instance_create_depth(x,y,1000,obj_cover);
    }

