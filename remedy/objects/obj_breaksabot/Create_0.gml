//This part of the file has been auto-generated by zeroinit.py
//obj_breaksabot:
flip = 0;
vicrdir = 0;
vicr = 0;
vicgdir = 0;
vicg = 0;
vicbdir = 0;
vicb = 0;
pressescape = 0;
pressescapeprev = 0;
pressinteract = 0;
pressinteractprev = 0;
i = 0;
joy = 0;
joyhold = 0;
imaxx = 0;
pfx = 0;
pfy = 0;
pftext = 0;
pfsize = 0;
pffont = 0;
pflen = 0;
pfx2 = 0;
pfy2 = 0;
pfchar = 0;
pfi = 0;
pressubprev = array_create(50, 0);
pressub = array_create(50, 0);
pressrunprev = 0;
pressrun = 0;
joyrun = 0;
pressupprev = 0;
pressup = 0;
pressdownprev = 0;
pressdown = 0;
pressleftprev = 0;
pressleft = 0;
pressrightprev = 0;
pressright = 0;
fileid = 0;


//Below are the original contents of the file.
scr_joycreate();
scr_createtext();
repeat(10)
    instance_create_depth(16+random(128),16+random(108),0,obj_breakobject);

