scr_drawtext(0,32,"$$$$Break time!",8,spr_text);

//Background color
flip=1-flip;
if (flip){
    if (vicrdir==0){
        vicr-=1;
        if (vicr<=0)
            vicrdir=1;
        }
    else if (vicrdir==1){
        vicr+=1;
        if (vicr>=60)
            vicrdir=0;
        }
    if (vicgdir==0){
        vicg-=3;
        if (vicg<=0)
            vicgdir=1;
        }
    else if (vicgdir==1){
        vicg+=3;
        if (vicg>=60)
            vicgdir=0;
        }
    if (vicbdir==0){
        vicb-=5;
        if (vicb<=0)
            vicbdir=1;
        }
    else if (vicbdir==1){
        vicb+=5;
        if (vicb>=60)
            vicbdir=0;
        }
    }
if (vicr<0) vicr=0;
if (vicg<0) vicg=0;
if (vicb<0) vicb=0;
global.flashr=vicr;
global.flashg=vicg;
global.flashb=vicb;

if (global.flashr>0){
    global.flashr-=global.flashspeed;
    if (global.flashr<=0)
        global.flashr=0;
    }
if (global.flashg>0){
    global.flashg-=global.flashspeed;
    if (global.flashg<=0)
        global.flashg=0;
    }
if (global.flashb>0){
    global.flashb-=global.flashspeed;
    if (global.flashb<=0)
        global.flashb=0;
    }
if (global.flashr>=250)
    global.flashr=250;
if (global.flashg>=250)
    global.flashg=250;
if (global.flashb>=250)
    global.flashb=250;
global.bgcolor=make_color_rgb(global.flashr,global.flashg,global.flashb);
layer_background_blend(background_layer, global.bgcolor);
