imgcyc+=1;
if (!slow && imgcyc mod 2==0)
    img+=1;
else if (slow && imgcyc mod 4==0)
    img+=1;
if (img==3)
    instance_destroy();
if (slow)
    speed*=0.85;

image_single=img+type*3;

