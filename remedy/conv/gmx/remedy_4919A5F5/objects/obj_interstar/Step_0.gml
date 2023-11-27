imgcyc+=1;
if (imgcyc==2){
    imgcyc=0;
    img+=1;
    if (img==12)
        img=0;
    }
image_single=img+type*12;
if (y<-16)
    instance_destroy();

