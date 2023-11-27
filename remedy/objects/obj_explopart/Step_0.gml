speed*=0.8;
cyc+=1;
if (!slow && cyc mod 2==0)
    img+=1;
else if (slow && cyc mod 4==0)
    img+=1;
if (img>=6)
    instance_destroy();
image_single=img;

